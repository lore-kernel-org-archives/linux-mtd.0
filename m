Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faKJm-000272-5X
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 12:22:07 +0000
Date: Tue, 3 Jul 2018 14:21:40 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Bean
 Huo <beanhuo@micron.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 0/3] mtd: rawnand: micron: Get the actual number of
 bitflips
Message-ID: <20180703142140.70165aa6@bbrezillon>
In-Reply-To: <20180703121737.29797-1-boris.brezillon@bootlin.com>
References: <20180703121737.29797-1-boris.brezillon@bootlin.com>
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



On Tue,  3 Jul 2018 14:17:37 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hello,
> 
> Back when support for Micron 4bit/512byte on-die ECC was added, we
> decided that it wasn't worth retrieving the real number of bitflips
> when the chip was returning WRITE_RECOMMENDED and instead decided to
> always return the maximum value (ECC strength).
> 
> This decision leads to UBI moving eraseblocks around as soon as 1
> bitflip is present, which is far from optimal, and might wear the NAND
> out faster than if we get the actual number of bitflips by re-reading
> the page in raw mode and comparing its content to the corrected
> version.
> 
> IIRC, Bean warned us about that, but it seems we didn't listen, so now
> is time to revisit the implementation and implement what Bean initially
> suggested.
> 
> This implementation has been tested on an MT29F2G08ABAEAH4, and seems
> to work as expected (nandbiterrs works fine, and the real number of
> bitflips is now returned).
> 
> Here are some details about these patches:
> Patch 1 is just a cleanup to avoid passing parameters we don't need to
> the ecc_status() functions. Patch 2 is preparing things for the actual
> changes by reworking the ordering in the read function, and patch 3 is
> implementing the read-in-raw-mode-and-compare logic.

Please ignore this cover letter. I just sent a new version, this time
with the patches.

Sorry for the noise.

Boris

> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (3):
>   mtd: rawnand: micron: Stop passing an mtd_info object to ecc_status
>     funcs
>   mtd: rawnand: micron: Disable ECC earlier in the read path
>   mtd: rawnand: micron: Get the actual number of bitflips
> 
>  drivers/mtd/nand/raw/nand_micron.c | 145 ++++++++++++++++++++++++++++++-------
>  1 file changed, 120 insertions(+), 25 deletions(-)
> 
