Received: from mail-eopbgr40082.outbound.protection.outlook.com ([40.107.4.82]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eFjnA-0004aB-Bo
 for linux-mtd@lists.infradead.org; Fri, 17 Nov 2017 16:47:03 +0000
From: Han Xu <han.xu@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Richard
 Weinberger" <richard@nod.at>, Sascha Hauer <kernel@pengutronix.de>, "Boris
 Brezillon" <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: gpmi-nand: Remove wrong Kconfig help text
Date: Fri, 17 Nov 2017 16:46:34 +0000
Message-ID: <VI1PR0401MB222135E76C25F0B7858B9C42972F0@VI1PR0401MB2221.eurprd04.prod.outlook.com>
References: <20171117110912.24305-1-s.hauer@pengutronix.de>,
 <CAOMZO5AB2y1rjHgSzzU2uHGZHOZwnaQvM1bO2O8sw0RWNQ-bmw@mail.gmail.com>
In-Reply-To: <CAOMZO5AB2y1rjHgSzzU2uHGZHOZwnaQvM1bO2O8sw0RWNQ-bmw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


________________________________________
From: Fabio Estevam <festevam@gmail.com>
Sent: Friday, November 17, 2017 5:34 AM
To: Sascha Hauer
Cc: linux-mtd@lists.infradead.org; Han Xu; Richard Weinberger; Sascha Hauer=
; Boris Brezillon
Subject: Re: [PATCH] mtd: nand: gpmi-nand: Remove wrong Kconfig help text

On Fri, Nov 17, 2017 at 9:09 AM, Sascha Hauer <s.hauer@pengutronix.de> wrot=
e:
> The GPMI nand Kconfig help texts mentions that the GPMI nand driver
> might conflict with SD cards. The only conflict there might really
> be is that both controllers use the same pins, but this is resolved
> by the pincontroller setup in the device tree. In any way the GPMI
> driver can safely be enabled, the text is just wrong. Remove it.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

Acked-by: Han Xu <han.xu@nxp.com>=
