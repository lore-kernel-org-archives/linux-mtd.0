Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKdfT-0007MU-IN
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 04:43:05 +0000
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v5D4gRqm018479
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 13:42:28 +0900
Received: by mail-yw0-f180.google.com with SMTP id e142so36220469ywa.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 21:42:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS6gM1Dhdz6=EoLwSCoW4q4-rnakR8YAZHkSvu=zkmE_w@mail.gmail.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-20-git-send-email-yamada.masahiro@socionext.com>
 <20170607160935.6b064eef@bbrezillon>
 <CAK7LNAS6gM1Dhdz6=EoLwSCoW4q4-rnakR8YAZHkSvu=zkmE_w@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Jun 2017 13:42:26 +0900
Message-ID: <CAK7LNAQ+F+fAkmt01-wCiUCN7NNfC18Cq+AHGfWmh5k3j=a+Lg@mail.gmail.com>
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

2017-06-08 20:22 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> 2017-06-07 23:09 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>> On Wed,  7 Jun 2017 20:52:28 +0900
>> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>>
>>>
>>> +static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>>> +{
>>> +     struct denali_nand_info *denali = mtd_to_denali(mtd);
>>> +     int i;
>>> +
>>> +     iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
>>
>> What is this '| 2'? You seem to use it a lot. Can you define a macro
>> and maybe add a comment if the macro name is not self-descriptive.
>
> The type of access.
>
> bit[1:0] == 0   : command cycle
>             1   : address cycle
>             2   : data read/write cycle
>
> I will replace magic numbers
> with macros or something.


I will add this magic-number/macro consolidation
at the tail of v6.



-- 
Best Regards
Masahiro Yamada
