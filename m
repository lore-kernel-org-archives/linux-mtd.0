Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqwlc-0002H6-KD
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 07:02:42 +0000
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id v2N723CX029926
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 16:02:04 +0900
Received: by mail-yw0-f172.google.com with SMTP id i203so26402578ywc.3
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 00:02:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170322215728.69e8b566@bbrezillon>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-12-git-send-email-yamada.masahiro@socionext.com>
 <20170322215728.69e8b566@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Mar 2017 16:02:02 +0900
Message-ID: <CAK7LNASC8VvNgMV5CGq5BJGUknPEP51R_RBfCy+K2ZiVm2Qxtg@mail.gmail.com>
Subject: Re: [PATCH v2 11/53] mtd: nand: denali: fix bitflips calculation in
 handle_ecc()
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

2017-03-23 5:57 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed, 22 Mar 2017 23:07:18 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> +     do {
>> +             err_addr = ioread32(denali->flash_reg + ECC_ERROR_ADDRESS);
>> +             err_sector = ECC_SECTOR(err_addr);
>> +             err_byte = ECC_BYTE(err_addr);
>> +
>> +             err_cor_info = ioread32(denali->flash_reg + ERR_CORRECTION_INFO);
>> +             err_cor_value = ECC_CORRECTION_VALUE(err_cor_info);
>> +             err_device = ECC_ERR_DEVICE(err_cor_info);
>> +
>> +             /* reset the bitflip counter when crossing ECC sector */
>> +             if (err_sector != prev_sector)
>> +                     bitflips = 0;
>> +
>> +             if (ECC_ERROR_UNCORRECTABLE(err_cor_info)) {
>> +                     /*
>> +                      * if the error is not correctable, need to look at the
>> +                      * page to see if it is an erased page. if so, then
>> +                      * it's not a real ECC error
>> +                      */
>> +                     ret = -EBADMSG;
>
> You should never return -EBADMSG directly. Just increment
> ecc_stats.failed and let the core return -EBADMSG to the upper layer.
>

Here, -EBADMSG is used like that returned from  ->ecc.correct()


Please notice denali_read_page() never returns -EBADMSG.

 -EBADMSG is used as a mark "we need erased page check".


I think nand_read_page_syndrome() does similar;
-EBADMSG is used internally.



-- 
Best Regards
Masahiro Yamada
