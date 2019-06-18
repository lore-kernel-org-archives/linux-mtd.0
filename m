Return-Path: <SRS0=PdnT=UR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0BAC31E5B
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 18:27:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E610C2080A
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 18:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PsqKmqoj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/sM1rUx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E610C2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7fvrZKXEYd/4Y6kotyHUQS4UeVLL7PaxYIPLy/BrvS4=; b=Psq
	KmqojmmqbcuEpYe9lKfEtWlfuP3zcK0blXUb85F8K34P8/FRCtRHQl8N+fNZT3lAEALWBZt5dJzGK
	fKhZh3yONtjJ/dKCLkldKxDO9b0/Zqab3OQ4nCwtmGJB3t594bejZa9gLxuCBG25ZgdMP5OQIufR/
	HFF5bwZ4Tc8vdcrgfL36OR2GaiiTiYCctES+Nu0J+3k1fnZizWHbm0dQfMMGte+P4BgDzOFPiBCAN
	nlnvjm3IRYyPBmRbLPUc1L0Qx8448qlB6rcnJ1wGwyXM6yZDy46STZwzAEGooqleCrNw3vsORQRdu
	ngMP7F4ZE/QFbXhqy8jzVzEz92Z9oPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdIp4-0005Ta-O8; Tue, 18 Jun 2019 18:27:10 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdIp2-0005TH-I2
 for linux-mtd@lists.infradead.org; Tue, 18 Jun 2019 18:27:09 +0000
Received: by mail-pf1-x443.google.com with SMTP id p184so8131210pfp.7
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2019 11:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mO472utuFQ+nV4A29aUiVfjK/XWRxLa6xDQ8sQgJqmI=;
 b=R/sM1rUxhjbZRW6SG/PJTnw0z5LYinOBGI/dRLlrIOlSjumvc0CKHCyD+SMw89XEH6
 O7uIcv+A5w/ApFurMpH4xh7R3mPPWYax8BkSssi4IrzM40/LE0nWs9C5qP0CBqnhw93d
 clouyVq+ZVdkUUfxHYdC0zSYpk71dNOtiQXtbtgazRGaEHxgXCbkPR/qnaWClOsp2shk
 D+KO0r0HepQKf8JCu2vxSMIVODaXsuBWxXTDpRPSXh7anxLjXJIfSKTzEYJtvT/HaDmw
 X0GDP/F88ssZTO1V5Z7TRVHRwMb15k96oMB4LUW3bOjZgodr58GmQanpz/1i7OrY0SuN
 htEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mO472utuFQ+nV4A29aUiVfjK/XWRxLa6xDQ8sQgJqmI=;
 b=pTGpoEflMLSm7av8qCJ+fQHkqhSu+wiAdxuHlzPRWiNKb7rYe3Y+TKhp9QY0Yt31C7
 2otwA7USeLOPg0z6+0WNj/Ya0OFSH1ONZpoqXDW1GYRpDcABQaYTHlfcXbGwVnlGgmVz
 YW9+ZO5bsbT3d1PlbztzN9NXCVvJp90EIQUwNAMwvv02HlETQc/oixfZo6gqZZYVUqre
 4dtsemmA2VFd5hDsqBc7/Ds3b90BVP68URhOW4Mmzat9BcG6rhpaK3wwPpMd+qbx7dhK
 vdFp4Ktqdbe4VsXYWF7H5Vz728q0jL+VZMH8z2bySutxyOCI3OJZ6KuynVICf/a0pkM4
 kbOw==
X-Gm-Message-State: APjAAAUUXFwswnyewrlvP1YXnkppiN3FHUCi0fNPrIwPI2TE6hvOlEMI
 0YS5lDdCa00V2PJ7qAH/zThBIutt
X-Google-Smtp-Source: APXvYqxTZ4eWDDY0GFYbRMxO2F8ZVnxImzZ5rLTeOMtXnl7NUQclELdAN0qKO+IgHFm8gnB56XWusg==
X-Received: by 2002:a17:90a:9905:: with SMTP id
 b5mr6758464pjp.70.1560882427917; 
 Tue, 18 Jun 2019 11:27:07 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id k4sm6639480pfk.42.2019.06.18.11.27.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 11:27:07 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 1/2] mtd: Add flag to indicate panic_write
Date: Tue, 18 Jun 2019 14:26:42 -0400
Message-Id: <1560882420-727-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190618_112708_591450_90A392AC 
X-CRM114-Status: GOOD (  12.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Added a flag to indicate a panic_write so that low level drivers can
use it to take required action where applicable, to ensure oops data
gets written to assigned mtd device.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/mtdcore.c   | 3 +++
 include/linux/mtd/mtd.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 453242d..2e04627 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1124,6 +1124,9 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EROFS;
 	if (!len)
 		return 0;
+
+	mtd->panic_write_triggered = true;
+
 	return mtd->_panic_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_panic_write);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 936a3fd..02dce49 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -316,6 +316,12 @@ struct mtd_info {
 	int (*_get_device) (struct mtd_info *mtd);
 	void (*_put_device) (struct mtd_info *mtd);
 
+	/*
+	 * flag indicates a panic write, low level drivers can take appropriate
+	 * action if required to ensure writes go through
+	 */
+	bool panic_write_triggered;
+
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
 
 	/* ECC status information */
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
