Received: from mail-pa0-f46.google.com ([209.85.220.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZhRL-0004og-Sp
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 13:28:36 +0000
Received: by mail-pa0-f46.google.com with SMTP id rd3so3730779pab.33
 for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2013 06:28:10 -0700 (PDT)
Date: Fri, 25 Oct 2013 21:33:00 -0400
From: Huang Shijie <shijie8@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH V2] mtd: gpmi: fix the ecc regression
Message-ID: <20131026013258.GA3195@gmail.com>
References: <1382602484-12023-1-git-send-email-b32955@freescale.com>
 <1382702607.8522.110.camel@shinybook.infradead.org>
 <1382703654.8522.114.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382703654.8522.114.camel@shinybook.infradead.org>
Cc: Marek Vasut <marex@denx.de>, dedekind1@gmail.com, tharvey@gateworks.com,
 stable@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 25, 2013 at 01:20:54PM +0100, David Woodhouse wrote:
> On Fri, 2013-10-25 at 13:03 +0100, David Woodhouse wrote:
> > 
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

Hi David:
  I am ok with your patch. but we will meet a compiler warning, since
  the set_geometry_by_ecc_info() is not referenced.

  thanks
  Huang Shijie
  
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 59ab069..a9830ff 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -349,7 +349,7 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
>  
>  int common_nfc_set_geometry(struct gpmi_nand_data *this)
>  {
> -	return set_geometry_by_ecc_info(this) ? 0 : legacy_set_geometry(this);
> +	return legacy_set_geometry(this);
>  }
>  
>  struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
> 
> 
> -- 
> dwmw2
> 



> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
