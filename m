Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctomc-0005sa-3I
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 05:07:36 +0000
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
 [209.85.213.174]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v2V56XcK016632
 for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2017 14:06:34 +0900
Received: by mail-yb0-f174.google.com with SMTP id f204so13390614ybc.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 22:06:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170330160238.59e5a2c1@bbrezillon>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-15-git-send-email-yamada.masahiro@socionext.com>
 <20170330160238.59e5a2c1@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 31 Mar 2017 14:06:32 +0900
Message-ID: <CAK7LNARUKwMHd79ALDx_SDY9XKcHPY96xTAOMQx6XarFgwb-AA@mail.gmail.com>
Subject: Re: [PATCH v3 14/37] mtd: nand: denali: support "nand-ecc-strength"
 DT property
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
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


2017-03-30 23:02 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Thu, 30 Mar 2017 15:46:00 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Historically, this driver tried to choose as big ECC strength as
>> possible, but it would be reasonable to allow DT to set a particular
>> ECC strength with "nand-ecc-strength" property.  This is useful
>> when a particular ECC setting is hard-coded by firmware (or hard-
>> wired by boot ROM).
>>
>> If no ECC strength is specified in DT, "nand-ecc-maximize" is implied
>> since this was the original behavior.
>
> You said there is currently no DT users,

Right.  No DT users ever in upstream.


> so how about changing the
> "fallback to ECC maximization" behavior for DT users, and instead of
> maximizing the ECC strength take the NAND requirements into account
> (chip->ecc_strength_ds).

This is difficult to judge in some cases.

As I said before, 4/512 and 8/1024 are not equivalent.

If chip's requirement  chip->ecc_step_ds matches
to the ecc->size supported by the controller,
this is easy.


If a chip requests 1024B, then the controller can only support 512B chunk
(or vice versa), it is difficult to simply compare
ecc strength.

Is it a bad thing if we use too strong ECC strength?

The disadvantage I see is we will have less OOB-free bytes,
but this will not be fatal, I guess.




-- 
Best Regards
Masahiro Yamada
