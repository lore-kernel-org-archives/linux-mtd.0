Date: Sun, 3 May 2015 10:55:49 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/4] mtd: mxc_nand: limit the size of used oob
Message-ID: <20150503075549.GH2265@tarshish>
References: <20150426200725.GC19431@pengutronix.de>
 <20150427043906.GR2258@tarshish>
 <20150427071238.GE19431@pengutronix.de>
 <20150427072057.GT2258@tarshish>
 <20150427075023.GF19431@pengutronix.de>
 <20150427114341.GW2258@tarshish>
 <20150427193127.GU19431@pengutronix.de>
 <20150429061853.GB2258@tarshish>
 <20150429063508.GE19431@pengutronix.de>
 <CAOMZO5AAcRu3gscLSQTiRExeS_pXO-uJm0uA3fL5uwYUUMMsqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5AAcRu3gscLSQTiRExeS_pXO-uJm0uA3fL5uwYUUMMsqQ@mail.gmail.com>
Cc: Fabio Estevam <Fabio.Estevam@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <sha@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabio,

On Thu, Apr 30, 2015 at 12:20:32PM -0300, Fabio Estevam wrote:
> On Wed, Apr 29, 2015 at 3:35 AM, Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> 
> > That's surprising. It would be interesting to hear from Freescale what
> > is wrong here (Fabio? Maybe contact support?). I quickly skimmed through
> > the errata documents but didn't found anything. So it's not only that
> 
> Yes, that's something I am not aware of either.
> 
> Please contact the FSL support folks so that the hardware guys could
> assist on this topic.

Our past experience with hardware support at the micro level was not all that 
great. Anyway, I dropped the limit to 128 for oobsize < 218, since this is 
only a theoretic bug, and I can't really test it.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
