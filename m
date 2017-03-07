Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clEmZ-0005Bm-2e
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 13:04:05 +0000
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
 [74.125.82.176]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v27D348g008094
 for <linux-mtd@lists.infradead.org>; Tue, 7 Mar 2017 22:03:04 +0900
Received: by mail-ot0-f176.google.com with SMTP id 19so1079684oti.0
 for <linux-mtd@lists.infradead.org>; Tue, 07 Mar 2017 05:03:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170307124034.59b5b763@bbrezillon>
References: <1488885839-18470-1-git-send-email-yamada.masahiro@socionext.com>
 <20170307124034.59b5b763@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 7 Mar 2017 22:03:03 +0900
Message-ID: <CAK7LNAQ8GrGEKGArRC2+xh_JDuFjrd-wQG3kKu80-GMuXRvvBA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: fix write accessor sanity checks
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


2017-03-07 20:40 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Tue,  7 Mar 2017 20:23:59 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> If the higher level accessor chip->write_page() is implemented,
>> ecc->write_page() and ecc->write_page_raw() are not required.
>
> I'm about to remove the chip->write_page() hook [1], I hope you're not
> planning to use it.
>
> [1]https://patchwork.ozlabs.org/patch/729966/
>

In fact, I was wondering if I should use chip->write_page()
for denali.c  (then I noticed this broken accessor checks).
After all, I decided to not (ab)use chip->write_page(), though.

Anyway, it is good that I am sure about this now.

Thanks!

-- 
Best Regards
Masahiro Yamada
