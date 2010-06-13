Received: from relay03.digicable.hu ([92.249.128.185])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ONiD8-00077M-Mc
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 08:06:32 +0000
Received: from [94.21.195.194] by relay03.digicable.hu with esmtpa
	id 1ONiCJ-00018Q-U6 for <linux-mtd@lists.infradead.org>;
	Sun, 13 Jun 2010 10:05:40 +0200
Message-ID: <4C149152.9090501@freemail.hu>
Date: Sun, 13 Jun 2010 10:05:38 +0200
From: =?UTF-8?B?TsOpbWV0aCBNw6FydG9u?= <nm127@freemail.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fix typo in FAQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Márton Németh <nm127@freemail.hu>
---
diff --git a/faq/general.xml b/faq/general.xml
index 1c0551f..be1a0d4 100644
--- a/faq/general.xml
+++ b/faq/general.xml
@@ -225,7 +225,7 @@ release the chip again.
 Some NOR chips power on with all of the eraseblocks in a locked state.
 The MTD layer doesn't unlock these devices by default. If you are accessing
 these devices from user-space, you can use the <CODE>flash_unlock</CODE> tool to
-unlock the MTD device(s). If you are using the MTD device as aw rite-able root
+unlock the MTD device(s). If you are using the MTD device as a write-able root
 file-system you will either need to have the boot loader unlock the eraseblocks
 before booting the kernel, or add code to the MTD map driver for your board to
 unlock them.
