Received: from mail-pg0-x235.google.com ([2607:f8b0:400e:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eos8W-0005Wj-QL
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 14:46:35 +0000
Received: by mail-pg0-x235.google.com with SMTP id w17so2073763pgv.6
 for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2018 06:46:06 -0800 (PST)
Message-ID: <1519310758.2359.3.camel@gmail.com>
Subject: Re: [PATCH NAND v3] mtd: nand: Replace printk() with appropriate
 pr_*() macro
From: Shreeya Patel <shreeya.patel23498@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr,  maximlevitsky@gmail.com,
 linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar,  outreachy-kernel@googlegroups.com
Date: Thu, 22 Feb 2018 20:15:58 +0530
In-Reply-To: <2093598.TLbMltDcSo@blindfold>
References: <1519305014-2547-1-git-send-email-shreeya.patel23498@gmail.com>
 <2093598.TLbMltDcSo@blindfold>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2018-02-22 at 15:30 +0100, Richard Weinberger wrote:
> Am Donnerstag, 22. Februar 2018, 14:10:14 CET schrieb Shreeya Patel:
> > 
> > @@ -438,7 +438,7 @@ static void __init doc2000_count_chips(struct
> > mtd_info
> > *mtd) break;
> >  	}
> >  	doc->chips_per_floor = i;
> > -	printk(KERN_DEBUG "Detected %d chips per floor.\n", i);
> > +	pr_debug("Detected %d chips per floor.\n", i);
> <bike-shedding>
> 
> You are aware of the fact that printk(KERN_DEBUG and pr_debug() are
> not 
> equivalent?
> Not a big deal, just want to make sure that you understand what you
> are doing. 

Actually pr_debug() shouldn't be used here.

We usually don't prefer pr_debug for drivers, instead we use dev_dbg.
But as Boris told me that it will be better to first having changed all
printks to pr_*() macro and then think about dev_*() macros.

> :-)
> 
> </bike-shedding>
> 
> Thanks,
> //richard
