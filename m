Received: from oxygenium.servers.drkhsh.at ([5.9.5.62])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1df26I-0007qH-4q
 for linux-mtd@lists.infradead.org; Tue, 08 Aug 2017 10:51:03 +0000
Received: by oxygenium.servers.drkhsh.at (OpenSMTPD) with ESMTP id cb791cd0
 for <linux-mtd@lists.infradead.org>;
 Tue, 8 Aug 2017 12:50:28 +0200 (CEST)
From: Aaron Marcher <me@drkhsh.at>
To: linux-mtd@lists.infradead.org
Cc: aaron marcher <me@drkhsh.at>
Subject: [PATCH] mtd-utils: ubinfo, add parameter check
Date: Tue,  8 Aug 2017 12:50:28 +0200
Message-Id: <20170808105028.11758-1-me@drkhsh.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: aaron marcher <me@drkhsh.at>

without specifying the UBI device number, ubinfo with the volume name
parameter returns an error that it cannot find the specified volume on
ubi-1. -1 comes from the default value of devn used for internal checks.
i added a check to fix this behaviour and print out an error message
instead.
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
