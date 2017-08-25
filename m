Received: from mx1.mailbox.org ([80.241.60.212])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dlDUN-0006zp-Vf
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 12:13:30 +0000
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Bin Meng <bmeng.cn@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
 <20170825104015.GB2980@lahna.fi.intel.com>
From: Stefan Roese <sr@denx.de>
Message-ID: <f3f0cbaf-aece-6e55-cfc6-884788ae3f8a@denx.de>
Date: Fri, 25 Aug 2017 14:12:58 +0200
MIME-Version: 1.0
In-Reply-To: <20170825104015.GB2980@lahna.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 25.08.2017 12:40, Mika Westerberg wrote:
> On Fri, Aug 25, 2017 at 01:12:51AM -0700, Bin Meng wrote:
>> The Intel SPI-NOR driver is dependent on LPC_ICH to get the platform
>> data. Select it in the Kconfig.
>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> ---
>>
>>   drivers/mtd/spi-nor/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index bfdfb1e..e998800 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -93,6 +93,7 @@ config SPI_INTEL_SPI_PLATFORM
>>   	tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
>>   	depends on X86
>>   	select SPI_INTEL_SPI
>> +	select LPC_ICH
> 
> How about
> 
> 	depends on X86 && LPC_ICH
> 
> instead?

I prefer Bin's version, as with your patch, the MTD SPI driver will
not be "seen" / selectable, as long as the LPC_ICH support is not
enabled. I've been hunting such dependencies myself a few times and
find them unnecessary burden.

Thanks,
Stefan
