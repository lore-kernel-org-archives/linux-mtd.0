Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghYla-0005A5-6Y
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2019 11:44:55 +0000
Date: Thu, 10 Jan 2019 12:44:48 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Jan Kara <jack@suse.cz>,
 linux-mtd@lists.infradead.org, Christoph Hellwig <hch@infradead.org>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de
Subject: UBIFS quota support
Message-ID: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm currently working on resurrecting the UBIFS quota patches posted back in
2015 by Dongsheng Yang, last posted here:

http://lists.infradead.org/pipermail/linux-mtd/2015-September/061812.html

First of all I think work stopped there, there is no newer UBIFS quota
support I am missing, right?

One problem with this series was that the quotactl systemcall expects a
path to a block device. UBIFS doesn't work on a block device but on a
character device instead.
The solution in this series was to pass the path to the cdev in
quotactl.  A struct cdev * member was added to struct super_block which
was used to identify the superblock for a given cdev. This approach was
rejected by Christoph ("I don't think the cdev has any business in core
VFS code.").  Apart from that UBIFS can not only be mounted with a path
to the character device (mount -t ubifs /dev/ubix_y /mnt) but also in
the form ubix:volname (mount -t ubifs ubix:volname /mnt) in which case
userspace doesn't have any valid path it could pass in quotactl.

An idea out of this would be to allow to pass the mountpoint instead of
the path to the block device in quotactl which would work with nfs or
even tmpfs aswell. Would that be acceptable? Any other ideas?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
