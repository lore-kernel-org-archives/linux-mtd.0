Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCfYg-0007n6-14
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 04:34:51 +0000
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
 [209.85.213.177]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id uB24Y0MF004097
 for <linux-mtd@lists.infradead.org>; Fri, 2 Dec 2016 13:34:00 +0900
Received: by mail-yb0-f177.google.com with SMTP id d59so36053329ybi.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 20:34:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127162129.67bb8e00@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-10-git-send-email-yamada.masahiro@socionext.com>
 <20161127162129.67bb8e00@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 2 Dec 2016 13:33:58 +0900
Message-ID: <CAK7LNAS8RFs6iLNObj=HESUqWyEr8CO7B=LCCCbZ6Ki8Em96wg@mail.gmail.com>
Subject: Re: [PATCH 09/39] mtd: nand: denali: fix erased page check code
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


2016-11-28 0:21 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Sun, 27 Nov 2016 03:05:55 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Currently, is_erased() is called against "buf" twice, so the second
>> call is meaningless.  The second one should be checked against
>> chip->oob_poi.
>>
>
> IMO, patch 9 to 12 should be squashed in a single patch. All you're
> doing in these patch is fixing the check_erased_page logic.
>
> You can describe the different broken thing in the commit message, but
> splitting things as you do does not help much.


OK. I will do so.

I realized some mistakes in this part
(both in my patches and in the current mainline code),
so I will rework it in a more sensible chunk.


> Also, please have at nand_check_erased_ecc_chunk() [1] instead of using
> a private method (is_erased()) to check if the page is erased.
> With this method you get bitflips in erased pages correction for free.

I will use this helper, thanks!




With this, I think I answered all of your questions to v1.

(Please tell me if there is something I missed to answer.)

Thanks a lot for your review.



-- 
Best Regards
Masahiro Yamada
