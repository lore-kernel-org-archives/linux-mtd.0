Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Gkvm-0006lC-00
	for mtd-list@infradead.org; Thu, 11 Jan 2001 16:50:30 +0000
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Gkvj-0006kI-00
	for mtd@infradead.org; Thu, 11 Jan 2001 16:50:28 +0000
Date: Thu, 11 Jan 2001 19:58:03 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: mstumpf@pobox.com
cc: Livio Plos <livioplos@bigfoot.com>, mtd@infradead.org
Subject: Re: howto
In-Reply-To: <20010110221533.7759.qmail@web2106.mail.yahoo.com>
Message-ID: <Pine.LNX.4.21.0101111953040.23392-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 10 Jan 2001, Michael Stumpf wrote:
> > Can I boot totally from flash without any other storage support?
> 
> There is a patch out there somewhere (search this list, if you can't find it,
> let me know and I'll get it to you.) that adds a block device to the kernel
> called "/dev/rom".. it has two modes of operation:

That would be the krom device, I think it was done by the uClinux
guys. It's not necessary for booting from cramfs though, it was made for
hackish support of romfs/mmap's directly to flash without going through
the buffer layer.

> unclear) 4 bytes containing the filesystem size (in bytes), 4 bytes of "00",
> and then the filesystem image, whatever that may be.  I use cramfs with great
> success on a very memory-constrained target.

To do that I just replace cramfs_read with this (romfs_start is defined by
head.S during boot to the place where the cramfs lives):

static inline void *cramfs_read(struct super_block *sb, unsigned int
offset, unsigned int len)
{
	return romfs_start + offset;
}

Then to be able to boot from it, add this to fs/super.c:

#ifdef CONFIG_ROOT_CRAMFS_AS_IMAGE
       void *data;
       fs_type = get_fs_type("cramfs");
       ROOT_DEV = get_unnamed_dev();
       sb = read_super(ROOT_DEV, NULL, fs_type, root_mountflags, data, 1);
       goto mount_it;
#endif

in mount_root just above the CONFIG_NFS_ROOT check.

-BW



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
