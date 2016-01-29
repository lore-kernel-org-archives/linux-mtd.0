Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPEgf-0005bW-H3
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 19:26:30 +0000
Received: by mail-pa0-x243.google.com with SMTP id yy13so3962676pab.1
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 11:26:13 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH v2 4/8] mtd: spi-nor: disallow further writes to SR if WP# is
 low
Date: Fri, 29 Jan 2016 11:25:33 -0800
Message-Id: <1454095537-130536-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
References: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Locking the flash is most useful if it provides real hardware security.
Otherwise, it's little more than a software permission bit.

A reasonable use case that provides real HW security might be like
follows:

(1) hardware WP# is deasserted
(2) program flash
(3) flash range is protected via status register
(4) hardware WP# is asserted
(5) flash protection range can no longer be changed, until WP# is
    deasserted

In this way, flash protection is co-owned by hardware and software.

Now, one would expect to be able to perform step (3) with
ioctl(MEMLOCK), except that the spi-nor driver does not set the Status
Register Protect bit (a.k.a. Status Register Write Disable (SRWD)), so
even though the range is now locked, it does not satisfy step (5) -- it
can still be changed by a call to ioctl(MEMUNLOCK).

So, let's enable status register protection after the first lock
command, and disable protection only when the flash is fully unlocked.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2:
 * added clearing the SRWD bit when unlocking the entire flash

 drivers/mtd/spi-nor/spi-nor.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 68133b949fe5..54eaf4b5bf05 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -540,6 +540,9 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask) | val;
 
+	/* Disallow further writes if WP pin is asserted */
+	status_new |= SR_SRWD;
+
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
 		return 0;
@@ -605,6 +608,10 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_new = (status_old & ~mask) | val;
 
+	/* Don't protect status register if we're fully unlocked */
+	if (lock_len == mtd->size)
+		status_new &= ~SR_SRWD;
+
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
 		return 0;
-- 
2.7.0.rc3.207.g0ac5344
