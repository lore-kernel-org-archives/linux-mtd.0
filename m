Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1evn0O-0006jE-Gm
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2018 16:42:30 +0000
Received: by mail-qk0-x22d.google.com with SMTP id o25so269163qkl.7
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2018 09:42:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180311172309.GA1964@seema-Inspiron-15-3567>
References: <20180311172309.GA1964@seema-Inspiron-15-3567>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Mar 2018 18:42:16 +0200
Message-ID: <CAHp75VfdJwVy3EpvGJHS7_Xz_YCoLXcV4o=88megrqcMG2KyBA@mail.gmail.com>
Subject: Re: [PATCH] mtd: Replace printk() with more standardize output format.
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ezequiel@vanguardiasur.com.ar
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 11, 2018 at 7:23 PM, Arushi Singhal
<arushisinghal19971997@gmail.com> wrote:

> +               pr_notice("ftl_cs: format error: too many "
> +                         "transfer units!\n");

Please, join messages back to be one line for one line.

Examples:

pr("part1 "
 "part2\'n");

-> pr("part1 part2\'n");

While
pr("part1\n"
 "part2\'n");

stays the same.

-- 
With Best Regards,
Andy Shevchenko
