Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cC01h-0002Ke-ST
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 08:14:02 +0000
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
 [209.85.161.181]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id uAU8D9LY007387
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 17:13:10 +0900
Received: by mail-yw0-f181.google.com with SMTP id t125so152834453ywc.1
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 00:13:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127160459.5894be93@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <20161127160459.5894be93@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 Nov 2016 17:13:08 +0900
Message-ID: <CAK7LNARSL=pH6upMcDN248m_CgrSHSiwC8k70oPd9cR7cmKSMw@mail.gmail.com>
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

2016-11-28 0:04 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> +Andy
>
> Hi Masahiro,
>
> On Sun, 27 Nov 2016 03:05:46 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> As I said in the 1st round series, I am tackling on this driver
>> to use it for my SoCs.
>>
>> The previous series was just cosmetic things, but this series
>> includes *real* changes.
>>
>> After some more cleanups, I will start to add changes that
>> are really necessary.
>> One of the biggest problems I want to solve is a bunch of
>> hard-coded parameters that prevent me from using this driver for
>> my SoCs.
>>
>> I will introduce capability flags that are associated with DT
>> compatible and make platform-dependent parameters overridable.
>>
>> I still have lots of reworks to get done (so probably 3rd round
>> series will come), but I hope it is getting better and
>> I am showing a big picture now.
>>
>
> Thanks for posting this 2nd round of patches, I know have a clearer
> view of what you're trying to achieve.
> Could you be a bit more specific about the remaining rework (your 3rd
> round)?


We still have plenty of time, and no reason to hurry now.
So, you do not have to apply this series
until you see an even bigger picture.

I will try my best to include as many of my plans as possible
in this round.

I may end up with dropping my on-going work to the ML occasionally
because I want early feedback in case I am doing something wrong.

-- 
Best Regards
Masahiro Yamada
