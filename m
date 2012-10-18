Message-ID: <507FA595.4020507@freescale.com>
Date: Thu, 18 Oct 2012 14:45:41 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vinod Koul <vinod.koul@linux.intel.com>
Subject: Re: [PATCH] dma: add new DMA control commands
References: <1350538335-29026-1-git-send-email-b32955@freescale.com>
 <1350541111.5263.3.camel@vkoul-udesk3>
In-Reply-To: <1350541111.5263.3.camel@vkoul-udesk3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, Huang Shijie <shijie8@gmail.com>,
 alsa-devel@alsa-project.org, shawn.guo@linaro.org, linux@arm.linux.org.uk,
 tiwai@suse.de, artem.bityutskiy@linux.intel.com,
 broonie@opensource.wolfsonmicro.com, linux-mmc@vger.kernel.org,
 w.sang@pengutronix.de, perex@perex.cz, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, ben-linux@fluff.org, djbw@fb.com,
 khali@linux-fr.org, cjb@laptop.org, dwmw2@infradead.org, lrg@ti.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B410=E6=9C=8818=E6=97=A5 14:18, Vinod Koul =E5=86=99=
=E9=81=93:
> Why cant you do start (prepare clock etc) when you submit the descripto=
r
> to dmaengine. Can be done in tx_submit callback.
> Similarly remove the clock when dma transaction gets completed.
I ever thought this method too.

But it will become low efficient in the following case:

   Assuming the gpmi-nand driver has to read out 1024 pages in one=20
_SINGLE_ read operation.
The gpmi-nand will submit the descriptor to dmaengine per page. So with=20
your method,
the system will repeat the enable/disable dma clock 1024 time. At every=20
enable/disable dma clock,
the system has to enable the clock chain and it's parents ...

But with this patch, we only need to enable/disable dma clock one time,=20
just at we select the nand chip.

thanks
Huang Shijie
