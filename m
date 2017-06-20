Received: from 5.mo6.mail-out.ovh.net ([46.105.54.31])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNR8R-0007IU-Hb
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 21:56:33 +0000
Received: from player774.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id E8AAAED8D4
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 23:56:07 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: cqspi: make of_device_ids const
To: Marek Vasut <marek.vasut@gmail.com>,
 Arvind Yadav <arvind.yadav.cs@gmail.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <c4663aaa9e5753053f6ac12a3565e0e1995f3b55.1497605323.git.arvind.yadav.cs@gmail.com>
 <4f604ebc-69a7-4e35-d682-cc4fa9e76c82@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <a612035a-817a-4474-8305-a8cb16882f03@wedev4u.fr>
Date: Tue, 20 Jun 2017 23:56:00 +0200
MIME-Version: 1.0
In-Reply-To: <4f604ebc-69a7-4e35-d682-cc4fa9e76c82@gmail.com>
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

Le 16/06/2017 à 12:27, Marek Vasut a écrit :
> On 06/16/2017 11:35 AM, Arvind Yadav wrote:
>> of_device_ids are not supposed to change at runtime. All functions
>> working with of_device_ids provided by <linux/of.h> work with const
>> of_device_ids. So mark the non-const structs as const.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> 
> Works for me
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
>

Applied to the spi-nor/next branch of l2-mtd

Thanks!

>> ---
>>  drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
>> index 9f8102d..1a25637 100644
>> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
>> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
>> @@ -1277,7 +1277,7 @@ static int cqspi_resume(struct device *dev)
>>  #define CQSPI_DEV_PM_OPS	NULL
>>  #endif
>>  
>> -static struct of_device_id const cqspi_dt_ids[] = {
>> +static const struct of_device_id const cqspi_dt_ids[] = {
>>  	{.compatible = "cdns,qspi-nor",},
>>  	{ /* end of table */ }
>>  };
>>
> 
> 
