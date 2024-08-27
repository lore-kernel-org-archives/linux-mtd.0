Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB90C5472F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2024 17:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFnNBBB1CxkpGNmsiLLWEHi5/jp5qWAAOxp5zNCdwo0=; b=tZp9BVhjVAdtQ3
	yIV6WXr2/Ku0Rh2LLh7hLhaXrpXH34UIhWG2kVdSumauwPZUidqOwYz/o9uir7VGPGaL35QuaqJ0p
	XrBxE2jgEDPxSfT2nMIZYWgbQ2Mmj+q5hzQGBVxpjzBhDQ5QbyQd4ObtV/iYOe869O5TAh1d3izLo
	0UsvVHMqy9DTidPRM1bIHk+vPIKdQ6vAM4rCiF1PiVk7BNcv6w8RE5KahyYArzjBEkxD06U9gMVWm
	L3fMYeXnW1azJ6ZTZiG+kB7priu3eIxMptU97p2jU6dIh/VXRI/u4QzGmDZbQk9uxSspjln+/Xp8V
	l05c7jyLOK5UrW3Y3SLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0Ke-0000000CMkZ-2PGh;
	Tue, 27 Aug 2024 17:50:16 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0KE-0000000CMYs-2Pcm
	for linux-mtd@lists.infradead.org;
	Tue, 27 Aug 2024 17:50:15 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 88B2710000B;
	Tue, 27 Aug 2024 20:49:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 88B2710000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1724780983;
	bh=/PdmQDr5X1ZUQQlzbIxZZmM5eEFyv/yRCGrGua+f4yo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=CH+kaEbobj88qM+2tenLDUgfXp4zIIbrR/ZF3PqYS8sw64pZaHbUBU9WcxhuoPFCF
	 52QPPXXyRnxrvUkZs3jCVzn+RWg9esVrqCZsB5F1PH9OlFiFfOTJkd+L19PzFpAkNZ
	 xklyQzoVE3CGvwfs/4anXbWvPJjF0xyGC63gAummuCru2OuiMyziP8dnl8l/aAf6s4
	 YmKi7fbuTcHDo0yWPLwTiqXUk/rs1XSOOcpiim9MAgUr/P+CqbPZ56QfV+LHpTd6yY
	 vnbgNqRZV4OTsugVCjO09l4fCFjU3/ifrRmhVoD+6J7ZwjwmcuX0xyF+3LSn8ebgDb
	 tF7/bXkiftX9Q==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 27 Aug 2024 20:49:43 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Michael Walle <michael@walle.cc>, "Mark
 Brown" <broonie@kernel.org>, Chia-Lin Kao <acelan.kao@canonical.com>, "Md
 Sadre Alam" <quic_mdalam@quicinc.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Sridharan S N <quic_sridsn@quicinc.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v2 4/5] mtd: spinand: micron: OTP access for MT29F2G01ABAGD
Date: Tue, 27 Aug 2024 20:49:02 +0300
Message-ID: <20240827174920.316756-5-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
References: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.129.118]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187372 [Aug 27 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 27 0.3.27 71302da218a62dcd84ac43314e19b5cc6b38e0b6, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/08/27 16:21:00 #26445643
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_104951_554530_52B4B1D7 
X-CRM114-Status: GOOD (  18.42  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Support for OTP area access on Micron MT29F2G01ABAGD chip.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/micron.c | 117 +++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 8d741be6d5f3e..a538409db4ccd 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
+#include <linux/spi/spi-mem.h>
 
 #define SPINAND_MFR_MICRON		0x2c
 
@@ -28,6 +29,16 @@
 
 #define MICRON_SELECT_DIE(x)	((x) << 6)
 
+#define MICRON_MT29F2G01ABAGD_OTP_PAGES			12
+#define MICRON_MT29F2G01ABAGD_OTP_PAGE_SIZE		2176
+#define MICRON_MT29F2G01ABAGD_OTP_SIZE_BYTES		\
+	(MICRON_MT29F2G01ABAGD_OTP_PAGES *		\
+	 MICRON_MT29F2G01ABAGD_OTP_PAGE_SIZE)
+
+#define MICRON_MT29F2G01ABAGD_CFG_OTP_STATE		BIT(7)
+#define MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK		\
+	(CFG_OTP_ENABLE | MICRON_MT29F2G01ABAGD_CFG_OTP_STATE)
+
 static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
 		//SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -182,6 +193,108 @@ static int micron_8_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int mt29f2g01abagd_otp_is_locked(struct spinand_device *spinand)
+{
+	size_t buf_size = MICRON_MT29F2G01ABAGD_OTP_PAGE_SIZE;
+	size_t retlen;
+	u8 *buf;
+	int ret;
+
+	buf = kmalloc(buf_size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = spinand_upd_cfg(spinand,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_STATE);
+	if (ret)
+		goto out;
+
+	ret = spinand_otp_read(spinand, 0, buf_size, buf, &retlen);
+
+	if (spinand_upd_cfg(spinand, MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
+			    0)) {
+		WARN(1, "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+	if (!ret) {
+		size_t i = 0;
+
+		/* If all zeros, then the OTP area is locked. */
+		while (i < buf_size && *(uint32_t *)(&buf[i]) == 0)
+			i += 4;
+
+		if (i == buf_size)
+			ret = 1;
+	}
+
+out:
+	kfree(buf);
+	return ret;
+}
+
+static int mt29f2g01abagd_otp_info(struct spinand_device *spinand, size_t len,
+				   struct otp_info *buf, size_t *retlen)
+{
+	int locked;
+
+	if (len < sizeof(*buf))
+		return -EINVAL;
+
+	locked = mt29f2g01abagd_otp_is_locked(spinand);
+	if (locked < 0)
+		return locked;
+
+	buf->locked = locked;
+	buf->start = 0;
+	buf->length = MICRON_MT29F2G01ABAGD_OTP_SIZE_BYTES;
+
+	*retlen = sizeof(*buf);
+	return 0;
+}
+
+static int mt29f2g01abagd_otp_lock(struct spinand_device *spinand, loff_t from,
+				   size_t len)
+{
+	struct spi_mem_op write_op = SPINAND_WR_EN_DIS_OP(true);
+	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_OP(0);
+	int ret;
+
+	ret = spinand_upd_cfg(spinand,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK);
+	if (!ret)
+		return ret;
+
+	ret = spi_mem_exec_op(spinand->spimem, &write_op);
+	if (!ret)
+		goto out;
+
+	ret = spi_mem_exec_op(spinand->spimem, &exec_op);
+	if (!ret)
+		goto out;
+
+	ret = spinand_wait(spinand, 10, 5, NULL);
+	if (!ret)
+		goto out;
+
+out:
+	if (spinand_upd_cfg(spinand, MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK, 0)) {
+		WARN(1, "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+static const struct spinand_otp_ops mt29f2g01abagd_otp_ops = {
+	.info = mt29f2g01abagd_otp_info,
+	.lock = mt29f2g01abagd_otp_lock,
+	.read = spinand_otp_read,
+	.write = spinand_otp_write,
+};
+
 static const struct spinand_info micron_spinand_table[] = {
 	/* M79A 2Gb 3.3V */
 	SPINAND_INFO("MT29F2G01ABAGD",
@@ -193,7 +306,9 @@ static const struct spinand_info micron_spinand_table[] = {
 					      &x4_update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
-				     micron_8_ecc_get_status)),
+				     micron_8_ecc_get_status),
+		     SPINAND_OTP_INFO(MICRON_MT29F2G01ABAGD_OTP_PAGES,
+				      &mt29f2g01abagd_otp_ops)),
 	/* M79A 2Gb 1.8V */
 	SPINAND_INFO("MT29F2G01ABBGD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
-- 
2.43.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
