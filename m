Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1em2kL-0006LF-W2
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 19:29:51 +0000
Date: Wed, 14 Feb 2018 20:29:24 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v4] mtd: nand: toshiba: Retrieve ECC requirements
 from extended ID
Message-ID: <20180214202924.200caace@bbrezillon>
In-Reply-To: <20180214201541.7c939976@bbrezillon>
References: <1518622506-16606-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <20180214201541.7c939976@bbrezillon>
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

On Wed, 14 Feb 2018 20:15:41 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> -linux-mmc
> +linux-mtd
> 
> On Thu, 15 Feb 2018 00:35:06 +0900
> KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote:
> 
> > This patch enables support to read the ECC strength and size from the
> > NAND flash using Toshiba Memory SLC NAND extended-ID. This patch is
> > based on the information of the 6th ID byte of the Toshiba Memory SLC
> > NAND.  
> 
> This version looks good to me.
> 

Applied.

Thanks,

Boris

> > 
> > Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
> > ---
> >  drivers/mtd/nand/nand_toshiba.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshiba.c
> > index 57df857..ab43f02 100644
> > --- a/drivers/mtd/nand/nand_toshiba.c
> > +++ b/drivers/mtd/nand/nand_toshiba.c
> > @@ -35,6 +35,32 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
> >  	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */ &&
> >  	    !(chip->id.data[4] & 0x80) /* !BENAND */)
> >  		mtd->oobsize = 32 * mtd->writesize >> 9;
> > +
> > +	/*
> > +	 * Extract ECC requirements from 6th id byte.
> > +	 * For Toshiba SLC, ecc requrements are as follows:
> > +	 *  - 43nm: 1 bit ECC for each 512Byte is required.
> > +	 *  - 32nm: 4 bit ECC for each 512Byte is required.
> > +	 *  - 24nm: 8 bit ECC for each 512Byte is required.
> > +	 */
> > +	if (chip->id.len >= 6 && nand_is_slc(chip)) {
> > +		chip->ecc_step_ds = 512;
> > +		switch (chip->id.data[5] & 0x7) {
> > +		case 0x4:
> > +			chip->ecc_strength_ds = 1;
> > +			break;
> > +		case 0x5:
> > +			chip->ecc_strength_ds = 4;
> > +			break;
> > +		case 0x6:
> > +			chip->ecc_strength_ds = 8;
> > +			break;
> > +		default:
> > +			WARN(1, "Could not get ECC info");
> > +			chip->ecc_step_ds = 0;
> > +			break;
> > +		}
> > +	}
> >  }
> >  
> >  static int toshiba_nand_init(struct nand_chip *chip)  
> 
> 
> 



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
