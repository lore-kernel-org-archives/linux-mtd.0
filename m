Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEHhK-0007li-Bo
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 14:25:55 +0000
From: "Franklin S Cooper Jr." <fcooper@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <rogerq@ti.com>,
 <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <nsekhar@ti.com>,
 <dwmw2@infradead.org>, <tony@atomide.com>
Subject: Re: [PATCH v2 0/5] mtd: nand: Fix support for NAND DMA prefetch
References: <1444930648-19313-1-git-send-email-fcooper@ti.com>
 <20151218180434.GJ10460@google.com>
Message-ID: <5683E93B.9050101@ti.com>
Date: Wed, 30 Dec 2015 08:24:59 -0600
MIME-Version: 1.0
In-Reply-To: <20151218180434.GJ10460@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 12/18/2015 12:04 PM, Brian Norris wrote:
> On Thu, Oct 15, 2015 at 12:37:23PM -0500, Franklin S Cooper Jr wrote:
>> NAND DMA prefetch has been broken for awhile and seems to have only
>> worked for SDMA based devices
>>
>> This patchset fixes DMA prefetch to work on both EDMA and SDMA devices
>>
>> Test on:
>> am335x gp evm
>> am437x gp evm
>> am37x gp evm
>>
>> This patchset depends on Roger Quadros recent v4 GPMC/NAND patchset
>> https://github.com/rogerq/linux.git
>> branch: for-v4.4/gpmc-v4
> In what way does this depend on the other series? Can any of this be
> taken without it? If not, then perhaps it'd be good if Roger can roll
> this into his series? Just throwing out ideas. If you want to wait on
> Roger's series, that's fine.
>
> FWIW, the MTD stuff all looks OK to me:
>
> Acked-by: Brian Norris <computersforpeace@gmail.com>

Patches 2 and 3 doesn't have any dependencies on Roger's
patchset so they should be fine to pull in.

I'll leave it up to Roger if he would like to roll my
patches into his patchset or I can submit the other 3
patches again once he sends out his new patchset.

>> Franklin S Cooper Jr (5):
>>   mtd: nand: omap2: Support parsing dma channel information from DT
>>   mtd: nand: omap2: Start dma request before enabling prefetch
>>   mtd: nand: omap2: Fix high memory dma prefetch transfer
>>   ARM: dts: am437x/am33xx/omap/dm816x: Add gpmc dma channel
>>   ARM: OMAP2+: Update GPMC and NAND DT binding documentation
>>
>>  .../bindings/memory-controllers/omap-gpmc.txt      |  7 +++++-
>>  .../devicetree/bindings/mtd/gpmc-nand.txt          |  2 ++
>>  arch/arm/boot/dts/am33xx.dtsi                      |  2 ++
>>  arch/arm/boot/dts/am4372.dtsi                      |  2 ++
>>  arch/arm/boot/dts/dm816x.dtsi                      |  2 ++
>>  arch/arm/boot/dts/omap3.dtsi                       |  2 ++
>>  arch/arm/boot/dts/omap4.dtsi                       |  2 ++
>>  arch/arm/boot/dts/omap5.dtsi                       |  2 ++
>>  drivers/mtd/nand/omap2.c                           | 27 +++++++++-------------
>>  9 files changed, 31 insertions(+), 17 deletions(-)
>>
>> -- 
>> 2.6.1
>>
