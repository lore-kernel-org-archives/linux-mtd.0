Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z59D4-0003bA-Pt
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 09:00:42 +0000
Message-ID: <5581371F.2020809@nod.at>
Date: Wed, 17 Jun 2015 11:00:15 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [PATCH 1/2] mtd: nandsim: fix free of NULL pointer
References: <1434530713-81591-1-git-send-email-shengyong1@huawei.com>
 <1434530713-81591-2-git-send-email-shengyong1@huawei.com>
 <5581345A.5020707@nod.at>
In-Reply-To: <5581345A.5020707@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.06.2015 um 10:48 schrieb Richard Weinberger:
> Am 17.06.2015 um 10:45 schrieb Sheng Yong:
>> If allocating ns->nand_pages_slab fails, do not try to destroy it when
>> cleaning up nandsim resources.
>>
>> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
>> ---
>>  drivers/mtd/nand/nandsim.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
>> index cb38f3d..33e4064 100644
>> --- a/drivers/mtd/nand/nandsim.c
>> +++ b/drivers/mtd/nand/nandsim.c
>> @@ -646,7 +646,8 @@ static void free_device(struct nandsim *ns)
>>  				kmem_cache_free(ns->nand_pages_slab,
>>  						ns->pages[i].byte);
>>  		}
>> -		kmem_cache_destroy(ns->nand_pages_slab);
>> +		if (ns->nand_pages_slab)
>> +			kmem_cache_destroy(ns->nand_pages_slab);
> 
> It is perfectly fine to free a NULL pointer.

Ignore that. /me needs more coffee. ;)

Thanks,
//richard
