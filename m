Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8zOj-0004CR-JL
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 00:57:22 +0000
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id uAM0uMUV020648
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 09:56:23 +0900
Received: by mail-yw0-f180.google.com with SMTP id r204so2335812ywb.0
 for <linux-mtd@lists.infradead.org>; Mon, 21 Nov 2016 16:56:22 -0800 (PST)
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 22 Nov 2016 09:56:21 +0900
Message-ID: <CAK7LNATiq+mZ1TzqLxC91UBqbFum_kEddLeeTsBH-A8RNCbYRA@mail.gmail.com>
Subject: Unclear comment about nand->ecc.read_page ?
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

Hi.

I have a question about the following comment in
include/linux/mtd/nand.h:

 * @read_page: function to read a page according to the ECC generator
 * requirements; returns maximum number of bitflips corrected in
 * any single ECC step, 0 if bitflips uncorrectable, -EIO hw error



The "0 if bitflips uncorrectable" sounds like
"the read function could not correct bitflips"
(=uncorrectable ECC (EBADMSG) error).


In my understanding, the return value zero means
it read the page successfully and no bitflip correction
happend, right?


If so, is is better to reword like
"0 if no bitflips" or something?

Or remove the "0 if bitflips uncorrectable" entirely?
(because "returns maximum number of bitfilps corrected"
explains the zero case as well)




-- 
Best Regards
Masahiro Yamada
