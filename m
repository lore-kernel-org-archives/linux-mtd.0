Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTND8-0007O8-S4
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2018 08:02:28 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
 Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 0/3] mtd: rawnand: denali: add new clocks and improve
 setup_data_interface
Date: Thu, 14 Jun 2018 10:02:12 +0200
Message-ID: <2214183.rYP2OkZajM@blindfold>
In-Reply-To: <20180614093835.5c3bf426@bbrezillon>
References: <1528953067-24324-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNASoV9nHTFax1nD_8pvkEjTzXkFpDFRf_xuoOnPPf9K23A@mail.gmail.com>
 <20180614093835.5c3bf426@bbrezillon>
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

Am Donnerstag, 14. Juni 2018, 09:38:35 CEST schrieb Boris Brezillon:
> On Thu, 14 Jun 2018 16:29:59 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 
> > Hi Richard,
> > 
> > 2018-06-14 16:25 GMT+09:00 Richard Weinberger <richard@sigma-star.at>:
> > > Masahiro,
> > >
> > > Am Donnerstag, 14. Juni 2018, 07:11:04 CEST schrieb Masahiro Yamada:  
> > >>
> > >> The ->setup_data_interface() hook needs to know the clock frequency.
> > >> In fact, this IP needs three clocks, bus "which clock?" is really
> > >> confusing.  (It is not described in the DT-binding at all.)
> > >>
> > >> This series adds more clocks.  In the new binding, three clocks
> > >> are required: core clock, bus interface clock, ECC engine clock.
> > >>
> > >> This series also takes care of the backward compatibility by
> > >> providing hardcoded values in case the new clocks are missing.
> > >> So, existing DT should work.
> > >>
> > >>
> > >> Changes in v2:
> > >>   - Split patches into sensible chunks
> > >>
> > >> Masahiro Yamada (3):
> > >>   mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
> > >>   mtd: rawnand: denali_dt: add more clocks based on IP datasheet
> > >>   mtd: rawnand: denali: optimize timing parameters for data interface  
> > >
> > > This still means that we need to feed at least 2/3 and 3/3 into -stable to
> > > unbreak the driver.  
> > 
> > 
> > 3/3 is not mandatory.
> > 
> > You can only back-port 1/3 and 2/3.
> 
> Well, patch 1 is not a fix, can we move it after patch 2 so that only
> patch 2 is flagged with the Fixes+Cc-stable tags?

Another question, shall we fix arch/arm/boot/dts/socfpga.dtsi too?

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
