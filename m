Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SAI9p-0000B4-PG
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2012 09:48:42 +0000
Received: by pbcun4 with SMTP id un4so777630pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2012 02:48:39 -0700 (PDT)
Subject: [PATCH] mtd: phram: fix section mismatch for phram_setup
From: Ryosuke Saito <raitosyo@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Mar 2012 18:47:47 +0900
Message-ID: <1332323267.14283.13.camel@HDL00099>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, h-fache@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

phram_setup() is only called from init_phram() which is in .init.text,
so it must be in the same section to avoid a section mismatch warning.

Signed-off-by: Ryosuke Saito <raitosyo@gmail.com>
---
 drivers/mtd/devices/phram.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 3d91ace..67823de 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -215,7 +215,7 @@ static inline void kill_final_newline(char *str)
  */
 static __initdata char phram_paramline[64+12+12];
 
-static int phram_setup(const char *val)
+static int __init phram_setup(const char *val)
 {
 	char buf[64+12+12], *str = buf;
 	char *token[3];
-- 
1.7.3.4
