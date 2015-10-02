Received: from mail-wi0-f178.google.com ([209.85.212.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhxfS-0003u2-9z
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 10:34:23 +0000
Received: by wicfx3 with SMTP id fx3so27464716wic.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Oct 2015 03:33:59 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: fsmc: Add BCH4 SW ECC support for SPEAr600
To: Brian Norris <computersforpeace@gmail.com>
References: <1441187581-12928-1-git-send-email-sr@denx.de>
 <20150929002127.GP31505@google.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Stefan Roese <sr@denx.de>
Message-ID: <560E5D96.5050208@denx.de>
Date: Fri, 2 Oct 2015 12:33:58 +0200
MIME-Version: 1.0
In-Reply-To: <20150929002127.GP31505@google.com>
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

On 29.09.2015 02:21, Brian Norris wrote:
> On Wed, Sep 02, 2015 at 11:53:01AM +0200, Stefan Roese wrote:
>> This patch adds support for 4-bit ECC BCH4 for the SPEAr600 SoC. This can
>> be used by boards equipped with a NAND chip that requires 4-bit ECC
>> strength. The SPEAr600 HW ECC only supports 1-bit ECC strength.
>>
>> To enable SW BCH4, you need to specify this in your nand controller
>> DT node:
>>
>> 	nand-ecc-mode = "soft_bch";
>
> Please update the DT binding file, referring to nand.txt. Just specify
> your additional restrictions (like, should be "soft_bch" or "hw").
>
> Also please use nand-ecc-strength and nand-ecc-size; see below.

Thanks for the review. I'll send a new patch (series) out shortly,
addressing all your comments and suggestions.

Thanks,
Stefan
