import alut
import openal

when isMainModule:
  if not alutInit(nil, nil):
    quit "Error during alutInit"
  var helloBuffer = alutCreateBufferHelloWorld()
  var helloSource = ALuint(0)
  alGenSources(ALsizei 1, helloSource.addr)
  alSourcei(helloSource, AL_BUFFER, Alint(helloBuffer))
  alSourcePlay(helloSource)
  discard alutSleep(1)
  if not alutExit():
    quit "Error during alutExit"
