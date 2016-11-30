Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cByG8-0005tG-De
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 06:20:49 +0000
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
 [209.85.213.169]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id uAU6KBRZ011680
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 15:20:12 +0900
Received: by mail-yb0-f169.google.com with SMTP id d128so14342387ybh.2
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2016 22:20:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127170907.002e6ab4@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-18-git-send-email-yamada.masahiro@socionext.com>
 <20161127170907.002e6ab4@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 Nov 2016 15:20:10 +0900
Message-ID: <CAK7LNASsn8esF6UsCmc-Pv+ED_ukvtMO7nOWLs+u6H0UgcsHTw@mail.gmail.com>
Subject: Re: [PATCH 17/39] mtd: nand: denali: support HW_ECC_FIXUP capability
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


2016-11-28 1:09 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
                                        &max_bitflips);
>
> Okay, so you currently have two ways of handling ECC errors. What if a
> new revision introduces yet another way to do it?
>
> How about making denali_caps a structure where you have one (or several)
> function pointers to implement operations differently depending on the
> IP revision?
>
> struct denali_caps {
>         u32 feature_flags; /* If needed. */
>         bool (*handle_ecc)(...);
>         ...
> };
>

I think a problem is the difference of function arguments:

static bool denali_hw_ecc_fixup(struct denali_nand_info *denali,
                                unsigned int *max_bitflips)

     vs

static bool denali_sw_ecc_fixup(struct denali_nand_info *denali, u8 *buf,
                                u32 irq_status, unsigned int *max_bitflips)


I do not want to pass redundant arguments,
which are used for one, but not used for the other.


We do not need to think about the situation that may not happen.
If happens, we can refactor the code any time.




-- 
Best Regards
Masahiro Yamada
