Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2vRz-0007Ik-P8
 for linux-mtd@lists.infradead.org; Fri, 13 Oct 2017 08:36:14 +0000
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
 [209.85.220.169]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v9D8ZBgE012099
 for <linux-mtd@lists.infradead.org>; Fri, 13 Oct 2017 17:35:12 +0900
Received: by mail-qk0-f169.google.com with SMTP id x82so4143211qkb.12
 for <linux-mtd@lists.infradead.org>; Fri, 13 Oct 2017 01:35:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e96ba107-9636-715d-7d53-fa79e0890a3d@sigmadesigns.com>
References: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
 <20170929142635.07d55f77@bbrezillon>
 <CAK7LNASiker+1_uHXyhdkSJVMCX-TwXLhxD_ibQFLXWR9u0p6w@mail.gmail.com>
 <e96ba107-9636-715d-7d53-fa79e0890a3d@sigmadesigns.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 13 Oct 2017 17:34:30 +0900
Message-ID: <CAK7LNAR0xNm9PVxrsqvHHTMDHYwBuP+1MDmAr7=jDBMg1Qi6UQ@mail.gmail.com>
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

2017-10-04 20:05 GMT+09:00 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>:
> On 29/09/2017 16:33, Masahiro Yamada wrote:
>
>> (+CC Marc Gonzalez)
>>
>> 2017-09-29 21:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>>> On Fri, 29 Sep 2017 19:38:38 +0900
>>> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>>>
>>>> 1/2 : add NAND_WAIT_TWHR and nand_whr_delay().
>>>>       You can set this new flag if you want nand_command(_lp)
>>>>       to insert tWHR delay where needed.
>>>>
>>>> 2/2 : Fix Denali setup_data_interface.
>>>>       Boris' suggestion in v1 was a good reminder that
>>>>       made me realize tCCS was missing in the driver.  Fix it now.
>>>>
>>>>
>>>> Changes in v2:
>>>>   - Add nand_whr_delay() helper
>>>>     Wait for tWHR only for drivers that explicitly set NAND_WAIT_TWHR flag
>>>>   - newly added
>>>>
>>>> Masahiro Yamada (2):
>>>>   mtd: nand: wait for tWHR after NAND_CMD_STATUS / NAND_CMD_READID
>>>
>>> Hm, I thought you were introducing this to then use it in the denali
>>> driver. Sorry, but I don't want to apply something that nobody needs.
>>> If someone ever complains about a missing delay I'll point him to your
>>> patch, but until then I'll keep the core unchanged.
>>
>> Perhaps, Marc Gonzalez is the person.
>>
>>
>> tango_nand.c is the only driver that sets NAND_WAIT_TCCS.
>>
>> Now, there is completely no delay when reading out the ID.
>>
>>
>> One safe change might be apply this patch,
>> then set NAND_WAIT_TWHR to tango_nand.c
>>
>>
>> I am guessing NAND_WAIT_TCCS was added for it.
>> Theoretically, I do not see logical difference between tCCS and tWHR.
>>
>> I am CCing Marc Gonzalez, the author of tango_nand.c
>
> Hello Masahiro,
>
> I remember having issues reading the ONFI ID when I was writing
> the driver, a year ago. Sometimes, the first few bytes appeared
> to be missing. This looked like a timing issue.
>
> Adding the dev_ready call-back solved the problem. Do you think
> that was by accident?

It is odd to use dev_ready() hook to insert delay for the READ ID command.
READ ID command never toggles the device's Ready/Busy# pin.


> When I have more time, I will test the 4.14
> branch, to see if there are any issues with the current driver.


Yeah, I highly recommend you to test your driver on the latest kernel.
I suspect it is broken because READ ID command in the generic hook
has absolutely zero delay.

As I proposed already, the correct fix it to wait for tWHR.




-- 
Best Regards
Masahiro Yamada
