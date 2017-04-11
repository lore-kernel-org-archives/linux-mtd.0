Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxrZO-00051K-HB
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 08:54:40 +0000
Received: from player690.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 9140935A9A
 for <linux-mtd@lists.infradead.org>; Tue, 11 Apr 2017 10:54:12 +0200 (CEST)
Subject: Re: [PATCH 04/10] mtd: spi-nor: aspeed: add support for SPI dual IO
 read mode
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-5-git-send-email-clg@kaod.org>
 <97d155e5-f0c2-8a78-ab00-d8823aea031d@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 Robert Lippert <roblip@gmail.com>, Robert Lippert <rlippert@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a304378c-d2f1-5008-6a09-3a617e514271@kaod.org>
Date: Tue, 11 Apr 2017 10:53:57 +0200
MIME-Version: 1.0
In-Reply-To: <97d155e5-f0c2-8a78-ab00-d8823aea031d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/06/2017 09:21 PM, Marek Vasut wrote:
> On 04/06/2017 06:56 PM, Cédric Le Goater wrote:
>> From: Robert Lippert <roblip@gmail.com>
>>
>> Implements support for the dual IO read mode on aspeed SMC/FMC
>> controllers which uses both MISO and MOSI lines for data during a read
>> to double the read bandwidth.
>>
>> Signed-off-by: Robert Lippert <rlippert@google.com>
>> [clg: adapted to mainline driver ]
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 20 +++++++++++++-------
>>  1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 7dfa1ea0a787..b3c8cfe29765 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -512,6 +512,7 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>>  	int i;
>>  	u8 dummy = 0xFF;
>>  	int ret;
>> +	u32 ctl;
>>  
>>  	if (aspeed_smc_dma_check(chip, from, len)) {
>>  		ret = aspeed_smc_dma_start(chip, from, read_buf, len, 0);
>> @@ -525,6 +526,13 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>>  	for (i = 0; i < chip->nor.read_dummy / 8; i++)
>>  		aspeed_smc_write_to_ahb(chip->ahb_base, &dummy, sizeof(dummy));
>>  
>> +	if (chip->nor.flash_read == SPI_NOR_DUAL) {
>> +		/* Switch to dual I/O mode for data cycle */
>> +		ctl = readl(chip->ctl) & ~CONTROL_IO_MODE_MASK;
>> +		ctl |= CONTROL_IO_DUAL_DATA;
>> +		writel(ctl, chip->ctl);
>> +	}
>> +
> Can't you switch the mode at runtime ? If you do, who'll clear the
> CONTROL_IO_DUAL_DATA in this ctl register if you switch to SINGLE
> mode for some command ?

This is the read routine in User mode. When the read is completed,
the previous (and default) setting of the control register is restored 
with a call to aspeed_smc_stop_user() but you don't see it in the diff 
hunk above.

The default setting of the control register is used when the controller 
is in Command mode. That is when reads are performed 'automatically' 
from the AHB bus. 

C.   
