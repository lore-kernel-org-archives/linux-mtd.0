Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cic7N-00056D-P3
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 07:22:44 +0000
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
 [209.85.161.179]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id v1S7LpAB011679
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2017 16:21:52 +0900
Received: by mail-yw0-f179.google.com with SMTP id p77so2511410ywg.1
 for <linux-mtd@lists.infradead.org>; Mon, 27 Feb 2017 23:21:52 -0800 (PST)
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 28 Feb 2017 16:21:50 +0900
Message-ID: <CAK7LNARAURP5-vbFZUUo1Wm9hudHw5DTuaQHz-TJGjdsXij38g@mail.gmail.com>
Subject: [NAND Question] When oob_required is used?
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org
Cc: masahiroy@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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


I am seeing the reference implementations for the callback
in drivers/mtd/nand/nand_base.c


I see only some of them use the argument "oob_required".


- oob_required is used
nand_read_page_raw()
nand_write_page_raw()
nand_write_subpage_hwecc()


- oob_required is ignored
nand_read_page_raw_syndrome()
nand_read_page_swecc()
nand_read_page_hwecc()
nand_read_page_hwecc_oob_first()
nand_read_page_syndrome()
nand_write_page_raw_syndrome()
nand_write_page_swecc()
nand_write_page_hwecc()
nand_write_page_syndrome()



I could not get the logic
when "oob_required" is used.



When implementing drivers, the "oob_required"
should be respected (i.e. oob_poi should be transferred as well),
or is it OK to ignore it?




-- 
Best Regards
Masahiro Yamada
