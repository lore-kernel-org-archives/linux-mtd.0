Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eorru-0002MU-Ir
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 14:29:29 +0000
From: Richard Weinberger <richard@nod.at>
To: Shreeya Patel <shreeya.patel23498@gmail.com>
Cc: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 maximlevitsky@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
 outreachy-kernel@googlegroups.com
Subject: Re: [PATCH NAND v3] mtd: nand: Replace printk() with appropriate
 pr_*() macro
Date: Thu, 22 Feb 2018 15:30:09 +0100
Message-ID: <2093598.TLbMltDcSo@blindfold>
In-Reply-To: <1519305014-2547-1-git-send-email-shreeya.patel23498@gmail.com>
References: <1519305014-2547-1-git-send-email-shreeya.patel23498@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 22. Februar 2018, 14:10:14 CET schrieb Shreeya Patel:
> @@ -438,7 +438,7 @@ static void __init doc2000_count_chips(struct mtd_info
> *mtd) break;
>  	}
>  	doc->chips_per_floor = i;
> -	printk(KERN_DEBUG "Detected %d chips per floor.\n", i);
> +	pr_debug("Detected %d chips per floor.\n", i);

<bike-shedding>

You are aware of the fact that printk(KERN_DEBUG and pr_debug() are not 
equivalent?
Not a big deal, just want to make sure that you understand what you are doing. 
:-)

</bike-shedding>

Thanks,
//richard
