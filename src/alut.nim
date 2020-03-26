#
# Hand-bindings for FreeAlut
#

import openal

when defined(linux):
  {.passL: "-lalut"}
  {.push importc.}
# TODO: Windows & MacOS X & IOS, assistance welcome

const
    ALUT_ERROR_NO_ERROR*                    = 0
    ALUT_ERROR_OUT_OF_MEMORY*               = 0x200
    ALUT_ERROR_INVALID_ENUM*                = 0x201
    ALUT_ERROR_INVALID_VALUE*               = 0x202
    ALUT_ERROR_INVALID_OPERATION*           = 0x203
    ALUT_ERROR_NO_CURRENT_CONTEXT*          = 0x204
    ALUT_ERROR_AL_ERROR_ON_ENTRY*           = 0x205
    ALUT_ERROR_ALC_ERROR_ON_ENTRY*          = 0x206
    ALUT_ERROR_OPEN_DEVICE*                 = 0x207
    ALUT_ERROR_CLOSE_DEVICE*                = 0x208
    ALUT_ERROR_CREATE_CONTEXT*              = 0x209
    ALUT_ERROR_MAKE_CONTEXT_CURRENT*        = 0x20A
    ALUT_ERROR_DESTROY_CONTEXT*             = 0x20B
    ALUT_ERROR_GEN_BUFFERS*                 = 0x20C
    ALUT_ERROR_BUFFER_DATA*                 = 0x20D
    ALUT_ERROR_IO_ERROR*                    = 0x20E
    ALUT_ERROR_UNSUPPORTED_FILE_TYPE*       = 0x20F
    ALUT_ERROR_UNSUPPORTED_FILE_SUBTYPE*    = 0x210
    ALUT_ERROR_CORRUPT_OR_TRUNCATED_DATA*   = 0x211

    ALUT_WAVEFORM_SINE*                     = 0x100
    ALUT_WAVEFORM_SQUARE*                   = 0x101
    ALUT_WAVEFORM_SAWTOOTH*                 = 0x102
    ALUT_WAVEFORM_WHITENOISE*               = 0x103
    ALUT_WAVEFORM_IMPULSE*                  = 0x104

    ALUT_LOADER_BUFFER*                     = 0x300
    ALUT_LOADER_MEMORY*                     = 0x301


# ALUT_API ALboolean ALUT_APIENTRY alutInit (int *argcp, char **argv);
proc alutInit*(argcp: ptr int, argv: pointer): bool

# ALUT_API ALboolean ALUT_APIENTRY alutInitWithoutContext (int *argcp, char **argv);
proc alutInitWithoutContext*(argcp: ptr int, argv: pointer): bool

# ALUT_API ALboolean ALUT_APIENTRY alutExit (void);
proc alutExit*(): bool

# ALUT_API ALenum ALUT_APIENTRY alutGetError (void);
proc alutGetError*(): ALenum

# ALUT_API const char *ALUT_APIENTRY alutGetErrorString (ALenum error);
proc alutGetErrorString*(error: ALenum): cstring

# ALUT_API ALuint ALUT_APIENTRY alutCreateBufferFromFile (const char *fileName);
proc alutCreateBufferFromFile*(fileName: cstring): ALuint

# ALUT_API ALuint ALUT_APIENTRY alutCreateBufferFromFileImage (const ALvoid *data, ALsizei length);
proc alutCreateBufferFromFileImage*(data: pointer, size: ALsizei): ALuint

#ALUT_API ALuint ALUT_APIENTRY alutCreateBufferHelloWorld (void);
proc alutCreateBufferHelloWorld*(): ALuint

#ALUT_API ALuint ALUT_APIENTRY alutCreateBufferWaveform (ALenum waveshape, ALfloat frequency, ALfloat phase, ALfloat duration);
proc alutCreateBufferWaveform*(waveshape: Alenum, frequency: ALfloat, phase: ALfloat, duration: ALfloat): ALuint

#ALUT_API ALvoid *ALUT_APIENTRY alutLoadMemoryFromFile (const char *fileName, ALenum *format, ALsizei *size, ALfloat *frequency);
proc alutLoadMemoryFromFile*(fileName: cstring, format: ptr ALenum, size: ptr ALSizei, frequency: ptr ALfloat)

#ALUT_API ALvoid *ALUT_APIENTRY alutLoadMemoryFromFileImage (const ALvoid *data, ALsizei length, ALenum *format, ALsizei *size, ALfloat *frequency);
proc alutLoadMemoryFromFileImage*(data: pointer, length: ALsizei, format: ptr ALenum, size: ptr ALsizei, frequency: ptr ALfloat)

# ALUT_API ALvoid *ALUT_APIENTRY alutLoadMemoryHelloWorld (ALenum *format, ALsizei *size, ALfloat *frequency);
proc alutLoadMemoryHelloWorld*(format: ptr ALenum, size: ptr ALsizei, frequency: ptr ALfloat)

#ALUT_API ALvoid *ALUT_APIENTRY alutLoadMemoryWaveform (ALenum waveshape, ALfloat frequency, ALfloat phase, ALfloat duration, ALenum *format, ALsizei *size, ALfloat *freq);
proc alutLoadMemoryWaveform*(waveshape: ALenum, frequency: ALfloat, phase: ALfloat, duration: ALfloat, format: ptr ALenum, size: ptr ALsizei, freq: ptr ALfloat)

# ALUT_API const char *ALUT_APIENTRY alutGetMIMETypes (ALenum loader);
proc alutGetMIMETypes*(loader: ALenum): cstring

# ALUT_API ALint ALUT_APIENTRY alutGetMajorVersion (void);
proc alutGetMajorVersion*(): ALint

# ALUT_API ALint ALUT_APIENTRY alutGetMinorVersion (void);
proc alutGetMinorVersion*(): ALint

# ALUT_API ALboolean ALUT_APIENTRY alutSleep (ALfloat duration);
proc alutSleep*(duration: ALfloat): bool

when isMainModule:
  discard alutInit(nil, nil)
  var helloBuffer = alutCreateBufferHelloWorld()
  var helloSource = ALuint(0)
  alGenSources(ALsizei 1, helloSource.addr)
  alSourcei(helloSource, AL_BUFFER, Alint(helloBuffer))
  alSourcePlay(helloSource)
  discard alutSleep(1)
  discard alutExit()
