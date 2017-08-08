Received: from oxygenium.servers.drkhsh.at ([5.9.5.62])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1df295-0000FI-0Q
 for linux-mtd@lists.infradead.org; Tue, 08 Aug 2017 10:53:56 +0000
Received: by oxygenium.servers.drkhsh.at (OpenSMTPD) with ESMTP id 9ee81ca2
 for <linux-mtd@lists.infradead.org>;
 Tue, 8 Aug 2017 12:53:33 +0200 (CEST)
From: Aaron Marcher <me@drkhsh.at>
To: linux-mtd@lists.infradead.org
Cc: Aaron Marcher <me@drkhsh.at>
Subject: [PATCH v2] mtd-utils: ubinfo: add parameter check
Date: Tue,  8 Aug 2017 12:53:27 +0200
Message-Id: <20170808105327.11905-1-me@drkhsh.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adds a check if the UBI device number is specified when passing a volume
name as parameter.

This fixes an issue, where by default an inexistent UBI device named
"ubi-1" is selected because of missing checks.

Signed-off-by: Aaron Marcher <me@drkhsh.at>
---
 ubi-utils/ubinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ubi-utils/ubinfo.c b/ubi-utils/ubinfo.c
index 82d4f18..29530be 100644
--- a/ubi-utils/ubinfo.c
+++ b/ubi-utils/ubinfo.c
@@ -399,6 +399,12 @@ int main(int argc, char * const argv[])
 			goto out_libubi;
 	}
 
+	if (args.vol_name && args.devn == -1) {
+		errmsg("volume name is specified, but UBI device number is not "
+			   "(use -h for help)\n");
+		goto out_libubi;
+	}
+
 	if (args.vol_name) {
 		err = get_vol_id_by_name(libubi, args.devn, args.vol_name);
 		if (err)
-- 
2.14.0
