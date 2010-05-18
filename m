Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OELfN-00050b-CN
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 12:12:58 +0000
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] check if the start address is page-aligned.
Date: Tue, 18 May 2010 20:23:10 +0800
Message-Id: <1274185390-3066-3-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1274185390-3066-2-git-send-email-stanley.miao@windriver.com>
References: <1274185390-3066-1-git-send-email-stanley.miao@windriver.com>
	<1274185390-3066-2-git-send-email-stanley.miao@windriver.com>
Cc: yaffs@lists.aleph1.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Only page-aligned address is permitted in NAND subsystem.

Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
---
 nandwrite.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 1e30ad1..fbb1153 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -306,6 +306,14 @@ int main(int argc, char * const argv[])
 		close(fd);
 		exit (EXIT_FAILURE);
 	}
+	
+	if (mtdoffset & (meminfo.writesize - 1)) {
+		fprintf(stderr, "The start address is not page-aligned !\n"
+				"The pagesize of this NAND Flash is 0x%x.\n",
+				meminfo.writesize);
+		close(fd);
+		exit(EXIT_FAILURE);
+	}
 
 	if (autoplace) {
 		/* Read the current oob info */
-- 
1.5.4.3
