Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPwXx-0007yG-Nt
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2018 20:58:40 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
 Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: DENALI: can't detect NAND chip
Date: Mon, 04 Jun 2018 22:57:32 +0200
Message-ID: <38227338.JIUUFn9IOS@blindfold>
In-Reply-To: <20180604225117.61d2c269@bbrezillon>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
 <2325115.CDikpRts66@blindfold> <20180604225117.61d2c269@bbrezillon>
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

Am Montag, 4. Juni 2018, 22:51:17 CEST schrieb Boris Brezillon:
> > According to the datasheet, the NAND clock rate should be 50Mhz, which is what
> > is returned in both cases.
> > So this does not really look invalid to me. :)
> 
> Did you try to put a scope on the RE or WE pin? The x2 factor looks too
> perfect to be just a coincidence.

Not yet, but you are right the x2 factor is really interesting.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
