MIME-Version: 1.0
In-Reply-To: <20150604091634.GY14071@sirena.org.uk>
References: <cover.1433364398.git.hramrach@gmail.com>
 <305830ebf9c0ae98c4f6e0ebbdec7414d6762b36.1433364398.git.hramrach@gmail.com>
 <20150604091634.GY14071@sirena.org.uk>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 4 Jun 2015 11:33:37 +0200
Message-ID: <CAOMqctQxn6UY2DJ9Syp6Ay9SYKLgdU+8EjiTK_48-R3dZ8PcvA@mail.gmail.com>
Subject: Re: [PATCH 10/11] spi: add more debug prints in s3c64xx
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-mtd@lists.infradead.org,
 Alison Chaiken <alison_chaiken@mentor.com>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Marek Vasut <marex@denx.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 devicetree <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 Han Xu <han.xu@freescale.com>, Knut Wohlrab <knut.wohlrab@de.bosch.com>,
 dmaengine <dmaengine@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 4 June 2015 at 11:16, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Jun 03, 2015 at 09:26:42PM -0000, Michal Suchanek wrote:
>> The SPI NOR transfers mysteriously fail so add more debug prints about
>> SPI transactions.
>
> Please try to only send patches to relevant people - the list of
> recipients for this is so large that it only barely fits on a single
> screen in my mail client.
>
> Also for this patch (which just adds some trace) there isn't any clear
> reason for it to be sent as part of the series at all, it doesn't help
> deliver the functionality and doesn't depend on the rest of the series.

I used this patch to add missing information to dmesg output so I
could diagnose the SPI failures so I think it is relevant.

The failure is reported by the s3c64xx but the root cause is pl330 not
finishing a DMA transfer.

It is non-obvious that this is the issue. The information that a call
to pl330 failed is only available in the s3c64xx driver and not SPI
core so I think there is no reasonable way to debug this issue other
than adding prints in s3c64xx. This issue is not completely resolved
or even well tested (I have only single board to test with) so these
prints remain relevant in my view.

>
>> --- a/drivers/spi/spi-s3c64xx.c
>> +++ b/drivers/spi/spi-s3c64xx.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/delay.h>
>>  #include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>
> Whatever you're doing here this indicates that there's a very big
> abstraction problem going on.

I wanted to print a clock name in case the information was relevant
for the issue at hand.

To print a clock name you AFAICT need this header. I think this is an
abstraction problem in the clock framework. Fixing the abstraction
problem with clock framework would only grow the list of recipients
which is already so long you complain about it.

It turns out that in this case the clock was not at fault so I did not
need the clock name in the end.

>
>> +     pr_debug("%s %s %s waiting for %ims transferring %zubytes@%iHz",
>> +              __func__, sdd->pdev ? dev_name(&sdd->pdev->dev) : NULL,
>> +              dev_name(&sdd->master->dev),
>> +              ms, xfer->len, sdd->cur_speed);
>
> I'd say dev_dbg() but more generally this is just tracing things that
> seem to be already covered by the trace points already present in the
> core, the same goes for most of the rest of it.  If there's things
> missing from the existing trace it seems better to add to it.

There is master and slave device involved but it's certainly possible
to use dev_dbg on one of them and pass the other as string.

Thanks

Michal
