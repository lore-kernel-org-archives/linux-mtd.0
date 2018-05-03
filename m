Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fE8Hc-0007Ri-RX
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 07:04:06 +0000
Date: Thu, 3 May 2018 09:03:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: pass ms delay to wait_op
Message-ID: <20180503090348.0c10b00f@bbrezillon>
In-Reply-To: <a40b0454ea78494983c909fd6b2c08c8@svr-chch-ex1.atlnz.lc>
References: <20180503022128.10702-1-chris.packham@alliedtelesis.co.nz>
 <a40b0454ea78494983c909fd6b2c08c8@svr-chch-ex1.atlnz.lc>
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

Hi Chris,

On Thu, 3 May 2018 05:28:32 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> On 03/05/18 14:21, Chris Packham wrote:
> > marvell_nfc_wait_op() expects the delay to be expressed in milliseconds
> > but nand_sdr_timings uses picoseconds. Use PSEC_TO_MSEC when passing
> > tPROG_max to marvell_nfc_wait_op().
> > 
> > Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >   drivers/mtd/nand/raw/marvell_nand.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> > index 1d779a35ac8e..e4b964fd40d8 100644
> > --- a/drivers/mtd/nand/raw/marvell_nand.c
> > +++ b/drivers/mtd/nand/raw/marvell_nand.c
> > @@ -1074,7 +1074,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
> >   		return ret;
> >   
> >   	ret = marvell_nfc_wait_op(chip,
> > -				  chip->data_interface.timings.sdr.tPROG_max);
> > +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> >   	return ret;
> >   }
> >   
> > @@ -1494,7 +1494,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct mtd_info *mtd,
> >   	}
> >   
> >   	ret = marvell_nfc_wait_op(chip,
> > -				  chip->data_interface.timings.sdr.tPROG_max);
> > +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> >   
> >   	marvell_nfc_disable_hw_ecc(chip);
> >     
> 
> Actually I'm not so sure about this patch. While passing the pico-second 
> value for tPROG_max is clearly wrong and leads to seemingly indefinite 
> hangs on some systems. Converting the times to micro-seconds leaves us 
> with delays that are far too short.

What makes you think they are far too short?

> 
> The old pxa3xx driver had hard coded 200ms delays. These delays now work 
> out to 1ms which seems every bit as wrong as 600000000ms.

The old driver was indifferently waiting a huge amount of time no
matter how long the chip is supposed to stay busy for a specific
operation. Here we're using the value exposed by the chip itself, and
it's not a typical value, it's a max value, which means you should
never reach that in real life, and if you do that means your chip is
stuck for some reasons. Now, if you want to take extra safety margin,
you can multiply the value by 2 and that should be enough, but 200ms is
way too long.

Regards,

Boris
