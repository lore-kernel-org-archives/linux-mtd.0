Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBy9F-000135-SP
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 06:13:42 +0000
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id uAU6D4MG025957
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 15:13:04 +0900
Received: by mail-yw0-f172.google.com with SMTP id i145so152324760ywg.2
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2016 22:13:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127171008.39f883b8@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-19-git-send-email-yamada.masahiro@socionext.com>
 <20161127171008.39f883b8@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 Nov 2016 15:13:03 +0900
Message-ID: <CAK7LNAQOQANtmgeRtJU7S6fUth0r5ZstUM+68Qs9FjxEz0_gfQ@mail.gmail.com>
Subject: Re: [PATCH 18/39] mtd: nand: denali: move denali_read_page_raw()
 above denali_read_page()
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

2016-11-28 1:10 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Sun, 27 Nov 2016 03:06:04 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> This will be needed in the next commit to call denali_read_page_raw()
>> from denali_read_page().
>
> Please squash this change into patch 19. It's clearly useless to
> dissociate them.
>

I will.

But as I mentioned in the reply to 19/39,
I am thinking that another solution may be possible.

In that case, both 18/39 and 19/39 will be unnecessary.


-- 
Best Regards
Masahiro Yamada
