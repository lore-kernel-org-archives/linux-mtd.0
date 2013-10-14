Message-ID: <525C4879.4030705@infradead.org>
Date: Mon, 14 Oct 2013 12:39:37 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
To: Thierry Reding <thierry.reding@gmail.com>,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH -next] staging/mt29f_spinand: fix build error when ONDIEECC
 not enabled
References: <1381762088-18880-1-git-send-email-treding@nvidia.com>
In-Reply-To: <1381762088-18880-1-git-send-email-treding@nvidia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Mona Anonuevo <manonuevo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build error when CONFIG_MTD_SPINAND_ONDIEECC is not enabled
by moving an inline function outside of that #ifdef block.

drivers/staging/mt29f_spinand/mt29f_spinand.c: In function 'spinand_read_byte':
drivers/staging/mt29f_spinand/mt29f_spinand.c:665:9: error: implicit declaration of function 'mtd_to_state' [-Werror=implicit-function-declaration]
drivers/staging/mt29f_spinand/mt29f_spinand.c:665:32: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/staging/mt29f_spinand/mt29f_spinand.c: In function 'spinand_write_buf':
drivers/staging/mt29f_spinand/mt29f_spinand.c:700:32: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/staging/mt29f_spinand/mt29f_spinand.c: In function 'spinand_read_buf':
drivers/staging/mt29f_spinand/mt29f_spinand.c:707:32: warning: initialization makes pointer from integer without a cast [enabled by default]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mona Anonuevo <manonuevo@micron.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- next-2013-1014.orig/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ next-2013-1014/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -28,9 +28,6 @@
 /*
  * OOB area specification layout:  Total 32 available free bytes.
  */
-#ifdef CONFIG_MTD_SPINAND_ONDIEECC
-static int enable_hw_ecc;
-static int enable_read_hw_ecc;
 
 static inline struct spinand_state *mtd_to_state(struct mtd_info *mtd)
 {
@@ -41,6 +38,10 @@ static inline struct spinand_state *mtd_
 	return state;
 }
 
+#ifdef CONFIG_MTD_SPINAND_ONDIEECC
+static int enable_hw_ecc;
+static int enable_read_hw_ecc;
+
 static struct nand_ecclayout spinand_oob_64 = {
 	.eccbytes = 24,
 	.eccpos = {
