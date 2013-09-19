Received: from mail-bk0-f51.google.com ([209.85.214.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMiL0-0004Gi-OI
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 17:48:23 +0000
Received: by mail-bk0-f51.google.com with SMTP id mx10so3511332bkb.24
 for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2013 10:47:44 -0700 (PDT)
Message-ID: <523B38BE.2010203@gmail.com>
Date: Thu, 19 Sep 2013 19:47:42 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19.09.2013 18:01, Ezequiel Garcia wrote:

> Ezequiel Garcia (21):
>   mtd: nand: pxa3xx: Allocate data buffer on detected flash size
>   mtd: nand: pxa3xx: Disable OOB on arbitrary length commands
>   mtd: nand: pxa3xx: Use a completion to signal device ready
>   mtd: nand: pxa3xx: Add bad block handling
>   mtd: nand: pxa3xx: Add driver-specific ECC BCH support
>   mtd: nand: pxa3xx: Configure detected pages-per-block
>   mtd: nand: pxa3xx: Clear cmd buffer #3 (NDCB3) on command start
>   mtd: nand: pxa3xx: Make config menu show supported platforms
>   mtd: nand: pxa3xx: Split FIFO size from to-be-read FIFO count
>   mtd: nand: pxa3xx: Replace host->page_size by mtd->writesize
>   mtd: nand: pxa3xx: Add helper function to set page address
>   mtd: nand: pxa3xx: Remove READ0 switch/case falltrough
>   mtd: nand: pxa3xx: Split prepare_command_pool() in two stages
>   mtd: nand: pxa3xx: Move the data buffer clean to
>     prepare_start_command()
>   mtd: nand: pxa3xx: Add a read/write buffers markers
>   mtd: nand: pxa3xx: Introduce multiple page I/O support
>   mtd: nand: pxa3xx: Add multiple chunk write support

Your patches work fine on my board with CONFIG_HAS_DMA=n.

However, it seems that with CONFIG_HAS_DMA=y, pxa3xx_nand_irq() is now
called before pxa3xx_nand_init_buff(), which results in a NULL pointer
dereference.  I had to tweak my pending dmaengine patch of course, but I
don't see an particular problem with that right now.

Any idea? Are you tesing with PIO mode or DMA?


Thanks,
Daniel
