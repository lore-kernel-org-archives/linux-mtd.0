Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNguU-0000Rg-9A
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 12:38:08 +0000
Subject: Re: UBIFS errors when file-system is full
To: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at> <55ADE0F1.9090809@gmail.com>
 <55ADE35F.6050808@nod.at> <55AF41DD.2060902@gmail.com>
 <55AF4447.50500@nod.at> <55B24F2F.9020705@gmail.com>
 <55B26D24.3060006@nod.at> <55BBA6A5.9020701@gmail.com>
 <55BC68D6.2070008@nod.at> <55C3379E.50000@gmail.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C4A695.7060608@nod.at>
Date: Fri, 7 Aug 2015 14:37:41 +0200
MIME-Version: 1.0
In-Reply-To: <55C3379E.50000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 06.08.2015 um 12:31 schrieb Bhuvanchandra DV:
>>> The tests ran on ubi partition after isolating it from U-Boot completly.
>>> Formatted the ubi partition and then boot with SD card (4.1.2 kernel fastmap enabled/disabled, fm_debug enabled).
>>> Please find the below log of ubi-tests:
>>>
>>> [io_paral] write_thread():222: written and read data are different
>> *blink*
> 
> Tried to run the io_paral test multiple times seperately with few debug prints added to see what exact
> differences with read and write buffers, so far we could see one complete page is read twice even though
> it is written once. I'm now confused is the issue happen while reading or while writing. Can you give us
> some pointers so that we can narrow down the cause for this failure.

The test verifies that the data has been written correctly to the block.
(Maybe a buffer problem in your MTD driver?)

You can also enable UBI's IO checks.
i.e. echo 1 > /sys/kernel/debug/ubi/ubi0/chk_io

It will also verify it's writes. Maybe it can give you a clue.

Thanks,
//richard
