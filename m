Received: from [61.30.80.237] (helo=serversw.iei.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AWu3n-0006LB-51
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2003 09:03:08 +0000
Received: from serversw.iei.com.tw (root@localhost)
	by serversw.iei.com.tw with ESMTP id hBI8qQg14249
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2003 16:52:26 +0800 (CST)
Received: from MailSQR.softnext.com.tw ([172.16.2.41])
	by serversw.iei.com.tw with ESMTP id hBI8qPH14245
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2003 16:52:26 +0800 (CST)
Received: from navgw.hq.iei ([172.16.2.30])hBI8txu2074637
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2003 16:56:00 +0800 (CST)
	(envelope-from kevinliao@iei.com.tw)
Received: (from rdkevinliaonb [172.16.12.6])
 by navgw.hq.iei (SAVSMTP 3.1.1.32) with SMTP id M2003121817002111991
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2003 17:00:21 +0800
Message-ID: <03d301c3c545$650f9080$060c10ac@rdkevinliaonb>
From: "Kevin Liao" <kevinliao@iei.com.tw>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 18 Dec 2003 17:00:32 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Subject: Duplicate the JFFS2 partition on NAND flash with bad blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does anyone know what could be happened for the following conditions:

1. Duplicate one NAND flash (with some JFFS2 partitions and bad blocks) to
another NAND flash (without any bad block)
2. Duplicate one NAND flash (with some JFFS2 partitions but no bad block) to
another NAND flash (with some bad blocks)
3. Duplicate one NAND flash (with some JFFS2 partitions and bad blocks) to
another NAND flash (also with some bad blocks but on different positions)

Can all data and partition information be kept without any problem on the
second NAND flash? Because I have one of the above situations and though the
kernel on both NAND flashes are the same, I can not mount one JFFS2
partition after duplication. Thanks a lot.

Regards,
Kevin
