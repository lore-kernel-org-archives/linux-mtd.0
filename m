Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqv6w-0001KP-Fi
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 05:16:36 +0000
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
 [209.85.161.173]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v2N5G0UG009479
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 14:16:01 +0900
Received: by mail-yw0-f173.google.com with SMTP id d191so12637932ywe.2
 for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2017 22:16:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170322213625.4d2cf783@bbrezillon>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-11-git-send-email-yamada.masahiro@socionext.com>
 <20170322213625.4d2cf783@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Mar 2017 14:15:59 +0900
Message-ID: <CAK7LNAQSjL88L5SDd+p15mXOJ2M-5E=0PAe8R=zJw=5FSy6O6g@mail.gmail.com>
Subject: Re: [PATCH v2 10/53] mtd: nand: denali: fix erased page checking
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Laurent Monat <laurent.monat@idquantique.com>,
 thorsten.christiansson@idquantique.com, Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
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


2017-03-23 5:36 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed, 22 Mar 2017 23:07:17 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> This part is wrong in multiple ways:
>>
>> [1] is_erased() is called against "buf" twice, so the second one is
>> meaningless.  The second call should check chip->oob_poi.
>>
>> [2] This code block is nested by double "if (check_erase_page)".
>> The inner one is redundant.
>>
>> [3] Erased page checking without threshold is false-positive.
>> Basically, there are two ways for erased page checking:
>> - read the whole of page + oob in raw transfer, then check if all
>>   the data are 0xFF.
>> - read the ECC-corrected page + oob, then check if *almost* all the
>>   data are 0xFF (bit-flips less than ecc.strength are allowed)
>> While here, it checks if all data in ECC-corrected page are 0xFF.
>> This is too strong because not all of the data are 0xFF after they
>> are manipulated by the ECC engine.  Proper threshold must be taken
>> into account to avoid false-positive ecc_stats.failed increments.
>
> Hm, the ECC engine should not introduce extra bitflips. I've seen 3
> different cases in the various ECC engine I worked with:
>
> 1/ the ECC engine is able to correct bitflips in erased pages. In this
>    case you should trust it and return the number of corrected
>    bitflips or increment the ECC failed counter if it reports
>    uncorrectable errors.
> 2/ the ECC engine is able to detect erased pages, but fails to detect
>    those containing bitflips in it. In this case, you should rely on
>    the default "empty page" detection and only manually check if the
>    page is almost filled with 0xff when an error is reported.
> 3/ the ECC engine does not detect empty pages at all. In this case, you
>    should check if the page empty (or almost empty) each time an ECC
>    error is reported


I think the Denali is case 3.
But, very new versions of this IP support erased page detection by hardware.
Please see 49/53:
http://patchwork.ozlabs.org/patch/742414/

Unfortunately this feature is not exactly what we want.
We want to detect per-sector empty'ness,
but this features is actually page oriented.

If you are unhappy about this,
it is possible to always turn off this feature
and use software detection (with nand_check_erased_ecc_chunk)



> In any case, if the ECC engine reports uncorrectable errors, it should
> keep the data untouched, which means you don't have to re-read the whole
> page in raw mode, only the OOB bytes.


OK.  We should respect the result from the ECC engine,
but we still need to fill the buffer with 0xff
if the page turned out to be empty.
(nand_check_erased_ecc_chunk() does this for us.)





>>
>> [4] positive return value for uncorrectable bitflips
>>
>> The comment of ecc->read_page() says it should return "0 if bitflips
>> uncorrectable", but the current code could return a positive value
>> in the case.
>
> This one should probably be fixed in the core. Returning a negative
> error core for uncorrectable errors is forbidden, but reporting the
> maximum number of bitflips that have been corrected in each valid
> ECC sector of the page (even if the page contains uncorrectable
> sectors) does not sound like a bad idea to me.
>
> The reason the core asks drivers to return 0 in case of uncorrectable
> errors is because it updates the max_bitflips variable before testing
> if the page contains uncorrectable errors [1]. Moving this statement
> here [2] (in an else branch) should solve the problem for all drivers
> returning positive numbers even when uncorrectable errors are detected
> in one of the ECC chunk contained in a page.


I understood your idea, but do you want this change in this series?



-- 
Best Regards
Masahiro Yamada
