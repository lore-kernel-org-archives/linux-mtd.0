Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIqlG-0005Xz-5m
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 06:17:40 +0000
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
 [209.85.161.178]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id v586Gs4u004352
 for <linux-mtd@lists.infradead.org>; Thu, 8 Jun 2017 15:16:54 +0900
Received: by mail-yw0-f178.google.com with SMTP id e142so1958119ywa.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2017 23:16:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Jun 2017 15:16:53 +0900
Message-ID: <CAK7LNAQMCCxZAJc=7EwEPmpxD+-VsgOvMxwk5ySLfxLVsarqhw@mail.gmail.com>
Subject: Re: [PATCH v5 00/23] mtd: nand: denali: Denali NAND IP patch bomb
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

2017-06-07 20:52 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This patch series intends to solve various problems.
>
> [1] The driver just retrieves the OOB area as-is
>     whereas the controller uses syndrome page layout.
> [2] Many NAND chip specific parameters are hard-coded in the driver.
> [3] ONFi devices are not working
> [4] It can not read Bad Block Marker
>
> Outstanding changes are:
> - Fix raw/oob callbacks for syndrome page layout
> - Implement setup_data_interface() callback
> - Fix/implement more commands for ONFi devices
> - Allow to skip the driver internal bounce buffer
> - Support PIO in case DMA is not supported
> - Switch from ->cmdfunc over to ->cmd_ctrl


I am planning v6, but
how many can you pick-up from this series?

I did not see your comments for 01-05, so are they applicable?

Could you add
Acked-by: Rob Herring <robh@kernel.org>
for 05  (http://patchwork.ozlabs.org/patch/772388/)

He had already acked it, but I just missed it.



-- 
Best Regards
Masahiro Yamada
