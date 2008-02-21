Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JSFnB-0007Sz-4m
	for linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 18:05:09 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JSFn4-00075E-5j
	for linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 18:05:02 +0000
Received: from 6.177.115-78.rev.gaoland.net ([6.177.115-78.rev.gaoland.net])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2008 18:05:02 +0000
Received: from ivan.djelic by 6.177.115-78.rev.gaoland.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2008 18:05:02 +0000
To: linux-mtd@lists.infradead.org
From: Ivan Djelic <ivan.djelic@parrot.com>
Subject: [MTD/NAND] Blackfin NFC driver DMA bug ?
Date: Thu, 21 Feb 2008 17:58:49 +0000 (UTC)
Message-ID: <loom.20080221T171743-57@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

While working on a NAND flash MTD driver, I came across the following piece of
code in the Blackfin bf5xx NAND flash controller driver:

>From linux-2.6.24.2, file bf5xx_nand.c:418, function bf5xx_nand_dma_rw():

	/*
	 * Before starting a dma transfer, be sure to invalidate/flush
	 * the cache over the address range of your DMA buffer to
	 * prevent cache coherency problems. Otherwise very subtle bugs
	 * can be introduced to your driver.
	 */
	if (is_read)
		invalidate_dcache_range((unsigned int)buf,
				(unsigned int)(buf + page_size));
	else
		flush_dcache_range((unsigned int)buf,
				(unsigned int)(buf + page_size));

Since 'buf' is allocated outside MTD, are we allowed to assume it is
cache-aligned ? Because if it's not, invalidating dcache on read is not enough
to prevent cache coherency problems. For instance, a cache line partially
spanning across the buffer address range could be flushed just after DMA has
completed, corrupting DMA data in the process...
Or am I missing something, since I am not familiar with the Blackfin arch ?

Thanks,

Ivan
