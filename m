From: dwmw2@infradead.org (David Woodhouse)
Date: 07 Feb 2003 14:29:44 +0000
Subject: mkfs.jffs on arm
In-Reply-To: <3E43CE5A.28886.1612269@localhost>
References: <3E43C03E.4616.12A05CE@localhost>
 <3E43CE5A.28886.1612269@localhost>
Message-ID: <1044628184.21169.23.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Please do not place your reply above the quoted text. Place it below,
and quote _only_ what is absolutely necessary when replying.

On Fri, 2003-02-07 at 14:18, Igor Trevisan wrote:
> I could build almost all the utilities related with JFFS
> a part from mkfs.jffs2 (mkfs.jffs is ok).
> This is how the compile flow ends...

> mkfs.jffs2.c:66:18: zlib.h: No such file or directory

You need zlib cross-compiled and installed such that your cross-compiler
can find zlib.h (and libz.so or libz.a).


> mkfs.jffs2.c: In function `write_dirent':
> mkfs.jffs2.c:770: warning: implicit declaration of function `cpu_to_je16'
> mkfs.jffs2.c:772: warning: implicit declaration of function `cpu_to_je32'

It seems to be including the wrong version of linux/jffs2.h. It should
be including the one from '../include/linux', due to the 
'CFLAGS += -I../include' in util/Makefile. 



-- 
dwmw2
