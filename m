Received: from mordell.elzevir.fr ([2001:4b98:dc0:41:216:3eff:feeb:c406])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDsXG-0005lo-9h
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2015 11:33:51 +0000
From: =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>
To: kamlakant.patel@broadcom.com
Cc: gregkh@linuxfoundation.org, manonuevo@micron.com,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>
Subject: [PATCH 4/4] staging: mt29f: fix usage of coma operator
Date: Tue, 29 Dec 2015 12:32:22 +0100
Message-Id: <1451388742-22964-4-git-send-email-mpg@elzevir.fr>
In-Reply-To: <1451388742-22964-1-git-send-email-mpg@elzevir.fr>
References: <1451388742-22964-1-git-send-email-mpg@elzevir.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using the coma operator for multiple assignments is unnecessary and just looks
weird here.

Signed-off-by: Manuel Pégourié-Gonnard <mpg@elzevir.fr>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index a1baad110477..13208ee3e57c 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -223,11 +223,11 @@ static int spinand_set_otp(struct spi_device *spi_nand, u8 *otp)
 	int retval;
 	struct spinand_cmd cmd = {0};
 
-	cmd.cmd = CMD_WRITE_REG,
-	cmd.n_addr = 1,
-	cmd.addr[0] = REG_OTP,
-	cmd.n_tx = 1,
-	cmd.tx_buf = otp,
+	cmd.cmd = CMD_WRITE_REG;
+	cmd.n_addr = 1;
+	cmd.addr[0] = REG_OTP;
+	cmd.n_tx = 1;
+	cmd.tx_buf = otp;
 
 	retval = spinand_cmd(spi_nand, &cmd);
 	if (retval < 0)
-- 
2.6.4
