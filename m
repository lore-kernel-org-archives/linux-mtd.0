Date: Wed, 13 May 2015 08:22:45 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 0/4] mtd: mxc_nand: fix 8 bit ECC and large oob
Message-ID: <20150513052245.GJ2558@tarshish>
References: <cover.1430636819.git.baruch@tkos.co.il>
 <20150508051538.GW6325@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150508051538.GW6325@pengutronix.de>
Cc: Fabio Estevam <Fabio.Estevam@freescale.com>,
 Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

On Fri, May 08, 2015 at 07:15:38AM +0200, Sascha Hauer wrote:
> On Sun, May 03, 2015 at 10:18:50AM +0300, Baruch Siach wrote:
> > This patch series fixes mxc_nand bugs that I encountered while trying to use 8
> > bit ECC mode on i.MX25 with the Micron MT29F8G08ABABA flash chip.
> > 
> > Many thanks to Uwe Kleine-König for guiding me through the process of
> > debugging and fixing, and for contributing a clean-up patch to this series.
> > 
> > This series applies and tested on v4.1-rc1.
> > 
> > This is version 2 of the patch series, addressing the comments and suggestion
> > of Uwe Kleine-König on the first series
> > (http://thread.gmane.org/gmane.linux.ports.arm.kernel/408635). See each patch
> > for detailed per-patch changelog.
> > 
> > Baruch Siach (3):
> >   mtd: mxc_nand: limit the size of used oob
> >   mtd: mxc_nand: fix truncate of unaligned oob copying
> >   mtd: mxc_nand: generate nand_ecclayout for 8 bit ECC
> > 
> > Uwe Kleine-König (1):
> >   mtd: nand: mxc_nand: cleanup copy_spare function
> 
> I looked at this version and have only found some minor coding style
> violations (spaces missing on both sides of operators).

Documentation/CodingStyle mentions it but checkpatch.pl doesn't warn. I find 
it more readable to omit spaces around the * operator when mixing with +. 

	layout->eccpos[i*18 + j] = i*26 + j + 7;

> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
