From: dwmw2@infradead.org (David Woodhouse)
Date: 07 Feb 2003 09:56:16 +0000
Subject: JFFS2 & 2.5.59 & FS_REQUIRES_DEV
In-Reply-To: <Pine.BSF.4.51.0302071031430.70445@kazi.fit.vutbr.cz>
References: <Pine.BSF.4.51.0302061603270.3212@kazi.fit.vutbr.cz>
 <1044544711.2535.13.camel@passion.cambridge.redhat.com>
 <Pine.BSF.4.51.0302070847270.66348@kazi.fit.vutbr.cz>
 <1044604814.5502.616.camel@imladris.demon.co.uk>
 <Pine.BSF.4.51.0302071016360.70445@kazi.fit.vutbr.cz>
 <1044610143.5502.691.camel@imladris.demon.co.uk>
 <Pine.BSF.4.51.0302071031430.70445@kazi.fit.vutbr.cz>
Message-ID: <1044611776.5502.695.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-02-07 at 09:44, Kasparek Tomas wrote:
> Oh, now I get it all together :-)
> 
> -> for mounting root FS we need mtdblock, but just for the mounting - that
> is the reason, why mtdblock_ro is enough.

_Any_ block device with minor number 31 would be good enough. We really
don't do anything with it at all. On occasion I've hacked the ramdisk to
load on major 31, to get JFFS2 to mount.

We don't use the device for _anything_ but looking at its minor number
and using that to find the correct MTD device.

> I was trying to get mtdblock_ro in working state sometime ago, but as I see
> it now, it will be better to work on solution how to mount root FS without
> mtdblock.
> 
> Fine, if I have enough time, I will try to think (and code) about handling
> with 'root=' and dropping mtdblock support at all.

That'd be useful -- thanks.

> As I see it, you would like to get state where we use 'root=mtd:X' or
> somethink like that and we will be able to mount root FS completelly
> without mtdblock support. (Am I right?)

Absolutely.

> What will be than mtdblock(_ro) good for? (specially _ro version - is there
> some other reason to use it?)

mtdblock_ro is useful for cramfs. mtdblock is useful for _writing_
things like cramfs (or ext2) once, where you'll have them read-only
during normal operation.

-- 
dwmw2
