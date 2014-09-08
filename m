Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQvkk-0002pW-C5
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:00:57 +0000
Received: by mail-pa0-f49.google.com with SMTP id lf10so784080pab.22
 for <linux-mtd@lists.infradead.org>; Mon, 08 Sep 2014 03:00:32 -0700 (PDT)
Date: Mon, 8 Sep 2014 15:30:19 +0530
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH 7/7] mtd: denali: fix indentations and other trivial things
Message-ID: <20140908100019.GA3840@sudip-PC>
References: <1410163813-31783-8-git-send-email-yamada.m@jp.panasonic.com>
 <20140908083920.GD5361@thin>
 <20140908181447.C428.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140908181447.C428.AA925319@jp.panasonic.com>
Cc: Jiri Kosina <trivial@kernel.org>, Huang Shijie <shijie8@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, linux-kernel@vger.kernel.org,
 Rashika Kheria <rashika.kheria@gmail.com>, linux-mtd@lists.infradead.org,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 08, 2014 at 06:14:48PM +0900, Masahiro Yamada wrote:
> Hi Josh,
> 
> 
> On Mon, 8 Sep 2014 01:39:20 -0700
> Josh Triplett <josh@joshtriplett.org> wrote:
> 
> > On Mon, Sep 08, 2014 at 05:10:13PM +0900, Masahiro Yamada wrote:
> > > @@ -406,9 +404,9 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
> > >  		break;
> > >  	default:
> > >  		dev_warn(denali->dev,
> > > -			"Spectra: Unknown Hynix NAND (Device ID: 0x%x)."
> > > -			"Will use default parameter values instead.\n",
> > > -			device_id);
> > > +			 "Spectra: Unknown Hynix NAND (Device ID: 0x%x)."
> > > +			 "Will use default parameter values instead.\n",
> > > +			 device_id);
> > 
> > Please join quoted strings into a single line.
> > 
> > > -		pr_err("Your NAND chip OOB is not large enough to \
> > > -				contain 8bit ECC correction codes");
> > > +		pr_err("Your NAND chip OOB is not large enough to "
> > > +		       "contain 8bit ECC correction codes");
> > 
> > Likewise.
> > 
> 
> Thanks for your review, but
> the quoted strings are too long to be joined into a single line.
> (exceed 80 columns)
> 
These are user-visible strings and they can be more than 80 char.
If you see CodingStyle document , it is mentioned that :

However, never break user-visible strings such as printk messages, because that breaks the ability to grep for them.

thanks
sudip

> 
> Best Regards
> Masahiro Yamada
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
