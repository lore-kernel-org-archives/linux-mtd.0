Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqx8l-0006ii-Ei
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 05:49:48 +0000
Received: by wikq8 with SMTP id q8so194925507wik.1
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 22:49:25 -0700 (PDT)
Subject: Re: [PATCH 3/3 v3] mtd: nand: fsmc: Add BCH4 SW ECC support for
 SPEAr600
To: Brian Norris <computersforpeace@gmail.com>
References: <1443782422-4515-3-git-send-email-sr@denx.de>
 <1445236813-26013-1-git-send-email-sr@denx.de>
 <20151026202038.GG13239@google.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
From: Stefan Roese <sr@denx.de>
Message-ID: <562F1063.40307@denx.de>
Date: Tue, 27 Oct 2015 06:49:23 +0100
MIME-Version: 1.0
In-Reply-To: <20151026202038.GG13239@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 26.10.2015 21:20, Brian Norris wrote:
> Hi Stefan,
>
> On Mon, Oct 19, 2015 at 08:40:13AM +0200, Stefan Roese wrote:
>> This patch adds support for 4-bit ECC BCH4 for the SPEAr600 SoC. This can
>> be used by boards equipped with a NAND chip that requires 4-bit ECC
>> strength. The SPEAr600 HW ECC only supports 1-bit ECC strength.
>>
>> To enable SW BCH4, you need to specify this in your nand controller
>> DT node:
>>
>> 	nand-ecc-mode = "soft_bch";
>> 	nand-ecc-strength = <4>;
>> 	nand-ecc-step-size = <512>;
>>
>> Tested on a custom SPEAr600 board.
>>
>> Signed-off-by: Stefan Roese <sr@denx.de>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> ---
>
> Looks good. Applied to l2-mtd.git with a small addition.

Thanks Brian. Really appreciated.

Thanks,
Stefan
