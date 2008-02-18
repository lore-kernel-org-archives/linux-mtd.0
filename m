Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JR89H-0000Kp-PL
	for linux-mtd@lists.infradead.org; Mon, 18 Feb 2008 15:43:20 +0000
Date: Tue, 19 Feb 2008 00:43:37 +0900 (JST)
Message-Id: <20080219.004337.74388852.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: at91_nand question
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: andrew@sanpeople.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.  Looking at at91_nand.c, I found that this driver does not
controls NCE signal during normal operations.  The driver only enables
NCE on at91_nand_probe() and disables NCE on at91_nand_remove().

Is this normal behavior?  I thought a nand driver should control NCE
signal on cmd_ctrl routine.  If the nand driver supported only one
chip, it can omit NCE control?

Though it seems work fine as is, I wonder keeping chipselect signal
low all the time is normal.

---
Atsushi Nemoto
