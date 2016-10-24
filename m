Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bygn8-00058o-9u
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 15:04:02 +0000
Received: by mail-pf0-x244.google.com with SMTP id 128so16845376pfz.1
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 08:03:37 -0700 (PDT)
Date: Mon, 24 Oct 2016 22:49:29 +0800
From: Han Xu <xhnjupt@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, boris.brezillon@free-electrons.com,
 Fabio Estevam <fabio.estevam@nxp.com>, han.xu@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: gpmi: disable the clocks on errors
Message-ID: <20161024144929.GA31816@shlinux2>
References: <1477152922-6722-1-git-send-email-festevam@gmail.com>
 <73e38ebd-3612-94c3-46bf-dc6e29925ee3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73e38ebd-3612-94c3-46bf-dc6e29925ee3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 23, 2016 at 05:08:19AM +0200, Marek Vasut wrote:
> On 10/22/2016 06:15 PM, Fabio Estevam wrote:
> > From: Fabio Estevam <fabio.estevam@nxp.com>
> > 
> > We should disable the previously enabled GPMI clocks in the error paths.
> > 
> > Also, when gpmi_enable_clk() fails simply return the error
> > code immediately rather than jumping to to the 'err_out' label.
> > 
> > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> 

Acked-by: Han Xu<han.xu@nxp.com>

> > ---
> >  drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > index 0f68a99..141bd70 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > @@ -161,7 +161,7 @@ int gpmi_init(struct gpmi_nand_data *this)
> >  
> >  	ret = gpmi_enable_clk(this);
> >  	if (ret)
> > -		goto err_out;
> > +		return ret;
> >  	ret = gpmi_reset_block(r->gpmi_regs, false);
> >  	if (ret)
> >  		goto err_out;
> > @@ -197,6 +197,7 @@ int gpmi_init(struct gpmi_nand_data *this)
> >  	gpmi_disable_clk(this);
> >  	return 0;
> >  err_out:
> > +	gpmi_disable_clk(this);
> >  	return ret;
> >  }
> >  
> > @@ -270,7 +271,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
> >  
> >  	ret = gpmi_enable_clk(this);
> >  	if (ret)
> > -		goto err_out;
> > +		return ret;
> >  
> >  	/*
> >  	* Due to erratum #2847 of the MX23, the BCH cannot be soft reset on this
> > @@ -308,6 +309,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
> >  	gpmi_disable_clk(this);
> >  	return 0;
> >  err_out:
> > +	gpmi_disable_clk(this);
> >  	return ret;
> >  }
> >  
> > 
> 
> 
> -- 
> Best regards,
> Marek Vasut
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
