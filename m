From: igor.trevisan@bluewind.it (Igor Trevisan)
Date: Mon, 10 Feb 2003 17:53:48 +0100
Subject: mkfs.jffs on arm
In-Reply-To: <1044628184.21169.23.camel@passion.cambridge.redhat.com>
References: <3E43CE5A.28886.1612269@localhost>
Message-ID: <3E47E72C.22242.1F4159F@localhost>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> I could build almost all the utilities related with JFFS
> > a part from mkfs.jffs2 (mkfs.jffs is ok).
> > This is how the compile flow ends...
> 
> > mkfs.jffs2.c:66:18: zlib.h: No such file or directory
> 
> You need zlib cross-compiled and installed such that your
> cross-compiler can find zlib.h (and libz.so or libz.a).
> 
> 
> > mkfs.jffs2.c: In function `write_dirent':
> > mkfs.jffs2.c:770: warning: implicit declaration of function
> > `cpu_to_je16' mkfs.jffs2.c:772: warning: implicit declaration of
> > function `cpu_to_je32'
> 
> It seems to be including the wrong version of linux/jffs2.h. It should
> be including the one from '../include/linux', due to the 'CFLAGS +=
> -I../include' in util/Makefile. 
> 
> 

Tanks for the suggestions!
Mkfs.jffs2 compiling process took some steps forward but...
it's still ending with errors!
In the following lines you can see the messages... 

#include "..." search starts here:
#include <...> search starts here:
 ../include
 /home/igortr/arm-tools/linux/include
 /home/igortr/arm-tools/gcc-3.2.1/lib/gcc-lib/arm-linux/3.2.1/include
 /home/igortr/arm-tools/gcc-3.2.1/arm-linux/sys-include
End of search list.
compr_zlib.c: In function `jffs2_zlib_compress':
compr_zlib.c:63: structure has no member named `zalloc'
compr_zlib.c:64: structure has no member named `zfree'
compr_zlib.c:66: warning: implicit declaration of function `deflateInit'
compr_zlib.c:78: warning: implicit declaration of function `deflate'
compr_zlib.c:80: warning: implicit declaration of function `deflateEnd'
compr_zlib.c: In function `jffs2_zlib_decompress':
compr_zlib.c:108: structure has no member named `zalloc'
compr_zlib.c:109: structure has no member named `zfree'
compr_zlib.c:111: warning: implicit declaration of function `inflateInit'
compr_zlib.c:122: warning: implicit declaration of function `inflate'
compr_zlib.c:125: warning: implicit declaration of function `inflateEnd'
make: *** [compr_zlib.o] Error 1
[igortr at linuxbw1 util]$

I think it's because it's missing some library created with file
in mtd/lib. I tried to cross-compile mtd/lib content but I had a lot
of problems...
Any new suggestion ?
Thanks a lot in advance...
	Igor.
