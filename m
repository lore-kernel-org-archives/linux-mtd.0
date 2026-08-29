Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B888C61DD9
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2026 06:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqcuSE0RkqlQHMan9p94iArdlsSULQa6g1YUWESX08g=; b=XKrdL0MnCcLQar
	PYtgUw6as9kxzNcBbGMmpvjR7NX6SHjlxTFbJ8R6d0WNmYdqpoQ7YoOz8GP6jl0rskYkJG0zZpIRR
	4uEaLFDvAy5M/JDL4cDDR4zy8do7xWguzOh+KfLzE/litOuTJdxlpgXJjgq4xK0+h46FdrrW3BNnb
	LpFuqdYg4wd2gkJxvFRhVYjgYPEpT3TPY2ZCE6t4CETbhobI+Lu0UqjN4flzZHDILzE57YX8Keor6
	GxBtuelkAJrF76zWOoD346mITUeoi2apfaOPkzqfbuYs+7GfUwTVRzLWslpJo7waDOB/2sOTqzPbk
	/cYZ7vgwdoJRjUl4lxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0CVu-00000006mez-3pBR;
	Sat, 29 Aug 2026 06:26:02 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0CVe-00000006mPk-3c77;
	Sat, 29 Aug 2026 06:25:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=osxjT7f1JxWv5xezKwzK5ISq924sZF9A35E3+reEz8Q=;
	b=UG3cQnouTZYLXE7dXFFi1mNX00e5Uge+R1PKM3c75ZlP+Xd5IOgoqoCncgffXfrxTCDXcHuHu
	4bZYSRLh0UczZAljLHJ/3CHV8Gqu+8BDLdGai45CHGaqPYlbQsLlu+sHMSUyVrrNGgvEO/cWLVi
	r2nyRxkna3kj6EcHJzVU+RM=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hX4jX2rPyzcb3P;
	Sat, 29 Aug 2026 14:14:56 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 7CF5A4058C;
	Sat, 29 Aug 2026 14:25:34 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 29 Aug
 2026 14:25:33 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v2 6/7] jffs2: rename CONFIG_JFFS2_FS_WBUF_VERIFY to CONFIG_JFFS2_FS_WRITE_VERIFY
Date: Sat, 29 Aug 2026 14:16:56 +0800
Message-ID: <20260829061658.306854-7-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260829061658.306854-1-zhouminqiang2@huawei.com>
References: <20260829061658.306854-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_232547_332614_D5917A96 
X-CRM114-Status: GOOD (  14.09  )
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

Write verification now covers all write paths including NOR direct
writes and write-buffer direct page writes, not just the write-buffer
flush path. The Kconfig option also no longer depends on
CONFIG_JFFS2_FS_WRITEBUFFER.

Rename the option from CONFIG_JFFS2_FS_WBUF_VERIFY to
CONFIG_JFFS2_FS_WRITE_VERIFY to reflect its broader scope and
independence from the write-buffer configuration.

Update defconfig files that explicitly enabled the old symbol to use
the new name, so that platforms which previously relied on this
verification continue to have it enabled.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 arch/arm/configs/keystone_defconfig     |  2 +-
 arch/arm/configs/lpc32xx_defconfig      |  2 +-
 arch/arm/configs/pxa3xx_defconfig       |  2 +-
 arch/arm/configs/pxa_defconfig          |  2 +-
 arch/powerpc/configs/44x/fsp2_defconfig |  2 +-
 fs/jffs2/Kconfig                        | 23 ++++++++++++++++++-----
 fs/jffs2/os-linux.h                     |  2 +-
 fs/jffs2/writev.c                       |  4 ++--
 8 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index b0cadd878152..d485b8b0b91d 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -212,7 +212,7 @@ CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_FS_WBUF_VERIFY=y
+CONFIG_JFFS2_FS_WRITE_VERIFY=y
 CONFIG_UBIFS_FS=y
 CONFIG_CRAMFS=y
 CONFIG_NFS_FS=y
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index b9e2e603cd95..dd0c6db641be 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -164,7 +164,7 @@ CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_FS_WBUF_VERIFY=y
+CONFIG_JFFS2_FS_WRITE_VERIFY=y
 CONFIG_UBIFS_FS=y
 CONFIG_CRAMFS=y
 CONFIG_NFS_FS=y
diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
index fb272e3a2337..f2121269f7c8 100644
--- a/arch/arm/configs/pxa3xx_defconfig
+++ b/arch/arm/configs/pxa3xx_defconfig
@@ -84,7 +84,7 @@ CONFIG_LEDS_TRIGGER_BACKLIGHT=m
 CONFIG_LEDS_TRIGGER_GPIO=m
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
 CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_FS_WBUF_VERIFY=y
+CONFIG_JFFS2_FS_WRITE_VERIFY=y
 CONFIG_JFFS2_COMPRESSION_OPTIONS=y
 CONFIG_JFFS2_LZO=y
 CONFIG_JFFS2_RUBIN=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 66cc149c5ca4..e05cbebb0d8b 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -596,7 +596,7 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_JFFS2_FS=m
 CONFIG_JFFS2_FS_DEBUG=1
-CONFIG_JFFS2_FS_WBUF_VERIFY=y
+CONFIG_JFFS2_FS_WRITE_VERIFY=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_FS_XATTR=y
 CONFIG_JFFS2_COMPRESSION_OPTIONS=y
diff --git a/arch/powerpc/configs/44x/fsp2_defconfig b/arch/powerpc/configs/44x/fsp2_defconfig
index b8b21fa15a07..e626dcb98d34 100644
--- a/arch/powerpc/configs/44x/fsp2_defconfig
+++ b/arch/powerpc/configs/44x/fsp2_defconfig
@@ -97,7 +97,7 @@ CONFIG_EXT4_FS_SECURITY=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_FS_WBUF_VERIFY=y
+CONFIG_JFFS2_FS_WRITE_VERIFY=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_FS_XATTR=y
 CONFIG_CRAMFS=y
diff --git a/fs/jffs2/Kconfig b/fs/jffs2/Kconfig
index 560187d61562..556025a5d438 100644
--- a/fs/jffs2/Kconfig
+++ b/fs/jffs2/Kconfig
@@ -42,13 +42,26 @@ config JFFS2_FS_WRITEBUFFER
 	    - NOR flash with transparent ECC
 	    - DataFlash
 
-config JFFS2_FS_WBUF_VERIFY
-	bool "Verify JFFS2 write-buffer reads"
-	depends on JFFS2_FS_WRITEBUFFER
+config JFFS2_FS_WRITE_VERIFY
+	bool "Verify JFFS2 writes"
+	depends on JFFS2_FS
 	default n
 	help
-	  This causes JFFS2 to read back every page written through the
-	  write-buffer, and check for errors.
+	  Read back data immediately after flash writes and compare it
+	  with the in-memory image that was written. This covers both
+	  write-buffer flushes and direct writes to non-writebuffered
+	  devices.
+
+	  This may catch corruption introduced after node CRCs are
+	  calculated but before/while data is transferred to the flash
+	  controller (e.g. RAM or DMA), where mtd_write() may succeed
+	  while the medium does not match what JFFS2 intended.
+
+	  Without an immediate read-back, a later node CRC failure cannot
+	  tell transport/program-time corruption from post-commit media
+	  damage.
+
+	  If unsure, say 'N'.
 
 config JFFS2_SUMMARY
 	bool "JFFS2 summary support"
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index e73ef643fd97..65604a6f8148 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -192,7 +192,7 @@ int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
 			size_t *retlen, const u_char *buf);
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+#ifdef CONFIG_JFFS2_FS_WRITE_VERIFY
 int jffs2_verify_write(struct jffs2_sb_info *c, const unsigned char *buf,
 		       uint32_t ofs, size_t len);
 int jffs2_verify_writev(struct jffs2_sb_info *c,
diff --git a/fs/jffs2/writev.c b/fs/jffs2/writev.c
index 2cb8cb030ae3..75b4244e93b8 100644
--- a/fs/jffs2/writev.c
+++ b/fs/jffs2/writev.c
@@ -14,7 +14,7 @@
 #include <linux/mtd/mtd.h>
 #include "nodelist.h"
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+#ifdef CONFIG_JFFS2_FS_WRITE_VERIFY
 int jffs2_verify_write(struct jffs2_sb_info *c, const unsigned char *buf,
 			      uint32_t ofs, size_t len)
 {
@@ -100,7 +100,7 @@ int jffs2_verify_writev(struct jffs2_sb_info *c,
 	}
 	return 0;
 }
-#endif /* CONFIG_JFFS2_FS_WBUF_VERIFY */
+#endif /* CONFIG_JFFS2_FS_WRITE_VERIFY */
 
 int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 			      unsigned long count, loff_t to, size_t *retlen)
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
