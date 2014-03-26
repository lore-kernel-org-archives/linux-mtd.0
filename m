Message-ID: <5332AEE7.2040402@freescale.com>
Date: Wed, 26 Mar 2014 18:41:43 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
References: <532BCFCC.4080205@freescale.com>	<1395399017-19005-1-git-send-email-LW@KARO-electronics.de>	<20140324095902.GB11377@localhost>
 <20140326095156.3e5585b8@ipc1.ka-ro>
In-Reply-To: <20140326095156.3e5585b8@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@freescale.com>, Rob Landley <rob@landley.net>,
 Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8826=E6=97=A5 16:51, Lothar Wa=C3=9Fmann =
=E5=86=99=E9=81=93:
> I don't see why this should not be supported on i.MX28 (i.MX23 doesn't
> do byteswapping anyway, so this wouldn't change anything for i.MX23).
> The partitions used by Linux need not necessarily be accessible for the
> Boot ROM code (and vice versa).
But the first partition used to store the u-boot is accessible for the RO=
M.

Please see "Figure 12-13" in the 12.12.1.12:
   "In order to preserve the BI (bad block information), flash updater=20
or gang programmer
applications need to swap Bad Block Information (BI) data to byte 0 of=20
metadata area for
every page before programming NAND Flash. ROM when loading firmware,=20
copies back
the value at metadata[0] to BI offset in page data. The following figure=20
shows how the
factory bad block marker is preserved."

So please the imx28 should _NOT_ support this feature.

thanks
Huang Shijie
