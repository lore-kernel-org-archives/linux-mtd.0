Message-ID: <5295BFB3.5020109@ti.com>
Date: Wed, 27 Nov 2013 15:17:31 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <201311271027.06982.marex@denx.de>
In-Reply-To: <201311271027.06982.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: broonie@linaro.org, linux-mtd@lists.infradead.org, pekon@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Marek Vasut, Huang,
On Wednesday 27 November 2013 02:57 PM, Marek Vasut wrote:
> Dear Huang Shijie,
>
>> 1.) Why add a new framework for SPI NOR?
>>    The SPI-NOR controller such as Freescale's Quadspi controller is working
>>    in a different way from the SPI bus. It should knows the NOR commands to
>>    find the right LUT sequence. Unfortunately, the current code can not meet
>>    this requirement.
> Is there any kind of documentation for this controller available? I cannot quite
> understand how this controller works and why can it not be used with our current
> infrastructure.
>
I do have a similar requirement where my controller need to be configured
from slave info. I have submiited a series in the mtd list adding that 
portion
of handling such cases. Here, is the patch which specific to m25p80 part.
http://patchwork.ozlabs.org/patch/294285/

The whole series can be found here:
https://www.mail-archive.com/linux-omap@vger.kernel.org/msg98691.html
> Best regards,
> Marek Vasut
