Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sz2bQ-000732-6A
 for linux-mtd@lists.infradead.org; Wed, 08 Aug 2012 09:30:56 +0000
Received: by vcbfl13 with SMTP id fl13so521322vcb.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2012 02:30:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK9yfHxbE+nB6TTecb8oDxGgXHTo+3o+KPuzpWKayqNmnWfT0w@mail.gmail.com>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHxbE+nB6TTecb8oDxGgXHTo+3o+KPuzpWKayqNmnWfT0w@mail.gmail.com>
Date: Wed, 8 Aug 2012 15:00:54 +0530
Message-ID: <CAK9yfHyDKpr5GYec9XE2Vw7aDVWhZfzXcu05k68zuabqbCwqRw@mail.gmail.com>
Subject: Re: [PATCH 1/6] mtd: s3c2410: Use module_platform_driver()
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: sachin.kamat@linaro.org, dwmw2@infradead.org, David.Woodhouse@intel.com,
 ben-linux@fluff.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ping...

On 3 August 2012 10:17, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi,
>
> Any comments on this series?
>
> On 16 July 2012 16:02, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> This makes the code simpler by eliminating module_init() and
>> module_exit().
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  drivers/mtd/nand/s3c2410.c |   15 +--------------
>>  1 files changed, 1 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
>> index 91121f3..8f9267f 100644
>> --- a/drivers/mtd/nand/s3c2410.c
>> +++ b/drivers/mtd/nand/s3c2410.c
>> @@ -1134,20 +1134,7 @@ static struct platform_driver s3c24xx_nand_driver = {
>>         },
>>  };
>>
>> -static int __init s3c2410_nand_init(void)
>> -{
>> -       printk("S3C24XX NAND Driver, (c) 2004 Simtec Electronics\n");
>> -
>> -       return platform_driver_register(&s3c24xx_nand_driver);
>> -}
>> -
>> -static void __exit s3c2410_nand_exit(void)
>> -{
>> -       platform_driver_unregister(&s3c24xx_nand_driver);
>> -}
>> -
>> -module_init(s3c2410_nand_init);
>> -module_exit(s3c2410_nand_exit);
>> +module_platform_driver(s3c24xx_nand_driver);
>>
>>  MODULE_LICENSE("GPL");
>>  MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
>> --
>> 1.7.4.1
>>
>
>
>
> --
> With warm regards,
> Sachin



-- 
With warm regards,
Sachin
