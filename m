Received: from mailrelay101.isp.belgacom.be ([195.238.20.128])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtNPO-0003cx-4T
 for linux-mtd@lists.infradead.org; Fri, 15 May 2015 21:44:43 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/6 linux-next] ubifs: remove unnecessary else after break
Date: Fri, 15 May 2015 23:43:59 +0200
Message-Id: <1431726240-4675-5-git-send-email-fabf@skynet.be>
In-Reply-To: <1431726240-4675-1-git-send-email-fabf@skynet.be>
References: <1431726240-4675-1-git-send-email-fabf@skynet.be>
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

else is not needed after break in dbg_check_old_index()
This also solves the {} parity.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/commit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 63f5661..dd9ba81 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -680,9 +680,9 @@ int dbg_check_old_index(struct ubifs_info *c, struct ubifs_zbranch *zroot)
 				if (iip + 1 < le16_to_cpu(idx->child_cnt)) {
 					iip = iip + 1;
 					break;
-				} else
-					/* Nope, so go up again */
-					iip = i->iip;
+				}
+				/* Nope, so go up again */
+				iip = i->iip;
 			}
 		} else
 			/* Go down left */
-- 
2.4.0
