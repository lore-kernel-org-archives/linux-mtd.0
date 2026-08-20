Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104BBC5DF88
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3jmOq/T8G/PYksY50NUAjAk8cM1MehHRGXWwkD+aAs=; b=aybrdKS8UQlT1T
	eR9I6yybyrO1N9SYwAoi6/Gd+OLIgRQhd1iyl20Lr0yqPfR2sfuM6YR2lcBQm7qM6Jms1Swa+1d1K
	QVaKW0QWnUVcG5s6hkRQq6Nin3igrClg3UmNbUP4ZM0SlaHWVOpdF7SjAvl5iGUy7xJQgjs4E1ZuU
	BHKADMDVOHEbASI3dBwpINTKVarAU7HtkPdpQfVbIQlpm+YuMAVUbXioif4VtYD6fvjUD4tS13Msr
	JAq/uSvLc4dJa2ABcyLAFm5sPZiEJ5TZadmNNhwA3Lf5n2trwfwkSPfsPSf3FxwLXrc4jZzHfzzPT
	l5pAltuGcwQlOBZ7Th5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0SN-0000000BOc8-1lAp;
	Thu, 20 Aug 2026 10:57:11 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0SK-0000000BOYL-3GNS
	for linux-mtd@lists.infradead.org;
	Thu, 20 Aug 2026 10:57:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6jIEgeBx8wgQoM1im7wbkSvNvmKimKnfj2DovqjaFlI=;
	b=wqHoJPYK2sGROKMjrESU3EJZCuvwy6BK9BUGyC4JS2BIyGJq9Rs+E0DYmMH7xLDQStAfFP1ow
	77LOs/OzVxBX5VLS8gNKv+85bMWOLxbBeNoYy+abzoonlwxm23qDECNx62h526rYJq6OnYctfg6
	3eqYFMDiOFdXcXBXH7ASzEw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hQg9C49Ddz12LDl;
	Thu, 20 Aug 2026 18:46:39 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E0224057F;
	Thu, 20 Aug 2026 18:57:00 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 20 Aug
 2026 18:56:59 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 5/6] jffs2: rename CONFIG_JFFS2_FS_WBUF_VERIFY to CONFIG_JFFS2_FS_WRITE_VERIFY
Date: Thu, 20 Aug 2026 18:50:01 +0800
Message-ID: <20260820105003.2525647-6-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260820105003.2525647-1-zhouminqiang2@huawei.com>
References: <20260820105003.2525647-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_035709_579192_91267892 
X-CRM114-Status: GOOD (  13.46  )
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

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/Kconfig    | 23 ++++++++++++++++++-----
 fs/jffs2/os-linux.h |  2 +-
 fs/jffs2/writev.c   |  4 ++--
 3 files changed, 21 insertions(+), 8 deletions(-)

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
index 39adc15ffd69..fc1eae60c476 100644
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
@@ -98,7 +98,7 @@ int jffs2_verify_writev(struct jffs2_sb_info *c,
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
