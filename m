Received: from szxga02-in.huawei.com ([119.145.14.65])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhWMT-0003Pz-1g
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 02:43:38 +0000
Message-ID: <51A56AA6.9030706@huawei.com>
Date: Wed, 29 May 2013 10:40:38 +0800
From: Libo Chen <clbchenlibo.chen@huawei.com>
MIME-Version: 1.0
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH RESEND] mtd: fix kfree bcm47xxsflash
References: <1367743225-3484-1-git-send-email-libo.chen@huawei.com>
 <519C40A8.1070506@huawei.com>
 <CAHp75VfXZMZvw_XmPKEWcBikbx7pk1oHoxa0ztoQ1ywhi5Ovew@mail.gmail.com>
In-Reply-To: <CAHp75VfXZMZvw_XmPKEWcBikbx7pk1oHoxa0ztoQ1ywhi5Ovew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Li Zefan <lizefan@huawei.com>, artem.bityutskiy@linux.intel.com,
 zajec5@gmail.com, LKML <linux-kernel@vger.kernel.org>,
 Bill Pemberton <wfp5p@virginia.edu>, linux-mtd@lists.infradead.org,
 hauke@hauke-m.de, Andrew Morton <akpm@linux-foundation.org>,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2013/5/28 23:29, Andy Shevchenko wrote:
> This is good fix, but I rather prefer not to see it in this shape.
> See comments below.
> 
> On Wed, May 22, 2013 at 6:51 AM, Libo Chen <clbchenlibo.chen@huawei.com> wrote:
>>
>> mtd is just member of bcm47xxsflash, so we should free bcm47xxsflash  not its member.
>>
>> Signed-off-by: Libo Chen <libo.chen@huawei.com>
>> Acked-by: Rafał Miłecki <zajec5@gmail.com>
>> ---
>>  drivers/mtd/devices/bcm47xxsflash.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> * add Acked-by: Rafał Miłecki <zajec5@gmail.com>
>> * change send list
>>
>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
>> index 9526628..4aa9141 100644
>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>> @@ -76,7 +76,7 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
>>         return 0;
>>
>>  err_dev_reg:
>> -       kfree(&b47s->mtd);
>> +       kfree(b47s);
>>  out:
>>         return err;
>>  }
> 
> What about to switch to devm_* and remove those labels and kfrees at all?
> 
> Additionally you can add another patch to use module_platform_driver()
> macro instead of module_init/exit.
> 

ok, I will update later.

thanks,

Libo


> --
> With Best Regards,
> Andy Shevchenko
> 
> .
> 
