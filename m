From: dwmw2@infradead.org (David Woodhouse)
Date: 31 Mar 2003 08:17:59 +0100
Subject: jffs2 / eCos
In-Reply-To: <1049057380.1180.36.camel@pc-002>
References: <1049057380.1180.36.camel@pc-002>
Message-ID: <1049095079.16365.768.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2003-03-30 at 21:49, Bob Koninckx wrote:
> First I tried mkfs.jffs2 version 1.32. Mounting the filesystem did not
> even succeed in this case. Apparently some magic number that needed to
> be 1985 was read as 8519. Some endianness problem I suppose.

We broke the endianness support in mkfs.jffs2...

> After upgrading to version 1.35, the filesystem can be mounted.

... then we fixed it :)

>  Files
> and directories appear to be present (the same fileio1 test still runs
> sucessfull and lists what should be present). Opening a file on this
> system seems to succeed (fopen returns a FILE * anyway). However, when I
> try to _read_ from the file, I get EIO errors.

Compile with CONFIG_JFFS2_FS_DEBUG set to 1 (in os-ecos.h iirc). Show
the error messages you get before it gives you EIO.

> Has anybody successfully used mkfs.jffs2 for making a filesystem image
> for a powerpc target system running eCos ? Am I doing something obvious
> wrong ?

You're doing nothing obviously wrong. The endianness support in
mkfs.jffs2 was temporarily broken, but that led to the failure to mount
which you first saw -- it shouldn't be related to the latter problem.

-- 
dwmw2
