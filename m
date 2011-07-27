Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qlvnu-00078M-Ph
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2011 04:33:07 +0000
Received: by vws8 with SMTP id 8so1012461vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2011 21:33:02 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] UBI FAQ: correct link
Date: Wed, 27 Jul 2011 00:32:55 -0400
Message-Id: <1311741176-8850-2-git-send-email-mlcreech@gmail.com>
In-Reply-To: <1311741176-8850-1-git-send-email-mlcreech@gmail.com>
References: <1311741176-8850-1-git-send-email-mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 faq/ubi.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/faq/ubi.xml b/faq/ubi.xml
index 6ddb23c..294403a 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -439,7 +439,7 @@ reboots.</p>
 
 <p>Yes, it may, as long as the flash is supported by the MTD layer. UBI does
 not use OOB and it requires data to be written sequentially (see
-<a href="ubi.html#L_mlc">here</a>). UBI guarantees that the difference
+<a href="ubi.html#L_restrict">here</a>). UBI guarantees that the difference
 between maximum and minimum erase-counters is withing certain threshold,
 which is 4096 by default. Since MLC flashes have quite low eraseblock
 life-cycle (about 1000-10000, unlike 100000-1000000 for SLC NAND and NOR
-- 
1.7.4.1
