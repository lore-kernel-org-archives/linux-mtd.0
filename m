Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCNTo-0001MZ-W5
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 09:16:38 +0000
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
 [209.85.213.169]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id uB19FlGi018916
 for <linux-mtd@lists.infradead.org>; Thu, 1 Dec 2016 18:15:48 +0900
Received: by mail-yb0-f169.google.com with SMTP id v132so24818001yba.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 01:15:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161130091722.2e35f32a@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <20161127160459.5894be93@bbrezillon>
 <CAK7LNAQPm7w0_iSDLJihFaxSdMp5UMnpDZH5nBTyVnoLL9KYjg@mail.gmail.com>
 <20161130091722.2e35f32a@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 1 Dec 2016 18:15:46 +0900
Message-ID: <CAK7LNAQO7dKxFYcTJ+S6sQTPJCK98820_x3y82gfSjk0e4NeFw@mail.gmail.com>
Subject: Re: [PATCH 00/39] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

2016-11-30 17:17 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:

>> [3]
>> Fix raw and oob callbacks.
>>
>> I asked in another thread,
>> the current driver just puts the physically accessed OOB data
>> into oob_poi, which is not a collection of ECC data.
>> Raw write/read() are wrong as well.
>
> That's all good things too.
>
>>
>> After fixing those, enable BBT scan by removing the following flag:
>>     /* skip the scan for now until we have OOB read and write support */
>>     chip->options |= NAND_SKIP_BBTSCAN;
>>
>
> Hm, here you have a problem. The layout you described replaces BBMs by
> payload data, thus preventing the BBM scan approach (or at least, it
> won't work with factory BBMs).


As I answered in another mail, the Denali IP expects BBMs
at the beginning of each OOB area (standard location).
They are protected from the ECC engine.

I just did not mention the BBM-reserved area
to make the story simpler.

So, after fixing oob read/write functions,
the driver will be able to enable BBT-scanning.


-- 
Best Regards
Masahiro Yamada
