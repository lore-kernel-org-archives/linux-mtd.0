Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSLkS-0005Xb-Vb
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 06:54:01 +0000
Received: by mail-ea0-f175.google.com with SMTP id m14so2173144eaj.20
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2013 23:53:32 -0700 (PDT)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: motobud@gmail.com,
	annulen@yandex.ru,
	dedekind1@gmail.com
Subject: [PATCH v0] mkfs.ubifs: Add support for lz4hc compressor in mkfs.ubifs
Date: Sat,  5 Oct 2013 08:53:21 +0200
Message-Id: <1380956001-6122-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brent et all,

I was bored last night and while following the thread on the lz4hc 
compression for ubifs got my attention so I decided to give a go at
implementing in. Below you can find a patch which does just that.

An lz4hc and favor_lz4hc compr type, they mimick lzo and favor_lzo 
but use lz4hc instead of lzo.

In order to use lz4hc I included 3 files from the lz4 project since
lz4 is not yet available in a conventient modular form (suggestions
to fix this are welcome).

In the meantime I saw however that Brent was also considering adding
lz4hc support mkfs.ubifs so I'm making a v0 zero post either to serve
as input for review comment (mainly on handling the lz4 dependency)
and then I'll take care of cleaning up and testing it myself, or just
to serve as some reference to the implementation of Brent, let me know
of you want some polishing up on this version or are already in an
advanced phase of a solution of yourself. 

(Yes, it's called v0, it's still untested but I would like input on 
the lz4 dependency handling and the extension of the options, or 
do we see something feasible where we contain lzo/lz4hc and zlib on 
the fly, suggestions welcome). 

my 2 cents
E. 
 

Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
---
 Makefile                 |    2 +-
 mkfs.ubifs/README        |    1 +
 mkfs.ubifs/compr.c       |   64 ++--
 mkfs.ubifs/compr.h       |    1 +
 mkfs.ubifs/lz4/lz4.h     |  205 ++++++++++++
 mkfs.ubifs/lz4/lz4hc.c   |  817 ++++++++++++++++++++++++++++++++++++++++++++++
 mkfs.ubifs/lz4/lz4hc.h   |  111 +++++++
 mkfs.ubifs/mkfs.ubifs.c  |   33 +-
 mkfs.ubifs/ubifs-media.h |    2 +
 mkfs.ubifs/ubifs.h       |    2 +
 10 files changed, 1203 insertions(+), 35 deletions(-)
 create mode 100644 mkfs.ubifs/lz4/lz4.h
 create mode 100644 mkfs.ubifs/lz4/lz4hc.c
 create mode 100644 mkfs.ubifs/lz4/lz4hc.h

diff --git a/Makefile b/Makefile
index bf57a13..f79b08a 100644
--- a/Makefile
+++ b/Makefile
@@ -102,7 +102,7 @@ $(call _mkdep,lib/,libmtd.a)
 #
 # Utils in mkfs.ubifs subdir
 #
-obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
+obj-mkfs.ubifs = crc16.o lpt.o compr.o lz4/lz4hc.o devtable.o \
 	hashtable/hashtable.o hashtable/hashtable_itr.o
 LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
 $(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
diff --git a/mkfs.ubifs/README b/mkfs.ubifs/README
index 4fbaa7d..249aaa6 100644
--- a/mkfs.ubifs/README
+++ b/mkfs.ubifs/README
@@ -8,3 +8,4 @@ UBIFS File System - Make File System program
 * defs.h is a bunch of definitions to smooth things over.
 * lpt.c is a selection of functions copied from fs/ubifs/lpt.c from the linux kernel, and amended.
 * hashtable/* was downloaded from http://www.cl.cam.ac.uk/~cwc22/hashtable/
+* lz4/* is based upon https://code.google.com/p/lz4/ lz4-r106.tar.gz
\ No newline at end of file
diff --git a/mkfs.ubifs/compr.c b/mkfs.ubifs/compr.c
index 4152b6a..d9886b4 100644
--- a/mkfs.ubifs/compr.c
+++ b/mkfs.ubifs/compr.c
@@ -34,6 +34,7 @@
 #include "compr.h"
 #include "ubifs-media.h"
 #include "mkfs.ubifs.h"
+#include "lz4/lz4hc.h"
 
 static void *lzo_mem;
 static unsigned long long errcnt = 0;
@@ -104,6 +105,20 @@ static int lzo_compress(void *in_buf, size_t in_len, void *out_buf,
 	return 0;
 }
 
+static int lz4hc_compress(void *in_buf, size_t in_len, void *out_buf,
+			size_t *out_len)
+{
+	int ret;
+	ret = LZ4_compressHC_limitedOutput(in_buf, out_buf, in_len, *out_len);
+
+	if (ret != 0) {
+		errcnt += 1;
+		return -1;
+	}
+
+	return 0;
+}
+
 static int no_compress(void *in_buf, size_t in_len, void *out_buf,
 		       size_t *out_len)
 {
@@ -114,43 +129,49 @@ static int no_compress(void *in_buf, size_t in_len, void *out_buf,
 
 static char *zlib_buf;
 
-static int favor_lzo_compress(void *in_buf, size_t in_len, void *out_buf,
-			       size_t *out_len, int *type)
+static int favor_alt_compress(void *in_buf, size_t in_len, void *out_buf,
+			      size_t *out_len, int *type, int lzo)
 {
-	int lzo_ret, zlib_ret;
-	size_t lzo_len, zlib_len;
-
-	lzo_len = zlib_len = *out_len;
-	lzo_ret = lzo_compress(in_buf, in_len, out_buf, &lzo_len);
+	int alt_ret, zlib_ret;
+	size_t alt_len, zlib_len;
+
+	alt_len = zlib_len = *out_len;
+	if (lzo)
+		alt_ret = lzo_compress(in_buf, in_len, out_buf, &alt_len);
+	else
+		alt_ret = lz4hc_compress(in_buf, in_len, out_buf, &alt_len);
 	zlib_ret = zlib_deflate(in_buf, in_len, zlib_buf, &zlib_len);
 
-	if (lzo_ret && zlib_ret)
+	if (alt_ret && zlib_ret)
 		/* Both compressors failed */
 		return -1;
 
-	if (!lzo_ret && !zlib_ret) {
+	if (!alt_ret && !zlib_ret) {
 		double percent;
 
 		/* Both compressors succeeded */
-		if (lzo_len <= zlib_len )
-			goto select_lzo;
+		if (alt_len <= zlib_len )
+			goto select_alt;
 
-		percent = (double)zlib_len / (double)lzo_len;
+		percent = (double)zlib_len / (double)alt_len;
 		percent *= 100;
 		if (percent > 100 - c->favor_percent)
-			goto select_lzo;
+			goto select_alt;
 		goto select_zlib;
 	}
 
-	if (lzo_ret)
+	if (alt_ret)
 		/* Only zlib compressor succeeded */
 		goto select_zlib;
 
-	/* Only LZO compressor succeeded */
+	/* Only alternative compressor succeeded */
 
-select_lzo:
-	*out_len = lzo_len;
-	*type = MKFS_UBIFS_COMPR_LZO;
+select_alt:
+	*out_len = alt_len;
+	if (lzo)
+		*type = MKFS_UBIFS_COMPR_LZO;
+	else
+		*type = MKFS_UBIFS_COMPR_LZ4HC;
 	return 0;
 
 select_zlib:
@@ -170,10 +191,13 @@ int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
 		return MKFS_UBIFS_COMPR_NONE;
 	}
 
-	if (c->favor_lzo)
-		ret = favor_lzo_compress(in_buf, in_len, out_buf, out_len, &type);
+	if (c->favor_lzo || c->favor_lz4hc)
+		ret = favor_alt_compress(in_buf, in_len, out_buf, out_len, &type, c->favor_lzo);
 	else {
 		switch (type) {
+		case MKFS_UBIFS_COMPR_LZ4HC:
+			ret = lz4hc_compress(in_buf, in_len, out_buf, out_len);
+			break;
 		case MKFS_UBIFS_COMPR_LZO:
 			ret = lzo_compress(in_buf, in_len, out_buf, out_len);
 			break;
diff --git a/mkfs.ubifs/compr.h b/mkfs.ubifs/compr.h
index e3dd95c..a20033c 100644
--- a/mkfs.ubifs/compr.h
+++ b/mkfs.ubifs/compr.h
@@ -36,6 +36,7 @@ enum compression_type
 	MKFS_UBIFS_COMPR_NONE,
 	MKFS_UBIFS_COMPR_LZO,
 	MKFS_UBIFS_COMPR_ZLIB,
+	MKFS_UBIFS_COMPR_LZ4HC,
 };
 
 int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len,
diff --git a/mkfs.ubifs/lz4/lz4.h b/mkfs.ubifs/lz4/lz4.h
new file mode 100644
index 0000000..f9aea72
--- /dev/null
+++ b/mkfs.ubifs/lz4/lz4.h
@@ -0,0 +1,205 @@
+/*
+   LZ4 - Fast LZ compression algorithm
+   Header File
+   Copyright (C) 2011-2013, Yann Collet.
+   BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+
+   Redistribution and use in source and binary forms, with or without
+   modification, are permitted provided that the following conditions are
+   met:
+
+       * Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+       * Redistributions in binary form must reproduce the above
+   copyright notice, this list of conditions and the following disclaimer
+   in the documentation and/or other materials provided with the
+   distribution.
+
+   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+   You can contact the author at :
+   - LZ4 homepage : http://fastcompression.blogspot.com/p/lz4.html
+   - LZ4 source repository : http://code.google.com/p/lz4/
+*/
+#pragma once
+
+#if defined (__cplusplus)
+extern "C" {
+#endif
+
+
+//**************************************
+// Compiler Options
+//**************************************
+#if defined(_MSC_VER) && !defined(__cplusplus)   // Visual Studio
+#  define inline __inline           // Visual C is not C99, but supports some kind of inline
+#endif
+
+
+//****************************
+// Simple Functions
+//****************************
+
+int LZ4_compress        (const char* source, char* dest, int inputSize);
+int LZ4_decompress_safe (const char* source, char* dest, int inputSize, int maxOutputSize);
+
+/*
+LZ4_compress() :
+    Compresses 'inputSize' bytes from 'source' into 'dest'.
+    Destination buffer must be already allocated,
+    and must be sized to handle worst cases situations (input data not compressible)
+    Worst case size evaluation is provided by function LZ4_compressBound()
+    inputSize : Max supported value is ~1.9GB
+    return : the number of bytes written in buffer dest
+             or 0 if the compression fails
+
+LZ4_decompress_safe() :
+    maxOutputSize : is the size of the destination buffer (which must be already allocated)
+    return : the number of bytes decoded in the destination buffer (necessarily <= maxOutputSize)
+             If the source stream is detected malformed, the function will stop decoding and return a negative result.
+             This function is protected against buffer overflow exploits (never writes outside of output buffer, and never reads outside of input buffer). Therefore, it is protected against malicious data packets
+*/
+
+
+//****************************
+// Advanced Functions
+//****************************
+
+static inline int LZ4_compressBound(int isize)   { return ((isize) + ((isize)/255) + 16); }
+#define           LZ4_COMPRESSBOUND(    isize)            ((isize) + ((isize)/255) + 16)
+
+/*
+LZ4_compressBound() :
+    Provides the maximum size that LZ4 may output in a "worst case" scenario (input data not compressible)
+    primarily useful for memory allocation of output buffer.
+    inline function is recommended for the general case,
+    macro is also provided when result needs to be evaluated at compilation (such as stack memory allocation).
+
+    isize  : is the input size. Max supported value is ~1.9GB
+    return : maximum output size in a "worst case" scenario
+    note : this function is limited by "int" range (2^31-1)
+*/
+
+
+int LZ4_compress_limitedOutput (const char* source, char* dest, int inputSize, int maxOutputSize);
+
+/*
+LZ4_compress_limitedOutput() :
+    Compress 'inputSize' bytes from 'source' into an output buffer 'dest' of maximum size 'maxOutputSize'.
+    If it cannot achieve it, compression will stop, and result of the function will be zero.
+    This function never writes outside of provided output buffer.
+
+    inputSize  : Max supported value is ~1.9GB
+    maxOutputSize : is the size of the destination buffer (which must be already allocated)
+    return : the number of bytes written in buffer 'dest'
+             or 0 if the compression fails
+*/
+
+
+int LZ4_decompress_fast (const char* source, char* dest, int outputSize);
+
+/*
+LZ4_decompress_fast() :
+    outputSize : is the original (uncompressed) size
+    return : the number of bytes read from the source buffer (in other words, the compressed size)
+             If the source stream is malformed, the function will stop decoding and return a negative result.
+    note : This function is a bit faster than LZ4_decompress_safe()
+           This function never writes outside of output buffers, but may read beyond input buffer in case of malicious data packet.
+           Use this function preferably into a trusted environment (data to decode comes from a trusted source).
+           Destination buffer must be already allocated. Its size must be a minimum of 'outputSize' bytes.
+*/
+
+int LZ4_decompress_safe_partial (const char* source, char* dest, int inputSize, int targetOutputSize, int maxOutputSize);
+
+/*
+LZ4_decompress_safe_partial() :
+    This function decompress a compressed block of size 'inputSize' at position 'source'
+    into output buffer 'dest' of size 'maxOutputSize'.
+    The function stops decompressing operation as soon as 'targetOutputSize' has been reached,
+    reducing decompression time.
+    return : the number of bytes decoded in the destination buffer (necessarily <= maxOutputSize)
+       Note : this number can be < 'targetOutputSize' should the compressed block to decode be smaller.
+             Always control how many bytes were decoded.
+             If the source stream is detected malformed, the function will stop decoding and return a negative result.
+             This function never writes outside of output buffer, and never reads outside of input buffer. It is therefore protected against malicious data packets
+*/
+
+
+//****************************
+// Stream Functions
+//****************************
+
+void* LZ4_create (const char* inputBuffer);
+int   LZ4_compress_continue (void* LZ4_Data, const char* source, char* dest, int inputSize);
+int   LZ4_compress_limitedOutput_continue (void* LZ4_Data, const char* source, char* dest, int inputSize, int maxOutputSize);
+char* LZ4_slideInputBuffer (void* LZ4_Data);
+int   LZ4_free (void* LZ4_Data);
+
+/* 
+These functions allow the compression of dependent blocks, where each block benefits from prior 64 KB within preceding blocks.
+In order to achieve this, it is necessary to start creating the LZ4 Data Structure, thanks to the function :
+
+void* LZ4_create (const char* inputBuffer);
+The result of the function is the (void*) pointer on the LZ4 Data Structure.
+This pointer will be needed in all other functions.
+If the pointer returned is NULL, then the allocation has failed, and compression must be aborted.
+The only parameter 'const char* inputBuffer' must, obviously, point at the beginning of input buffer.
+The input buffer must be already allocated, and size at least 192KB.
+'inputBuffer' will also be the 'const char* source' of the first block.
+
+All blocks are expected to lay next to each other within the input buffer, starting from 'inputBuffer'.
+To compress each block, use either LZ4_compress_continue() or LZ4_compress_limitedOutput_continue().
+Their behavior are identical to LZ4_compress() or LZ4_compress_limitedOutput(), 
+but require the LZ4 Data Structure as their first argument, and check that each block starts right after the previous one.
+If next block does not begin immediately after the previous one, the compression will fail (return 0).
+
+When it's no longer possible to lay the next block after the previous one (not enough space left into input buffer), a call to : 
+char* LZ4_slideInputBuffer(void* LZ4_Data);
+must be performed. It will typically copy the latest 64KB of input at the beginning of input buffer.
+Note that, for this function to work properly, minimum size of an input buffer must be 192KB.
+==> The memory position where the next input data block must start is provided as the result of the function.
+
+Compression can then resume, using LZ4_compress_continue() or LZ4_compress_limitedOutput_continue(), as usual.
+
+When compression is completed, a call to LZ4_free() will release the memory used by the LZ4 Data Structure.
+*/
+
+
+int LZ4_decompress_safe_withPrefix64k (const char* source, char* dest, int inputSize, int maxOutputSize);
+int LZ4_decompress_fast_withPrefix64k (const char* source, char* dest, int outputSize);
+
+/*
+*_withPrefix64k() :
+    These decoding functions work the same as their "normal name" versions,
+    but can use up to 64KB of data in front of 'char* dest'.
+    These functions are necessary to decode inter-dependant blocks.
+*/
+
+
+//****************************
+// Obsolete Functions
+//****************************
+
+static inline int LZ4_uncompress (const char* source, char* dest, int outputSize) { return LZ4_decompress_fast(source, dest, outputSize); }
+static inline int LZ4_uncompress_unknownOutputSize (const char* source, char* dest, int isize, int maxOutputSize) { return LZ4_decompress_safe(source, dest, isize, maxOutputSize); }
+
+/*
+These functions are deprecated and should no longer be used.
+They are provided here for compatibility with existing user programs.
+*/
+
+
+
+#if defined (__cplusplus)
+}
+#endif
diff --git a/mkfs.ubifs/lz4/lz4hc.c b/mkfs.ubifs/lz4/lz4hc.c
new file mode 100644
index 0000000..d2b402d
--- /dev/null
+++ b/mkfs.ubifs/lz4/lz4hc.c
@@ -0,0 +1,817 @@
+/*
+   LZ4 HC - High Compression Mode of LZ4
+   Copyright (C) 2011-2013, Yann Collet.
+   BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+
+   Redistribution and use in source and binary forms, with or without
+   modification, are permitted provided that the following conditions are
+   met:
+
+       * Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+       * Redistributions in binary form must reproduce the above
+   copyright notice, this list of conditions and the following disclaimer
+   in the documentation and/or other materials provided with the
+   distribution.
+
+   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+   You can contact the author at :
+   - LZ4 homepage : http://fastcompression.blogspot.com/p/lz4.html
+   - LZ4 source repository : http://code.google.com/p/lz4/
+*/
+
+//**************************************
+// Memory routines
+//**************************************
+#include <stdlib.h>   // calloc, free
+#define ALLOCATOR(s)  calloc(1,s)
+#define FREEMEM       free
+#include <string.h>   // memset, memcpy
+#define MEM_INIT      memset
+
+
+//**************************************
+// CPU Feature Detection
+//**************************************
+// 32 or 64 bits ?
+#if (defined(__x86_64__) || defined(_M_X64) || defined(_WIN64) \
+  || defined(__powerpc64__) || defined(__ppc64__) || defined(__PPC64__) \
+  || defined(__64BIT__) || defined(_LP64) || defined(__LP64__) \
+  || defined(__ia64) || defined(__itanium__) || defined(_M_IA64) )   // Detects 64 bits mode
+#  define LZ4_ARCH64 1
+#else
+#  define LZ4_ARCH64 0
+#endif
+
+// Little Endian or Big Endian ?
+// Overwrite the #define below if you know your architecture endianess
+#if defined (__GLIBC__)
+#  include <endian.h>
+#  if (__BYTE_ORDER == __BIG_ENDIAN)
+#     define LZ4_BIG_ENDIAN 1
+#  endif
+#elif (defined(__BIG_ENDIAN__) || defined(__BIG_ENDIAN) || defined(_BIG_ENDIAN)) && !(defined(__LITTLE_ENDIAN__) || defined(__LITTLE_ENDIAN) || defined(_LITTLE_ENDIAN))
+#  define LZ4_BIG_ENDIAN 1
+#elif defined(__sparc) || defined(__sparc__) \
+   || defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) \
+   || defined(__hpux)  || defined(__hppa) \
+   || defined(_MIPSEB) || defined(__s390__)
+#  define LZ4_BIG_ENDIAN 1
+#else
+// Little Endian assumed. PDP Endian and other very rare endian format are unsupported.
+#endif
+
+// Unaligned memory access is automatically enabled for "common" CPU, such as x86.
+// For others CPU, the compiler will be more cautious, and insert extra code to ensure aligned access is respected
+// If you know your target CPU supports unaligned memory access, you want to force this option manually to improve performance
+#if defined(__ARM_FEATURE_UNALIGNED)
+#  define LZ4_FORCE_UNALIGNED_ACCESS 1
+#endif
+
+// Define this parameter if your target system or compiler does not support hardware bit count
+#if defined(_MSC_VER) && defined(_WIN32_WCE)            // Visual Studio for Windows CE does not support Hardware bit count
+#  define LZ4_FORCE_SW_BITCOUNT
+#endif
+
+
+//**************************************
+// Compiler Options
+//**************************************
+#if defined (__STDC_VERSION__) && __STDC_VERSION__ >= 199901L   // C99
+  /* "restrict" is a known keyword */
+#else
+#  define restrict  // Disable restrict
+#endif
+
+#ifdef _MSC_VER    // Visual Studio
+#  define FORCE_INLINE static __forceinline
+#  include <intrin.h>                    // For Visual 2005
+#  if LZ4_ARCH64   // 64-bits
+#    pragma intrinsic(_BitScanForward64) // For Visual 2005
+#    pragma intrinsic(_BitScanReverse64) // For Visual 2005
+#  else            // 32-bits
+#    pragma intrinsic(_BitScanForward)   // For Visual 2005
+#    pragma intrinsic(_BitScanReverse)   // For Visual 2005
+#  endif
+#  pragma warning(disable : 4127)        // disable: C4127: conditional expression is constant
+#  pragma warning(disable : 4701)        // disable: C4701: potentially uninitialized local variable used
+#else 
+#  ifdef __GNUC__
+#    define FORCE_INLINE static inline __attribute__((always_inline))
+#  else
+#    define FORCE_INLINE static inline
+#  endif
+#endif
+
+#ifdef _MSC_VER  // Visual Studio
+#  define lz4_bswap16(x) _byteswap_ushort(x)
+#else
+#  define lz4_bswap16(x)  ((unsigned short int) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8)))
+#endif
+
+
+//**************************************
+// Includes
+//**************************************
+#include "lz4hc.h"
+#include "lz4.h"
+
+
+//**************************************
+// Basic Types
+//**************************************
+#if defined (__STDC_VERSION__) && __STDC_VERSION__ >= 199901L   // C99
+# include <stdint.h>
+  typedef uint8_t  BYTE;
+  typedef uint16_t U16;
+  typedef uint32_t U32;
+  typedef  int32_t S32;
+  typedef uint64_t U64;
+#else
+  typedef unsigned char       BYTE;
+  typedef unsigned short      U16;
+  typedef unsigned int        U32;
+  typedef   signed int        S32;
+  typedef unsigned long long  U64;
+#endif
+
+#if defined(__GNUC__)  && !defined(LZ4_FORCE_UNALIGNED_ACCESS)
+#  define _PACKED __attribute__ ((packed))
+#else
+#  define _PACKED
+#endif
+
+#if !defined(LZ4_FORCE_UNALIGNED_ACCESS) && !defined(__GNUC__)
+#  ifdef __IBMC__
+#    pragma pack(1)
+#  else
+#    pragma pack(push, 1)
+#  endif
+#endif
+
+typedef struct _U16_S { U16 v; } _PACKED U16_S;
+typedef struct _U32_S { U32 v; } _PACKED U32_S;
+typedef struct _U64_S { U64 v; } _PACKED U64_S;
+
+#if !defined(LZ4_FORCE_UNALIGNED_ACCESS) && !defined(__GNUC__)
+#  pragma pack(pop)
+#endif
+
+#define A64(x) (((U64_S *)(x))->v)
+#define A32(x) (((U32_S *)(x))->v)
+#define A16(x) (((U16_S *)(x))->v)
+
+
+//**************************************
+// Constants
+//**************************************
+#define MINMATCH 4
+
+#define DICTIONARY_LOGSIZE 16
+#define MAXD (1<<DICTIONARY_LOGSIZE)
+#define MAXD_MASK ((U32)(MAXD - 1))
+#define MAX_DISTANCE (MAXD - 1)
+
+#define HASH_LOG (DICTIONARY_LOGSIZE-1)
+#define HASHTABLESIZE (1 << HASH_LOG)
+#define HASH_MASK (HASHTABLESIZE - 1)
+
+#define MAX_NB_ATTEMPTS 256
+
+#define ML_BITS  4
+#define ML_MASK  (size_t)((1U<<ML_BITS)-1)
+#define RUN_BITS (8-ML_BITS)
+#define RUN_MASK ((1U<<RUN_BITS)-1)
+
+#define COPYLENGTH 8
+#define LASTLITERALS 5
+#define MFLIMIT (COPYLENGTH+MINMATCH)
+#define MINLENGTH (MFLIMIT+1)
+#define OPTIMAL_ML (int)((ML_MASK-1)+MINMATCH)
+
+#define KB *(1U<<10)
+#define MB *(1U<<20)
+#define GB *(1U<<30)
+
+
+//**************************************
+// Architecture-specific macros
+//**************************************
+#if LZ4_ARCH64   // 64-bit
+#  define STEPSIZE 8
+#  define LZ4_COPYSTEP(s,d)     A64(d) = A64(s); d+=8; s+=8;
+#  define LZ4_COPYPACKET(s,d)   LZ4_COPYSTEP(s,d)
+#  define UARCH U64
+#  define AARCH A64
+#  define HTYPE                 U32
+#  define INITBASE(b,s)         const BYTE* const b = s
+#else   // 32-bit
+#  define STEPSIZE 4
+#  define LZ4_COPYSTEP(s,d)     A32(d) = A32(s); d+=4; s+=4;
+#  define LZ4_COPYPACKET(s,d)   LZ4_COPYSTEP(s,d); LZ4_COPYSTEP(s,d);
+#  define UARCH U32
+#  define AARCH A32
+//#  define HTYPE                 const BYTE*
+//#  define INITBASE(b,s)         const int b = 0
+#  define HTYPE                 U32
+#  define INITBASE(b,s)         const BYTE* const b = s
+#endif
+
+#if defined(LZ4_BIG_ENDIAN)
+#  define LZ4_READ_LITTLEENDIAN_16(d,s,p) { U16 v = A16(p); v = lz4_bswap16(v); d = (s) - v; }
+#  define LZ4_WRITE_LITTLEENDIAN_16(p,i)  { U16 v = (U16)(i); v = lz4_bswap16(v); A16(p) = v; p+=2; }
+#else   // Little Endian
+#  define LZ4_READ_LITTLEENDIAN_16(d,s,p) { d = (s) - A16(p); }
+#  define LZ4_WRITE_LITTLEENDIAN_16(p,v)  { A16(p) = v; p+=2; }
+#endif
+
+
+//************************************************************
+// Local Types
+//************************************************************
+typedef struct 
+{
+    const BYTE* inputBuffer;
+    const BYTE* base;
+    const BYTE* end;
+    HTYPE hashTable[HASHTABLESIZE];
+    U16 chainTable[MAXD];
+    const BYTE* nextToUpdate;
+} LZ4HC_Data_Structure;
+
+
+//**************************************
+// Macros
+//**************************************
+#define LZ4_WILDCOPY(s,d,e)    do { LZ4_COPYPACKET(s,d) } while (d<e);
+#define LZ4_BLINDCOPY(s,d,l)   { BYTE* e=d+l; LZ4_WILDCOPY(s,d,e); d=e; }
+#define HASH_FUNCTION(i)       (((i) * 2654435761U) >> ((MINMATCH*8)-HASH_LOG))
+#define HASH_VALUE(p)          HASH_FUNCTION(A32(p))
+#define HASH_POINTER(p)        (HashTable[HASH_VALUE(p)] + base)
+#define DELTANEXT(p)           chainTable[(size_t)(p) & MAXD_MASK] 
+#define GETNEXT(p)             ((p) - (size_t)DELTANEXT(p))
+
+
+//**************************************
+// Private functions
+//**************************************
+#if LZ4_ARCH64
+
+FORCE_INLINE int LZ4_NbCommonBytes (register U64 val)
+{
+#if defined(LZ4_BIG_ENDIAN)
+#  if defined(_MSC_VER) && !defined(LZ4_FORCE_SW_BITCOUNT)
+    unsigned long r = 0;
+    _BitScanReverse64( &r, val );
+    return (int)(r>>3);
+#  elif defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 304) && !defined(LZ4_FORCE_SW_BITCOUNT)
+    return (__builtin_clzll(val) >> 3); 
+#  else
+    int r;
+    if (!(val>>32)) { r=4; } else { r=0; val>>=32; }
+    if (!(val>>16)) { r+=2; val>>=8; } else { val>>=24; }
+    r += (!val);
+    return r;
+#  endif
+#else
+#  if defined(_MSC_VER) && !defined(LZ4_FORCE_SW_BITCOUNT)
+    unsigned long r = 0;
+    _BitScanForward64( &r, val );
+    return (int)(r>>3);
+#  elif defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 304) && !defined(LZ4_FORCE_SW_BITCOUNT)
+    return (__builtin_ctzll(val) >> 3); 
+#  else
+    static const int DeBruijnBytePos[64] = { 0, 0, 0, 0, 0, 1, 1, 2, 0, 3, 1, 3, 1, 4, 2, 7, 0, 2, 3, 6, 1, 5, 3, 5, 1, 3, 4, 4, 2, 5, 6, 7, 7, 0, 1, 2, 3, 3, 4, 6, 2, 6, 5, 5, 3, 4, 5, 6, 7, 1, 2, 4, 6, 4, 4, 5, 7, 2, 6, 5, 7, 6, 7, 7 };
+    return DeBruijnBytePos[((U64)((val & -val) * 0x0218A392CDABBD3F)) >> 58];
+#  endif
+#endif
+}
+
+#else
+
+FORCE_INLINE int LZ4_NbCommonBytes (register U32 val)
+{
+#if defined(LZ4_BIG_ENDIAN)
+#  if defined(_MSC_VER) && !defined(LZ4_FORCE_SW_BITCOUNT)
+    unsigned long r;
+    _BitScanReverse( &r, val );
+    return (int)(r>>3);
+#  elif defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 304) && !defined(LZ4_FORCE_SW_BITCOUNT)
+    return (__builtin_clz(val) >> 3); 
+#  else
+    int r;
+    if (!(val>>16)) { r=2; val>>=8; } else { r=0; val>>=24; }
+    r += (!val);
+    return r;
+#  endif
+#else
+#  if defined(_MSC_VER) && !defined(LZ4_FORCE_SW_BITCOUNT)
+    unsigned long r;
+    _BitScanForward( &r, val );
+    return (int)(r>>3);
+#  elif defined(__GNUC__) && ((__GNUC__ * 100 + __GNUC_MINOR__) >= 304) && !defined(LZ4_FORCE_SW_BITCOUNT)
+    return (__builtin_ctz(val) >> 3); 
+#  else
+    static const int DeBruijnBytePos[32] = { 0, 0, 3, 0, 3, 1, 3, 0, 3, 2, 2, 1, 3, 2, 0, 1, 3, 3, 1, 2, 2, 2, 2, 0, 3, 1, 2, 0, 1, 0, 1, 1 };
+    return DeBruijnBytePos[((U32)((val & -(S32)val) * 0x077CB531U)) >> 27];
+#  endif
+#endif
+}
+
+#endif
+
+
+FORCE_INLINE void LZ4_initHC (LZ4HC_Data_Structure* hc4, const BYTE* base)
+{
+    MEM_INIT((void*)hc4->hashTable, 0, sizeof(hc4->hashTable));
+    MEM_INIT(hc4->chainTable, 0xFF, sizeof(hc4->chainTable));
+    hc4->nextToUpdate = base + 1;
+    hc4->base = base;
+    hc4->inputBuffer = base;
+    hc4->end = base;
+}
+
+
+void* LZ4_createHC (const char* inputBuffer)
+{
+    void* hc4 = ALLOCATOR(sizeof(LZ4HC_Data_Structure));
+    LZ4_initHC ((LZ4HC_Data_Structure*)hc4, (const BYTE*)inputBuffer);
+    return hc4;
+}
+
+
+int LZ4_freeHC (void* LZ4HC_Data)
+{
+    FREEMEM(LZ4HC_Data);
+    return (0);
+}
+
+
+// Update chains up to ip (excluded)
+FORCE_INLINE void LZ4HC_Insert (LZ4HC_Data_Structure* hc4, const BYTE* ip)
+{
+    U16*   chainTable = hc4->chainTable;
+    HTYPE* HashTable  = hc4->hashTable;
+    INITBASE(base,hc4->base);
+
+    while(hc4->nextToUpdate < ip)
+    {
+        const BYTE* const p = hc4->nextToUpdate;
+        size_t delta = (p) - HASH_POINTER(p); 
+        if (delta>MAX_DISTANCE) delta = MAX_DISTANCE; 
+        DELTANEXT(p) = (U16)delta; 
+        HashTable[HASH_VALUE(p)] = (HTYPE)((p) - base);
+        hc4->nextToUpdate++;
+    }
+}
+
+
+char* LZ4_slideInputBufferHC(void* LZ4HC_Data)
+{
+    LZ4HC_Data_Structure* hc4 = (LZ4HC_Data_Structure*)LZ4HC_Data;
+    U32 distance = (U32)(hc4->end - hc4->inputBuffer) - 64 KB;
+    distance = (distance >> 16) << 16;   // Must be a multiple of 64 KB
+    LZ4HC_Insert(hc4, hc4->end - MINMATCH);
+    memcpy((void*)(hc4->end - 64 KB - distance), (const void*)(hc4->end - 64 KB), 64 KB);
+    hc4->nextToUpdate -= distance;
+    hc4->base -= distance;
+    if ((U32)(hc4->inputBuffer - hc4->base) > 1 GB + 64 KB)   // Avoid overflow
+    {
+        int i;
+        hc4->base += 1 GB;
+        for (i=0; i<HASHTABLESIZE; i++) hc4->hashTable[i] -= 1 GB;
+    }
+    hc4->end -= distance;
+    return (char*)(hc4->end);
+}
+
+
+FORCE_INLINE size_t LZ4HC_CommonLength (const BYTE* p1, const BYTE* p2, const BYTE* const matchlimit)
+{
+    const BYTE* p1t = p1;
+
+    while (p1t<matchlimit-(STEPSIZE-1))
+    {
+        UARCH diff = AARCH(p2) ^ AARCH(p1t);
+        if (!diff) { p1t+=STEPSIZE; p2+=STEPSIZE; continue; }
+        p1t += LZ4_NbCommonBytes(diff);
+        return (p1t - p1);
+    }
+    if (LZ4_ARCH64) if ((p1t<(matchlimit-3)) && (A32(p2) == A32(p1t))) { p1t+=4; p2+=4; }
+    if ((p1t<(matchlimit-1)) && (A16(p2) == A16(p1t))) { p1t+=2; p2+=2; }
+    if ((p1t<matchlimit) && (*p2 == *p1t)) p1t++;
+    return (p1t - p1);
+}
+
+
+FORCE_INLINE int LZ4HC_InsertAndFindBestMatch (LZ4HC_Data_Structure* hc4, const BYTE* ip, const BYTE* const matchlimit, const BYTE** matchpos)
+{
+    U16* const chainTable = hc4->chainTable;
+    HTYPE* const HashTable = hc4->hashTable;
+    const BYTE* ref;
+    INITBASE(base,hc4->base);
+    int nbAttempts=MAX_NB_ATTEMPTS;
+    size_t repl=0, ml=0;
+    U16 delta=0;  // useless assignment, to remove an uninitialization warning
+
+    // HC4 match finder
+    LZ4HC_Insert(hc4, ip);
+    ref = HASH_POINTER(ip);
+
+#define REPEAT_OPTIMIZATION
+#ifdef REPEAT_OPTIMIZATION
+    // Detect repetitive sequences of length <= 4
+    if ((U32)(ip-ref) <= 4)        // potential repetition
+    {
+        if (A32(ref) == A32(ip))   // confirmed
+        {
+            delta = (U16)(ip-ref);
+            repl = ml  = LZ4HC_CommonLength(ip+MINMATCH, ref+MINMATCH, matchlimit) + MINMATCH;
+            *matchpos = ref;
+        }
+        ref = GETNEXT(ref);
+    }
+#endif
+
+    while (((U32)(ip-ref) <= MAX_DISTANCE) && (nbAttempts))
+    {
+        nbAttempts--;
+        if (*(ref+ml) == *(ip+ml))
+        if (A32(ref) == A32(ip))
+        {
+            size_t mlt = LZ4HC_CommonLength(ip+MINMATCH, ref+MINMATCH, matchlimit) + MINMATCH;
+            if (mlt > ml) { ml = mlt; *matchpos = ref; }
+        }
+        ref = GETNEXT(ref);
+    }
+
+#ifdef REPEAT_OPTIMIZATION
+    // Complete table
+    if (repl)
+    {
+        const BYTE* ptr = ip;
+        const BYTE* end;
+
+        end = ip + repl - (MINMATCH-1);
+        while(ptr < end-delta)
+        {
+            DELTANEXT(ptr) = delta;    // Pre-Load
+            ptr++;
+        }
+        do
+        {
+            DELTANEXT(ptr) = delta;    
+            HashTable[HASH_VALUE(ptr)] = (HTYPE)((ptr) - base);     // Head of chain
+            ptr++;
+        } while(ptr < end);
+        hc4->nextToUpdate = end;
+    }
+#endif 
+
+    return (int)ml;
+}
+
+
+FORCE_INLINE int LZ4HC_InsertAndGetWiderMatch (LZ4HC_Data_Structure* hc4, const BYTE* ip, const BYTE* startLimit, const BYTE* matchlimit, int longest, const BYTE** matchpos, const BYTE** startpos)
+{
+    U16* const  chainTable = hc4->chainTable;
+    HTYPE* const HashTable = hc4->hashTable;
+    INITBASE(base,hc4->base);
+    const BYTE*  ref;
+    int nbAttempts = MAX_NB_ATTEMPTS;
+    int delta = (int)(ip-startLimit);
+
+    // First Match
+    LZ4HC_Insert(hc4, ip);
+    ref = HASH_POINTER(ip);
+
+    while (((U32)(ip-ref) <= MAX_DISTANCE) && (nbAttempts))
+    {
+        nbAttempts--;
+        if (*(startLimit + longest) == *(ref - delta + longest))
+        if (A32(ref) == A32(ip))
+        {
+#if 1
+            const BYTE* reft = ref+MINMATCH;
+            const BYTE* ipt = ip+MINMATCH;
+            const BYTE* startt = ip;
+
+            while (ipt<matchlimit-(STEPSIZE-1))
+            {
+                UARCH diff = AARCH(reft) ^ AARCH(ipt);
+                if (!diff) { ipt+=STEPSIZE; reft+=STEPSIZE; continue; }
+                ipt += LZ4_NbCommonBytes(diff);
+                goto _endCount;
+            }
+            if (LZ4_ARCH64) if ((ipt<(matchlimit-3)) && (A32(reft) == A32(ipt))) { ipt+=4; reft+=4; }
+            if ((ipt<(matchlimit-1)) && (A16(reft) == A16(ipt))) { ipt+=2; reft+=2; }
+            if ((ipt<matchlimit) && (*reft == *ipt)) ipt++;
+_endCount:
+            reft = ref;
+#else
+            // Easier for code maintenance, but unfortunately slower too
+            const BYTE* startt = ip;
+            const BYTE* reft = ref;
+            const BYTE* ipt = ip + MINMATCH + LZ4HC_CommonLength(ip+MINMATCH, ref+MINMATCH, matchlimit);
+#endif
+
+            while ((startt>startLimit) && (reft > hc4->inputBuffer) && (startt[-1] == reft[-1])) {startt--; reft--;}
+
+            if ((ipt-startt) > longest)
+            {
+                longest = (int)(ipt-startt);
+                *matchpos = reft;
+                *startpos = startt;
+            }
+        }
+        ref = GETNEXT(ref);
+    }
+
+    return longest;
+}
+
+
+typedef enum { noLimit = 0, limitedOutput = 1 } limitedOutput_directive;
+
+FORCE_INLINE int LZ4HC_encodeSequence (
+                       const BYTE** ip,
+                       BYTE** op,
+                       const BYTE** anchor,
+                       int matchLength,
+                       const BYTE* ref,
+                       limitedOutput_directive limitedOutputBuffer,
+                       BYTE* oend)
+{
+    int length;
+    BYTE* token;
+
+    // Encode Literal length
+    length = (int)(*ip - *anchor);
+    token = (*op)++;
+    if ((limitedOutputBuffer) && ((*op + length + (2 + 1 + LASTLITERALS) + (length>>8)) > oend)) return 1;   // Check output limit
+    if (length>=(int)RUN_MASK) { int len; *token=(RUN_MASK<<ML_BITS); len = length-RUN_MASK; for(; len > 254 ; len-=255) *(*op)++ = 255;  *(*op)++ = (BYTE)len; } 
+    else *token = (BYTE)(length<<ML_BITS);
+
+    // Copy Literals
+    LZ4_BLINDCOPY(*anchor, *op, length);
+
+    // Encode Offset
+    LZ4_WRITE_LITTLEENDIAN_16(*op,(U16)(*ip-ref));
+
+    // Encode MatchLength
+    length = (int)(matchLength-MINMATCH);
+    if ((limitedOutputBuffer) && (*op + (1 + LASTLITERALS) + (length>>8) > oend)) return 1;   // Check output limit
+    if (length>=(int)ML_MASK) { *token+=ML_MASK; length-=ML_MASK; for(; length > 509 ; length-=510) { *(*op)++ = 255; *(*op)++ = 255; } if (length > 254) { length-=255; *(*op)++ = 255; } *(*op)++ = (BYTE)length; } 
+    else *token += (BYTE)(length);	
+
+    // Prepare next loop
+    *ip += matchLength;
+    *anchor = *ip; 
+
+    return 0;
+}
+
+
+static int LZ4HC_compress_generic (
+                 void* ctxvoid,
+                 const char* source, 
+                 char* dest,
+                 int inputSize,
+                 int maxOutputSize,
+                 limitedOutput_directive limit
+                )
+{
+    LZ4HC_Data_Structure* ctx = (LZ4HC_Data_Structure*) ctxvoid;
+    const BYTE* ip = (const BYTE*) source;
+    const BYTE* anchor = ip;
+    const BYTE* const iend = ip + inputSize;
+    const BYTE* const mflimit = iend - MFLIMIT;
+    const BYTE* const matchlimit = (iend - LASTLITERALS);
+
+    BYTE* op = (BYTE*) dest;
+    BYTE* const oend = op + maxOutputSize;
+
+    int   ml, ml2, ml3, ml0;
+    const BYTE* ref=NULL;
+    const BYTE* start2=NULL;
+    const BYTE* ref2=NULL;
+    const BYTE* start3=NULL;
+    const BYTE* ref3=NULL;
+    const BYTE* start0;
+    const BYTE* ref0;
+
+
+    // Ensure blocks follow each other
+    if (ip != ctx->end) return 0;
+    ctx->end += inputSize;
+
+    ip++;
+
+    // Main Loop
+    while (ip < mflimit)
+    {
+        ml = LZ4HC_InsertAndFindBestMatch (ctx, ip, matchlimit, (&ref));
+        if (!ml) { ip++; continue; }
+
+        // saved, in case we would skip too much
+        start0 = ip;
+        ref0 = ref;
+        ml0 = ml;
+
+_Search2:
+        if (ip+ml < mflimit)
+            ml2 = LZ4HC_InsertAndGetWiderMatch(ctx, ip + ml - 2, ip + 1, matchlimit, ml, &ref2, &start2);
+        else ml2 = ml;
+
+        if (ml2 == ml)  // No better match
+        {
+            if (LZ4HC_encodeSequence(&ip, &op, &anchor, ml, ref, limit, oend)) return 0;
+            continue;
+        }
+
+        if (start0 < ip)
+        {
+            if (start2 < ip + ml0)   // empirical
+            {
+                ip = start0;
+                ref = ref0;
+                ml = ml0;
+            }
+        }
+
+        // Here, start0==ip
+        if ((start2 - ip) < 3)   // First Match too small : removed
+        {
+            ml = ml2;
+            ip = start2;
+            ref =ref2;
+            goto _Search2;
+        }
+
+_Search3:
+        // Currently we have :
+        // ml2 > ml1, and
+        // ip1+3 <= ip2 (usually < ip1+ml1)
+        if ((start2 - ip) < OPTIMAL_ML)
+        {
+            int correction;
+            int new_ml = ml;
+            if (new_ml > OPTIMAL_ML) new_ml = OPTIMAL_ML;
+            if (ip+new_ml > start2 + ml2 - MINMATCH) new_ml = (int)(start2 - ip) + ml2 - MINMATCH;
+            correction = new_ml - (int)(start2 - ip);
+            if (correction > 0)
+            {
+                start2 += correction;
+                ref2 += correction;
+                ml2 -= correction;
+            }
+        }
+        // Now, we have start2 = ip+new_ml, with new_ml = min(ml, OPTIMAL_ML=18)
+
+        if (start2 + ml2 < mflimit)
+            ml3 = LZ4HC_InsertAndGetWiderMatch(ctx, start2 + ml2 - 3, start2, matchlimit, ml2, &ref3, &start3);
+        else ml3 = ml2;
+
+        if (ml3 == ml2) // No better match : 2 sequences to encode
+        {
+            // ip & ref are known; Now for ml
+            if (start2 < ip+ml)  ml = (int)(start2 - ip);
+            // Now, encode 2 sequences
+            if (LZ4HC_encodeSequence(&ip, &op, &anchor, ml, ref, limit, oend)) return 0;
+            ip = start2;
+            if (LZ4HC_encodeSequence(&ip, &op, &anchor, ml2, ref2, limit, oend)) return 0;
+            continue;
+        }
+
+        if (start3 < ip+ml+3) // Not enough space for match 2 : remove it
+        {
+            if (start3 >= (ip+ml)) // can write Seq1 immediately ==> Seq2 is removed, so Seq3 becomes Seq1
+            {
+                if (start2 < ip+ml)
+                {
+                    int correction = (int)(ip+ml - start2);
+                    start2 += correction;
+                    ref2 += correction;
+                    ml2 -= correction;
+                    if (ml2 < MINMATCH)
+                    {
+                        start2 = start3;
+                        ref2 = ref3;
+                        ml2 = ml3;
+                    }
+                }
+
+                if (LZ4HC_encodeSequence(&ip, &op, &anchor, ml, ref, limit, oend)) return 0;
+                ip  = start3;
+                ref = ref3;
+                ml  = ml3;
+
+                start0 = start2;
+                ref0 = ref2;
+                ml0 = ml2;
+                goto _Search2;
+            }
+
+            start2 = start3;
+            ref2 = ref3;
+            ml2 = ml3;
+            goto _Search3;
+        }
+
+        // OK, now we have 3 ascending matches; let's write at least the first one
+        // ip & ref are known; Now for ml
+        if (start2 < ip+ml)
+        {
+            if ((start2 - ip) < (int)ML_MASK)
+            {
+                int correction;
+                if (ml > OPTIMAL_ML) ml = OPTIMAL_ML;
+                if (ip + ml > start2 + ml2 - MINMATCH) ml = (int)(start2 - ip) + ml2 - MINMATCH;
+                correction = ml - (int)(start2 - ip);
+                if (correction > 0)
+                {
+                    start2 += correction;
+                    ref2 += correction;
+                    ml2 -= correction;
+                }
+            }
+            else
+            {
+                ml = (int)(start2 - ip);
+            }
+        }
+        if (LZ4HC_encodeSequence(&ip, &op, &anchor, ml, ref, limit, oend)) return 0;
+
+        ip = start2;
+        ref = ref2;
+        ml = ml2;
+
+        start2 = start3;
+        ref2 = ref3;
+        ml2 = ml3;
+
+        goto _Search3;
+
+    }
+
+    // Encode Last Literals
+    {
+        int lastRun = (int)(iend - anchor);
+        if ((limit) && (((char*)op - dest) + lastRun + 1 + ((lastRun+255-RUN_MASK)/255) > (U32)maxOutputSize)) return 0;  // Check output limit
+        if (lastRun>=(int)RUN_MASK) { *op++=(RUN_MASK<<ML_BITS); lastRun-=RUN_MASK; for(; lastRun > 254 ; lastRun-=255) *op++ = 255; *op++ = (BYTE) lastRun; } 
+        else *op++ = (BYTE)(lastRun<<ML_BITS);
+        memcpy(op, anchor, iend - anchor);
+        op += iend-anchor;
+    } 
+
+    // End
+    return (int) (((char*)op)-dest);
+}
+
+
+int LZ4_compressHC(const char* source, char* dest, int inputSize)
+{
+    void* ctx = LZ4_createHC(source);
+    int result;
+    if (ctx==NULL) return 0;
+
+    result = LZ4HC_compress_generic (ctx, source, dest, inputSize, 0, noLimit);
+
+    LZ4_freeHC(ctx);
+    return result;
+}
+
+int LZ4_compressHC_continue (void* LZ4HC_Data, const char* source, char* dest, int inputSize)
+{
+    return LZ4HC_compress_generic (LZ4HC_Data, source, dest, inputSize, 0, noLimit);
+}
+
+
+int LZ4_compressHC_limitedOutput(const char* source, char* dest, int inputSize, int maxOutputSize)
+{
+    void* ctx = LZ4_createHC(source);
+    int result;
+    if (ctx==NULL) return 0;
+
+    result = LZ4HC_compress_generic (ctx, source, dest, inputSize, maxOutputSize, limitedOutput);
+
+    LZ4_freeHC(ctx);
+    return result;
+}
+
+int LZ4_compressHC_limitedOutput_continue (void* LZ4HC_Data, const char* source, char* dest, int inputSize, int maxOutputSize)
+{
+    return LZ4HC_compress_generic (LZ4HC_Data, source, dest, inputSize, maxOutputSize, limitedOutput);
+}
+
diff --git a/mkfs.ubifs/lz4/lz4hc.h b/mkfs.ubifs/lz4/lz4hc.h
new file mode 100644
index 0000000..f3fd954
--- /dev/null
+++ b/mkfs.ubifs/lz4/lz4hc.h
@@ -0,0 +1,111 @@
+/*
+   LZ4 HC - High Compression Mode of LZ4
+   Header File
+   Copyright (C) 2011-2013, Yann Collet.
+   BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+
+   Redistribution and use in source and binary forms, with or without
+   modification, are permitted provided that the following conditions are
+   met:
+
+       * Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+       * Redistributions in binary form must reproduce the above
+   copyright notice, this list of conditions and the following disclaimer
+   in the documentation and/or other materials provided with the
+   distribution.
+
+   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+   You can contact the author at :
+   - LZ4 homepage : http://fastcompression.blogspot.com/p/lz4.html
+   - LZ4 source repository : http://code.google.com/p/lz4/
+*/
+#pragma once
+
+
+#if defined (__cplusplus)
+extern "C" {
+#endif
+
+
+int LZ4_compressHC (const char* source, char* dest, int inputSize);
+/*
+LZ4_compressHC :
+    return : the number of bytes in compressed buffer dest
+             or 0 if compression fails.
+    note : destination buffer must be already allocated. 
+        To avoid any problem, size it to handle worst cases situations (input data not compressible)
+        Worst case size evaluation is provided by function LZ4_compressBound() (see "lz4.h")
+*/
+
+int LZ4_compressHC_limitedOutput (const char* source, char* dest, int inputSize, int maxOutputSize);
+/*
+LZ4_compress_limitedOutput() :
+    Compress 'inputSize' bytes from 'source' into an output buffer 'dest' of maximum size 'maxOutputSize'.
+    If it cannot achieve it, compression will stop, and result of the function will be zero.
+    This function never writes outside of provided output buffer.
+
+    inputSize  : Max supported value is 1 GB
+    maxOutputSize : is maximum allowed size into the destination buffer (which must be already allocated)
+    return : the number of output bytes written in buffer 'dest'
+             or 0 if compression fails.
+*/
+
+
+/* Note :
+Decompression functions are provided within LZ4 source code (see "lz4.h") (BSD license)
+*/
+
+
+/* Advanced Functions */
+
+void* LZ4_createHC (const char* inputBuffer);
+int   LZ4_compressHC_continue (void* LZ4HC_Data, const char* source, char* dest, int inputSize);
+int   LZ4_compressHC_limitedOutput_continue (void* LZ4HC_Data, const char* source, char* dest, int inputSize, int maxOutputSize);
+char* LZ4_slideInputBufferHC (void* LZ4HC_Data);
+int   LZ4_freeHC (void* LZ4HC_Data);
+
+/* 
+These functions allow the compression of dependent blocks, where each block benefits from prior 64 KB within preceding blocks.
+In order to achieve this, it is necessary to start creating the LZ4HC Data Structure, thanks to the function :
+
+void* LZ4_createHC (const char* inputBuffer);
+The result of the function is the (void*) pointer on the LZ4HC Data Structure.
+This pointer will be needed in all other functions.
+If the pointer returned is NULL, then the allocation has failed, and compression must be aborted.
+The only parameter 'const char* inputBuffer' must, obviously, point at the beginning of input buffer.
+The input buffer must be already allocated, and size at least 192KB.
+'inputBuffer' will also be the 'const char* source' of the first block.
+
+All blocks are expected to lay next to each other within the input buffer, starting from 'inputBuffer'.
+To compress each block, use either LZ4_compressHC_continue() or LZ4_compressHC_limitedOutput_continue().
+Their behavior are identical to LZ4_compressHC() or LZ4_compressHC_limitedOutput(), 
+but require the LZ4HC Data Structure as their first argument, and check that each block starts right after the previous one.
+If next block does not begin immediately after the previous one, the compression will fail (return 0).
+
+When it's no longer possible to lay the next block after the previous one (not enough space left into input buffer), a call to : 
+char* LZ4_slideInputBufferHC(void* LZ4HC_Data);
+must be performed. It will typically copy the latest 64KB of input at the beginning of input buffer.
+Note that, for this function to work properly, minimum size of an input buffer must be 192KB.
+==> The memory position where the next input data block must start is provided as the result of the function.
+
+Compression can then resume, using LZ4_compressHC_continue() or LZ4_compressHC_limitedOutput_continue(), as usual.
+
+When compression is completed, a call to LZ4_freeHC() will release the memory used by the LZ4HC Data Structure.
+*/
+
+
+#if defined (__cplusplus)
+}
+#endif
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index f9977bc..b68b0bd 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -179,11 +179,11 @@ static const char *helptext =
 "-o, --output=FILE        output to FILE\n"
 "-j, --jrn-size=SIZE      journal size\n"
 "-R, --reserved=SIZE      how much space should be reserved for the super-user\n"
-"-x, --compr=TYPE         compression type - \"lzo\", \"favor_lzo\", \"zlib\" or\n"
-"                         \"none\" (default: \"lzo\")\n"
-"-X, --favor-percent      may only be used with favor LZO compression and defines\n"
-"                         how many percent better zlib should compress to make\n"
-"                         mkfs.ubifs use zlib instead of LZO (default 20%)\n"
+"-x, --compr=TYPE         compression type - \"lzo\", \"favor_lzo\", \"lz4hc\",\n"
+"                          \"favor_lz4hc\", \"zlib\" or \"none\" (default: \"lzo\")\n"
+"-X, --favor-percent      may only be used with favor LZO or LZ4HC compression and\n"
+"                         defines how many percent better zlib should compress to\n"
+"                         make mkfs.ubifs use zlib instead of LZO/LZ4HC (default 20%)\n"
 "-f, --fanout=NUM         fanout NUM (default: 8)\n"
 "-F, --space-fixup        file-system free space has to be fixed up on first mount\n"
 "                         (requires kernel version 3.0 or greater)\n"
@@ -201,14 +201,15 @@ static const char *helptext =
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilobytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
-"If you specify \"lzo\" or \"zlib\" compressors, mkfs.ubifs will use this compressor\n"
-"for all data. The \"none\" disables any data compression. The \"favor_lzo\" is not\n"
-"really a separate compressor. It is just a method of combining \"lzo\" and \"zlib\"\n"
-"compressors. Namely, mkfs.ubifs tries to compress data with both \"lzo\" and \"zlib\"\n"
-"compressors, then it compares which compressor is better. If \"zlib\" compresses 20\n"
-"or more percent better than \"lzo\", mkfs.ubifs chooses \"lzo\", otherwise it chooses\n"
-"\"zlib\". The \"--favor-percent\" may specify arbitrary threshold instead of the\n"
-"default 20%.\n\n"
+"If you specify \"lz4hc\", \"lzo\" or \"zlib\" compressors, mkfs.ubifs will use this\n"
+"compressor for all data. The \"none\" disables any data compression. The \"favor_lzo\"\n"
+"or \"favor_lz4hc\" are not really separate compressors. They are just a method of\n"
+"combining \"lzo\" and \"zlib\" or \"lz4hc\" and \"zlib\" compressors.\n"
+"Namely, mkfs.ubifs tries to compress data with both compressors specified,\n"
+"then it compares which compressor is better. If \"zlib\" compresses 20\n"
+"or more percent better than the alternative, mkfs.ubifs chooses \"zlib\", otherwise\n"
+"the alternative is chosen. The \"--favor-percent\" may specify arbitrary threshold\n"
+"instead of the default 20%.\n\n"
 "The -F parameter is used to set the \"fix up free space\" flag in the superblock,\n"
 "which forces UBIFS to \"fixup\" all the free space which it is going to use. This\n"
 "option is useful to work-around the problem of double free space programming: if the\n"
@@ -596,8 +597,12 @@ static int get_options(int argc, char**argv)
 		case 'x':
 			if (strcmp(optarg, "favor_lzo") == 0)
 				c->favor_lzo = 1;
+			else if (strcmp(optarg, "favor_lz4hc") == 0)
+				c->favor_lz4hc = 1;
 			else if (strcmp(optarg, "zlib") == 0)
 				c->default_compr = UBIFS_COMPR_ZLIB;
+			else if (strcmp(optarg, "lz4hc") == 0)
+				c->default_compr = UBIFS_COMPR_LZ4HC;
 			else if (strcmp(optarg, "none") == 0)
 				c->default_compr = UBIFS_COMPR_NONE;
 			else if (strcmp(optarg, "lzo") != 0)
@@ -607,7 +612,7 @@ static int get_options(int argc, char**argv)
 			c->favor_percent = strtol(optarg, &endp, 0);
 			if (*endp != '\0' || endp == optarg ||
 			    c->favor_percent <= 0 || c->favor_percent >= 100)
-				return err_msg("bad favor LZO percent '%s'",
+				return err_msg("bad favor percent '%s'",
 					       optarg);
 			break;
 		case 'j':
diff --git a/mkfs.ubifs/ubifs-media.h b/mkfs.ubifs/ubifs-media.h
index fe62d0e..96b8500 100644
--- a/mkfs.ubifs/ubifs-media.h
+++ b/mkfs.ubifs/ubifs-media.h
@@ -296,6 +296,7 @@ enum {
  *
  * UBIFS_COMPR_NONE: no compression
  * UBIFS_COMPR_LZO: LZO compression
+ * UBIFS_COMPR_LZ4HC: LZ4HC compression
  * UBIFS_COMPR_ZLIB: ZLIB compression
  * UBIFS_COMPR_TYPES_CNT: count of supported compression types
  */
@@ -303,6 +304,7 @@ enum {
 	UBIFS_COMPR_NONE,
 	UBIFS_COMPR_LZO,
 	UBIFS_COMPR_ZLIB,
+	UBIFS_COMPR_LZ4HC,
 	UBIFS_COMPR_TYPES_CNT,
 };
 
diff --git a/mkfs.ubifs/ubifs.h b/mkfs.ubifs/ubifs.h
index 434b651..87f944a 100644
--- a/mkfs.ubifs/ubifs.h
+++ b/mkfs.ubifs/ubifs.h
@@ -276,6 +276,7 @@ struct ubifs_znode
  * @main_first: first LEB of the main area
  * @default_compr: default compression type
  * @favor_lzo: favor LZO compression method
+ * @favor_lz4hc: favor LZ4HC compression method
  * @favor_percent: lzo vs. zlib threshold used in case favor LZO
  *
  * @key_hash_type: type of the key hash
@@ -354,6 +355,7 @@ struct ubifs_info
 	int main_first;
 	int default_compr;
 	int favor_lzo;
+	int favor_lz4hc;
 	int favor_percent;
 
 	uint8_t key_hash_type;
-- 
1.7.10.4
