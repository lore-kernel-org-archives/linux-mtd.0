Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMygr-0004mI-TW
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 08:02:26 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/8] nanddump: choose correct "printf" format-specifier
Date: Mon, 29 Nov 2010 00:02:00 -0800
Message-ID: <1291017722-23985-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd-descriptor attributes contain signed data, not unsigned.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 96b46d4..0e393cc 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -381,7 +381,7 @@ int main(int argc, char * const argv[])
 
 	/* Print informative message */
 	if (!quiet) {
-		fprintf(stderr, "Block size %u, page size %u, OOB size %u\n",
+		fprintf(stderr, "Block size %d, page size %d, OOB size %d\n",
 				mtd.eb_size, mtd.min_io_size, mtd.oob_size);
 		fprintf(stderr,
 				"Dumping data starting at 0x%08llx and ending at 0x%08llx...\n",
-- 
1.7.0.4
