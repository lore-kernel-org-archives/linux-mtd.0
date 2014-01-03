Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz9Ia-0004ix-8s
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 18:16:44 +0000
Received: by mail-ie0-f181.google.com with SMTP id e14so16305312iej.40
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 10:16:22 -0800 (PST)
Date: Fri, 3 Jan 2014 10:16:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 7/8] mtd: plat_nand: Use devm_*() functions
Message-ID: <20140103181615.GE5631@ld-irv-0074>
References: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
 <001601cefd40$f6b3dd00$e41b9700$%han@samsung.com>
 <20140103010445.GA5631@ld-irv-0074>
 <000501cf0823$0658bc70$130a3550$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000501cf0823$0658bc70$130a3550$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 'Vitaly Wool' <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 10:27:53AM +0900, Jingoo Han wrote:
> On Friday, January 03, 2014 10:18 AM, Jingoo Han wrote:

^^^ Huh? It looks like you quoted me, but your mailer says you're
quoting yourself! You might want to fix that :)

> > This gives me a few errors:
> > 
> > drivers/mtd/nand/plat_nand.c: In function 'plat_nand_probe':
> > drivers/mtd/nand/plat_nand.c:61:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-
> > function-declaration]
> > drivers/mtd/nand/plat_nand.c:62:3: error: implicit declaration of function 'PTR_ERR' [-
> > Werror=implicit-function-declaration]
> > make[4]: *** [drivers/mtd/nand/plat_nand.o] Error 1
> > 
> > You probably need to #include <linux/err.h>. I guess you don't
> > compile-test your changes? It would help if you can catch these mistakes
> > before they get to the maintainer.
> 
> Hi Norris,
> 
> I did compile all patches. However, I cannot understand why the build
> error happens.

I guess you were relying on an implicit #include via some other
explicitly-included header, and maybe this implicit inclusion is
different for different ARCHes, so that this only fails to compile under
certain configurations.

> Anyway, I will check it and add '#include <linux/err.h'
> if needed.

Yes, that is the right thing. Standard practice is to explicitly include
any required headers, so that changes in unrelated headers don't break
things.

> Thank you for your comment. :-)
> Happy new year!

Yes, happy 2014!

Brian
