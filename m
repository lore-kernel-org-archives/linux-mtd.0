Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrMzD-0006vc-2T
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 07:16:35 +0000
Received: by mail-pd0-f181.google.com with SMTP id p10so1957463pdj.26
 for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2013 23:16:13 -0800 (PST)
Date: Fri, 13 Dec 2013 12:46:04 +0530
From: Rashika Kheria <rashika.kheria@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drivers: mtd: Mark function is_erased() as static in
 denali.c
Message-ID: <9a7eb08500c9fae325e5422d64f10cae3d4cf81f.1386912859.git.rashika.kheria@gmail.com>
References: <d0512c2bc35b27af33ad79d74d93ecc0f2b4e92c.1386912859.git.rashika.kheria@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0512c2bc35b27af33ad79d74d93ecc0f2b4e92c.1386912859.git.rashika.kheria@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 josh@joshtriplett.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch marks the function is_erased() as static in denali.c because
it is not used outside this file.

This patch elimiates the following warning in nand/denali.c:
drivers/mtd/nand/denali.c:900:6: warning: no previous prototype for ‘is_erased’ [-Wmissing-prototypes]

Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---
 drivers/mtd/nand/denali.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 370b9dd..3a3a47f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -897,7 +897,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 /* this function examines buffers to see if they contain data that
  * indicate that the buffer is part of an erased region of flash.
  */
-bool is_erased(uint8_t *buf, int len)
+static bool is_erased(uint8_t *buf, int len)
 {
 	int i = 0;
 	for (i = 0; i < len; i++)
-- 
1.7.9.5
