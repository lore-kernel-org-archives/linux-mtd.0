Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TYGgR-0005gr-IY
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2012 13:37:48 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so4642430pad.36
 for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2012 05:37:43 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH v3 05/11] ubifs: use prandom_bytes
Date: Tue, 13 Nov 2012 22:37:04 +0900
Message-Id: <1352813830-4624-6-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1352813830-4624-1-git-send-email-akinobu.mita@gmail.com>
References: <1352813830-4624-1-git-send-email-akinobu.mita@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Akinobu Mita <akinobu.mita@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This also converts filling memory loop to use memset.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
---
* v3
- rename random32_get_bytes to prandom_bytes

 fs/ubifs/debug.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 6291163..12817ff 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2560,7 +2560,7 @@ static int power_cut_emulated(struct ubifs_info *c, int lnum, int write)
 static int corrupt_data(const struct ubifs_info *c, const void *buf,
 			unsigned int len)
 {
-	unsigned int from, to, i, ffs = chance(1, 2);
+	unsigned int from, to, ffs = chance(1, 2);
 	unsigned char *p = (void *)buf;
 
 	from = random32() % (len + 1);
@@ -2571,11 +2571,9 @@ static int corrupt_data(const struct ubifs_info *c, const void *buf,
 		   ffs ? "0xFFs" : "random data");
 
 	if (ffs)
-		for (i = from; i < to; i++)
-			p[i] = 0xFF;
+		memset(p + from, 0xFF, to - from);
 	else
-		for (i = from; i < to; i++)
-			p[i] = random32() % 0x100;
+		prandom_bytes(p + from, to - from);
 
 	return to;
 }
-- 
1.7.11.7
