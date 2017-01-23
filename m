Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVbsv-0000p4-9C
 for linux-mtd@lists.infradead.org; Mon, 23 Jan 2017 10:30:02 +0000
Subject: Re: [PATCH, 1/1] mtd: spi-nor: Added support for gd25q16
To: Marek Vasut <marek.vasut@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 <linux-spi@vger.kernel.org>, <f.fainelli@gmail.com>,
 <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>
References: <1484940351-8145-1-git-send-email-kdasu.kdev@gmail.com>
 <8647a273-4ad8-264b-5dcd-a48662dae40d@gmail.com>
CC: <bcm-kernel-feedback-list@broadcom.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <ffd3b461-fa79-8cc3-c214-67595f85b0c2@atmel.com>
Date: Mon, 23 Jan 2017 11:29:36 +0100
MIME-Version: 1.0
In-Reply-To: <8647a273-4ad8-264b-5dcd-a48662dae40d@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 21/01/2017 à 12:36, Marek Vasut a écrit :
> On 01/20/2017 08:25 PM, Kamal Dasu wrote:
>> Add GigaDevice GD25Q16 (16M-bit) to supported list.
>>
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> 
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
>

Applied to git://github.com/spi-nor/linux.git

Please note that in the subject line, I've replaced "Added support ..." by
"Add support ...". Indeed, looking at submitting-patches.rst:

Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.

This is a very small detail so I thought there would be no need to send
another version for that.

Thanks!

>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index da7cd69..8530d51 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -833,6 +833,11 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>  
>>  	/* GigaDevice */
>>  	{
>> +		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
>> +			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>> +	},
>> +	{
>>  		"gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>
> 
> 

Applied to
