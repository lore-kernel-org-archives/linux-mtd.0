Received: from xes-mad.com ([216.165.139.220] helo=mail.xes-mad.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e8qC2-0005KP-Tr
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 16:12:13 +0000
Date: Sun, 29 Oct 2017 11:11:42 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Message-ID: <763349437.151011.1509293502020.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH] mtd: spi-nor: Check that BP bits are set properly
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previously, the lock and unlock functions returned success even if the
BP bits were not actually updated in the status register due to
hardware write protection. Introduce write_sr_and_check() to write and
read back the status register to ensure the desired BP bits are
actually set as requested.

Signed-off-by: Joe Schultz <jschultz@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 19c00072..8a87bd1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -550,6 +550,31 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 
+/* Write status register and ensure bits in mask match written values */
+static int write_sr_and_check(struct spi_nor *nor, u8 new, u8 mask)
+{
+	int ret;
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	write_enable(nor);
+	ret = write_sr(nor, new);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	ret = read_sr(nor);
+	if (ret < 0)
+		return ret;
+
+	return ((ret & mask) != (new & mask)) ? -EIO : 0;
+}
+
 static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
@@ -648,7 +673,6 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
-	int ret;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
@@ -712,11 +736,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if ((status_new & mask) < (status_old & mask))
 		return -EINVAL;
 
-	write_enable(nor);
-	ret = write_sr(nor, status_new);
-	if (ret)
-		return ret;
-	return spi_nor_wait_till_ready(nor);
+	return write_sr_and_check(nor, status_new, mask);
 }
 
 /*
@@ -733,7 +753,6 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
-	int ret;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
@@ -800,11 +819,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if ((status_new & mask) > (status_old & mask))
 		return -EINVAL;
 
-	write_enable(nor);
-	ret = write_sr(nor, status_new);
-	if (ret)
-		return ret;
-	return spi_nor_wait_till_ready(nor);
+	return write_sr_and_check(nor, status_new, mask);
 }
 
 /*
-- 
2.7.4
