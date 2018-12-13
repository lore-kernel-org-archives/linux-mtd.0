Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXVl3-0003pb-Dd
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 18:30:52 +0000
Date: Thu, 13 Dec 2018 19:30:26 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Lucas
 Stach <dev@lynxeye.de>, Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu
 <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org
Subject: Re: [v5,04/17] mtd: rawnand: omap2: convert driver to nand_scan()
Message-ID: <20181213193026.3efa0944@bbrezillon>
In-Reply-To: <20181213190111.2f32cfaffa5ea26f77bae520@gmail.com>
References: <20180725133152.30898-5-miquel.raynal@bootlin.com>
 <20181213190111.2f32cfaffa5ea26f77bae520@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 Dec 2018 19:01:11 +0100
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

> Hello Miquel, Boris,
> 
> On Wed, 25 Jul 2018 15:31:39 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Two helpers have been added to the core to do all kind of controller
> > side configuration/initialization between the detection phase and the
> > final NAND scan. Implement these hooks so that we can convert the driver
> > to just use nand_scan() instead of the nand_scan_ident() +
> > nand_scan_tail() pair.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>  
> 
> I've bisected this patch to brake Beagle Bone Black boot
> (from NAND, at least in DMA mode):
> 
> [    0.243337] edma 49000000.edma: TI EDMA DMA engine driver
> 
> ... skipped...
> 
> [    1.888170] omap-gpmc 50000000.gpmc: GPMC revision 6.0
> [    1.893597] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
> [    1.901776] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> [    1.908589] nand: Micron MT29F2G08ABAEAWP
> [    1.912807] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> [    1.920802] omap2-nand 8000000.nand: DMA engine request failed
> 
> ... unrelated...
> 
> [    1.985544] UBI error: cannot open mtd NAND.root-squashfs2, error -2
> [    1.992432] UBI error: cannot open mtd NAND.root-ubifs, error -2
> [    1.998897] UBI: block: can't open volume on ubi0_0, err=-19
> 
> ... unrelated...
> 
> [    2.025751] VFS: Cannot open root device "ubiblock0_0" or unknown-block(0,0): error -6
> [    2.034168] Please append a correct "root=" boot option; here are the available partitions:
> [    2.042997] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> 
> EDMA driver is here, yet the channel cannot be obtained after
> commit e1e6255c31.

Can you provide the full logs before and after this commit?
