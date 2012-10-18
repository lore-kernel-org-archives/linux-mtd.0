Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TOmPg-00040E-JJ
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2012 09:29:15 +0000
Received: by mail-vb0-f49.google.com with SMTP id fo1so8699062vbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2012 02:29:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <507FA595.4020507@freescale.com>
References: <1350538335-29026-1-git-send-email-b32955@freescale.com>
 <1350541111.5263.3.camel@vkoul-udesk3>
 <507FA595.4020507@freescale.com>
Date: Thu, 18 Oct 2012 14:59:10 +0530
Message-ID: <CAJe_ZhfarH-HpJkEOpH=jY1Gc-UPEyuA4bJ4LSQES7Uyea2BQw@mail.gmail.com>
Subject: Re: [PATCH] dma: add new DMA control commands
From: Jassi Brar <jaswinder.singh@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 artem.bityutskiy@linux.intel.com, perex@perex.cz,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Huang Shijie <shijie8@gmail.com>, marex@denx.de, linux@arm.linux.org.uk,
 cjb@laptop.org, lrg@ti.com, ben-linux@fluff.org,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vinod.koul@linux.intel.com>,
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

On 18 October 2012 12:15, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2012=C4=EA10=D4=C218=C8=D5 14:18, Vinod Koul =D0=B4=B5=C0:
>
>> Why cant you do start (prepare clock etc) when you submit the descriptor
>> to dmaengine. Can be done in tx_submit callback.
>> Similarly remove the clock when dma transaction gets completed.
>
> I ever thought this method too.
>
> But it will become low efficient in the following case:
>
>   Assuming the gpmi-nand driver has to read out 1024 pages in one _SINGLE=
_
> read operation.
> The gpmi-nand will submit the descriptor to dmaengine per page. So with y=
our
> method,
> the system will repeat the enable/disable dma clock 1024 time. At every
> enable/disable dma clock,
> the system has to enable the clock chain and it's parents ...
>
> But with this patch, we only need to enable/disable dma clock one time, j=
ust
> at we select the nand chip.
>
If the clock is the dmac's property (not channels'), the toggling
seems too aggressive.
You could try using runtime_suspend/resume for clock
disabling/enabling. How about employing autosuspend with a few ms
delay?
