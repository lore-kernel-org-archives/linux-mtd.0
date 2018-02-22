Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eouqD-0000m3-Tv
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 17:39:35 +0000
Date: Thu, 22 Feb 2018 18:39:11 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Shreeya Patel <shreeya.patel23498@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Maxim Levitsky
 <maximlevitsky@gmail.com>, "open list:MEMORY TECHNOLOGY..."
 <linux-mtd@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, ezequiel@vanguardiasur.com.ar,
 outreachy-kernel@googlegroups.com
Subject: Re: [PATCH NAND v5] mtd: nand: Replace printk() with appropriate
 pr_*() macro
Message-ID: <20180222183911.51e00722@bbrezillon>
In-Reply-To: <CAHp75VdHFAtGQ7=tRJz=dZJtsSnK_pKbUV=-8WAGOSKJwOQU2w@mail.gmail.com>
References: <1519317082-4790-1-git-send-email-shreeya.patel23498@gmail.com>
 <CAHp75VdHFAtGQ7=tRJz=dZJtsSnK_pKbUV=-8WAGOSKJwOQU2w@mail.gmail.com>
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

On Thu, 22 Feb 2018 19:08:29 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Feb 22, 2018 at 6:31 PM, Shreeya Patel
> <shreeya.patel23498@gmail.com> wrote:
> > Using pr_<loglevel>() is more concise than
> > printk(KERN_<LOGLEVEL>).
> > Replace printks having a log level with the appropriate
> > pr_*() macros.
> > Define pr_fmt() and remove other additional macros from
> > the replaced printks.  
> 
> It makes sense to fix indentation, like in case similar to ' mm?"":""
> ',

Fix indentation if you change the line, why not...

> and fix the specifiers, when
> void *p is printed as 0x%08x or alike.

But specifier fixes should be done separately, and I'm not sure I
want to receive yet another bunch of cosmestic patches changing that, at
least not now.

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
