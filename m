Message-ID: <507FC796.7060401@freescale.com>
Date: Thu, 18 Oct 2012 17:10:46 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] dma: add new DMA control commands
References: <1350538335-29026-1-git-send-email-b32955@freescale.com>
 <1350541111.5263.3.camel@vkoul-udesk3> <507FA595.4020507@freescale.com>
 <20121018085208.GR21164@n2100.arm.linux.org.uk>
In-Reply-To: <20121018085208.GR21164@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, Huang Shijie <shijie8@gmail.com>,
 Vinod Koul <vinod.koul@linux.intel.com>, shawn.guo@linaro.org,
 alsa-devel@alsa-project.org, tiwai@suse.de, artem.bityutskiy@linux.intel.com,
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

=E4=BA=8E 2012=E5=B9=B410=E6=9C=8818=E6=97=A5 16:52, Russell King - ARM L=
inux =E5=86=99=E9=81=93:
> On Thu, Oct 18, 2012 at 02:45:41PM +0800, Huang Shijie wrote:
>> =E4=BA=8E 2012=E5=B9=B410=E6=9C=8818=E6=97=A5 14:18, Vinod Koul =E5=86=
=99=E9=81=93:
>>> Why cant you do start (prepare clock etc) when you submit the descrip=
tor
>>> to dmaengine. Can be done in tx_submit callback.
>>> Similarly remove the clock when dma transaction gets completed.
>> I ever thought this method too.
>>
>> But it will become low efficient in the following case:
>>
>>    Assuming the gpmi-nand driver has to read out 1024 pages in one
>> _SINGLE_ read operation.
>> The gpmi-nand will submit the descriptor to dmaengine per page. So wit=
h
>> your method,
>> the system will repeat the enable/disable dma clock 1024 time. At ever=
y
>> enable/disable dma clock,
>> the system has to enable the clock chain and it's parents ...
> And what if you stop using clk_prepare_enable(), and prepare the clock
> when the channel is requested and only use clk_enable() in the tx_submi=
t
yes. it's a little better.
There is nearly no difference between the clk_prepare_enable() and=20
clk_enable() in actually.
the clk_gate2_ops does not have any @->prepare.

thanks
Huang Shijie

> method?
>
