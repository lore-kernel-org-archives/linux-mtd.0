Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eouMM-00021l-Gr
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 17:08:43 +0000
Received: by mail-qk0-x236.google.com with SMTP id 130so2504469qkd.13
 for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2018 09:08:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1519317082-4790-1-git-send-email-shreeya.patel23498@gmail.com>
References: <1519317082-4790-1-git-send-email-shreeya.patel23498@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Feb 2018 19:08:29 +0200
Message-ID: <CAHp75VdHFAtGQ7=tRJz=dZJtsSnK_pKbUV=-8WAGOSKJwOQU2w@mail.gmail.com>
Subject: Re: [PATCH NAND v5] mtd: nand: Replace printk() with appropriate
 pr_*() macro
To: Shreeya Patel <shreeya.patel23498@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ezequiel@vanguardiasur.com.ar, outreachy-kernel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 22, 2018 at 6:31 PM, Shreeya Patel
<shreeya.patel23498@gmail.com> wrote:
> Using pr_<loglevel>() is more concise than
> printk(KERN_<LOGLEVEL>).
> Replace printks having a log level with the appropriate
> pr_*() macros.
> Define pr_fmt() and remove other additional macros from
> the replaced printks.

It makes sense to fix indentation, like in case similar to ' mm?"":""
', and fix the specifiers, when
void *p is printed as 0x%08x or alike.

-- 
With Best Regards,
Andy Shevchenko
