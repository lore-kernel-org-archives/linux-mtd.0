Received: from 211-23-38-20.hinet-ip.hinet.net ([211.23.38.20]
	helo=serversw.iei.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19PKU3-0004yb-Qz
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 12:06:40 +0100
Received: from serversw.iei.com.tw (root@localhost)
	by serversw.iei.com.tw with ESMTP id h59B0ax13270
	for <linux-mtd@lists.infradead.org>;
	Mon, 9 Jun 2003 19:00:36 +0800 (CST)
Received: from antivirusgw.hq.iei ([172.16.2.30])
	by serversw.iei.com.tw with SMTP id h59B0ZI13262
	for <linux-mtd@lists.infradead.org>;
	Mon, 9 Jun 2003 19:00:35 +0800 (CST)
Received: (from kevinliao [172.17.23.81])
 by antivirusgw.hq.iei (NAVGW 2.5.1.19) with SMTP id M2003060919052016970
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 19:05:20 +0800
Message-ID: <00cf01c32e77$4367ae00$511711ac@kevinliao>
From: "Kevin Liao" <kevinliao@iei.com.tw>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 9 Jun 2003 19:07:04 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Subject: A question about how to send a page program command to NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In nand.c, I found that there was a piece of code in nand_command(...) as below:

...
if (command != NAND_CMD_SEQIN)
  writeb (command, NAND_IO_ADDR);
 else {
  if (mtd->oobblock == 256 && column >= 256) {
   column -= 256;
   writeb (NAND_CMD_READOOB, NAND_IO_ADDR);
   writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
  } else if (mtd->oobblock == 512 && column >= 256) {
   if (column < 512) {
    column -= 256;
    writeb (NAND_CMD_READ1, NAND_IO_ADDR);
    writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
   } else {
    column -= 512;
    writeb (NAND_CMD_READOOB, NAND_IO_ADDR);
    writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
   }
  } else {
   writeb (NAND_CMD_READ0, NAND_IO_ADDR);
   writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
  }
 }
...

My question is why we need to send some kind of read command first before issuing the real page program command? Thanks a lot.

Regards,
Kevin
