Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkKP-0000Tj-Cr
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:45:30 -0500
Date: Tue, 21 Dec 2004 14:45:11 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221134511.GK22636@wohnheim.fh-wedel.de>
References: <20041218161923.GD1083@wohnheim.fh-wedel.de>
	<1103391155.10788.13.camel@squizzey.bult.co.uk>
	<20041218175222.GB4147@wohnheim.fh-wedel.de>
	<20041218181100.GD4147@wohnheim.fh-wedel.de>
	<1103402930.10792.20.camel@squizzey.bult.co.uk>
	<20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
	<20041221134120.GH22636@wohnheim.fh-wedel.de>
	<20041221134258.GI22636@wohnheim.fh-wedel.de>
	<20041221134408.GJ22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221134408.GJ22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/22] Remove gcc warnings
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Name sais enough.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_prototypes	2004-12-20 18:57:18.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 19:00:27.000000000 +0100
@@ -150,7 +150,7 @@
 	int	offset 	= to & ~PAGE_MASK;	// page offset
 	//
 
-	static int my_read()
+	static int my_read(void)
 	{
 		err=0;
 		page = page_readahead(mapping,index);
@@ -163,7 +163,7 @@
 		return err;
 	}
 	//
-	static int my_erase()
+	static int my_erase(void)
 	{
 		int pages = len >> PAGE_SHIFT;
 		unsigned char *p;
@@ -198,7 +198,7 @@
 		return 0;
 	}
 
-	static int my_write()
+	static int my_write(void)
 	{
 		int cpylen;
 
@@ -240,6 +240,7 @@
 	return err;
 }
 
+
 /* erase a specified part of the device */
 static int blkmtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
