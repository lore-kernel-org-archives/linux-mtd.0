Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxvxd-00040g-7C
 for linux-mtd@lists.infradead.org; Fri, 29 Sep 2017 14:08:15 +0000
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v8TE7NKD030451
 for <linux-mtd@lists.infradead.org>; Fri, 29 Sep 2017 23:07:23 +0900
Received: by mail-yw0-f181.google.com with SMTP id w22so912103ywa.13
 for <linux-mtd@lists.infradead.org>; Fri, 29 Sep 2017 07:07:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170929142635.07d55f77@bbrezillon>
References: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
 <20170929142635.07d55f77@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 29 Sep 2017 23:06:42 +0900
Message-ID: <CAK7LNASh=wLuyzGQEVQaNaNi=f-imKn1ybDx36L702c9WD_zvQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mtd: nand: wait for tWHR, and fix the
 setup_data_interface of Denali
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-09-29 21:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Fri, 29 Sep 2017 19:38:38 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> 1/2 : add NAND_WAIT_TWHR and nand_whr_delay().
>>       You can set this new flag if you want nand_command(_lp)
>>       to insert tWHR delay where needed.
>>
>> 2/2 : Fix Denali setup_data_interface.
>>       Boris' suggestion in v1 was a good reminder that
>>       made me realize tCCS was missing in the driver.  Fix it now.
>>
>>
>> Changes in v2:
>>   - Add nand_whr_delay() helper
>>     Wait for tWHR only for drivers that explicitly set NAND_WAIT_TWHR flag
>>   - newly added
>>
>> Masahiro Yamada (2):
>>   mtd: nand: wait for tWHR after NAND_CMD_STATUS / NAND_CMD_READID
>
> Hm, I thought you were introducing this to then use it in the denali
> driver. Sorry, but I don't want to apply something that nobody needs.
> If someone ever complains about a missing delay I'll point him to your
> patch, but until then I'll keep the core unchanged.


At first, I thought this was necessary for me,
but I realized it was my misunderstanding.


Please let me explain one more.

See commit 3158fa0e739615769cc047d2428f30f4c3b6640e.

Prior to that commit, READID waited for #R/B transition,
it was wrong, so I fixed it.

However, it dropped the delay completely.
If somebody was implicitly relying on the delay of chip->dev_ready,
the first byte might be read out before the valid data
is available.

This was motivation of v1, where inserted ndelay(200)
unconditionally.





>>   mtd: nand: denali: fix setup_data_interface to meet tCCS delay
>
> This one is valid. I'll queue it to nand/next soon.

If you drop 1/2, please let me do v3.

V2 mentions NAND_WAIT_TWHR, this is strange.



-- 
Best Regards
Masahiro Yamada
