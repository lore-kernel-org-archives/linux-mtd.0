Message-ID: <542BD646.8050102@ti.com>
Date: Wed, 1 Oct 2014 13:24:06 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] nand: omap2: fix building with CONFIG_MTD_NAND_OMAP_BCH=m
References: <1811108.CcWEs0vKNL@wuerfel> <1943672.dOtqDNIvT0@wuerfel>
 <542BD277.6070509@ti.com> <2306426.hFH1ds3Hiv@wuerfel>
In-Reply-To: <2306426.hFH1ds3Hiv@wuerfel>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: pekon <pekon@pek-sem.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/01/2014 01:13 PM, Arnd Bergmann wrote:
> On Wednesday 01 October 2014 13:07:51 Roger Quadros wrote:
>> On 10/01/2014 12:56 PM, Arnd Bergmann wrote:
>>> On Wednesday 01 October 2014 12:32:09 Roger Quadros wrote:
>>>>
>>>> With this patch NAND probe on DRA7xx fails like so
>>>>
>>>> [    2.077313] omap-gpmc 50000000.gpmc: GPMC revision 6.0
>>>> [    2.083842] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xca
>>>> [    2.090524] nand: Micron MT29F2G16ABAEAWP
>>>> [    2.094728] nand: 256MiB, SLC, page size: 2048, OOB size: 64
>>>> [    2.100745] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
>>>> [    2.109764] omap2-nand: probe of omap2-nand.0 failed with error -38
>>>>
>>>> OMAP NAND driver is the only user of the ELM module and we want it
>>>> to be usable in all possible configurations when enabled.
>>>
>>> I don't understand. Is the BCH driver optional or not?
>>>
>> It is optional. If it is disabled we error out on platforms that have
>> the ELM IP. But if it is enabled, we don't want to fail probe on such platforms.
> 
> Wouldn't it be better to treat the absence of the ELM driver the
> same way as the absence of the ELM hardware?

By absence of ELM driver you meant not enabled right?

We will have to use Software BCH library in that case and is not optimal.
That again is a Kconfig option that needs to be enabled if ELM driver is disabled.

cheers,
-roger
