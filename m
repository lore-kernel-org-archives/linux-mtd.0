From: kasparek@fit.vutbr.cz (Kasparek Tomas)
Date: Fri, 7 Feb 2003 10:44:59 +0100 (CET)
Subject: JFFS2 & 2.5.59 & FS_REQUIRES_DEV
In-Reply-To: <1044610143.5502.691.camel@imladris.demon.co.uk>
References: <Pine.BSF.4.51.0302061603270.3212@kazi.fit.vutbr.cz>
 <1044544711.2535.13.camel@passion.cambridge.redhat.com>
 <Pine.BSF.4.51.0302070847270.66348@kazi.fit.vutbr.cz>
 <1044604814.5502.616.camel@imladris.demon.co.uk>
 <Pine.BSF.4.51.0302071016360.70445@kazi.fit.vutbr.cz>
 <1044610143.5502.691.camel@imladris.demon.co.uk>
Message-ID: <Pine.BSF.4.51.0302071031430.70445@kazi.fit.vutbr.cz>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 7 Feb 2003, David Woodhouse wrote:

> On Fri, 2003-02-07 at 09:22, Kasparek Tomas wrote:
> > OK, please could you summarize actual state - how it should work without
> > mtdblock device. What is now the right value for 'root='?
>
> For the root file system, it _doesn't_ work without an mtdblock device.
> You need to specify the device as before. For mounting normally,
> however, you can specify something like 'mtd:jffs2 partition' or 'mtd:1'
> (IIRC -- I'd have to look at the code against to confirm the latter) to
> mount by MTD device name or number, with no need to use the mtdblock
> devices.
>
> If the mechanism for mounting the root file system would pass the
> contents of the 'root=' command line argument in to the file system,
> then we could do it for the root file system too. But it doesn't so we
> can't -- until it gets fixed. So it's not just get_fs_names() that wants
> changing, but the whole way in which we use the 'root=' argument to
> decide on a block device and create a fake /dev/root with the
> appropriate major/minor.

Oh, now I get it all together :-)

-> for mounting root FS we need mtdblock, but just for the mounting - that
is the reason, why mtdblock_ro is enough.

I was trying to get mtdblock_ro in working state sometime ago, but as I see
it now, it will be better to work on solution how to mount root FS without
mtdblock.

Fine, if I have enough time, I will try to think (and code) about handling
with 'root=' and dropping mtdblock support at all.

As I see it, you would like to get state where we use 'root=mtd:X' or
somethink like that and we will be able to mount root FS completelly
without mtdblock support. (Am I right?)

What will be than mtdblock(_ro) good for? (specially _ro version - is there
some other reason to use it?)

(please CC)

Thanks

--

	Tomas Kasparek (sioux), PhD student FIT VUT Brno
 	  tomas.kasparek@[seznam.cz,volny.cz]
	  kasparek at fit.vutbr.cz, linux at fit.vutbr.cz
	  http://www.fit.vutbr.cz/~kasparek
