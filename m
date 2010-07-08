Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWy4e-0001rv-Gp
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 20:52:01 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>
Subject: [PATCH 1/6] mtd-utils/nanddump.c: Increase max OOB size
Date: Thu, 8 Jul 2010 13:50:04 -0700
Message-ID: <1278622209-20149-2-git-send-email-norris@broadcom.com>
In-Reply-To: <1278622209-20149-1-git-send-email-norris@broadcom.com>
References: <1278622209-20149-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Supported OOB and page sizes can now be changed more easily by a
macro constant. NAND_MAX_OOBSIZE needed increased to support 218
and 224 byte OOB.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 nanddump.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index e44ab36..735ae48 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -174,8 +174,10 @@ static void process_options (int argc, char * const argv[])
 /*
  * Buffers for reading data from flash
  */
-static unsigned char readbuf[4096];
-static unsigned char oobbuf[128];
+#define NAND_MAX_PAGESIZE 4096
+#define NAND_MAX_OOBSIZE 256
+static unsigned char readbuf[NAND_MAX_PAGESIZE];
+static unsigned char oobbuf[NAND_MAX_OOBSIZE];
 
 /*
  * Main program
-- 
1.7.0.4
