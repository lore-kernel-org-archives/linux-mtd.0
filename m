Received: from 5.mo6.mail-out.ovh.net ([46.105.54.31])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNRay-0002nl-Mh
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 22:26:02 +0000
Received: from player774.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id CA1C4ED7E4
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 00:25:37 +0200 (CEST)
Subject: Re: [PATCH 1/4] mtd: spi-nor: aspeed: remove dummies from keep mask
To: Marek Vasut <marek.vasut@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
References: <1492689397-4704-1-git-send-email-clg@kaod.org>
 <1492689397-4704-2-git-send-email-clg@kaod.org>
 <cfd472d8-8213-3780-01a5-f95dfc1c7cd3@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <7ecaa2fe-3492-fba0-99c6-2de5bb54e3bb@wedev4u.fr>
Date: Wed, 21 Jun 2017 00:25:29 +0200
MIME-Version: 1.0
In-Reply-To: <cfd472d8-8213-3780-01a5-f95dfc1c7cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 20/04/2017 à 15:28, Marek Vasut a écrit :
> On 04/20/2017 01:56 PM, Cédric Le Goater wrote:
>> There is no need to keep the dummy bytes in the control register if
>> the command mode is not kept also. This could lead to an inconsistent
>> setting : normal read mode (command 0x3) and dummy bytes. It is to be
>> noted that the HW allows such a configuration.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
>

Applied to the spi-nor/next branch of l2-mtd

Thanks!

>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 56051d30f000..2940f2098420 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -180,8 +180,7 @@ struct aspeed_smc_controller {
>>  
>>  #define CONTROL_KEEP_MASK						\
>>  	(CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 | \
>> -	 CONTROL_IO_DUMMY_MASK | CONTROL_CLOCK_FREQ_SEL_MASK |		\
>> -	 CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
>> +	 CONTROL_CLOCK_FREQ_SEL_MASK | CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
>>  
>>  /*
>>   * The Segment Register uses a 8MB unit to encode the start address
>>
> 
> 
