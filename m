Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ytjpn-0006Qt-MF
 for linux-mtd@lists.infradead.org; Sat, 16 May 2015 21:41:29 +0000
Received: by wicmx19 with SMTP id mx19so62695631wic.0
 for <linux-mtd@lists.infradead.org>; Sat, 16 May 2015 14:41:03 -0700 (PDT)
Message-ID: <5557B8AF.9090703@vanguardiasur.com.ar>
Date: Sat, 16 May 2015 18:37:51 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Antoine Tenart <antoine.tenart@free-electrons.com>,
 sebastian.hesselbarth@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH v5 00/12] ARM: berlin: add nand support
References: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
In-Reply-To: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Antoine,

This is a long patchset, which involves some very invasive changes
to the driver. So, I think it'll be better to split it in different
patchsets.

On 05/11/2015 11:58 AM, Antoine Tenart wrote:
[..]
> 
> Antoine Tenart (12):

These two clock patches are related to Berlin support only.

>   mtd: pxa3xx_nand: add a non mandatory ECC clock
>   Documentation: bindings: document the clocks for pxa3xx-nand

The next four patches rework the timing setup and remove the legacy
device detection. I think we should try to get them merged in first place.

>   mtd: pxa3xx_nand: add a default chunk size
>   mtd: pxa3xx_nand: add helpers to setup the timings
>   mtd: pxa3xx_nand: rework flash detection and timing setup
>   mtd: pxa3xx_nand: clean up the pxa3xx timings

Next one just adds support for a new device. It has little to do with
the series. I already replied about using JEDEC ID; once we solve that,
I suggest that you submit this patch alone.

>   mtd: nand: add Samsung K9GBG08U0A-M to nand_ids table

And finally, once we solve the timing rework, we can go through Berlin
support.

>   mtd: pxa3xx_nand: add support for the Marvell Berlin nand controller
>   Documentation: bindings: add the Berlin nand controller compatible
>   mtd: nand: let Marvell Berlin SoCs select the pxa3xx driver
>   ARM: berlin: add BG2Q node for the nand
>   ARM: berlin: enable flash on the BG2Q DMP
> 

What do you think?

>  .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   5 +
>  arch/arm/boot/dts/berlin2q-marvell-dmp.dts         |  25 ++
>  arch/arm/boot/dts/berlin2q.dtsi                    |  13 +
>  drivers/mtd/nand/Kconfig                           |   4 +-
>  drivers/mtd/nand/nand_ids.c                        |   4 +
>  drivers/mtd/nand/pxa3xx_nand.c                     | 440 +++++++++++++++------
>  include/linux/platform_data/mtd-nand-pxa3xx.h      |  11 +-
>  7 files changed, 374 insertions(+), 128 deletions(-)
> 

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
