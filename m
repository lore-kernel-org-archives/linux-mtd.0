Date: Fri, 23 Nov 2018 09:02:35 -0800
From: Tony Lindgren <tony@atomide.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ARM: OMAP1: ams-delta: Provide GPIO lookup table
 for NAND data port
Message-ID: <20181123170235.GG53235@atomide.com>
References: <20180813223448.21316-1-jmkrzyszt@gmail.com>
 <20181121110806.32076-1-jmkrzyszt@gmail.com>
 <20181121110806.32076-2-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121110806.32076-2-jmkrzyszt@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Janusz Krzysztofik <jmkrzyszt@gmail.com> [181121 11:06]:
> Data port used by Amstrad Delta NAND driver is actually an OMAP MPUIO
> device, already under control of gpio-omap driver.  The NAND driver
> gets access to the port by ioremapping it and performs read/write
> operations.  That is done without any proteciton from other users
> legally manipulating the port pins over GPIO API.
> 
> The plan is to convert the driver to access the port over GPIO consumer
> API.  Before that is implemented, the driver can already obtain
> exclusive access to the port by requesting an array of its GPIO
> descriptors.
> 
> Add respective entries to the NAND GPIO lookup table.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Best to merge this along with the MFD patches:

Acked-by: Tony Lindgren <tony@atomide.com>
