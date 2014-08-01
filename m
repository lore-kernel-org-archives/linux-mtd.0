Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XD86m-00051d-ID
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 08:22:37 +0000
Received: by mail-wi0-f175.google.com with SMTP id ho1so923458wib.8
 for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2014 01:22:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140801075436.GF29045@atomide.com>
References: <1406113130-23939-1-git-send-email-pekon@ti.com>
 <53D7904C.20600@ti.com>
 <CAK1JQxoJMAGqRCYxJBCLp0_0QN+t7COmxU01wSWVjPR0AY0LdQ@mail.gmail.com>
 <53DA2BF1.3030008@ti.com> <20140801063830.GC29045@atomide.com>
 <53DB45DB.1020308@ti.com> <20140801075436.GF29045@atomide.com>
Date: Fri, 1 Aug 2014 13:52:07 +0530
Message-ID: <CAK1JQxqheHvAx2RoM_=Go=2ReO93+DdaY-0mLL7bir0dGHctUA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: dra7-evm: add parallel NOR flash support
From: Pekon Gupta <pekon.gupta@gmail.com>
To: Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Sourav Poddar <sourav.poddar@ti.com>, linux-omap <linux-omap@vger.kernel.org>,
 "Nori, Sekhar" <nsekhar@ti.com>, Balaji T Krishnamoorthy <balajitk@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 1, 2014 at 1:24 PM, Tony Lindgren <tony@atomide.com> wrote:
> * Roger Quadros <rogerq@ti.com> [140801 00:49]:
>> On 08/01/2014 09:38 AM, Tony Lindgren wrote:
>> > * Roger Quadros <rogerq@ti.com> [140731 04:46]:
>> >> +Sourav for QSPI and Balaji for mmc
>> >>
>> >> On 07/30/2014 10:40 PM, Pekon Gupta wrote:
>> >>> Hi Roger,
>> >>>
>> >>> On Tue, Jul 29, 2014 at 5:45 PM, Roger Quadros <rogerq@ti.com> wrote:
>> >>>> On 07/23/2014 01:58 PM, Pekon Gupta wrote:
>> >>>>> This patch adds support for parallel NOR device (S29GL512S10) present on J6-EVM.
>> >>>>> The Flash device is connected to GPMC controller on chip-select[0] and accessed
>> >>>>> as memory-mapped device. It has data-witdh=x16, capacity-64MBytes(512Mbits) and
>> >>>>> is CFI compatible.
>> >>>>> As multiple devices are share GPMC pins on this board, so following board
>> >>>>> settings are required to detect NOR device:
>> >>>>>      SW5.1 (NAND_BOOTn) = OFF (logic-1)
>> >>>>>      SW5.2 (NOR_BOOTn)  = ON  (logic-0) /* Active-low */
>> >>>>>      SW5.3 (eMMC_BOOTn) = OFF (logic-1)
>> >>>>>      SW5.4 (QSPI_BOOTn) = OFF (logic-1)
>> >>>>
>> >>>> Why does NOR have any dependency on states of eMMC_BOOTn and QSPI_BOOTn?
>> >>>>
>> >>> If you see the schematics of J6-EVM, GPMC data and control lines are shared
>> >>> between NAND, NOR, eMMC (and probably QSPI also).
>> >>> I don't have access to TI's hardaware or board schematics anymore, so
>> >>> please double check.
>> >>
>> >> I just took a deeper look in the schematics.
>> >> It has nothing to do with GPMC Data and control lines but with the address lines.
>> >> The GPMC address lines are muxed on the same pins of the SoC as QSPI and MMC2.
>> >> i.e. A13-A18,CS2 for QSPI and A19-A27,CS1 for MMC2
>> >>
>> >> NAND can probably work simultaneously with QSPI and MMC2 but for NOR case, QSPI and MMC2
>> >> need to be disabled.
>> >>
>> >> This is starting to look ugly where apart from changing the DIP switch the DTS has to be
>> >> hand modified to support a certain case.
>> >>
>> >> Lets leave the most usable configuration for default case i.e. NAND, QSPI and MMC2 enabled and keep NOR information in the dts but keep it disabled with a note that if NOR is enabled then NAND, QSPI, and MMC2 nodes need to be disabled.
>> >>
>> >> I will resend this patch with the relevant changes.
>> >
>> > It might make sense for the gpmc driver to manage the pins in some
>> > cases. That would allow dynamic muxing of the pins depending which
>> > driver is loaded, or even during runtime if needed.
>>
>> It is more like a board configuration so something more generic than the gpmc driver has to manage.
>> Also, QSPI and MMC don't fall under GPMC scope.
>>
>> There are 2 things that need to change to update the hardware configuration.
>> 1) The pinmux via the enabling/disabling (or plugging in/out) of relevant nodes in the DT.
>> 2) The I2C GPIOs which reconfigure the DIP Switch lines in order to reconfigure external Muxes.
>
> Oh OK, yeah gpmc should only manage gpmc pins, this would need
> a separate driver for coordinating things.
>
You need to also consider the case where multiple devices of different types
are connected to different chip-selects like;
- NAND on chip-select[0]
- NOR on chip-select[1]
And with acceptance of 'Rostislav Lisovy''s patch [1] this
multi-device configuration
is possible on custom boards.

It would have been appropriate if pinctrl-probe was called from protocol drivers
(OMAP-NAND and NOR in this case). But I don't know if that's feasible even.
Also how drivers would handle probe conflicts arising with common pins.
Example: gpmc_ad[7:0] will be common to pin-mux of both NAND and NOR devices.

Does pinctrl framework gives freedom to _ignore_ conflicts on already configured
pins, and continues with configuring remaining non-conflicting pins ?
If yes, then
moving pinctrl-probe to OMAP-NAND | NOR protocol driver should be more
appropriate.


with regards, pekon

[1] https://patchwork.kernel.org/patch/4514561/
