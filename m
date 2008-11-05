Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KxgQY-00010j-VT
	for linux-mtd@lists.infradead.org; Wed, 05 Nov 2008 11:19:59 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3856444wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Nov 2008 03:19:58 -0800 (PST)
Message-ID: <3cc7a0df0811050319t7d4b2542hcef73780ebfc9906@mail.gmail.com>
Date: Wed, 5 Nov 2008 16:49:58 +0530
From: "Gaurav Singh" <gausinghnsit@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Writing to NAND using DMA
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working on an ST Nomadik board with ST 1 GB NAND chip. Have
written a board specific driver and trying to use DMA and JFFS2
filesystem to write data to the NAND .

I have allocated a nand_buffer structure using dma_alloc_coherent and
am using this buffer for reading data.

In case of write however I see that the JFFS2 filesystem has allocated
a wbuf for writing (using kmalloc). Now I have an option of copying
this buffer into a dma able buffer of my own but I feel there should
be a better solution.

What is your view ? Should JFFS2 provide a dma able buffer to write a
NAND page ?
