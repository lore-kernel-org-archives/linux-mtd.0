Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQv37-0006iL-L4
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 09:15:50 +0000
Date: Mon, 08 Sep 2014 18:14:48 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH 7/7] mtd: denali: fix indentations and other trivial things
In-Reply-To: <20140908083920.GD5361@thin>
References: <1410163813-31783-8-git-send-email-yamada.m@jp.panasonic.com>
 <20140908083920.GD5361@thin>
Message-Id: <20140908181447.C428.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: Jiri Kosina <trivial@kernel.org>, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, Rashika Kheria <rashika.kheria@gmail.com>,
 linux-mtd@lists.infradead.org, "grmoore@altera.com" <grmoore@altera.com>,
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

Hi Josh,


On Mon, 8 Sep 2014 01:39:20 -0700
Josh Triplett <josh@joshtriplett.org> wrote:

> On Mon, Sep 08, 2014 at 05:10:13PM +0900, Masahiro Yamada wrote:
> > @@ -406,9 +404,9 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
> >  		break;
> >  	default:
> >  		dev_warn(denali->dev,
> > -			"Spectra: Unknown Hynix NAND (Device ID: 0x%x)."
> > -			"Will use default parameter values instead.\n",
> > -			device_id);
> > +			 "Spectra: Unknown Hynix NAND (Device ID: 0x%x)."
> > +			 "Will use default parameter values instead.\n",
> > +			 device_id);
> 
> Please join quoted strings into a single line.
> 
> > -		pr_err("Your NAND chip OOB is not large enough to \
> > -				contain 8bit ECC correction codes");
> > +		pr_err("Your NAND chip OOB is not large enough to "
> > +		       "contain 8bit ECC correction codes");
> 
> Likewise.
> 

Thanks for your review, but
the quoted strings are too long to be joined into a single line.
(exceed 80 columns)


Best Regards
Masahiro Yamada
