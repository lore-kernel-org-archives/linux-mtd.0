From: igor.trevisan@bluewind.it (Igor Trevisan)
Date: Tue, 11 Feb 2003 18:45:44 +0100
Subject: mkfs.jffs on arm
In-Reply-To: <1044981926.2263.35.camel@passion.cambridge.redhat.com>
References: <3E47E72C.22242.1F4159F@localhost>
Message-ID: <3E4944D8.16980.21A68CD@localhost>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

[...]
> > `jffs2_zlib_decompress': compr_zlib.c:108: structure has no member
> > named `zalloc' compr_zlib.c:109: structure has no member named
> > `zfree' compr_zlib.c:111: warning: implicit declaration of function
> > `inflateInit' compr_zlib.c:122: warning: implicit declaration of
> > function `inflate' compr_zlib.c:125: warning: implicit declaration
> > of function `inflateEnd' make: *** [compr_zlib.o] Error 1
> > [igortr at linuxbw1 util]$
> 
> What version of zlib.h is it including? It looks like it might be
> including the kernel's version instead of the one for the userspace
> zlib.

Well... forgive my ignorance but...
What does it mean?
Exactly which file have I to try to include and which ones not?
Thanks for the time you (I hope) will spend for me!
:-)
	Igor.
