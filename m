Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSfUM-0001Ky-CN
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 09:21:20 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: DENALI: can't detect NAND chip
Date: Tue, 12 Jun 2018 11:21:03 +0200
Message-ID: <2538157.EbBc2oB3DW@blindfold>
In-Reply-To: <20180605093627.03ee6a95@bbrezillon>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
 <CAK7LNARe+h_Fj5+nnpqYS4xGVLPHqgrW5g+1bckGB0+FWh9=sA@mail.gmail.com>
 <20180605093627.03ee6a95@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 5. Juni 2018, 09:36:27 CEST schrieb Boris Brezillon:
> On Tue, 5 Jun 2018 10:43:49 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 
> > 2018-06-05 7:01 GMT+09:00 Richard Weinberger <richard@sigma-star.at>:
> > > Am Montag, 4. Juni 2018, 22:57:32 CEST schrieb Richard Weinberger:  
> > >> Am Montag, 4. Juni 2018, 22:51:17 CEST schrieb Boris Brezillon:  
> > >> > > According to the datasheet, the NAND clock rate should be 50Mhz, which is what
> > >> > > is returned in both cases.
> > >> > > So this does not really look invalid to me. :)  
> > >> >
> > >> > Did you try to put a scope on the RE or WE pin? The x2 factor looks too
> > >> > perfect to be just a coincidence.  
> > >>
> > >> Not yet, but you are right the x2 factor is really interesting.  
> > >
> > > The NFC uses two clocks, nand_x_clk and nand_clk.
> > > nand_clk is nand_x_clk / 4.
> > > In the device tree nand_clk is referenced, and therefore used to calculate
> > > the timings. So we might need to use the 200Mhz clock instead of the 50Mhz
> > > for the calculation.
> > >  
> > 
> > 
> > Yes.
> > 
> > 
> > Strictly speaking, the Denali IP takes three clocks.
> > 
> > [1] clk :     core clock
> > [2] clk_x:    bus interface clock
> > [3] ecc_clk:  for ECC engine
> > 
> > 
> > 
> > Also in my SoCs (Socionext UniPhier),
> > 
> > clk = 50MHz,
> > clk_x = ecc_clk = 200MHz
> > 
> > 
> > 
> > In this case, the ->setup_data_interface hook
> > is interested in the frequency of [2] clk_x.
> > 
> > However, clk_x is not a core clock.
> > I admit this is confusing.
> > 
> > 
> > If we really want to make the DT-binding precise,
> > we can change the clock requirement like follows:
> > 
> > clock-names = "clk", "clk_x", "ecc_clk";
> 
> How about:
> 
> clock-names = "nand", "nand_x", "ecc";
> 
> The clk prefix/suffix is really redundant here.
> 
> > clocks = <...>, <...>, <...>;
> 
> If the IP really takes 3 different clks in input, then it should be
> represented like that.
> 
> > 
> > 
> > This might be an annoying churn, though...
> > 
> > 
> 
> I guess you're talking about backward compat with existing dtb. This
> should be a problem, and we can even fix the Richard's problem for
> those dtbs if we hardcode the nand_x_clk rate to 200Mhz when nand_x_clk
> is missing (see below).

[...]

Masahiro, which fix do you prefer?

We could also just fix the dts file.
e.g.
commit c0097d0b498bdefb427c352d615432e97f1998aa
Author: Richard Weinberger <richard@nod.at>
Date:   Tue Jun 12 11:16:22 2018 +0200

    arm: dts: socfpga: Use right denali clock
    
    To calculate the timing parameters a 200MHz clock is needed, in case of
    socfpga this is nand_x_clk and not nand_clk.
    
    Cc: stable@kernel.org
    Fixes: 1bb88666775e ("mtd: nand: denali: handle timing parameters by setup_data_interface()")
    Signed-off-by: Richard Weinberger <richard@nod.at>

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 486d4e7433ed..8fbddc2a5c33 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -754,7 +754,7 @@
 			reg-names = "nand_data", "denali_reg";
 			interrupts = <0x0 0x90 0x4>;
 			dma-mask = <0xffffffff>;
-			clocks = <&nand_clk>;
+			clocks = <&nand_x_clk>;
 			status = "disabled";
 		};
 
Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
