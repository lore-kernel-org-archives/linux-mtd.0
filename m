From: dwmw2@infradead.org (David Woodhouse)
Date: 11 Feb 2003 16:45:27 +0000
Subject: mkfs.jffs on arm
In-Reply-To: <3E47E72C.22242.1F4159F@localhost>
References: <3E43CE5A.28886.1612269@localhost>
 <3E47E72C.22242.1F4159F@localhost>
Message-ID: <1044981926.2263.35.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-02-10 at 16:53, Igor Trevisan wrote:

> compr_zlib.c: In function `jffs2_zlib_compress':
> compr_zlib.c:63: structure has no member named `zalloc'
> compr_zlib.c:64: structure has no member named `zfree'
> compr_zlib.c:66: warning: implicit declaration of function `deflateInit'
> compr_zlib.c:78: warning: implicit declaration of function `deflate'
> compr_zlib.c:80: warning: implicit declaration of function `deflateEnd'
> compr_zlib.c: In function `jffs2_zlib_decompress':
> compr_zlib.c:108: structure has no member named `zalloc'
> compr_zlib.c:109: structure has no member named `zfree'
> compr_zlib.c:111: warning: implicit declaration of function `inflateInit'
> compr_zlib.c:122: warning: implicit declaration of function `inflate'
> compr_zlib.c:125: warning: implicit declaration of function `inflateEnd'
> make: *** [compr_zlib.o] Error 1
> [igortr at linuxbw1 util]$

What version of zlib.h is it including? It looks like it might be
including the kernel's version instead of the one for the userspace
zlib.

-- 
dwmw2
