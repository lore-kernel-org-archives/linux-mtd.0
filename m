Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZwR-00059D-PQ
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:50:12 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 11/12] mtd: kill old field for `struct mtd_info_user'
Date: Tue, 30 Aug 2011 18:45:46 -0700
Message-ID: <1314755147-17756-12-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ecctype and eccsize fields have been obsolete for a while. Since they
don't have any users, we can kill them and leave padding in their place
for now.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c |    4 ++--
 include/mtd/mtd-abi.h |    5 +----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 1547e2a..8feb5fd 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -672,8 +672,8 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		info.erasesize	= mtd->erasesize;
 		info.writesize	= mtd->writesize;
 		info.oobsize	= mtd->oobsize;
-		/* The below fields are obsolete */
-		info.ecctype	= -1;
+		/* The below field is obsolete */
+		info.padding	= 0;
 		if (copy_to_user(argp, &info, sizeof(struct mtd_info_user)))
 			return -EFAULT;
 		break;
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index d54ccf3..8138767 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -129,10 +129,7 @@ struct mtd_info_user {
 	__u32 erasesize;
 	__u32 writesize;
 	__u32 oobsize;	/* Amount of OOB data per block (e.g. 16) */
-	/* The below two fields are obsolete and broken, do not use them
-	 * (TODO: remove at some point) */
-	__u32 ecctype;
-	__u32 eccsize;
+	__u64 padding;	/* Old obsolete field; do not use */
 };
 
 struct region_info_user {
-- 
1.7.5.4
