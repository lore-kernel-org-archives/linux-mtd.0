Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XofD8-0007Ch-KM
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 21:12:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd-www: UBI: Fastmap: Fix typo
Date: Wed, 12 Nov 2014 22:11:45 +0100
Message-Id: <1415826705-7510-2-git-send-email-richard@nod.at>
In-Reply-To: <1415826705-7510-1-git-send-email-richard@nod.at>
References: <1415826705-7510-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a missing "a".

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 doc/ubi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index 4bded98..5cb1603 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -1238,7 +1238,7 @@ from it.</p>
 
 <ol>
 	<li>UBI tries to find the fastmap anchor PEB,
-	if no anchor PEB was found UBI performs  traditional full scan</li>
+	if no anchor PEB was found UBI performs a traditional full scan</li>
 	<li>It follows the pointers stored in the anchor PEB and reads
 	the fastmap payload data</li>
 	<li>Then it performs a traditional scan only on PEBs in the pool
-- 
2.1.0
