Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVdSR-0004Ex-Fp
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 07:52:40 +0000
Received: by mail-we0-f170.google.com with SMTP id z2so3341383wey.29
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2013 00:52:37 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 26 Apr 2013 09:52:37 +0200
Message-ID: <CABLyGt_OCcOya7TFYhxWypj6x8s_pp7bjzdyMonHe8ZcgY36Bw@mail.gmail.com>
Subject: Question about mtdblock.c
From: Maarten Blomme <maartenblomme@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a question about mtdblock.c, is this the right place to ask it?

My question is about the usage of the return value of
write_cached_data in mtdblock_flush and mtdblock_release. The return
value is not used in those functions. What could be the reason for
that?

I have a problem in my code where I flush the data, but the flush does
not fail if the flush did not work (because of a bad NAND flash
sector). As far as I understand the mtdblock.c code, this could be
fixed by using the return value of write_cached_data.

Thanks for listening!

best regards,
Maarten Blomme
