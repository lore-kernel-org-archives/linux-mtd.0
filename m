From: ch@murgatroid.com (Christopher Hoover)
Date: Sun, 9 Feb 2003 14:24:35 -0800
Subject: Flash C3 Cowardly refusing to erase blocks
In-Reply-To: <001501c2d022$4a99e3e0$0200a8c0@ester>
Message-ID: <002201c2d08a$06bd78e0$0301000a@bergamot>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> I've not yet understood if this C3 flash type is properly 
> supported into the kernel-2.4.19 neither 2.5.x.
>
> I've got this error and I think I need a patch for C3 flash.

As I've already told you, C3 flash works fine in recent 2.4
and 2.5 kernels.  Please stop asking if C3 flash is supported.

The only caveat is that you must unlock it before you r/w
mount a jffs2 partition contained within C3 flash.

If you want to use a C3 jffs2 parition as your *root*
partition, you must to do one of three things: 

1. have your bootloader unlock the flash (this would be 
easy, e.g, in blob),

2. use my kernel patch (or similar code),

or 

3. use an initrd that uses the mtd utils to unlock the flash
and then mounts the jffs2 root and pivots.

-ch
