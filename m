Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eFevA-00017K-N7
 for linux-mtd@lists.infradead.org; Fri, 17 Nov 2017 11:35:04 +0000
Received: by mail-ot0-x22e.google.com with SMTP id 18so1751863oty.9
 for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2017 03:34:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171117110912.24305-1-s.hauer@pengutronix.de>
References: <20171117110912.24305-1-s.hauer@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 17 Nov 2017 09:34:28 -0200
Message-ID: <CAOMZO5AB2y1rjHgSzzU2uHGZHOZwnaQvM1bO2O8sw0RWNQ-bmw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: gpmi-nand: Remove wrong Kconfig help text
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Han Xu <han.xu@nxp.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <kernel@pengutronix.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 17, 2017 at 9:09 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> The GPMI nand Kconfig help texts mentions that the GPMI nand driver
> might conflict with SD cards. The only conflict there might really
> be is that both controllers use the same pins, but this is resolved
> by the pincontroller setup in the device tree. In any way the GPMI
> driver can safely be enabled, the text is just wrong. Remove it.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
