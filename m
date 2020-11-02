Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C82C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:59:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA8D223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="avMoJjB+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JS+Kwdsw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA8D223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XbR5qi0cCCG4IsMZWef48omDENjBLc2cHLkivMZjmmg=; b=avMoJjB+mwadfSI8aeOUgsvpT
	R7y02Vcq9MiISKDi+I8D67BxakyWCVBdfXm3nUQTDLTS49o43v28FKP4KVrAguYWlKOdKnmvbQvzz
	kY0HgBAlwoGLfE67Sa/kwip7V/UzVPZvWkUjKbsMMpPQU1b7ylGixjtXHMCY48nmAtcl6Ozrlt/eX
	CmDOh7/nfduXGkJBwvwS4MOCgxYYtGJ+cyw2CEytZLPcC7tvloh7y7cvVQie/Bl71GGAUtLU0mYfe
	X2Ctt60vMo8kY2/5y9ihdtlsDp8WaAwPGhuakxb7pTpwV49/Er6Ctqgttg/ZHLx4Yf13SGed4njKP
	83wbbW9cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYUV-0000MT-9L; Mon, 02 Nov 2020 11:59:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYQ7-00023x-9Z
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:54 +0000
Received: by mail-wm1-x344.google.com with SMTP id c18so9106483wme.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRzuWaCfIw4UTs2aF+5rmwioSm/r/nvXMg3tmaX+2L0=;
 b=JS+KwdswLAieYiaVeglSx5ggqAhqLpcikTROj7r7BZ55giY22O3qr5VILyrUR4yONv
 UAruY8PiBxCqihxjeC67TcC7ye9Au72twge4l2BcSioJyYz1PMNuh41qs3FzprrNPvbI
 FHLyC0K835GWyx+1GV9YalD1Bd8Sce/mRu8mP2CPSUSmo/6F9XuEYdh73H5Jqw8pojNJ
 aTD22WfqdQq2A8BhX0GeNNwaNjMv6U1rPQJzCmNu81+Vr1fqwcquHFk+NKPDlYt3/K5e
 adHhhB2e2J+MIVdkHOdnx1VyZWF99+Kqaep73B7geFO2cQgTGZCefO10Quqw/jDYQM5X
 s0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRzuWaCfIw4UTs2aF+5rmwioSm/r/nvXMg3tmaX+2L0=;
 b=EUp5klr0JvX2XlpoVNyQHjt34OT8Euy51iJ2wox6lZFY3PEcNPmAVHZ/mzUZQ0BHJu
 nU5ObVA98SJOnptQAMIUfgz1cGwfVUd5Y/Z2Vggo3xCA5MMzDMpVPfAVlu1vePs8KCuz
 zOLRRBMiZww2YrCk5e2yFrHPiLsGts56rVJEyhRkOjkL2IgUrKBMHiP3rnqA6nZUsRnm
 BO+f64iudzHPoYbSeA6NY8a+iZJHSNyZjjtBFxpnMeudYyCcet8WFi2EIuxGcH8Fjsz9
 4NiaaTD6TJQ/9KsPg9sVjATgEZ56Ucd2kAx2dpX7lflP2vcTyrCuYNTpy14Hs97r6tfV
 4FYw==
X-Gm-Message-State: AOAM533fpT9JcSFTPWuj17LrgldEmcVQt85NoA3Dz1P1tzB2zF4ZMv5V
 oMPYeVGu6S4edM5RBncMvrTyIA==
X-Google-Smtp-Source: ABdhPJwqyLdi+hvK8ABATLFZsgWDxfRSJ/d6F8En9RgoXNzWtzAm3miqfTQw75V5SnGsKn+a3h1n3A==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr10168153wmi.136.1604318082123; 
 Mon, 02 Nov 2020 03:54:42 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 23/23] mtd: devices: powernv_flash: Add function names to
 headers and fix 'dev'
Date: Mon,  2 Nov 2020 11:54:06 +0000
Message-Id: <20201102115406.1074327-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065443_474606_44EEDDDA 
X-CRM114-Status: GOOD (  17.18  )
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Cyril Bur <cyril.bur@au1.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/devices/powernv_flash.c:129: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:145: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:161: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:184: warning: Function parameter or member 'dev' not described in 'powernv_flash_set_driver_info'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Cc: linux-mtd@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/powernv_flash.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 0b757d9ba2f6b..32cb0e649096f 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -126,6 +126,8 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 }
 
 /**
+ * powernv_flash_read
+ *
  * @mtd: the device
  * @from: the offset to read from
  * @len: the number of bytes to read
@@ -142,6 +144,7 @@ static int powernv_flash_read(struct mtd_info *mtd, loff_t from, size_t len,
 }
 
 /**
+ * powernv_flash_write
  * @mtd: the device
  * @to: the offset to write to
  * @len: the number of bytes to write
@@ -158,6 +161,7 @@ static int powernv_flash_write(struct mtd_info *mtd, loff_t to, size_t len,
 }
 
 /**
+ * powernv_flash_erase
  * @mtd: the device
  * @erase: the erase info
  * Returns 0 if erase successful or -ERRNO if an error occurred
@@ -176,7 +180,7 @@ static int powernv_flash_erase(struct mtd_info *mtd, struct erase_info *erase)
 
 /**
  * powernv_flash_set_driver_info - Fill the mtd_info structure and docg3
- * structure @pdev: The platform device
+ * @dev: The device structure
  * @mtd: The structure to fill
  */
 static int powernv_flash_set_driver_info(struct device *dev,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
