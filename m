Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F1w4y-0004s4-2y
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2006 20:37:44 -0500
Received: from ep_mmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ITO004R1F6MID@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 26 Jan 2006 10:37:34 +0900 (KST)
Received: from july7 ([10.88.163.199])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPA id <0ITO00KYGF6MGM@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 26 Jan 2006 10:37:34 +0900 (KST)
Date: Thu, 26 Jan 2006 10:37:35 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0ITO00KYHF6MGM@mmp2.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Subject: [PATCH] OneNAND: write oob with oobsize to prevent byte access
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

There's some problem with write oob in serveral platform.
So we write oob with oobsize aligned (16bytes) instead of 3 bytes (from {2,
3})

If you don't mind I will commit this with write oob verify patch from Jarkko
Lavinen

Regards,
Kyungmin Park

Index: drivers/mtd/onenand/onenand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/onenand/onenand_base.c,v
retrieving revision 1.15
diff -u -p -r1.15 onenand_base.c
--- drivers/mtd/onenand/onenand_base.c	20 Jan 2006 15:29:28 -0000	1.15
+++ drivers/mtd/onenand/onenand_base.c	26 Jan 2006 01:29:00 -0000
@@ -936,8 +936,11 @@ static int onenand_write_oob(struct mtd_
 
 		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, mtd->oobsize);
 
-		this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0,
mtd->oobsize);
-		this->write_bufferram(mtd, ONENAND_SPARERAM, buf, column,
thislen);
+		/* We send data to spare ram with oobsize
+		 * to prevent byte access */
+		memset(this->page_buf, 0xff, mtd->oobsize);
+		memcpy(this->page_buf + column, buf, thislen);
+		this->write_bufferram(mtd, ONENAND_SPARERAM, this->page_buf,
0, mtd->oobsize);
 
 		this->command(mtd, ONENAND_CMD_PROGOOB, to, mtd->oobsize);
 
