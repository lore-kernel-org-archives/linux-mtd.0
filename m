Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UjsC-00070S-0L
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2003 10:13:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20030622183130.GA5109@lst.de>
References: <20030622183130.GA5109@lst.de>
Message-Id: <1056446059.29264.388.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Jun 2003 10:14:19 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] better prototypes for mtd_blktrans_ops methods
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2003-06-22 at 19:31, Christoph Hellwig wrote:
> ->open and ->release lose the totally pointless inode and file
> arguments, ->ioctl gets replaced by ->getgeo and ->flush, removing
> duplicated code from the individual drivers and avoiding to sneak
> more ioctl mess.. :)

Cute, thanks. I've changed it around a bit so the ->getgeo() methods
don't actually write to userspace, and the core mtd_blkdevs code fills
in the partition start sector appropriately too. It's in Linus' tree as
of last night.

-- 
dwmw2
