Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3Qnc-0007Hc-Vm
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 12:09:41 +0000
Received: by mail-wi0-f169.google.com with SMTP id hm2so3052970wib.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 05:09:40 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2 3/7] UBI: accept empty string for vid_hdr_offs parameter
Date: Mon, 20 Aug 2012 14:09:17 +0200
Message-Id: <1345464561-24464-4-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345464561-24464-1-git-send-email-richard.genoud@gmail.com>
References: <1345464561-24464-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

as a new parameter (max_beb_per1024) will come in next patches, it's
better to accept empty string value so that we can do:
mtd.ubi=2,,25

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/build.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 3c0b91f..cc0a4fa 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1292,7 +1292,11 @@ static int __init bytes_str_to_int(const char *str)
 	unsigned long result;
 
 	result = simple_strtoul(str, &endp, 0);
-	if (str == endp || result >= INT_MAX) {
+	if (str == endp)
+		/* empty string, assume it's 0 */
+		return 0;
+
+	if (result >= INT_MAX) {
 		printk(KERN_ERR "UBI error: incorrect bytes count: \"%s\"\n",
 		       str);
 		return -EINVAL;
-- 
1.7.2.5
