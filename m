Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZhMj-0004YK-62
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 13:23:51 +0000
From: Marek <marex@denx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH V2] mtd: gpmi: fix the ecc regression
Date: Fri, 25 Oct 2013 15:22:12 +0200
Message-ID: <1759334.BdWLZMGAMu@w510>
In-Reply-To: <1382703654.8522.114.camel@shinybook.infradead.org>
References: <1382602484-12023-1-git-send-email-b32955@freescale.com>
 <1382702607.8522.110.camel@shinybook.infradead.org>
 <1382703654.8522.114.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: dedekind1@gmail.com, tharvey@gateworks.com, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 25 of October 2013 13:20:54 David Woodhouse wrote:
> On Fri, 2013-10-25 at 13:03 +0100, David Woodhouse wrote:
> > So... what if someone has already shipped the new chips that require
> > stronger ECC, without realising that legacy_set_geometry() is
> > insufficient? (And is legacy_set_geometry *actually* doing precisely the
> > same as 3.10/3.11?)
> 
> Answering my own question: If the required ECC strength is known and the
> legacy ECC layout is insufficient, that's caused a failure since commit
> 92d0e09abeebd ("mtd: gpmi: add sanity check for the ECC") in 3.9, so I'm
> not worried about supporting that.
> 
> And legacy_set_geometry() *is* doing what 3.11 did, verbatim.
> 
> So the question is whether we want this "if legacy is sufficient then
> use it else use the new method" that you offer in v2 of the patch, or if
> a device-tree property is the better way to do it.
> 
> I'm actually slightly in favour of the device-tree property. But since
> 3.12 is imminent I think the *best* option is just to do this to
> preserve the 3.11 behaviour, and worry about getting it right for 3.13:
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c index 59ab069..a9830ff 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -349,7 +349,7 @@ static int legacy_set_geometry(struct gpmi_nand_data
> *this)
> 
>  int common_nfc_set_geometry(struct gpmi_nand_data *this)
>  {
> -	return set_geometry_by_ecc_info(this) ? 0 : legacy_set_geometry(this);
> +	return legacy_set_geometry(this);
>  }
> 
>  struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)

I can confirm this patch fixes the regression, UBIFS can now again be mounted on 
3.12rc6 . Thanks!

Acked-by: Marek Vasut <marex@denx.de>

On M28EVK with NAND device:
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron MT29F2G08ABAEAWP)
NAND device: 256MiB, SLC, page size: 2048, OOB size: 64

Tested-by: Marek Vasut <marex@denx.de>

Cheers!
