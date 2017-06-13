Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKh1p-0007RZ-1x
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 08:18:22 +0000
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
 [209.85.161.176]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v5D8Hggc026252
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 17:17:43 +0900
Received: by mail-yw0-f176.google.com with SMTP id v7so28930387ywc.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 01:17:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170613090249.6a247389@bbrezillon>
References: <1497330250-17348-1-git-send-email-yamada.masahiro@socionext.com>
 <20170613090249.6a247389@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Jun 2017 17:17:41 +0900
Message-ID: <CAK7LNAQAjGJDZLKG7BAVizZgvxkir9V+R0rPTChegH=tKVdx=w@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: nand: denali: Denali NAND IP patch bomb
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

Hi Boris,


2017-06-13 16:02 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:

>
> BTW, I also implemented ->read/write_buf_word() since the core may one
> day call these functions, and the default implementations used by the
> core when these hooks are NULL are not appropriate in your case.
>

BTW, why doesn't the default hook in the core do like this?


static uint8_t nand_read_byte(struct mtd_info *mtd)
{
        struct nand_chip *chip = mtd_to_nand(mtd);
        uint8_t byte;

        chip->read_buf(chip, &byte, 1);
        return byte;
}


->read_byte() is a special case of ->read_buf() with length==1,
so this should work.




-- 
Best Regards
Masahiro Yamada
