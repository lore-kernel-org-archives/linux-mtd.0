From: kasparek@fit.vutbr.cz (Kasparek Tomas)
Date: Fri, 7 Feb 2003 08:50:49 +0100 (CET)
Subject: JFFS2 & 2.5.59 & FS_REQUIRES_DEV
In-Reply-To: <1044544711.2535.13.camel@passion.cambridge.redhat.com>
References: <Pine.BSF.4.51.0302061603270.3212@kazi.fit.vutbr.cz>
 <1044544711.2535.13.camel@passion.cambridge.redhat.com>
Message-ID: <Pine.BSF.4.51.0302070847270.66348@kazi.fit.vutbr.cz>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hello,

I'm trying to get 2.5.59 running on iPAQ and have following problem:

- in 2.5.7 jffs2/super.c: fs_flags: FS_REQUIRES_DEV was removed from
  jffs2_fs_type.
-> that means 'nodev' word at line with jffs2 in /proc/filesystems
  (in filesystems list -> get_filesystem_list())
-> that means that init/do_mounts.c:get_fs_names() returns empty filesystem
   list because thay skip entries with nodev keyword
-> having no FS list init/do_mounts.c:mount_block_root() do not try to
   mount any FS and it calls panic("VFS: Unable to mount root fs on %s").

There are few solutions:

- either use fs_flags FS_REQUIRE_DEV again
- or rewrite get_fs_names()
- or use rootfstype=jffs2 kernel parameter

Of course, I can use the kernel param, but I would like to know if
this is desired way or if some code should be changed.

I'm not in the list, so please could you CC the answers.

Thanks in advance

--

	Tomas Kasparek (sioux), PhD student FIT VUT Brno
 	  tomas.kasparek@[seznam.cz,volny.cz]
	  kasparek at fit.vutbr.cz, linux at fit.vutbr.cz
	  http://www.fit.vutbr.cz/~kasparek
