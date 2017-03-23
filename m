Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqwpv-0004G1-RS
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 07:07:09 +0000
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
 [209.85.161.169]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v2N76K9s020772
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 16:06:21 +0900
Received: by mail-yw0-f169.google.com with SMTP id d191so13782277ywe.2
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 00:06:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170322220937.202c5180@bbrezillon>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-13-git-send-email-yamada.masahiro@socionext.com>
 <20170322220937.202c5180@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Mar 2017 16:06:19 +0900
Message-ID: <CAK7LNAS0uGyADQoshT_pt8d=wZ+rW8Ha4LCjckdPOOX9s_x2XA@mail.gmail.com>
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

2017-03-23 6:09 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed, 22 Mar 2017 23:07:19 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> @@ -339,6 +352,7 @@ struct denali_nand_info {
>>       int bbtskipbytes;
>>       int max_banks;
>>       unsigned int caps;
>> +#define DENALI_CAP_HW_ECC_FIXUP                      BIT(0)
>
> Can you move this definition outside of the struct denali_nand_info
> definition?


My idea was to put relevant macros close to the "caps" member.
Actually, "struct mmc_host" does similar.


If you do not like it, yes, I can move it.
Anyway, this is a matter of taste,
and I do not have a strong opinion about this.


-- 
Best Regards
Masahiro Yamada
