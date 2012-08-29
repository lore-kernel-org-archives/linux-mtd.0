Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6cu1-0005xh-N8
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 07:41:30 +0000
Date: Wed, 29 Aug 2012 09:41:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Roland Stigge <stigge@antcom.de>
Subject: Re: mxc_nand.c on mach-imx/imx53
Message-ID: <20120829074122.GV26594@pengutronix.de>
References: <5035F84E.3000901@antcom.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5035F84E.3000901@antcom.de>
Cc: linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roland,

On Thu, Aug 23, 2012 at 11:30:54AM +0200, Roland Stigge wrote:
> Hi,
> 
> I'd like to know about the current state of mxc_nand.c on imx53, because
> I got an error on probe() because the clock that mxc_nand is requesting
> is "nfc" but imx53 only defines the clock "mxc_nand".

The driver generally works on i.MX53, only some pieces are missing. I
just resent the corresponding series and put you on Cc.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
