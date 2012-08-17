Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2NzY-00088W-Eb
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 14:57:41 +0000
Received: by wibhn17 with SMTP id hn17so1331893wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2012 07:57:38 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/4] sync include/mtd/ubi-user.h: DROP CONFIG_MTD_UBI_BEB_LIMIT
Date: Fri, 17 Aug 2012 16:57:21 +0200
Message-Id: <1345215442-19082-4-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345215442-19082-1-git-send-email-richard.genoud@gmail.com>
References: <1345215442-19082-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 include/mtd/ubi-user.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 32771cf..44720d3 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -259,8 +259,8 @@ enum {
  * If the device has more bad eraseblocks than this limit, UBI does not reserve
  * any physical eraseblocks for new bad eraseblocks, but attempts to use
  * available eraseblocks (if any).
- * The accepted range is 0-255. If 0 is given, the default kernel config value
- * CONFIG_MTD_UBI_BEB_LIMIT will be used for compatibility.
+ * The accepted range is 0-255. If 0 is given, the default value
+ * MTD_UBI_DEFAULT_BEB_LIMIT will be used for compatibility.
  */
 struct ubi_attach_req {
 	__s32 ubi_num;
-- 
1.7.2.5
