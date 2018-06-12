Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSgg8-0004Oy-OP
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 10:37:34 +0000
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
 [209.85.217.177]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id w5CAaljK014090
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2018 19:36:48 +0900
Received: by mail-ua0-f177.google.com with SMTP id a5-v6so15608901uao.8
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2018 03:36:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1528799515-1356-2-git-send-email-yamada.masahiro@socionext.com>
References: <1528799515-1356-1-git-send-email-yamada.masahiro@socionext.com>
 <1528799515-1356-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Jun 2018 19:36:06 +0900
Message-ID: <CAK7LNASM53scdd-OZOj_7404Eru3a98uNLagip_GdkrSSaG3-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: denali: add more clocks
To: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 DTML <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
 Richard Weinberger <richard@sigma-star.at>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Maybe, the commit title should be:

mtd: rawnand: denali: add more clocks and improve setup_data_interface



2018-06-12 19:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> According to the Denali User's Guide, this IP needs three clock inputs:
>
>  - clk: controller core clock
>
>  - clk_x: bus interface clock
>
>  - ecc_clk: clock at which ECC circuitry is run
>
> Currently, denali_dt.c requires a single anonymous clock and its
> frequency.  However, the driver needs to get the frequency of "clk_x"
> not "clk".  This is confusing because people tend to assume the
> anonymous clock means the core clock.
>
> Instead of the cheesy implementation, the clocks in the real hardware
> should be represented in the driver code and the DT-binding.
>
> I improved the ->setup_data_interface() hook as well.
>
> The denali_setup_data_interface() needs the frequency of clk_x
> and the ratio of clk_x / clk.
>
> The latter is currently hardcoded in the driver, like this:
>
>   #define DENALI_CLK_X_MULT       6
>
> The IP datasheet specifies that clk_x / clk should be 4, 5, or 6.
> I just chose 6 because it is the most defensive value, but it is not
> very nice.  By getting the clock rate of both "clk" and "clk_x", the
> driver can compute the timing values more precisely.
>
> Adding new clocks would break the existing platforms.  For the backward
> compatibility, the driver still accepts the single clock just as before.
> Also, ->clk_rate and ->clk_x_rate are set to hardcoded values if clk_x
> is missing.
>
> It should work for all upstreamed platforms because Intel Moorestown,
> Altera (Intel) SOCFPGA, Socionext UniPhier use the following clock
> frequency:
>
>   clk = 50 MHz
>   clk_x = ecc_clk = 200 MHz
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


-- 
Best Regards
Masahiro Yamada
