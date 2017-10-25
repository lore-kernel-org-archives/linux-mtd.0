Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e7P7u-0006kp-FQ
 for linux-mtd@lists.infradead.org; Wed, 25 Oct 2017 17:06:08 +0000
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
 [209.85.161.182]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id v9PH59LT002138
 for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2017 02:05:10 +0900
Received: by mail-yw0-f182.google.com with SMTP id y75so616136ywg.0
 for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2017 10:05:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <45cccdbe-9787-1b07-a04b-526c87d5e550@sigmadesigns.com>
References: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
 <20170929142635.07d55f77@bbrezillon>
 <CAK7LNASiker+1_uHXyhdkSJVMCX-TwXLhxD_ibQFLXWR9u0p6w@mail.gmail.com>
 <e96ba107-9636-715d-7d53-fa79e0890a3d@sigmadesigns.com>
 <CAK7LNAR0xNm9PVxrsqvHHTMDHYwBuP+1MDmAr7=jDBMg1Qi6UQ@mail.gmail.com>
 <45cccdbe-9787-1b07-a04b-526c87d5e550@sigmadesigns.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 26 Oct 2017 02:04:28 +0900
Message-ID: <CAK7LNAR1CbYU4mwS9sG=snEqPxTq-VAaUfdE-LcQ3bGRDTOPOg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mtd: nand: wait for tWHR, and fix the
 setup_data_interface of Denali
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Mason <slash.tmp@free.fr>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marc,

2017-10-19 23:58 GMT+09:00 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>:
> On 13/10/2017 10:34, Masahiro Yamada wrote:
>
>> 2017-10-04 20:05, Marc Gonzalez wrote:
>>
>>> On 29/09/2017 16:33, Masahiro Yamada wrote:
>>>
>>>> tango_nand.c is the only driver that sets NAND_WAIT_TCCS.
>>>>
>>>> Now, there is completely no delay when reading out the ID.
>>>>
>>>>
>>>> One safe change might be apply this patch,
>>>> then set NAND_WAIT_TWHR to tango_nand.c
>>>>
>>>>
>>>> I am guessing NAND_WAIT_TCCS was added for it.
>>>> Theoretically, I do not see logical difference between tCCS and tWHR.
>>>>
>>>> I am CCing Marc Gonzalez, the author of tango_nand.c
>>>
>>> Hello Masahiro,
>>>
>>> I remember having issues reading the ONFI ID when I was writing
>>> the driver, a year ago. Sometimes, the first few bytes appeared
>>> to be missing. This looked like a timing issue.
>>>
>>> Adding the dev_ready call-back solved the problem. Do you think
>>> that was by accident?
>>
>> It is odd to use dev_ready() hook to insert delay for the READ ID command.
>> READ ID command never toggles the device's Ready/Busy# pin.
>>
>>
>>> When I have more time, I will test the 4.14
>>> branch, to see if there are any issues with the current driver.
>>
>>
>> Yeah, I highly recommend you to test your driver on the latest kernel.
>> I suspect it is broken because READ ID command in the generic hook
>> has absolutely zero delay.
>>
>> As I proposed already, the correct fix it to wait for tWHR.
>
> Hello Masahiro,
>
> I checked out v4.14-rc5, imported the DMA driver (which is, unfortunately,
> not upstream) and DT nodes.


Thanks for your test report.

I was worried since you said
you had issues reading the ONFI ID.

Anyway, it is OK if your driver is working.

Thanks.




-- 
Best Regards
Masahiro Yamada
