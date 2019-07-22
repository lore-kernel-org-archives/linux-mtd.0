Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DF5C76188
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:00:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F26B21955
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzwSS+lZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMh1rXdk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F26B21955
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AesoOMbkOnLHhA6p0Z2SZnVPlE+xe4bzXwMj9SyPcKk=; b=tzwSS+lZSeKKdK
	STc7mEg4Ww6oCmB2OsInBZJs33snmsmUP6p38RC9+tkQLCufDOUV8gDQhPT8w/DiSK65TBfYdnh64
	ilRDa0YUH+U907LQeiAJVAoS/DGHQR+yRVTMBe+/XYk+PN4KEqGAQGj/3WTRclog/nsizYD2LbIdC
	2q3+XShxGDNsTVp2MxO04TaeHQYb52Ajc209pAD6Qrx7H0h9gmE6CeRONSZnF4vjru6L22Lbqwy/l
	voKZN6Rpxo10Yz5EwuFcpAkCdh9toZWKPKzAvzYQzAg+RKyB/YtXv4YjR88ic7zMbJ8kXuZIvTxtB
	vZ20R10mtvqvS0hY0A+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpRMZ-0008W6-S7; Mon, 22 Jul 2019 05:59:56 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpRJm-00063p-8e
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 05:57:06 +0000
Received: by mail-ed1-x52c.google.com with SMTP id i11so39484457edq.0
 for <linux-mtd@lists.infradead.org>; Sun, 21 Jul 2019 22:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=V0NauvuKcIG8OsEXlRR/U4pgQmro8nJ1gsHE95WvQnI=;
 b=NMh1rXdkfWbuWDt+z3yLdkH/Y3Ouh+MzrzHaN3CeC/8ltQHQSE6EGFxxH/BDFynb01
 1ZVuNU0zwSR+XjqzhCJOUbVvmP/unkNMf52OSqhfkjAfHp6QeEqWuNd5j2blDRPgDolT
 GA1zL+pryQepcxHDTFH5RAjThr3ky8HcL/HqE0W+f0+Hl5Vn69QH/854SL+CcgibT7pq
 Emr4BgMusm690fBWxx8lvWeFX7UUve1x+F58dX8Wuyyai6smP9BAOKBjzxWcR22VY8SZ
 7i3rCiy/wYQLtgP0dvxLAuGjZ+A2vQHls8QLiK7rrdT+QumCXd4V0sPa6zSXZk2Kilwj
 H2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=V0NauvuKcIG8OsEXlRR/U4pgQmro8nJ1gsHE95WvQnI=;
 b=MsTPVl9OgPclJtiuweTu81i0ARMgSXpgi8SgE/MLGbihxpZC0ANpbaqPGX+EDUZoJi
 36+grDyBXfY6yMyIZn5V1qn4aUEtaoJwLbt8yBBvt/gaXLgzJqqzSQdodt9+xSmiV4S4
 Tw98QqLzEwU32Sh6YwhbZcigM2U3DFKBAsOgt71AfqQvwhNt2PWNGKd90mwBsEQRzPJ0
 MrsoOpThpbWyyk5q2G7+39W4W5PHxoSsCX8nficjdRSzDr3Grlb72Ctsz9pHo01QTPkv
 LBZz6HgoJ5unC6nRgzDvIV4Y7hCVFfk/PoL4nY3ch5mndzVurdpiBr9Y98gmoXLWjiY4
 cQWw==
X-Gm-Message-State: APjAAAWKWtTZUJWIMsOegzxGDdbsSh6WjLSCUa4YMiefx//Z0cYXv5TD
 5bC+oQa1rzgKmgSOT49uCNQ=
X-Google-Smtp-Source: APXvYqzalEzwxMf39q5qKDrV92KYncql/CQqlOTzgBM0FoITMmwp3crIM1iaLnWdTd/EYvyTCCPPEQ==
X-Received: by 2002:a05:6402:609:: with SMTP id
 n9mr58825921edv.159.1563775020497; 
 Sun, 21 Jul 2019 22:57:00 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id a6sm10351725eds.19.2019.07.21.22.56.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 22:57:00 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: [PATCH 1/8] mtd: nand: move ONFI related functions to onfi.h
Date: Mon, 22 Jul 2019 07:56:14 +0200
Message-Id: <20190722055621.23526-2-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722055621.23526-1-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_225702_437531_DEB3BAF4 
X-CRM114-Status: GOOD (  11.55  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

These functions will be used by both raw NAND and SPI NAND, which
supports ONFI like standards.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/raw/internals.h | 1 -
 include/linux/mtd/onfi.h         | 9 +++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index cba6fe7dd8c4..ed323087d884 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -140,7 +140,6 @@ void nand_legacy_adjust_cmdfunc(struct nand_chip *chip);
 int nand_legacy_check_hooks(struct nand_chip *chip);
 
 /* ONFI functions */
-u16 onfi_crc16(u16 crc, u8 const *p, size_t len);
 int nand_onfi_detect(struct nand_chip *chip);
 
 /* JEDEC functions */
diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
index 339ac798568e..2c8a05a02bb0 100644
--- a/include/linux/mtd/onfi.h
+++ b/include/linux/mtd/onfi.h
@@ -10,6 +10,7 @@
 #ifndef __LINUX_MTD_ONFI_H
 #define __LINUX_MTD_ONFI_H
 
+#include <linux/mtd/nand.h>
 #include <linux/types.h>
 
 /* ONFI version bits */
@@ -175,4 +176,12 @@ struct onfi_params {
 	u8 vendor[88];
 };
 
+/* ONFI functions */
+u16 onfi_crc16(u16 crc, u8 const *p, size_t len);
+void nand_bit_wise_majority(const void **srcbufs,
+			    unsigned int nsrcbufs,
+			    void *dstbuf,
+			    unsigned int bufsize);
+void sanitize_string(u8 *s, size_t len);
+
 #endif /* __LINUX_MTD_ONFI_H */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
