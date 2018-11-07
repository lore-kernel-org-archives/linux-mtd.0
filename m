Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKWwP-00014N-QL
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 23:08:55 +0000
Received: by mail-lf1-x142.google.com with SMTP id p17so12742058lfh.4
 for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2018 15:08:42 -0800 (PST)
MIME-Version: 1.0
References: <1541601809-16950-1-git-send-email-frieder.schrempf@kontron.de>
 <1541601809-16950-7-git-send-email-frieder.schrempf@kontron.de>
 <CAOesGMgPwwwmizC+R4W1aLpvgcuVOYQr2qR2Vqb6171zGfarRw@mail.gmail.com>
 <b12936f5-871d-a982-13c5-9d894f4a1521@kontron.de>
In-Reply-To: <b12936f5-871d-a982-13c5-9d894f4a1521@kontron.de>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 7 Nov 2018 15:08:29 -0800
Message-ID: <CAOesGMgGGRK=Q-Q8BDk+4hk-VsnqocrkQSLNZoRMXtdJXNKMPg@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] ARM: defconfig: Use the new FSL QSPI driver
 under the SPI framework
To: frieder.schrempf@kontron.de
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-spi@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 miquel.raynal@bootlin.com,
 Mark Brown <broonie@kernel.org>, david.wolfe@nxp.com,
 Fabio Estevam <fabio.estevam@nxp.com>, prabhakar.kushwaha@nxp.com,
 yogeshnarayan.gaur@nxp.com, han.xu@nxp.com, Shawn Guo <shawnguo@kernel.org>,
 frieder.schrempf@exceet.de, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, linux-imx@nxp.com,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Eric Anholt <eric@anholt.net>,
 Stefan Agner <stefan@agner.ch>, Simon Horman <horms+renesas@verge.net.au>,
 Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Stefan Wahren <stefan.wahren@i2se.com>, yannick.fertre@st.com,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 7, 2018 at 8:36 AM Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> Hi Olof,
>
> On 07.11.18 17:20, Olof Johansson wrote:
> > On Wed, Nov 7, 2018 at 6:44 AM Frieder Schrempf
> > <frieder.schrempf@kontron.de> wrote:
> >>
> >> From: Frieder Schrempf <frieder.schrempf@exceet.de>
> >>
> >> The new driver at spi/spi-fsl-qspi.c replaces the old SPI NOR driver
> >> at mtd/fsl-quadspi.c. Switch to the new driver in the defconfigs.
> >>
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
> >
> > Hi Frieder,
> >
> > This patch is part of a series that I didn't see the rest of, but in
> > general we prefer to merge these through arm-soc even if the driver
> > goes in through another tree. The way we'd prefer to handle it is that
> > once the driver lands, we'll take the config option change to turn it
> > on. To avoid our branches to break until both sides have landed, it
> > might be a good idea to keep both drivers on for a short while (one
> > release).
> >
> > So, I'm not going to ack this since we avoid taking defconfig changes
> > through driver trees (these two defconfigs tend to churn a lot and we
> > don't want to create merge conflicts where we don't have to), but
> > we'll be happy to pick it up when the time comes.
>
> Ok, thank you for explaining the common practice. I will drop the config
> changes for the next version and send it separately when the time is ready.
>
> Both the old driver and the new one use the same compatible strings for
> probing. Wouldn't that cause problems if both drivers are enabled for a
> while, or am I missing something?

Only one of them would be allowed to bind to a device, but it might
not be predictable which one does (especially in the case of modules).

So, it's far from ideal, but breaking the platform is possibly worse.
It might just be a good idea to merge the driver and not turn it on
until it's in for that case (i.e. we take the config change between
-rc1 and -rc2).


-Olof
