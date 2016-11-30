Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cByAh-0001jq-No
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 06:15:12 +0000
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
 [209.85.161.169]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id uAU6EVFH028660
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 15:14:32 +0900
Received: by mail-yw0-f169.google.com with SMTP id r204so152164712ywb.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2016 22:14:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127171406.327c4d6e@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-21-git-send-email-yamada.masahiro@socionext.com>
 <20161127171406.327c4d6e@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 Nov 2016 15:14:31 +0900
Message-ID: <CAK7LNATp1Pvmk_cE6UGaURsM+nyWHpsmGiTgxU5M=FdVogL4Ew@mail.gmail.com>
Subject: Re: [PATCH 20/39] mtd: nand: denali_dt: enable HW_ECC_FIXUP
 capability for DT platform
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

2016-11-28 1:14 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Sun, 27 Nov 2016 03:06:06 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> The denali_dt.c was split out by Altera for the SOCFPGA port.  The
>> Denali IP on SOCFPGA incorporates the hardware ECC fixup feature.
>> Newer versions are very likely to support it.  So, it should be OK
>> to set DENALI_CAPS_HW_ECC_FIXUP for all DT platforms.
>
> Seems like a bad idea. What's the problem with setting this flag in the
> data->caps definition of each revision?

No problem.

I will follow your suggestion in v2.


-- 
Best Regards
Masahiro Yamada
