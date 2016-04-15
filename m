Date: Fri, 15 Apr 2016 17:40:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: Markus Pargmann <mpa@pengutronix.de>, David Woodhouse
 <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, Huang Shijie
 <shijie.huang@intel.com>, Brian Norris <computersforpeace@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Stefan Christ <s.christ@phytec.de>,
 Elie De Brauwer <eliedebrauwer@gmail.com>, Richard Weinberger
 <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages
Message-ID: <20160415174031.3c088df5@bbrezillon>
In-Reply-To: <AM4PR0401MB1841C82A9BCBFF2C55AA4DC397680@AM4PR0401MB1841.eurprd04.prod.outlook.com>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <33206452.D8BR53ndXi@adelgunde>
 <20160415113906.7f971cec@bbrezillon> <1733015.oJ2G1KSZLY@adelgunde>
 <AM4PR0401MB1841C82A9BCBFF2C55AA4DC397680@AM4PR0401MB1841.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 15 Apr 2016 15:33:07 +0000
Han Xu <han.xu@nxp.com> wrote:

> >
> > I just did [1] (it applies on top of your patch), but maybe you
> > can test it (I don't have any imx platforms right now) ;).
> 
> Great, thank you :). I just tested the patch and it works for me. The
> erased page bitflips are still detected and fixed. I will send a new
> version then.
> 
> Hi Markus,
> 
> Could you please share how to verify the patch, in other words, how to reproduce the
> UBIFS corruption issue consistently. Thanks.

I should really post a new version of the nandflipbits tool [1].
That's clearly the easiest solution to verify that your bitflip
correction is reliable.


[1]http://lists.infradead.org/pipermail/linux-mtd/2014-November/056634.html

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
