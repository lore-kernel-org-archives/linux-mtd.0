Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCfR8-0004se-Tk
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 04:27:04 +0000
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
 [209.85.161.176]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id uB24QSU9017232
 for <linux-mtd@lists.infradead.org>; Fri, 2 Dec 2016 13:26:28 +0900
Received: by mail-yw0-f176.google.com with SMTP id r204so212176238ywb.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 20:26:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127164235.6ad93fab@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-16-git-send-email-yamada.masahiro@socionext.com>
 <20161127164235.6ad93fab@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 2 Dec 2016 13:26:27 +0900
Message-ID: <CAK7LNARTE9z=mb6jA9RU-tvZOOedQDTjjqeSanp-yyOoo78xpg@mail.gmail.com>
Subject: Re: [PATCH 15/39] mtd: nand: denali: improve readability of
 handle_ecc()
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


2016-11-28 0:42 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>> +                     if (err_byte < ECC_SECTOR_SIZE) {
>> +                             struct mtd_info *mtd =
>> +                                     nand_to_mtd(&denali->nand);
>> +                             int offset;
>> +
>> +                             offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
>> +                                     denali->devnum + err_device;
>> +                             /* correct the ECC error */
>> +                             buf[offset] ^= err_correction_value;
>> +                             mtd->ecc_stats.corrected++;
>> +                             bitflips++;
>
> Hm, bitflips is what is set in max_bitflips, and apparently the
> implementation (which is not yours) is not doing what the core expects.
>
> You should first count bitflips per sector with something like that:
>
>                                 bitflips[err_sector]++;
>
>
> And then once you've iterated over all errors do:
>
>         for (i = 0; i < nsectors; i++)
>                 max_bitflips = max(bitflips[err_sector], max_bitflips);


I see.

For soft ECC fixup, we can calculate bitflips
for each ECC sector, so I can fix the max_bitflips
as the core framework expects.

For hard ECC fixup, the register only reports
the number of corrected bit-flips
in the whole page (sum from all ECC sectors).
We cannot calculate max_bitflips, I think.



BTW, I noticed another problem of the current code.

      buf[offset] ^= err_correction_value;
      mtd->ecc_stats.corrected++;
      bitflips++;

This code is counting the number of corrected bytes,
not the number of corrected bits.


I think multiple bit-flips within one byte can happen.


Perhaps, we should add

  hweight8(buf[offset] ^ err_correction_value)

to ecc_stats.corrected and bitflips.




-- 
Best Regards
Masahiro Yamada
