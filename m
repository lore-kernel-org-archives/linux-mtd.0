Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIvXP-0005nM-DA
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 11:23:41 +0000
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
 [209.85.213.180]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id v58BMluJ020543
 for <linux-mtd@lists.infradead.org>; Thu, 8 Jun 2017 20:22:47 +0900
Received: by mail-yb0-f180.google.com with SMTP id f192so8796584yba.2
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 04:22:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170607160935.6b064eef@bbrezillon>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-20-git-send-email-yamada.masahiro@socionext.com>
 <20170607160935.6b064eef@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Jun 2017 20:22:46 +0900
Message-ID: <CAK7LNAS6gM1Dhdz6=EoLwSCoW4q4-rnakR8YAZHkSvu=zkmE_w@mail.gmail.com>
Subject: Re: [PATCH v5 19/23] mtd: nand: denali: fix raw and oob accessors for
 syndrome page layout
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Enrico Jorns <ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-06-07 23:09 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed,  7 Jun 2017 20:52:28 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>>
>> +static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>> +{
>> +     struct denali_nand_info *denali = mtd_to_denali(mtd);
>> +     int i;
>> +
>> +     iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
>
> What is this '| 2'? You seem to use it a lot. Can you define a macro
> and maybe add a comment if the macro name is not self-descriptive.

The type of access.

bit[1:0] == 0   : command cycle
            1   : address cycle
            2   : data read/write cycle

I will replace magic numbers
with macros or something.



-- 
Best Regards
Masahiro Yamada
