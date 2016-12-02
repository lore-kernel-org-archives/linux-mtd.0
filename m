Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCfT5-0005bj-KB
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 04:29:04 +0000
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
 [209.85.161.174]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id uB24SORo018197
 for <linux-mtd@lists.infradead.org>; Fri, 2 Dec 2016 13:28:25 +0900
Received: by mail-yw0-f174.google.com with SMTP id r204so212192907ywb.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 20:28:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127163114.24e9b8ad@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-14-git-send-email-yamada.masahiro@socionext.com>
 <20161127163114.24e9b8ad@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 2 Dec 2016 13:28:23 +0900
Message-ID: <CAK7LNATt3xDRG94DP5C40PvmaaSdhiQDz1jyHo4mfROV7HaVNA@mail.gmail.com>
Subject: Re: [PATCH 13/39] mtd: nand: denali: increment ecc_stats->corrected
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
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

2016-11-28 0:31 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Sun, 27 Nov 2016 03:05:59 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Update the number of corrected bit flips when read_page() succeeds.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  drivers/mtd/nand/denali.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
>> index a6445d9..4cc8945 100644
>> --- a/drivers/mtd/nand/denali.c
>> +++ b/drivers/mtd/nand/denali.c
>> @@ -1162,6 +1162,9 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>>                       mtd->ecc_stats.failed++;
>>               return 0;
>>       }
>> +
>> +     mtd->ecc_stats.corrected += max_bitflips;
>
> First of all, ecc_stats.corrected should contain the total number of
> bitflips detected on the MTD device, here you're just adding the
> maximum number of bitflips per ECC chunk for the current page, which is
> slightly different.
>
> Then, ecc_stats.corrected seems to be properly updated in handle_ecc()
> [1], so I see no reason to do it here.
>

You are right.

This patch is completely wrong, so I will drop it in v2.



-- 
Best Regards
Masahiro Yamada
