Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KzXPF-0003y1-Ck
	for linux-mtd@lists.infradead.org; Mon, 10 Nov 2008 14:06:17 +0000
Date: Mon, 10 Nov 2008 14:05:49 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: Gaurav Singh <gausinghnsit@gmail.com>
Subject: Re: Writing to NAND using DMA
Message-ID: <20081110140549.GD11063@fluff.org.uk>
References: <3cc7a0df0811050319t7d4b2542hcef73780ebfc9906@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cc7a0df0811050319t7d4b2542hcef73780ebfc9906@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 05, 2008 at 04:49:58PM +0530, Gaurav Singh wrote:
> I am working on an ST Nomadik board with ST 1 GB NAND chip. Have
> written a board specific driver and trying to use DMA and JFFS2
> filesystem to write data to the NAND .
> 
> I have allocated a nand_buffer structure using dma_alloc_coherent and
> am using this buffer for reading data.
> 
> In case of write however I see that the JFFS2 filesystem has allocated
> a wbuf for writing (using kmalloc). Now I have an option of copying
> this buffer into a dma able buffer of my own but I feel there should
> be a better solution.
> 
> What is your view ? Should JFFS2 provide a dma able buffer to write a
> NAND page ?

This discussion came up at CELF, I belive that there is a move to try
and make the mtd interface take only DMA-safe memory since it is not
only JFFS2 that may be using the NAND driver.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
