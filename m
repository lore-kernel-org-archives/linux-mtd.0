Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyqzR-0006Xz-Mq
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:02:26 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 03/10] nandwrite: consolidate buffer usage
Date: Wed, 31 Aug 2011 13:00:32 -0700
Message-ID: <1314820839-7107-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: b35362@freescale.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of using two different output buffers for OOB data, let's just
use the same one for all output. This adds an extra memcpy, but it
simplifies some future work, so it's worth it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 3f70cb3..3eea6e2 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -531,11 +531,12 @@ int main(int argc, char * const argv[])
 							oobreadbuf + start,
 							len);
 				}
+			} else {
+				memcpy(oobbuf, oobreadbuf, mtd.oob_size);
 			}
 			/* Write OOB data first, as ecc will be placed in there */
 			if (mtd_write_oob(mtd_desc, &mtd, fd, mtdoffset,
-						mtd.oob_size,
-						noecc ? oobreadbuf : oobbuf)) {
+						mtd.oob_size, oobbuf)) {
 				sys_errmsg("%s: MTD writeoob failure", mtd_device);
 				goto closeall;
 			}
-- 
1.7.5.4
