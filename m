Received: from xes-mad.com ([216.165.139.220] helo=mail.xes-mad.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMHjM-0003a9-Es
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 18:14:10 +0000
Date: Tue, 5 Dec 2017 12:13:44 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Cc: Joe Schultz <jschultz@xes-inc.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <84804381.386644.1512497624913.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH v2] mtd: spi-nor: Check that BP bits are set properly
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
 drivers/mtd/spi-nor/spi-nor.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

v2: * Removed unnecessary spi_nor_wait_till_ready() call
    * Renamed "new" variable to "status_new"

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bc266f7..c3ee168 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -552,6 +552,27 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 
+/* Write status register and ensure bits in mask match written values */
+static int write_sr_and_check(struct spi_nor *nor, u8 status_new, u8 mask)
+{
+	int ret;
+
+	write_enable(nor);
+	ret = write_sr(nor, status_new);
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
+	return ((ret & mask) != (status_new & mask)) ? -EIO : 0;
+}
+
 static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
@@ -650,7 +671,6 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
-	int ret;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
@@ -714,11 +734,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -735,7 +751,6 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
-	int ret;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
@@ -802,11 +817,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
