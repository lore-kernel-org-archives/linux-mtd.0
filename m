Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JS8eJ-0006tv-2t
	for linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 10:27:31 +0000
Date: Thu, 21 Feb 2008 08:45:08 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Indraneel <indraneel.m@samsung.com>
Subject: Re: Block devices
Message-ID: <20080221084508.GB20156@shareable.org>
References: <47BD22D0.9060008@dlasys.net> <47BD46F9.9000708@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47BD46F9.9000708@samsung.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	"David H. Lynch Jr." <dhlii@dlasys.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Indraneel wrote:
> >     Can I write a filesystem driver for a flash device that does not
> > require a block device ?
> 
> AFAIK, for a flash file system you need a Block Device. But you can 
> write a character driver to access the flash without a Block Device.

I think JFFS2 (flash file system) does not require a block device.  If
you mount /dev/mtdblockN with JFFS2, it actually looks up the
corresponding MTD character device and uses that instead.  The same is
probably true of the other dedicated flash filesystems.

-- Jamie
