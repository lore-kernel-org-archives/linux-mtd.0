From: dwmw2@infradead.org (David Woodhouse)
Date: 07 Feb 2003 08:00:14 +0000
Subject: JFFS2 & 2.5.59 & FS_REQUIRES_DEV
In-Reply-To: <Pine.BSF.4.51.0302070847270.66348@kazi.fit.vutbr.cz>
References: <Pine.BSF.4.51.0302061603270.3212@kazi.fit.vutbr.cz>
 <1044544711.2535.13.camel@passion.cambridge.redhat.com>
 <Pine.BSF.4.51.0302070847270.66348@kazi.fit.vutbr.cz>
Message-ID: <1044604814.5502.616.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-02-07 at 07:50, Kasparek Tomas wrote:
> 
> Hello,
> 
> I'm trying to get 2.5.59 running on iPAQ and have following problem:
> 
> - in 2.5.7 jffs2/super.c: fs_flags: FS_REQUIRES_DEV was removed from
>   jffs2_fs_type.
> -> that means 'nodev' word at line with jffs2 in /proc/filesystems
>   (in filesystems list -> get_filesystem_list())
> -> that means that init/do_mounts.c:get_fs_names() returns empty filesystem
>    list because thay skip entries with nodev keyword
> -> having no FS list init/do_mounts.c:mount_block_root() do not try to
>    mount any FS and it calls panic("VFS: Unable to mount root fs on %s").
> 
> There are few solutions:
> 
> - either use fs_flags FS_REQUIRE_DEV again

If we did this, then the mount by MTD device number or partition name
would stop working. We'd be back to requiring the mtdblock device to be
present again. I'd rather not do that.

> - or rewrite get_fs_names()

Not just get_fs_names(). We want the 'root=' argument from the kernel's
command line to be passed to us, which requires rethinking the way it's
converted into a major/minor number for /dev/root and then mounted. 

> - or use rootfstype=jffs2 kernel parameter

This is the short-term solution, as you've noted.
 
-- 
dwmw2
