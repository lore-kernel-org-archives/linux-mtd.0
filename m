Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eE8of-0003Kf-43
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 07:05:58 +0000
Received: by mail-yw0-x241.google.com with SMTP id t11so12629142ywg.12
 for <linux-mtd@lists.infradead.org>; Sun, 12 Nov 2017 23:05:36 -0800 (PST)
MIME-Version: 1.0
From: Rock Lee <rockdotlee@gmail.com>
Date: Mon, 13 Nov 2017 15:05:34 +0800
Message-ID: <CAL-1w2tFYphS=sh=EccVr8buxb6FRRdYRZjEfL=YoRhffWZ2YQ@mail.gmail.com>
Subject: [PATCH] libmtd: fix a comment typo in dev_node2num
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at, Rock Lee <rockdotlee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Rock Lee <rockdotlee@gmail.com>
---
 lib/libmtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 1ecb31b..86c89ae 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -422,7 +422,7 @@ static int type_str2int(const char *str)
 }

 /**
- * dev_node2num - find UBI device number by its character device node.
+ * dev_node2num - find MTD device number by its character device node.
  * @lib: MTD library descriptor
  * @node: name of the MTD device node
  * @mtd_num: MTD device number is returned here
-- 
1.9.1
