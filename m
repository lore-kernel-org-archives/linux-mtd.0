Received: from mailrelay101.isp.belgacom.be ([195.238.20.128])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtNPL-0003cx-Cp
 for linux-mtd@lists.infradead.org; Fri, 15 May 2015 21:44:40 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/6 linux-next] ubifs: remove unnecessary semi-colon
Date: Fri, 15 May 2015 23:43:55 +0200
Message-Id: <1431726240-4675-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

semi-colon after case is unneeded.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/sb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index f4fbc7b..50be857 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -586,7 +586,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
 		c->key_hash = key_test_hash;
 		c->key_hash_type = UBIFS_KEY_HASH_TEST;
 		break;
-	};
+	}
 
 	c->key_fmt = sup->key_fmt;
 
-- 
2.4.0
