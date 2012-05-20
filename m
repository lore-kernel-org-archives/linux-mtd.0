Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SW4Ws-0001Qb-R2
 for linux-mtd@lists.infradead.org; Sun, 20 May 2012 11:42:31 +0000
Date: Sun, 20 May 2012 13:42:29 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [patch] UBI: add in hex the value for UBI_INTERNAL_VOL_START to
 comment
Message-ID: <alpine.DEB.2.00.1205201340410.26953@eristoteles.iwoars.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Explicitly provide the first internal volume ID value in the comment for
UBI_INTERNAL_VOL_START. This allows developers who, when adding features
related to volume ids and observe unexpected very large volume ids, to grep
for the observed value in the source code and find out immediately that it is
expected behaviour.

Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>
---
 drivers/mtd/ubi/ubi-media.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 6fb8ec2..9dab25d 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -298,8 +298,8 @@ struct ubi_vid_hdr {
 #define UBI_INT_VOL_COUNT 1

 /*
- * Starting ID of internal volumes. There is reserved room for 4096 internal
- * volumes.
+ * Starting ID of internal volumes: 0x7fffefff.
+ * There is reserved room for 4096 internal volumes.
  */
 #define UBI_INTERNAL_VOL_START (0x7FFFFFFF - 4096)

-- 
1.7.5.4
