Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMiK-0008ET-74
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 03:20:21 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <david@sigma-star.at>, <dedekind1@gmail.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH] gitignore: add ubifs_dump to gitignore.
Date: Sat, 31 Oct 2015 11:13:01 +0800
Message-ID: <1446261181-10085-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1444881890-4012-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1444881890-4012-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index e1d23cd..04d9251 100644
--- a/.gitignore
+++ b/.gitignore
@@ -45,6 +45,7 @@
 /nor-utils/rfdformat
 /misc-utils/serve_image
 /jffsX-utils/sumtool
+/ubifs-utils/ubifs_dump/ubifs_dump
 
 #
 # Top-level generic files
-- 
1.8.4.2
