Received: from 15.mo5.mail-out.ovh.net ([178.33.107.29])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFlH8-0003ju-WD
 for linux-mtd@lists.infradead.org; Sat, 10 Dec 2016 17:17:32 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id F14EC54682
 for <linux-mtd@lists.infradead.org>; Sat, 10 Dec 2016 18:17:06 +0100 (CET)
Subject: Re: [PATCH v3 3/5] mtd: aspeed: used a label property
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-4-git-send-email-clg@kaod.org>
 <6bc350c3-b162-dc10-4cd3-c32f9a3d4eaf@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <66f5cede-e907-caf3-7d87-53246efa8908@kaod.org>
Date: Sat, 10 Dec 2016 18:16:53 +0100
MIME-Version: 1.0
In-Reply-To: <6bc350c3-b162-dc10-4cd3-c32f9a3d4eaf@gmail.com>
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

On 12/10/2016 05:03 AM, Marek Vasut wrote:
> On 12/09/2016 05:49 PM, Cédric Le Goater wrote:
>> This can be used to easily identify a chip on a system with multiple
>> chips.
> 
> I don't think I understand what this patch does.
> It seems to me like this one should be wrapped into 1/5.

Yes, but this is to open the discussion on the change required in the 
jedec,spi-nor binding.

C.



>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 99302b0d7786..9119c0ca86b6 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -676,6 +676,8 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>  		nor->prepare = aspeed_smc_prep;
>>  		nor->unprepare = aspeed_smc_unprep;
>>  
>> +		mtd->name = of_get_property(child, "label", NULL);
>> +
>>  		ret = aspeed_smc_chip_setup_init(chip, r);
>>  		if (ret)
>>  			break;
>>
> 
> 
