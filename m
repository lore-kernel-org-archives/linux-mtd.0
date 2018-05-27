Received: from ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
 ([18.194.220.216] helo=sysam.it)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fN10B-00013E-TO
 for linux-mtd@lists.infradead.org; Sun, 27 May 2018 19:06:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by sysam.it (Postfix) with ESMTP id 2828F218E1
 for <linux-mtd@lists.infradead.org>; Sun, 27 May 2018 18:58:31 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
 by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rp5MglRaSxt4 for <linux-mtd@lists.infradead.org>;
 Sun, 27 May 2018 18:58:30 +0000 (UTC)
Received: from jerusalem (host126-233-dynamic.51-79-r.retail.telecomitalia.it
 [79.51.233.126]) by sysam.it (Postfix) with ESMTPSA id DF127218DF
 for <linux-mtd@lists.infradead.org>; Sun, 27 May 2018 18:58:29 +0000 (UTC)
Date: Sun, 27 May 2018 20:58:29 +0200
From: Angelo Dureghello <angelo@sysam.it>
To: linux-mtd@lists.infradead.org
Subject: squashfs: issue mounting with dma enabled
Message-ID: <20180527185828.GC17528@jerusalem>
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

Dear all,

i am testing a new dma driver, named mcf-edma, for the
ColdFire mcf5441x family of SoC's. The driver is still
by the way under approval on dmaengine mailing list.

https://www.spinics.net/lists/dmaengine/msg15416.html

Mainly, i am testing it with fsl-dspi.c, reading by an 
spi-nor flash.

With DMA enabled, mounting a simple 200KB squashfs i get:

/ # mount /dev/mtdblock2 squashfs
[ 1186.310000] SQUASHFS error: squashfs_read_data failed to read block 0x42e7d
[ 1186.310000] SQUASHFS error: Unable to read metadata cache entry [42e7d]
[ 1186.320000] SQUASHFS error: Unable to read inode 0x17dc
mount: mounting /dev/mtdblock2 on squashfs failed: Input/output error

>From some traces,
spi frame lengths seems fixed to 517, and the read length is always 517.

While, with same setup (DMA enabled) if i read a predefined pattern
by "hexdump -C -n4096 /dev/mtdblock2" i read perfectly the written
pattern.

Every help is appreciated,

Regards,
Angelo Dureghello
