From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] dma: add new DMA control commands
Date: Thu, 18 Oct 2012 10:49:21 +0200
References: <1350538335-29026-1-git-send-email-b32955@freescale.com>
 <201210181016.06782.marex@denx.de> <507FC290.10205@freescale.com>
In-Reply-To: <507FC290.10205@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201210181049.21556.marex@denx.de>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 artem.bityutskiy@linux.intel.com, perex@perex.cz,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Huang Shijie <shijie8@gmail.com>, linux@arm.linux.org.uk, cjb@laptop.org,
 lrg@ti.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Vinod Koul <vinod.koul@linux.intel.com>, broonie@opensource.wolfsonmicro.com,
 linux-mmc@vger.kernel.org, w.sang@pengutronix.de, linux-kernel@vger.kernel.org,
 djbw@fb.com, khali@linux-fr.org, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2012=E5=B9=B410=E6=9C=8818=E6=97=A5 16:16, Marek Vasut =E5=86=
=99=E9=81=93:
> > So we can't stream data from the chip? About time to adjust the MTD
> > framework to allow that. Maybe implement a command queue?
>=20
> IMHO, it's not possible. Because the READ-PAGE(00h-30h) command needs to
> check the busy status
> which means we have to stop in the middle, so we can not chain the all
> the read-pages DMA commands.

Can the DMA not branch?

> thanks
> Huang Shijie

Best regards,
Marek Vasut
