Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OY92s-0003vI-4p
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2010 02:47:02 +0000
Received: by iwn40 with SMTP id 40so4809777iwn.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Jul 2010 19:47:00 -0700 (PDT)
Message-ID: <4C3A8220.6040707@gmail.com>
Date: Sun, 11 Jul 2010 21:46:56 -0500
From: Neal B <nealb001@gmail.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com
Subject: [PATCH 1/6] Mtd: fixed coding style indent errors
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: maximlevitsky@gmail.com, cascardo@holoscopio.com,
	linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>,
	linux-mtd@lists.infradead.org, jkosina@suse.cz,
	mohanlaljangir@gmail.com, rmk+kernel@arm.linux.org.uk, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 From f4301b9c13f65d173d67759d53acaf3e8d2331c6 Mon Sep 17 00:00:00 2001
From: Neal Buckendahl <nealb001@gmail.com>
Date: Sun, 11 Jul 2010 16:58:24 -0500
Subject: [PATCH 1/6] Mtd: fixed coding style indent errors found by the 
checkpatch.pl tool
  Signed-off-by: Neal Buckendahl <nealb001@gmail.com>

---
  drivers/mtd/afs.c |    4 ++--
  1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index cec7ab9..2bea681 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -162,8 +162,8 @@ afs_read_iis(struct mtd_info *mtd, struct 
image_info_struct *iis, u_int ptr)
  }

  static int parse_afs_partitions(struct mtd_info *mtd,
-                         struct mtd_partition **pparts,
-                         unsigned long origin)
+			struct mtd_partition **pparts,
+			unsigned long origin)
  {
  	struct mtd_partition *parts;
  	u_int mask, off, idx, sz;
-- 
1.7.1
