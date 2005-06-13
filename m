Received: from atlantis.8hz.com ([212.129.237.78])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DhmUN-0005da-Sw
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 06:48:21 -0400
Received: from atlantis.8hz.com (localhost [127.0.0.1])
	by atlantis.8hz.com (Postfix) with ESMTP id 89555BB94
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Jun 2005 12:48:18 +0200 (CEST)
Received: (from sean@localhost)
	by atlantis.8hz.com (8.13.1/8.13.1/Submit) id j5DAmIlB024626
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jun 2005 12:48:18 +0200 (CEST) (envelope-from sean)
Date: Mon, 13 Jun 2005 12:48:18 +0200
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20050613104818.GB24387@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: inftl major number
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to Documentation/devices.txt and 
http://www.lanana.org/docs/device-list/devices-2.6+.txt the major number 
of the inftl is 96; however the driver uses 94. 94 is already in use by 
another driver (IBM S/390 DASD block storage). Can this by applied?


Sean

diff -u -r1.6 inftl.h
--- include/linux/mtd/inftl.h   30 Jun 2004 14:49:00 -0000      1.6
+++ include/linux/mtd/inftl.h   13 Jun 2005 10:47:19 -0000
@@ -20,7 +20,7 @@
 #include <mtd/inftl-user.h>

 #ifndef INFTL_MAJOR
-#define INFTL_MAJOR 94
+#define INFTL_MAJOR 96
 #endif
 #define INFTL_PARTN_BITS 4
