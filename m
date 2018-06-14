Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTMda-0002Ia-ML
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2018 07:25:43 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 0/3] mtd: rawnand: denali: add new clocks and improve
 setup_data_interface
Date: Thu, 14 Jun 2018 09:25:19 +0200
Message-ID: <6557713.S7AzxIg9TS@blindfold>
In-Reply-To: <1528953067-24324-1-git-send-email-yamada.masahiro@socionext.com>
References: <1528953067-24324-1-git-send-email-yamada.masahiro@socionext.com>
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

Masahiro,

Am Donnerstag, 14. Juni 2018, 07:11:04 CEST schrieb Masahiro Yamada:
> 
> The ->setup_data_interface() hook needs to know the clock frequency.
> In fact, this IP needs three clocks, bus "which clock?" is really
> confusing.  (It is not described in the DT-binding at all.)
> 
> This series adds more clocks.  In the new binding, three clocks
> are required: core clock, bus interface clock, ECC engine clock.
> 
> This series also takes care of the backward compatibility by
> providing hardcoded values in case the new clocks are missing.
> So, existing DT should work.
> 
> 
> Changes in v2:
>   - Split patches into sensible chunks
> 
> Masahiro Yamada (3):
>   mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
>   mtd: rawnand: denali_dt: add more clocks based on IP datasheet
>   mtd: rawnand: denali: optimize timing parameters for data interface

This still means that we need to feed at least 2/3 and 3/3 into -stable to
unbreak the driver.
I'd really prefer a single self-hosting fix that can go into -stable and then
patches on top of the fix can prettify the driver.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
