Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3wPc-0005M0-Jv
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 12:14:13 +0000
Message-Id: <6.0.1.1.0.20040317175202.01f80e70@dns.struinfo.it>
Date: Thu, 18 Mar 2004 13:14:06 +0100
To: linux-mtd@lists.infradead.org
From: llandre <r&d@wawnet.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Large block NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm going to write a driver for the Samsung Flash K9F1G08U0M (128MB).
The main characteristics are:
- erase block size: 128 KB
- page program size: 2 KB
- total chip size: 128 MB
- tR = 25 us

This chip is not fully compatible with the standard NAND flash commands 
defined in
nand.h (Samsung call these devices "large block").
Thus, in my understanding, I must provide the following custom functions:
my_board_nand_command
my_board_nand_wait
my_board_nand_block_bad

Anybody wrote a driver for a similar device?
Have the MTD maintainers already planned to support these devices?




Best regards,

llandre  
