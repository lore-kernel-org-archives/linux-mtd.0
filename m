Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJ1H3-0005Xx-Io
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 17:31:11 +0000
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
 [209.85.213.181]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id v58HUEuX018551
 for <linux-mtd@lists.infradead.org>; Fri, 9 Jun 2017 02:30:14 +0900
Received: by mail-yb0-f181.google.com with SMTP id f192so11025362yba.2
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 10:30:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ3OwpC60oZ5pXTAzLN5uQHbm2jRMMQiwJuznHZYPWnTg@mail.gmail.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-11-git-send-email-yamada.masahiro@socionext.com>
 <20170607155701.4bc89ad8@bbrezillon>
 <CAK7LNAQanUEcNQK=jUvZMpaN+_cePhp5_qt23AxmdwqE5JN_nA@mail.gmail.com>
 <20170608091239.0095511b@bbrezillon>
 <CAK7LNAQSCC-MB3Ck7KyE47HVeAOJ1t1Xop2s=tuJ-UH-OpvShQ@mail.gmail.com>
 <20170608132620.17fc7c96@bbrezillon>
 <CAK7LNARbaAKyB2ss780o=L=sqqUdz=fix+PaxW_ODDAM63VXOw@mail.gmail.com>
 <20170608174311.4f012cc5@bbrezillon>
 <CAK7LNAQ3OwpC60oZ5pXTAzLN5uQHbm2jRMMQiwJuznHZYPWnTg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 9 Jun 2017 02:30:12 +0900
Message-ID: <CAK7LNARCVua6zXvCzd+3UugXF-mAOs3GwVXYPis6ndtS1D8ntw@mail.gmail.com>
Subject: Re: [PATCH v5 10/23] mtd: nand: denali: rework interrupt handling
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-06-09 2:26 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:

> ->dev_ready() is optional, but we may end up with waiting more than needed.
>
>         case NAND_CMD_RESET:
>                 if (chip->dev_ready)
>                          break;
>                 udelay(chip->chip_delay);
>
>
> chip->chip_delay is probably set large enough, so this is not optimal.

I misunderstood the code.

The following line will be the most of the part of delay.

     nand_wait_status_ready(mtd, 250);


-- 
Best Regards
Masahiro Yamada
