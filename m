Message-ID: <558137E9.8060707@huawei.com>
Date: Wed, 17 Jun 2015 17:03:37 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: nandsim: fix free of NULL pointer
References: <1434530713-81591-1-git-send-email-shengyong1@huawei.com>
 <1434530713-81591-2-git-send-email-shengyong1@huawei.com>
 <5581345A.5020707@nod.at>
In-Reply-To: <5581345A.5020707@nod.at>
Content-Type: text/plain; charset="utf-8"
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



On 6/17/2015 4:48 PM, Richard Weinberger wrote:
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
OK, then maybe the double free is not a serious problem, besides we just
get a message "Trying to vfree() nonexistent vm area" or the like. But
kmem_cache_destroy() will access ns->nand_pages_slab, and ns->nand_pages_slab
is NULL. This will crash the kernel. :)

thanks,
Sheng
> 
> Thanks,
> //richard
> 
> .
> 
