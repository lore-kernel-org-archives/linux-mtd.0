Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcVK2-00024Q-Us
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 02:50:38 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o132oU0A016363
	for <linux-mtd@lists.infradead.org>;
	Tue, 2 Feb 2010 18:50:30 -0800 (PST)
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] check if the start address is page-aligned.
Date: Wed,  3 Feb 2010 10:56:33 +0800
Message-Id: <1265165796-24686-3-git-send-email-stanley.miao@windriver.com>
In-Reply-To: <1265165796-24686-2-git-send-email-stanley.miao@windriver.com>
References: <1265165796-24686-1-git-send-email-stanley.miao@windriver.com>
	<1265165796-24686-2-git-send-email-stanley.miao@windriver.com>
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
 nandwrite.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index c66eda0..c66ab54 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -248,6 +248,13 @@ int main(int argc, char * const argv[])
 		exit (EXIT_FAILURE);
 	}
 
+	if (mtdoffset & (meminfo.writesize - 1)) {
+		fprintf(stderr, "The start address is not page-aligned !\n"
+				"The pagesize of this NAND Flash is 0x%x.\n",
+				meminfo.writesize);
+		close(fd);
+		exit(EXIT_FAILURE);
+	}
 
 	oob.length = meminfo.oobsize;
 	oob.ptr =  oobbuf;
-- 
1.5.4.3
