Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQid5-0005RC-92
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 14:05:20 +0000
Date: Tue, 14 Jul 2009 23:05:03 +0900 (JST)
Message-Id: <20090714.230503.162167450.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: abuse of nand_correct_data in tmio_nand driver
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.  I found tmio_nand driver abuses nand_correct_data.

The current nand_correct_data() can be used for ecc.bytes = 3 case
only.  The tmio_nand driver uses ecc.bytes = 6.

This is just a report.  No patch since I don't have this hardware.

---
Atsushi Nemoto
