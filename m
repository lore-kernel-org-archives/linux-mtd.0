Return-Path: <SRS0=6kki=IC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADABBC433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 01:02:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5536064EDF
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 01:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5536064EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GQIevkvlt0m43srAXPQnXa7DRlOCnY2V5H/JgbzCcoo=; b=miBDWHt+Lww4gJBDU6nEq4Gr7M
	8fT6Q6yg9/icZeb9gVPf900NKY+Cfehz15oQKm8BgL/irFrKvnRavps22Lo5CVSlljNDYDjEA3TS6
	yUJkim1LprK+b5dZVh+EpwP57+TqmfEgk3x9nIbFsoVxOUjyk1FzQLeHrzAEyZR99UMltB2YjOBVx
	LCfPyk9bdpdKyejOa1WXwxoQs7K8D4HdCfAGk+Lci/ahkW4HgAjwIkE4WNheheFD3/+3kIPSly6ex
	ZaGWI1m/iQnI3xCc/7emGEM23HnPGXnowlG7fsF0bYCCHovNW3GWVA58KoTl6BrWFxE2NwlDFL93R
	C9I9UyPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHcLy-007GWn-Cd; Thu, 04 Mar 2021 01:00:37 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXx2-006ONV-4X
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 20:18:55 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5A5232223A;
 Wed,  3 Mar 2021 21:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614802710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bH5OIkVqJBqAQ09VIrZoFL+fgJq/hfQAqXuKtC2hFko=;
 b=fzN6MJMnfbZg9AaRVlOKMsI9HmE9rktmpJz+tjAiqpFuwq9dcRJiiQIxzNaMjR6gT1Wr0B
 3Lrgl6DybeyDsYNEhQSxe1fPfzh5tbDkF8qifpMPmARkiERM9ZI8icFrSvgTZ56PO6FNkN
 FBFiw92krw7WR2QOHEMHAMdvruzWhak=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor.Ambarus@microchip.com, Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd: add OTP (one-time-programmable) erase ioctl
Date: Wed,  3 Mar 2021 21:18:19 +0100
Message-Id: <20210303201819.2752-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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

This may sound like a contradiction but some SPI-NOR flashes really
support erasing their OTP region until it is finally locked. Having the
possibility to erase an OTP region might come in handy during
development.

The ioctl argument follows the OTPLOCK style.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Changes since RFC:
 - check write permissions for OTPERASE
 - use correct ioctl macro (_IOW)

 drivers/mtd/mtdchar.c      |  7 ++++++-
 drivers/mtd/mtdcore.c      | 12 ++++++++++++
 include/linux/mtd/mtd.h    |  3 +++
 include/uapi/mtd/mtd-abi.h |  2 ++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 57c4a2f0b703..b9b56eb9457e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -666,6 +666,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 	case MEMWRITEOOB:
 	case MEMWRITEOOB64:
 	case MEMWRITE:
+	case OTPERASE:
 		if (!(file->f_mode & FMODE_WRITE))
 			return -EPERM;
 		break;
@@ -930,6 +931,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 	}
 
 	case OTPLOCK:
+	case OTPERASE:
 	{
 		struct otp_info oinfo;
 
@@ -937,7 +939,10 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 			return -EINVAL;
 		if (copy_from_user(&oinfo, argp, sizeof(oinfo)))
 			return -EFAULT;
-		ret = mtd_lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
+		if (cmd == OTPLOCK)
+			ret = mtd_lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
+		else
+			ret = mtd_erase_user_prot_reg(mtd, oinfo.start, oinfo.length);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 38782ceea1f6..aea58366a94e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1919,6 +1919,18 @@ int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
 }
 EXPORT_SYMBOL_GPL(mtd_lock_user_prot_reg);
 
+int mtd_erase_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_erase_user_prot_reg)
+		return -EOPNOTSUPP;
+	if (!len)
+		return 0;
+	return master->_erase_user_prot_reg(master, from, len);
+}
+EXPORT_SYMBOL_GPL(mtd_erase_user_prot_reg);
+
 /* Chip-supported device locking */
 int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index ceabc2cae8a4..4aac200ca8b5 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -337,6 +337,8 @@ struct mtd_info {
 				     size_t len, size_t *retlen, u_char *buf);
 	int (*_lock_user_prot_reg) (struct mtd_info *mtd, loff_t from,
 				    size_t len);
+	int (*_erase_user_prot_reg) (struct mtd_info *mtd, loff_t from,
+				     size_t len);
 	int (*_writev) (struct mtd_info *mtd, const struct kvec *vecs,
 			unsigned long count, loff_t to, size_t *retlen);
 	void (*_sync) (struct mtd_info *mtd);
@@ -518,6 +520,7 @@ int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
 int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, u_char *buf);
 int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len);
+int mtd_erase_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len);
 
 int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	       unsigned long count, loff_t to, size_t *retlen);
diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 65b9db936557..b869990c2db2 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -205,6 +205,8 @@ struct otp_info {
  * without OOB, e.g., NOR flash.
  */
 #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
+/* Erase a given range of user data (must be in mode %MTD_FILE_MODE_OTP_USER) */
+#define OTPERASE		_IOW('M', 25, struct otp_info)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
