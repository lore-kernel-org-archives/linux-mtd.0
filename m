Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPR15-0007Me-M8
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 05:55:04 +0000
Message-ID: <52451D85.90404@ti.com>
Date: Fri, 27 Sep 2013 11:24:13 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv2] drivers: mtd: devices: Add quad read support.
References: <1380191565-28640-1-git-send-email-sourav.poddar@ti.com>
 <1380193243.28494.51.camel@i7.infradead.org> <524418AF.3030306@ti.com>
 <5244F003.6040502@freescale.com>
In-Reply-To: <5244F003.6040502@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 27 September 2013 08:10 AM, Huang Shijie wrote:
> 于 2013年09月26日 19:21, Sourav Poddar 写道:
>> If the pupose of LUT is to just set the dummy cycles, and vf610-twr
>> hardware state machine does not have have any other dependency
>> on LUT, this patch should work.
> Hi Sourav & David:
>
>    The key issue about the vf610-twr is that:
>    [0] Use the LUT makes the Quadspi driver more efficiency.
>    [1] the vf610-twr needs to know the SPI NOR commands for Page Program.
>        Why? because the driver can not change the size of write-buffer 
> from 256bytes to the 64byte(TXFIFO SIZE).
Not clear about this. But, you will anyway know what you are using from 
the m25p80 side rite?
>    [2] the dummy and other things.
>
Dummy stuffs can be handled from m25p80 side rite? fast read dummy cycle 
support is already there. While,
$subject patch adds it for quad read.
> Mark said the Quadspi is not a SPI controller, instead it is a SPI NOR 
> controller, and Mark suggested me
>  to rewrite the m25p80.c for the Quadspi.
>
> thanks
> Huang Shijie
>
>
