Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cByy5-00084F-7i
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 07:06:14 +0000
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
 [209.85.161.169]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id uAU75bRg011449
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 16:05:37 +0900
Received: by mail-yw0-f169.google.com with SMTP id r204so152691151ywb.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2016 23:05:37 -0800 (PST)
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 Nov 2016 16:05:36 +0900
Message-ID: <CAK7LNATS-Vd0BEWZEdp7skHrpngvyyLm6OFXJsRQ=87VMbUOAQ@mail.gmail.com>
Subject: How read_oob() should work for HW_SYNDROME NAND controller?
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
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
(CCing Intel engineers because this is related to Denali driver
and comments from them are very appreciated.)

I am tacking on Denali NAND driver rework.

My question is:
Which data should chip->ecc.read_oob() get
in case of a controller with syndrome-like ECC engine.

For example, say we have a NAND chip
with 2048 byte page + 64 byte oob.
(the picture in the right side.)

And let's say the controller's ecc.size = 1024 and ecc.bytes == 14.
I am omitting BBM to make the situation simpler.

The Denali NAND controller interleaves
payload and ECC like the picture in the left side.

  |-----------|    |-----------|
  |           |    |           |
  | Payload0  |    |           |
  |           |    |           |
  | (ecc.size |    |           |
  |  1024B)   |    | Main Page |
  |           |    |   area    |
  |-----------|    |           |
  |  ECC0     |    |   2048B   |
  | (ecc.bytes|    |           |
  |   14B)    |    |           |
  |-----------|    |           |
  |           |    |           |
  | Payload1  |    |           |
  |           |    |           |
  | (ecc.size |    |           |
  |  1024B)   |    |-----------|
  |           |    |           |
  |-----------|    |           |
  |  ECC1     |    | OOB area  |
  | (ecc.bytes|    |           |
  |   14B)    |    |   64B     |
  |-----------|    |           |
  | OOB free  |    |           |
  |    36B    |    |           |
  |-----------|    |-----------|

The controller can transfer
Main page area, OOB area, or both of them,
like the physical structure of the device
in the right-side picture.

This is different from how
Denali controller uses the page logically
(in the left-side picture).


The current read_oob() implementation in the Denali driver
simply get the data in the physical OOB area.
It corresponds the tail of Payload1 + ECC1 + OOB free.


I am afraid the behavior is different from
the reference implementation of
nand_read_page_raw_syndrome()
nand_read_oob_syndrome()


I think we should collect ECC sections
into oob_poi to get along with the ooblayout APIs.


The Denali IP also supports lowlevel
command-base interface to issue NAND_CMD_RNDOUT
and cherry-pick ECC sections.

But, more simply, I can transfer the whole page + oob
into a temporary buffer, then only copy
ECC sections into oob_poi.



Comments are very appreciated.


-- 
Best Regards
Masahiro Yamada
