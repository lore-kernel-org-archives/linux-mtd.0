Received: from mail-ia0-x22b.google.com ([2607:f8b0:4001:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVgfj-0000TT-3k
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 11:18:36 +0000
Received: by mail-ia0-f171.google.com with SMTP id r13so3477511iar.30
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2013 04:18:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <517A5EA6.3010207@atmel.com>
References: <CACQ1gAhY5TbH3JUYMtRk9ETOLn-ZFNbwKQ_5=j_hnPpZ-1fj_w@mail.gmail.com>
 <517A5EA6.3010207@atmel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 26 Apr 2013 13:18:14 +0200
Message-ID: <CACQ1gAjM3kC8ROKPDv7uymNb9-v2gy0i--NCiSxq0w+GDGo2Bg@mail.gmail.com>
Subject: Re: PMECC capability
To: Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/4/26 Josh Wu <josh.wu@atmel.com>:
> Hi, Richard
>
>
> On 4/26/2013 6:17 PM, Richard Genoud wrote:
>>
>> Hi,
>>
>> I've got a (dumb?) question about the error correct capability of atmel
>> PMECC:
>> Do we have to use the exact error capability required by the nand
>> chipset or we can use a bigger one ?
>
>
> I think it is a very good question and I don't have answer yet.
> And it bring up another question: Can the nand flash will got much error
> bits than the ONFI minimum require?
I checked on the datasheet I've got, and in this case, they call it a
bad block :
"An invalid block is one that contains at least
one page that has more bad bits than can be corrected by the minimum
required ECC."
And I found also this sentence :
"Under typical conditions, use the minimum required ECC"
But it doesn't say that using a stronger ECC will kill kittens or not.

> Or the filesystem will make sure this situation rarely happen?
>
>
>>
>> use case:
>> I'm working on at91sam9g35-cm board which require 1 bit per 512bytes
>> correction and also on a at91sam9g35-cm+phy which require 4bits per
>> 512bytes correction.
>>
>> If I use for both a 4b/512B correction, this won't hurt ?
>> There won't be any strange side effect ?
>
>
> I think it will not hurt. And since PMECC is hardware calculation,
> performance should have no big impaction (I am not test that)
>
>
>>
>> Moreover, as I don't use the OOB data, I could set a 8b/512B correction.
>> Will it be completely useless ?
>
>
> I've seen one of mtd/nand driver (I don't remember the exact name), the ECC
> capability is set as the max one base on the OOB valid size (exclude the
> some used by filesystem).
>
> Just in the moment, I think use the max error correct capability base on
> valid OOB is safer for long time using.
>
> Best Regards,
> Josh Wu
>
>>
>>
>> Regards,
>>
>> Richard.
>>
>
Thanks for your replies !

Richard.


-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
