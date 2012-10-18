Message-ID: <507FBDF1.5050602@freescale.com>
Date: Thu, 18 Oct 2012 16:29:37 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dma: add new DMA control commands
References: <1350538335-29026-1-git-send-email-b32955@freescale.com>
 <201210180914.58527.marex@denx.de> <507FB495.7050104@freescale.com>
 <201210181016.06782.marex@denx.de>
In-Reply-To: <201210181016.06782.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 artem.bityutskiy@linux.intel.com, perex@perex.cz,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Huang Shijie <shijie8@gmail.com>, linux@arm.linux.org.uk, cjb@laptop.org,
 lrg@ti.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Vinod Koul <vinod.koul@linux.intel.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 broonie@opensource.wolfsonmicro.com, linux-mmc@vger.kernel.org,
 w.sang@pengutronix.de, linux-kernel@vger.kernel.org, djbw@fb.com,
 khali@linux-fr.org, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B410=E6=9C=8818=E6=97=A5 16:16, Marek Vasut =E5=86=99=
=E9=81=93:
> So we can't stream data from the chip? About time to adjust the MTD fra=
mework to
> allow that. Maybe implement a command queue?
>

to Artem & David:
    is this possible to stream the data out with a command queue?

thanks
Huang Shijie
