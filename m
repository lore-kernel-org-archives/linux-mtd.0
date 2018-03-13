Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1evmmn-0003Lk-LS
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2018 16:28:29 +0000
Received: by mail-qt0-x243.google.com with SMTP id z14so236592qti.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2018 09:28:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180312170208.GA10604@seema-Inspiron-15-3567>
References: <20180312170208.GA10604@seema-Inspiron-15-3567>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Mar 2018 18:28:13 +0200
Message-ID: <CAHp75VfZKrm-K+VJDmFrwxyqVvm9D9CuZV6CVtsNSrw6WWfQRA@mail.gmail.com>
Subject: Re: [PATCH] mtd: chips: Replace printk() with pr_*() and define
 pr_fmt()
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 12, 2018 at 7:02 PM, Arushi Singhal
<arushisinghal19971997@gmail.com> wrote:
> Using pr_<loglevel>() is more concise than printk(KERN_<LOGLEVEL>).
> This patch:


> @@ -182,7 +184,7 @@ static void fixup_convert_atmel_pri(struct mtd_info *mtd)

> -       printk(KERN_ERR "atmel Features: %02x\n", atmel_pri.Features);
> +       pr_err("atmel Features: %02x\n", atmel_pri.Features);

Does struct mtd_info include a pointer to struct device? In such case,
why not to use dev_*() macros instead?
(It's a question to the all current pr_*()/printk() calls.

-- 
With Best Regards,
Andy Shevchenko
