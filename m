Received: from dns.possio.com ([62.95.65.150] helo=master.possio.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JYyu-0007jn-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 12:50:24 +0000
Received: from [62.95.65.76] by master.possio.com (NTMail 7.00.0018/NT0065.00.5d386785) with ESMTP id hxwnaaaa for linux-mtd@lists.infradead.org; Wed, 4 Dec 2002 14:20:58 +0100
Message-ID: <3DEE00AD.4B682401@possio.com>
Date: Wed, 04 Dec 2002 14:18:37 +0100
From: Stefan Thomasson <stefan.thomasson@possio.com>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Bug in part_read_fact_prot_reg 
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>



diff -urp mtd/drivers/mtd/mtdpart.c mtd_new/drivers/mtd/mtdpart.c
--- mtd/drivers/mtd/mtdpart.c   Mon Oct 21 15:40:05 2002
+++ mtd_new/drivers/mtd/mtdpart.c       Wed Dec  4 14:09:33 2002
@@ -113,7 +113,7 @@ static int part_read_fact_prot_reg (stru
                        size_t *retlen, u_char *buf)
 {
        struct mtd_part *part = PART(mtd);
-       return part->master->read_user_prot_reg (part->master, from,
+       return part->master->read_fact_prot_reg (part->master, from,
                                        len, retlen, buf);
 }
