From: kasparek@fit.vutbr.cz (Kasparek Tomas)
Date: Fri, 7 Feb 2003 10:22:58 +0100 (CET)
Subject: JFFS2 & 2.5.59 & FS_REQUIRES_DEV
In-Reply-To: <1044604814.5502.616.camel@imladris.demon.co.uk>
References: <Pine.BSF.4.51.0302061603270.3212@kazi.fit.vutbr.cz>
 <1044544711.2535.13.camel@passion.cambridge.redhat.com>
 <Pine.BSF.4.51.0302070847270.66348@kazi.fit.vutbr.cz>
 <1044604814.5502.616.camel@imladris.demon.co.uk>
Message-ID: <Pine.BSF.4.51.0302071016360.70445@kazi.fit.vutbr.cz>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 7 Feb 2003, David Woodhouse wrote:

> > I'm trying to get 2.5.59 running on iPAQ and have following problem:
> >
> > - in 2.5.7 jffs2/super.c: fs_flags: FS_REQUIRES_DEV was removed from
> >   jffs2_fs_type.
> > -> that means 'nodev' word at line with jffs2 in /proc/filesystems
> >   (in filesystems list -> get_filesystem_list())
> > -> that means that init/do_mounts.c:get_fs_names() returns empty filesystem
> >    list because thay skip entries with nodev keyword
> > -> having no FS list init/do_mounts.c:mount_block_root() do not try to
> >    mount any FS and it calls panic("VFS: Unable to mount root fs on %s").
> >
> > There are few solutions:
> >
> > - either use fs_flags FS_REQUIRE_DEV again
>
> If we did this, then the mount by MTD device number or partition name
> would stop working. We'd be back to requiring the mtdblock device to be
> present again. I'd rather not do that.
>
> > - or rewrite get_fs_names()
>
> Not just get_fs_names(). We want the 'root=' argument from the kernel's
> command line to be passed to us, which requires rethinking the way it's
> converted into a major/minor number for /dev/root and then mounted.

OK, please could you summarize actual state - how it should work without
mtdblock device. What is now the right value for 'root='?

If there is some page about this, please give me link(s) too.

(I'm not in the list, so please CC me.)

Thanks

--

	Tomas Kasparek (sioux), PhD student FIT VUT Brno
 	  tomas.kasparek@[seznam.cz,volny.cz]
	  kasparek at fit.vutbr.cz, linux at fit.vutbr.cz
	  http://www.fit.vutbr.cz/~kasparek
