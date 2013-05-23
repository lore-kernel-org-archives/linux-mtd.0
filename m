From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH RESEND] mtd: mtdchar: Exit write loop when hitting end of OTP
 memory
Date: Thu, 23 May 2013 11:56:11 +0200
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <924bb94e-8254-46b8-8942-2d5de8ab2985@mary.at.omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a write to one time programmable memory (OTP) hits the end
of this memory area, no more data can be written and count does not
decrease anymore. We are trapped in the loop forever.

Therefore drop the remaining data if retlen != len.

Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
---
 drivers/mtd/mtdchar.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e0e59bf..70c18c2 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -321,6 +321,10 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 		case MTD_FILE_MODE_OTP_USER:
 			ret = mtd_write_user_prot_reg(mtd, *ppos, len,
 						      &retlen, kbuf);
+
+			/* if we hit the end of otp memory, drop the rest */
+			if (retlen != len)
+				count -= len - retlen;
 			break;
 
 		case MTD_FILE_MODE_RAW:
-- 
1.7.9.5
