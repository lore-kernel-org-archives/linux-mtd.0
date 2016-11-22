Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c91rQ-0001MW-KS
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 03:35:10 +0000
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
 [209.85.161.169]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id uAM3YCgS012880
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 12:34:13 +0900
Received: by mail-yw0-f169.google.com with SMTP id i145so4528774ywg.2
 for <linux-mtd@lists.infradead.org>; Mon, 21 Nov 2016 19:34:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNATiq+mZ1TzqLxC91UBqbFum_kEddLeeTsBH-A8RNCbYRA@mail.gmail.com>
References: <CAK7LNATiq+mZ1TzqLxC91UBqbFum_kEddLeeTsBH-A8RNCbYRA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 22 Nov 2016 12:34:11 +0900
Message-ID: <CAK7LNARGiHGBXg76u9rbTnUAKxzn2pJMtQ3v1OTD7As0BwLMsw@mail.gmail.com>
Subject: Re: Unclear comment about nand->ecc.read_page ?
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I take back this question.


2016-11-22 9:56 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Hi.
>
> I have a question about the following comment in
> include/linux/mtd/nand.h:
>
>  * @read_page: function to read a page according to the ECC generator
>  * requirements; returns maximum number of bitflips corrected in
>  * any single ECC step, 0 if bitflips uncorrectable, -EIO hw error
>
>
>
> The "0 if bitflips uncorrectable" sounds like
> "the read function could not correct bitflips"
> (=uncorrectable ECC (EBADMSG) error).
>


The comment block is correct.
It was my misunderstanding.

nand->ecc.correct() should return -EBADMSG for uncorrectable ECC error,
while nand->ecc.read_page() should return zero.


Sorry for noise.


-- 
Best Regards
Masahiro Yamada
