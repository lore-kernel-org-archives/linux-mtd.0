MIME-Version: 1.0
In-Reply-To: <4E3FBC75.7010703@freescale.com>
References: <20110805135133.GA26981@pengutronix.de>
	<4E3F8087.6070206@freescale.com>
	<CAHMSPgMYP+5Hpa5sC-yt=1H-S=tEER8uNzj6uMSK403_DGYJ9Q@mail.gmail.com>
	<4E3FBC75.7010703@freescale.com>
Date: Mon, 8 Aug 2011 14:42:12 +0200
Message-ID: <CAHMSPgMdBmmNG41_QgGivSb+M1rG5nqJjtveyZueKHHJrA8vzA@mail.gmail.com>
Subject: Re: GPMI-NAND Status?
From: Koen Beel <koen.beel.barco@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Wolfram Sang <w.sang@pengutronix.de>, linux-mtd@lists.infradead.org,
	Shawn Guo <shawn.guo@linaro.org>, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Aug 8, 2011 at 12:37 PM, Huang Shijie <b32955@freescale.com> wrote:
> Hi,
>>
>> On my target, the mxs-dma is working for sdio until the gpmi-nand
>> gives a timeout. After that the dma for sdio is *not fully* working
>> anymore.
>>
> We need more log in following aspects:
> [1] apbh-dma registers
> [2] clk registers
> [3] gpmi registers
>
> Please git-apply the patch in the attachment.
> It will print out more DMA information WHEN dma-timeout occur.

Don't get it. What exactly are you trying to dump?
This patch dumps CTRL0, CTRL1, CTRL2, DEVSEL but also some registers
of APBH channel0 which is reserved....
Then it prints some debug info on channel 1 (ssp1) and then alle
channel 2 register except the debug register (ssp2 = not used here).

What info do you need?

Br,
Koen

>
> Best Regards
> Huang Shijie
>
