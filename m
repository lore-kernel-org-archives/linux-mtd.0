From: Marek Vasut <marex@denx.de>
To: "Jean-Christophe PLAGNIOL-VILLARD" <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] mtd: mxc_nand: Make use of supplied pinctrl data
Date: Tue, 8 Jan 2013 21:22:46 +0100
References: <1357568885-15507-1-git-send-email-marex@denx.de>
 <20130108195826.GD7360@game.jcrosoft.org>
In-Reply-To: <20130108195826.GD7360@game.jcrosoft.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201301082122.46815.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Lothar =?iso-8859-1?q?Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Jean-Christophe PLAGNIOL-VILLARD,

> On 15:28 Mon 07 Jan     , Marek Vasut wrote:
> > The MXC NAND driver doesn't consider the pinctrl data supplied via DT,
> > which will result in NAND pins not being properly configured.
> > 
> > Make the driver use pinctrl, but to prevent breakage on various boards,
> > do not fail if the pinctrl data are not available, only print a warning
> > message.
> 
> nack
> 
> we will at bus level

Can you please elaborate? I don't understand what you're complaining about at 
all, sorry.

Best regards,
Marek Vasut
