Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dlDTI-0006JN-6D
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 12:12:26 +0000
Received: by mail-wr0-x241.google.com with SMTP id z91so1382332wrc.0
 for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2017 05:11:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170825104015.GB2980@lahna.fi.intel.com>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
 <20170825104015.GB2980@lahna.fi.intel.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Aug 2017 20:11:54 +0800
Message-ID: <CAEUhbmWihuxtF81qf6MD9k2ViUvY3AjBr4uHE1kGWj-iptqffg@mail.gmail.com>
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mika,

On Fri, Aug 25, 2017 at 6:40 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, Aug 25, 2017 at 01:12:51AM -0700, Bin Meng wrote:
>> The Intel SPI-NOR driver is dependent on LPC_ICH to get the platform
>> data. Select it in the Kconfig.
>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> ---
>>
>>  drivers/mtd/spi-nor/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index bfdfb1e..e998800 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -93,6 +93,7 @@ config SPI_INTEL_SPI_PLATFORM
>>       tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
>>       depends on X86
>>       select SPI_INTEL_SPI
>> +     select LPC_ICH
>
> How about
>
>         depends on X86 && LPC_ICH
>
> instead?

Other LPC_ICH users (like gpio, watchdog) use the 'select' logic, so I
would prefer to keep things consistent.

Regards,
Bin
