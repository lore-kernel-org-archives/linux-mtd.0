Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmIF5-0002db-3F
 for linux-mtd@lists.infradead.org; Mon, 28 Aug 2017 11:30:10 +0000
Subject: Re: [PATCH v10 03/16] spi: spi-falcon: drop check of boot select
To: Ralf Baechle <ralf@linux-mips.org>, Mark Brown <broonie@kernel.org>
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, john@phrozen.org,
 linux-spi@vger.kernel.org, hauke.mehrtens@intel.com, robh@kernel.org,
 andy.shevchenko@gmail.com, p.zabel@pengutronix.de, kishon@ti.com,
 mark.rutland@arm.com
References: <20170819221823.13850-1-hauke@hauke-m.de>
 <20170819221823.13850-4-hauke@hauke-m.de>
 <20170828112327.GA15640@linux-mips.org>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <40428f8d-f781-7952-30c6-41f65ec1096b@hauke-m.de>
Date: Mon, 28 Aug 2017 13:29:33 +0200
MIME-Version: 1.0
In-Reply-To: <20170828112327.GA15640@linux-mips.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/28/2017 01:23 PM, Ralf Baechle wrote:
> On Sun, Aug 20, 2017 at 12:18:10AM +0200, Hauke Mehrtens wrote:
> 
>> Do not check which flash type the SoC was booted from before
>> using this driver. Assume that the device tree is correct and use this
>> driver when it was added to device tree. This also removes a build
>> dependency to the SoC code.
>>
>> All device trees I am aware of only have one correct flash device entry
>> in it. The device tree is anyway bundled with the kernel in all systems
>> using device tree I know of.
>>
>> The boot mode can be specified with some pin straps and will select the
>> flash type the rom code will boot from. One SPI, NOR or NAND flash chip
>> can be connect to the EBU and used to load the first stage boot loader
>> from.
> 
> I think other than this patch we finally have all the acks necessary so
> I merged the series except this patch which shouldn't be strictly necessary.
> 
>   Ralf
> 

Hi Ralf and Mark,

this driver will not build any more without this patch, because
ltq_boot_select() gets removed in "[PATCH v10 09/16] MIPS: lantiq:
remove ltq_reset_cause() and ltq_boot_select()"

Mark could you please have a look at the commit message if it is better now.

Hauke
