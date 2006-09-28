Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GSjc5-0003jj-N2
	for linux-mtd@lists.infradead.org; Thu, 28 Sep 2006 01:18:54 +0100
Subject: Re: Nand Flash write fails
From: Thomas Gleixner <tglx@linutronix.de>
To: ajain@neomagic.com
In-Reply-To: <04c001c6de5d$46f73a10$561fa8c0@pcajain>
References: <04c001c6de5d$46f73a10$561fa8c0@pcajain>
Content-Type: text/plain
Date: Thu, 28 Sep 2006 02:20:07 +0200
Message-Id: <1159402808.9326.615.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-09-22 at 21:09 +0530, Ajay Jain wrote:
> Hi, 
> 
> I have set up a JFFS2 partition on my NAND flash. The board driver in
> question is my own. I can successfully 'mkfs' & 'mount' that partition.
> However when I start copying any file to it, it gives the following
> error.
> 
> nand_write_ecc: vectored attempt to write not page aligned data: to =
> 20b9e4, total_len =       44
> Write of 68 bytes at 0x0000b9e4 failed. returned -22, retlen 0
> Not marking the space at 0x0000b9e4 as dirty because the flash driver
> returned retlen zero
> 
> I was looking up the code of the mtd nand layer. I see that in case the
> data is not alligned on the page boundary, it returns back giving this
> error. Therefore my question is that is it the responsibility of the
> "jffs2 layer" or "mtd" layer to issue writes that are aligned to page
> boundary. 
> ANY suggestions are welcome.

Update to a recent kernel.

	tglx
