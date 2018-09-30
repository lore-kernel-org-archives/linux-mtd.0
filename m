Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6USF-00085m-2r
 for linux-mtd@lists.infradead.org; Sun, 30 Sep 2018 05:39:44 +0000
Date: Sun, 30 Sep 2018 07:39:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Lukasz Majewski <lukma@denx.de>, Fabio Estevam <festevam@gmail.com>,
 prabhakar.kushwaha@nxp.com, han.xu@nxp.com
Cc: Frieder Schrempf <frieder.schrempf@exceet.de>, Mark Rutland
 <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 yogeshnarayan.gaur@nxp.com, richard@nod.at, Stefan Agner <stefan@agner.ch>,
 Fabio Estevam <fabio.estevam@nxp.com>, broonie@kernel.org,
 david.wolfe@nxp.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 albert.aribaud@3adev.fr
Subject: Re: [RFC/RFT PATCH v1 0/9] mtd: fsl: quadspi: Fixes for
 fsl-quadspi.c driver (vybrid HW)
Message-ID: <20180930073927.001c16d2@bbrezillon>
In-Reply-To: <20180929230240.1c8d844d@jawa>
References: <20180926220739.620-1-lukma@denx.de>
 <20180929000359.34fe18ae@bbrezillon> <20180929230240.1c8d844d@jawa>
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

Hi Lukasz,

On Sat, 29 Sep 2018 23:02:40 +0200
Lukasz Majewski <lukma@denx.de> wrote:

> > Talking about that, can you try to port your fixes on top of Frieder's
> > patchset? I'm pretty sure some bug fixes are irrelevant after the
> > migration to spi-mem (patch 1, 3, 4, 5, 6, 7 and 9 should be dropped I
> > think).  
> 
> The problem is that Frieder's patch is using IP command mode for
> transfers smaller than AHB RX fifo size.
> This according to the comment in the current driver is broken in HW for
> Vybrid (so this is a regression).

Why not fixing that in the new driver?

> 
> I'm also wondering if other users of vf610 based boards experience
> issues with QSPI?

Are you sure the 4 I/O lines are wired on your design? Anyway, if it's
a bug that only hurts vf610, you should mask quad modes in ->hwcaps (or
patch fsl_qspi_supports_op() in the new driver), not change the SPI NOR
definition.

> 
> In my case, after running the UBI/UBIFS tests (on the original and
> new driver without those "fixes") I cannot mount the volume after
> creation as the header is wrongly read.

I'm not denying this fact, I'm just saying, now that you've found where
the issue comes from, you can also port the fix to the new driver.

Regards,

Boris
