Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c88JB-0001Iw-2X
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2016 16:16:06 +0000
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
 [209.85.161.179]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id uAJGF6oB015164
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2016 01:15:06 +0900
Received: by mail-yw0-f179.google.com with SMTP id t125so182436792ywc.1
 for <linux-mtd@lists.infradead.org>; Sat, 19 Nov 2016 08:15:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161119093011.17b53356@bbrezillon>
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <20161119093011.17b53356@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 20 Nov 2016 01:15:05 +0900
Message-ID: <CAK7LNAQceXj1dspwFaRZgcKRxYZP4W+QAiOB_2-L9BeAz=ZS1g@mail.gmail.com>
Subject: Re: [PATCH 00/11] mtd: nand: denali: first round of cleanups of
 Denali NAND driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


2016-11-19 17:30 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> Hi Masahiro,
>
> On Wed,  9 Nov 2016 13:35:19 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> I am tackling on this driver to use it for my SoCs.
>> The difficulty is a bunch of platform specific stuff
>> (more specifically, Intel MRST specific) is hard-coded in this driver.
>>
>> I need lots of rework to utilize the driver for generic cases,
>> but at the same time, I found the driver code is really dirty,
>> lots of unused code, odd comments, etc.
>>
>> The first thing I needed to do was to clean up the code.
>> My work is still under the way, but I decided to drop this series
>> for now.  I hope this series is easy to review, so I guess
>> splitting into a small chunks is better than a one-shot patch bomb.
>
> Well, all I've seen coming from you so far are minor cleanups and
> cosmetic changes (including one introducing a regression).
> I'll apply this series, but please, next time, try to send the whole
> series, so that we can see the big picture, and not just random
> cleanups.
>
> Thanks,
>
> Boris

Right, this series alone is not useful at all.

I've been mostly stuck in some local works this week,
but hopefully I will find some time to complete the series next week.

If you want to see the big picture,
you can postpone this series until then.



-- 
Best Regards
Masahiro Yamada
