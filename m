Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPwIe-0000MI-NM
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2018 20:41:59 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Cc: Philipp Rosenberger <p.rosenberger@linutronix.de>,
 Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: DENALI: can't detect NAND chip
Date: Mon, 04 Jun 2018 22:41:40 +0200
Message-ID: <2325115.CDikpRts66@blindfold>
In-Reply-To: <20180604223453.0e233668@bbrezillon>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
 <CAFLxGvwWfC5LAXwhzhP+k=HPzhaEGe=v1K4yvofW6Lz+ZPnrCg@mail.gmail.com>
 <20180604223453.0e233668@bbrezillon>
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

Am Montag, 4. Juni 2018, 22:34:53 CEST schrieb Boris Brezillon:
> > I got access to that board and did initial debugging of the problem.
> > 
> > The problem seems to be that after your rework the NAND timings get
> > derived from the NAND clock.
> > When I make denali_setup_data_interface() a NOP, the NAND is being
> > detected and works.
> > 
> > Can it be that the function does not calculate the timings correctly
> > in all cases?
> > Please see the following debug output for good and bad case.
> > 
> > bad case:
> > [    0.946757] XXX: denali clk rate: 0x2faf080
> > [    0.950932] XXX: denali clk phase: 0x0
> > [    0.954671] XXX: denali clk accuracy: 0x0
> > [    0.958920] denali-nand-dt ff900000.nand: clk_x_rate: 0x2faf080
> > [    0.964846] denali-nand-dt ff900000.nand: Dump timing register values:
> > [    0.964846] acc_clks: 2, re_2_we: 10, re_2_re: 10
> > [    0.964846] we_2_re: 25, addr_2_data: 20, rdwr_en_lo_cnt: 4
> > [    0.964846] rdwr_en_hi_cnt: 2, cs_setup_cnt: 3
> > 
> > good case:
> > [    0.961061] XXX: denali clk rate: 0x2faf080
> > [    0.965231] XXX: denali clk phase: 0x0
> > [    0.968967] XXX: denali clk accuracy: 0x0
> > [    0.973031] denali-nand-dt ff900000.nand: Dump timing register values:
> > [    0.973031] acc_clks: 4, re_2_we: 20, re_2_re: 20
> > [    0.973031] we_2_re: 12, addr_2_data: 14, rdwr_en_lo_cnt: 2
> > [    0.973031] rdwr_en_hi_cnt: 2, cs_setup_cnt: 2
> > 
> > Does this ring a bell?
> > 
> 
> Could it be that clk_get_rate() returns an invalid value? Looks like
> all good timings are almost equal to bad timings multiplied by 2, so
> maybe the ->recalc_rate() method of clk driver returns freq / 2 instead
> of freq.

According to the datasheet, the NAND clock rate should be 50Mhz, which is what
is returned in both cases.
So this does not really look invalid to me. :)

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
