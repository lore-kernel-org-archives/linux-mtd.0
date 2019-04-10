Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253EEC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 19:59:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C442075B
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 19:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AEYn53aW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QP1vEQtQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C442075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbcnRbAfuPdVPjwprog20soLBiOZxcbdZQD6XIO6YCs=; b=AEYn53aWYjk7vU
	vMjj9xcSBz84MCqoqW4msbCgvE07KXKFsM/UfZrK+MXdodvGPe9q1UdKoYVrehRm7VItV7cURfwRO
	0VW7RDuxVnuRjkcrd8rdILDPqQpicwyJqCCTnsZAF+DE6AeU1xDeGGL50qoPZawLUK0B42NIvFMHK
	mzsqKsWavsNJEIfoH3/pfwwDHnTNCfXEbtmfS8PVOOOgpMXSrHYF84aH7OaNY+nLdXseokGNlq5yw
	fKSnbBihhdu5nu8cgUHmDeosl+UgIfKG2WtIsCVjQvHxW/NGz/LqT/2s5H0SPl0A2WQC5GHMk+VXi
	khYZewMBAnhVKF+cWGmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEJNL-0007nZ-L0; Wed, 10 Apr 2019 19:59:15 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEJNE-0007ce-UP
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 19:59:13 +0000
Received: by mail-lj1-x241.google.com with SMTP id f23so3316441ljc.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 12:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xF0+W7srIQfbgQ7tlGxBCjWOJ+vLDr6qxPO28weJN5Y=;
 b=QP1vEQtQhoJSrpZ76JBL1JAYV+zoZbWvYwB5G5p18VhhzHZBR2lMnGBoqbyRvNr0pq
 4OoUGdDwPBl3J8a4UO97fGmytDlID6KzSlRdoVCzR3SNnR+r4tTM1lV6ujfQlIlVagXK
 uO0tXtmSG5ptGpp7laRSeweAc9bxB01JqHArPISzXsGzTE4q+K5w/eqPKfGwWb69zOaX
 gDiMvuM1FKmmxSFyuvDUJ47R9sz05HNBltF4LNg8ZXPHCwcPF901ylscKJ4LzBbV2AAe
 q8vM9cBtGjbBPp/OCI9smkda/UjqT+FOWvKWjwnr2WlqKbtk9PLFzuACWKnaqjXY94Kz
 wKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xF0+W7srIQfbgQ7tlGxBCjWOJ+vLDr6qxPO28weJN5Y=;
 b=E2hxF0gK3p3d6G+KrNKB1OKYUF2rQguD6Vc2Mn/ji5RzFgEEGXarlXpS/f9Hila13L
 vgndPTZMsEnDB+/haJ1QRW+HLAtqP+DFdlS5RD/1P02bs0f6nHJpoHWTavb8/jUR5DaS
 +xdP9QMM0u8XMECkNCLBoWdYCwjrZC409Ic8sXTccY1rkFGSpARhm7XpjlQ5kCs/H67t
 0EzcvKk42ZEfvJVORMLD8n3dtZlRB41RLIV8CrhBQQbMLC/XRVw55ySMUgEtOWTQx94v
 c2LvlHkxoIZWB7MqKED91H4sk+2+ktmaSIbHwQfOAr5A0nsMbGCtXLDrKBuwo8MvreaC
 2lig==
X-Gm-Message-State: APjAAAU6Y7xTPt1sEIog/xmY4XMCw93vSXM4rzUnGab9AeErqJ5bi4Qy
 m/0an1CyswC/iENWpRAJblkwXwcdNn/6cQ==
X-Google-Smtp-Source: APXvYqxt6FgSVLw9nqPk30okfUzZKtd0kyDRdWsGL7tCt+Tr0Rj6/diNn62XiSBXkkf/SDfYKilkmg==
X-Received: by 2002:a2e:968c:: with SMTP id q12mr23873796lji.36.1554926346965; 
 Wed, 10 Apr 2019 12:59:06 -0700 (PDT)
Received: from localhost (c-573670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.87])
 by smtp.gmail.com with ESMTPSA id q5sm7150752lfm.16.2019.04.10.12.59.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Apr 2019 12:59:06 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org,
 marek.vasut@gmail.com, richard@nod.at
Subject: [PATCH 2/2] mtd: nand: raw: fix build dependency
Date: Wed, 10 Apr 2019 21:58:52 +0200
Message-Id: <20190410195852.4066-2-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190410195852.4066-1-anders.roxell@linaro.org>
References: <20190410195852.4066-1-anders.roxell@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_125909_174341_C3B69FDD 
X-CRM114-Status: GOOD (  12.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Anders Roxell <anders.roxell@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When enable CONFIG_MTD_NAND_ECC_SW_BCH as a module, the
MTD_NAND_ECC_SW_BCH depends on MTD_NAND, but the module controlled by
MTD_NAND links against the module controlled by MTD_NAND_ECC_SW_BCH.
This leads to the following link failure.

aarch64-linux-gnu-ld: drivers/mtd/nand/raw/nand_base.o: in function `nand_cleanup':
../drivers/mtd/nand/raw/nand_base.c:5886: undefined reference to `nand_bch_free'
aarch64-linux-gnu-ld: ../drivers/mtd/nand/raw/nand_base.c:5886:(.text+0x9928): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `nand_bch_free'
aarch64-linux-gnu-ld: drivers/mtd/nand/raw/nand_base.o: in function `nand_set_ecc_soft_ops':
../drivers/mtd/nand/raw/nand_base.c:5093: undefined reference to `nand_bch_calculate_ecc'
aarch64-linux-gnu-ld: ../drivers/mtd/nand/raw/nand_base.c:5093:(.text+0xe914): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `nand_bch_calculate_ecc'
aarch64-linux-gnu-ld: ../drivers/mtd/nand/raw/nand_base.c:5093: undefined reference to `nand_bch_calculate_ecc'
aarch64-linux-gnu-ld: ../drivers/mtd/nand/raw/nand_base.c:5094: undefined reference to `nand_bch_correct_data'
aarch64-linux-gnu-ld: ../drivers/mtd/nand/raw/nand_base.c:5094:(.text+0xe934): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `nand_bch_correct_data'
aarch64-linux-gnu-ld: ../drivers/mtd/nand/raw/nand_base.c:5094: undefined reference to `nand_bch_correct_data'
aarch64-linux-gnu-ld: ../drivers/mtd/nand/raw/nand_base.c:5148: undefined reference to `nand_bch_init'
aarch64-linux-gnu-ld: ../drivers/mtd/nand/raw/nand_base.c:5148:(.text+0xebbc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `nand_bch_init'

Rework CONFIG_MTD_NAND_ECC_SW_BCH from tristate to bool,
and then link the nand_bch.o file into nand.ko if its enabled.

Fixes: 51ef1d0b2095 ("mtd: nand: Clarify Kconfig entry for software BCH ECC algorithm")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/mtd/nand/raw/Kconfig  | 2 +-
 drivers/mtd/nand/raw/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 615d738be411..0500c42f31cb 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -22,7 +22,7 @@ menuconfig MTD_RAW_NAND
 if MTD_RAW_NAND
 
 config MTD_NAND_ECC_SW_BCH
-	tristate "Support software BCH ECC"
+	bool "Support software BCH ECC"
 	select BCH
 	default n
 	help
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 8bc6faaa3bc7..efaf5cd25edc 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -2,7 +2,7 @@
 
 obj-$(CONFIG_MTD_RAW_NAND)		+= nand.o
 obj-$(CONFIG_MTD_NAND_ECC_SW_HAMMING)	+= nand_ecc.o
-obj-$(CONFIG_MTD_NAND_ECC_SW_BCH)	+= nand_bch.o
+nand-$(CONFIG_MTD_NAND_ECC_SW_BCH)	+= nand_bch.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
