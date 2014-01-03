Received: from mail-ve0-x22c.google.com ([2607:f8b0:400c:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VytSF-0004QY-EA
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 01:21:39 +0000
Received: by mail-ve0-f172.google.com with SMTP id jw12so7792950veb.3
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jan 2014 17:21:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140103010445.GA5631@ld-irv-0074>
References: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
 <001601cefd40$f6b3dd00$e41b9700$%han@samsung.com>
 <20140103010445.GA5631@ld-irv-0074>
Date: Thu, 2 Jan 2014 17:21:17 -0800
Message-ID: <CAN8TOE9eeT_B0-JsCe48DdkTftoWSiX0M_8MO7sG1K66ykkh_Q@mail.gmail.com>
Subject: Re: [PATCH 7/8] mtd: plat_nand: Use devm_*() functions
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Vitaly Wool <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 2, 2014 at 5:17 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Fri, Dec 20, 2013 at 02:04:29PM +0900, Jingoo Han wrote:
>> +     if (IS_ERR(data->io_base))
>> +             return PTR_ERR(data->io_base);
>
> This gives me a few errors:
>
> drivers/mtd/nand/plat_nand.c: In function 'plat_nand_probe':
> drivers/mtd/nand/plat_nand.c:61:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
> drivers/mtd/nand/plat_nand.c:62:3: error: implicit declaration of function 'PTR_ERR' [-Werror=implicit-function-declaration]
> make[4]: *** [drivers/mtd/nand/plat_nand.o] Error 1
>
> You probably need to #include <linux/err.h>. I guess you don't
> compile-test your changes? It would help if you can catch these mistakes
> before they get to the maintainer.
>
>>
>>       data->chip.priv = &data;
>>       data->mtd.priv = &data->chip;

Sorry, I replied to the v1, but I was actually testing v3. My comments
apply to either version though.

Brian
