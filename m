Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbUPv-0007ax-8G
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 17:21:12 +0000
Date: Fri, 6 Jul 2018 19:20:58 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 chris.packham@alliedtelesis.co.nz, miquel.raynal@bootlin.com,
 thor.thayer@linux.intel.com, Marek Vasut <marex@denx.de>
Subject: Re: [BUG] mtd: rawnand: mircon: Cannot detect chip with commit
 51f3b3970a8c
Message-ID: <20180706192058.2464d86c@bbrezillon>
In-Reply-To: <c3419bce-ecdb-b587-5e79-f75e34e7ef6c@kernel.org>
References: <c3419bce-ecdb-b587-5e79-f75e34e7ef6c@kernel.org>
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

On Fri, 6 Jul 2018 12:03:49 -0500
Dinh Nguyen <dinguyen@kernel.org> wrote:

> Hi,
> 
> It looks like commit: "51f3b3970a8c mtd: rawnand: micron: detect forced
> on-die ECC" is causing the NAND chip on the SoCFPGA Arria10 devkit to
> stop working on linux-next.
> 
> If I revert the commit, then the NAND driver is able to detect the NAND
> chip.
> 
> The NAND chip is a Micron MT29F1G08ABBEAH4 part.
> 
> 
> [    0.741984] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xa1
> [    0.748336] nand: Micron MT29F1G08ABBEAH4
> [    0.752330] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048,
> OOB siz
> e: 64
>  [    0.763358] ecc.mode = 3
> [    0.766312] On-die ECC forcefully enabled, not supported
> [    0.771654] denali-nand-dt: probe of ffb90000.nand failed with error -22
> 
> With commit reverted:
> 
> [    0.742481] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xa1
> [    0.748833] nand: Micron MT29F1G08ABBEAH4
> [    0.752828] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048,
> OOB siz
> e: 64
> [    0.760610] Bad block table found at page 65472, version 0x01
> [    0.766433] Bad block table found at page 65408, version 0x01
> [    0.772464] 2 fixed-partitions partitions found on MTD device denali-nand
> [    0.779247] Creating 2 MTD partitions on "denali-nand":
> [    0.784453] 0x000000000000-0x000001c00000 : "Boot and fpga data"
> [    0.791241] 0x000001c00000-0x000008000000 : "Root Filesystem - JFFS2"
> 
> Looks like if I comment out this part of the patch in
> drivers/mtd/nand/raw/nand_micron.c
> 
> +#if 0
>         for (i = 0; i < ARRAY_SIZE(micron_on_die_ecc); i++)
>                 if (chip->id.data[1] == micron_on_die_ecc[i])
>                         return MICRON_ON_DIE_MANDATORY;
> -
> +#endif

Oops, I overlooked that detail. Testing only the ID bytes is not
enough, because it does not encode whether the NAND has on-die ECC or
not. We should really test the model name here...

Chris, can you prepare a fixup for that?

> 
> then the driver is able to detect the NAND chip again.
> 
> Dinh
