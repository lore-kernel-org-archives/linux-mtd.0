Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA07EC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:05:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C1664EDB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11C1664EDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u/octqNd2RVsQ7Ixaxlz7eC4IO3Mc4io9bXYQfT6yt8=; b=iHSEMFL/9DthL0X5pbiIP41rPE
	n+K3VhNu769RTNE8fYYvoMCk5QByK80iEhUIEEJo6b7oFLWak8jhHm+J5+tHirYCoQRuO/SKqKDmm
	+B4fRBRs4H8k7UtLxc9Mr5eK0+BwMXgnfTrCsBDpYayehaB+2opxor1KxninmIZZ9wHT/yn+RYgbt
	iIu9tKwhKXCrXOzILcmeplb/HOx0zTNMStbf7iHFN7hdTWqYO9ijzXwvknpx6tektfpqaAL3yyRTQ
	wlZm0gqfneQpkPtDQ0+n/Iss8ddv5t6/WHtnWJ7po4mTQJJV+WR4/QZxsOQWrpEOatDxEUdrOJeMi
	OSrOYzLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUvD-005ijR-TC; Wed, 03 Mar 2021 17:04:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSsX-005En9-OE
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Y90MuA0NqkAfFOryRJ3pugHzMXl4ZgJWRrx9sJOu0J8=; b=n9lnaYJ9C5F9pU+PAPUWFBFzXq
 D4/zRaKKEqNrGwPM2Lut2yq/r+wmuoTFYmRutWmQwmagrM9ivRU4blIS6EiD91Mkkiet4vCD+cy+R
 +tmygm195mRDBZa/Kw3PC26bzkpnXd3kCWjW8bfAigOYK5zz26OH+TA7gGugIxNx1uJ+TEj1vs68L
 C4Zo4G9pgLn/jNNMwx44WBVWtnQPz/OPuuVqx7GO3RD8Qp5t4Eh6Z9IMIrHySlCKsYojehAZ+Ddgh
 it31lfeE+stYobx3rXv6TRwIPrvkj3cyYDc19/IJTHcVZY4hnUpuBbDprC3OqMZ9YwVLvhuaYBFhb
 Z4Ox4uWw==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH2ua-00GzJq-1Y
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 11:10:01 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5CB0822236;
 Tue,  2 Mar 2021 12:09:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614683382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y90MuA0NqkAfFOryRJ3pugHzMXl4ZgJWRrx9sJOu0J8=;
 b=Qs9vTMDUzz+g/gdCSZzh+Dn2HzuSOtqZ4GlO1Zn2nMsuSCQqO2TgUEdRxfhZL6hGcfiUzv
 EHwCL15PiNp9vdPscs5LmbeHDpIrPoMrz25LSNjAvF4UMM0FviFbtR0zW2jZFKOmmJqONQ
 lC9JIsNsokRWzxqDWiJZgUreoDAuSoU=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor.Ambarus@microchip.com, Michael Walle <michael@walle.cc>
Subject: [RFC PATCH] mtd: add OTP (one-time-programmable) erase ioctl
Date: Tue,  2 Mar 2021 12:09:27 +0100
Message-Id: <20210302110927.6520-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_111001_094481_3CDD5461 
X-CRM114-Status: GOOD (  16.66  )
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
OTP support for SPI-NOR flashes may be merged soon:
https://lore.kernel.org/linux-mtd/20210216162807.13509-1-michael@walle.cc/

Tudor suggested to add support for the OTP erase operation most SPI-NOR
flashes have:
https://lore.kernel.org/linux-mtd/d4f74b1b-fa1b-97ec-858c-d807fe1f9e57@microchip.com/

Therefore, this is an RFC to get some feedback on the MTD side, once this
is finished, I can post a patch for mtd-utils. Then we'll have a foundation
to add the support to SPI-NOR.

 drivers/mtd/mtdchar.c      |  7 ++++++-
 drivers/mtd/mtdcore.c      | 12 ++++++++++++
 include/linux/mtd/mtd.h    |  3 +++
 include/uapi/mtd/mtd-abi.h |  2 ++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 323035d4f2d0..da423dd031ae 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -661,6 +661,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 	case OTPGETREGIONCOUNT:
 	case OTPGETREGIONINFO:
 	case OTPLOCK:
+	case OTPERASE:
 	case ECCGETLAYOUT:
 	case ECCGETSTATS:
 	case MTDFILEMODE:
@@ -938,6 +939,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 	}
 
 	case OTPLOCK:
+	case OTPERASE:
 	{
 		struct otp_info oinfo;
 
@@ -945,7 +947,10 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
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
index 2d6423d89a17..d844d718ef77 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1918,6 +1918,18 @@ int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
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
index 157357ec1441..734ad7a8c353 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -336,6 +336,8 @@ struct mtd_info {
 				     size_t len, size_t *retlen, u_char *buf);
 	int (*_lock_user_prot_reg) (struct mtd_info *mtd, loff_t from,
 				    size_t len);
+	int (*_erase_user_prot_reg) (struct mtd_info *mtd, loff_t from,
+				     size_t len);
 	int (*_writev) (struct mtd_info *mtd, const struct kvec *vecs,
 			unsigned long count, loff_t to, size_t *retlen);
 	void (*_sync) (struct mtd_info *mtd);
@@ -517,6 +519,7 @@ int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
 int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, u_char *buf);
 int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len);
+int mtd_erase_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len);
 
 int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	       unsigned long count, loff_t to, size_t *retlen);
diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 65b9db936557..242015f60d10 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -205,6 +205,8 @@ struct otp_info {
  * without OOB, e.g., NOR flash.
  */
 #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
+/* Erase a given range of user data (must be in mode %MTD_FILE_MODE_OTP_USER) */
+#define OTPERASE		_IOR('M', 25, struct otp_info)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
