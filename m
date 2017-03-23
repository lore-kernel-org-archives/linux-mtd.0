Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqwoV-0003wW-UG
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 07:05:41 +0000
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
 [209.85.161.177]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id v2N753wl031695
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 16:05:04 +0900
Received: by mail-yw0-f177.google.com with SMTP id i203so26440096ywc.3
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 00:05:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170322221216.26539147@bbrezillon>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-13-git-send-email-yamada.masahiro@socionext.com>
 <20170322221216.26539147@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Mar 2017 16:05:02 +0900
Message-ID: <CAK7LNARd0sKyqvZO_Tp6LV6V7p1pcWWdjfU2QJCmnT0hdeBTXg@mail.gmail.com>
Subject: Re: [PATCH v2 12/53] mtd: nand: denali: support HW_ECC_FIXUP
 capability
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


2017-03-23 6:12 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed, 22 Mar 2017 23:07:19 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> +static int denali_hw_ecc_fixup(struct mtd_info *mtd,
>> +                            struct denali_nand_info *denali)
>> +{
>> +     int bank = denali->flash_bank;
>> +     uint32_t ecc_cor;
>> +     unsigned int max_bitflips;
>> +
>> +     ecc_cor = ioread32(denali->flash_reg + ECC_COR_INFO(bank));
>> +     ecc_cor >>= ECC_COR_INFO__SHIFT(bank);
>> +
>> +     if (ecc_cor & ECC_COR_INFO__UNCOR_ERR)
>> +             return -EBADMSG;
>
> As previously mentioned, just increment ecc_stats.failed.
>

I explained the intention of -EBADMSG in 11/53.

ecc_stats.failed is incremented in denali_read_page().


-- 
Best Regards
Masahiro Yamada
