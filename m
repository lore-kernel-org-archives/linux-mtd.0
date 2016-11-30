Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBzrF-00028d-1h
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 08:03:14 +0000
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
 [209.85.213.169]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id uAU82Hbk031358
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 17:02:17 +0900
Received: by mail-yb0-f169.google.com with SMTP id v132so14831042yba.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 00:02:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127160459.5894be93@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <20161127160459.5894be93@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 Nov 2016 17:02:16 +0900
Message-ID: <CAK7LNAQPm7w0_iSDLJihFaxSdMp5UMnpDZH5nBTyVnoLL9KYjg@mail.gmail.com>
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

Hi.

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


[1]
I want to remove
get_samsung_nand_para()
get_onfi_nand_para()

The driver should not hard-code timing parameters of Samsung specific
chips.  For ONFI, it is duplicating effort of the core framework.

I am thinking if it would be possible to implement
chip->setup_data_interface() in order to set up
timings in a generic way.

[2]
Remove driver-internal bounce buffer.
The current Denali driver allocate DMA_BIDIRECTIONAL buffer
to use it as a driver-internal bounce buffer.

The hardware transfer page data into the bounce buffer,
then CPU copies from the bounce buffer to a given buf (and oob_poi).
This is not efficient.

So, I want to set NAND_USE_BOUNCE_BUFFER flag
and do dma_map_single directly for a given buffer.

[3]
Fix raw and oob callbacks.

I asked in another thread,
the current driver just puts the physically accessed OOB data
into oob_poi, which is not a collection of ECC data.
Raw write/read() are wrong as well.

After fixing those, enable BBT scan by removing the following flag:
    /* skip the scan for now until we have OOB read and write support */
    chip->options |= NAND_SKIP_BBTSCAN;



> Also, if you don't mind, I'd like to have reviews and testing from intel
> users before applying the series. Can you Cc Andy (and possibly other
> intel maintainers) for the next round.

Sure.

Anyway, this series already missed the pull-req for 4.10-rc1,
we have plenty of time until 4.11-rc1.

Review/test from Intel engineers are very appreciated
because I have no access to their boards.


-- 
Best Regards
Masahiro Yamada
