Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cuEdo-0003ZE-1m
 for linux-mtd@lists.infradead.org; Sat, 01 Apr 2017 08:44:14 +0000
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
 [209.85.161.170]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id v318hUlV006830
 for <linux-mtd@lists.infradead.org>; Sat, 1 Apr 2017 17:43:31 +0900
Received: by mail-yw0-f170.google.com with SMTP id p77so47161774ywg.1
 for <linux-mtd@lists.infradead.org>; Sat, 01 Apr 2017 01:43:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490856383-31560-13-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-13-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 1 Apr 2017 17:43:29 +0900
Message-ID: <CAK7LNAS2g4Dvv+GNvQ0XU2Gt-pvqDZbKG0xiq=bAiDTRnWqeTw@mail.gmail.com>
Subject: Re: [PATCH v3 12/37] mtd: nand: denali: support 1024 byte ECC step
 size
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-03-30 15:45 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This driver was originally written for the Intel MRST platform with
> several platform specific parameters hard-coded.  Another thing we
> need to fix is the hard-coded ECC step size.  Currently, it is
> defined as follows:
>
>   #define ECC_SECTOR_SIZE 512
>
> (somehow, it is defined in both denali.c and denali.h)
>
> This must be avoided because the Denali IP supports 1024B ECC size
> as well.  The Denali User's Guide also says supporting both 512B and
> 1024B ECC sectors is possible, though it would require instantiation
> of two different ECC circuits.  So, possible cases are:
>
>  [1] only 512B ECC size is supported
>  [2] only 1024B ECC size is supported
>  [3] both 512B and 1024B ECC sizes are supported
>
> Newer versions of this IP need ecc.size and ecc.steps explicitly
> set up via the following registers:
>   CFG_DATA_BLOCK_SIZE       (0x6b0)
>   CFG_LAST_DATA_BLOCK_SIZE  (0x6c0)
>   CFG_NUM_DATA_BLOCKS       (0x6d0)
>
> Older versions do not have such registers (they were reserved), so
> write accesses are safely ignored.
>
> This commit adds new flags DENALI_CAP_ECC_SIZE_{512,1024}.
>
> The DT property "nand-ecc-step-size" is still optional; a reasonable
> default will be chosen for [1] and [2].  For case [3], users can
> force ECC size via DT in case firmware hard-codes ECC settings.
> If not specified, the driver will use chip's ECC requirement as a
> hint to decide the ECC size.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>
> Changes in v3:
>   - Move DENALI_CAP_ define out of struct denali_nand_info
>   - Use chip->ecc_step_ds as a hint to choose chip->ecc.size
>     where possible
>


Please hold back this patch
until we decide how to handle 14.




-- 
Best Regards
Masahiro Yamada
