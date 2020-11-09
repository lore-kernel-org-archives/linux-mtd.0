Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E0AC2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:24:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51FB3206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HNml7Rsm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQCgoNIa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51FB3206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lFKBzJS8X7V6eH+bmY6reCszP1og4QAmYckLE428P9Y=; b=HNml7RsmfaHtT7v9A09ysyKFV
	uwo1smWHSHdHQGPK3QydaSgKcZfixBREtR0W3nYcEHiq/51J7sEX4TpQ7h0yB4LcBKlBaF9QSx1FG
	QZ9zRqMqW45bfMUPO6yd082JuazchNfBhlC4Ssn4hEGz5u+736NF8UjrNryAhInVIdCQ5vtcdiAaT
	GkC3sNZx0ZD/U0oXKWFMRLHcdasazN0jRYkiWg610VCIFK3d2GB8OQYAGY+Id/lPxDRGOLelvxd+K
	wkpsN1lMAy1aHSW93CwiWi6P4kgpPyUe1obYskdsB5QiZgZ/p9iH51Sj5O+cqkCZIkWycihivuN/M
	4oi05N8jA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBpH-0001MZ-Ml; Mon, 09 Nov 2020 18:23:35 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoI-0000sR-4M
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:39 +0000
Received: by mail-wm1-x343.google.com with SMTP id p22so393784wmg.3
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/I+nJpznOBt9dN4XJqBf8TuNQJ12DhAWcPprYkWhwFk=;
 b=rQCgoNIa+HcrAR4oxWzehDdHf9SYcJne82iqJeRlLaO/0SzjYou6fpwvojFv2tn63b
 +xMb/hawmDEvq9XV1NCbUhyekrHecLXwpbqsC6TQY4ychclYMzoKFOeJqNGTgn6EldL0
 PpQWssmHYrxPNPNOicxE4xA9WPZFJIeS8RFIDqvt+BvDfHbaqLExjSATD6aOq7Xh7IIZ
 yPKlWSWlEybkfxKCHlriq8rQuidtgCt+/0gIcovjcN3Hs9E+T2Wa+AeTOqNg37y+RFsR
 Tn1OELxcWkmRYlEuoftfHNIzCMElhauet+HDHul1CO+Wfnpd6vvSd1/6EcEUiyWEz+Ns
 PkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/I+nJpznOBt9dN4XJqBf8TuNQJ12DhAWcPprYkWhwFk=;
 b=Vj9yp+XUneFIwnU8W4Hmvaf7s/LeJ76wpp4CRWPWTRTj1dp+xjOlfFEuwhA4mDo5DW
 mxgLPtY3Rz7uuh1MVqqm7OVrH1NCNP3lbI85qWlydReAPdt85c7oS4fj20qUmcWm3941
 V+u09KcUhZHPHSSn5R34gpAA1Zc3gXFfVULbTYx7+uebsyiYQSCEMLwz//vF8EXC2I11
 JPBRN578fMeFlLeR5a7FhY46UtMX0HU7Nwr/iw+DAf/IKZ044T5ZXHkTy13jiF/7TJCR
 lBT5tuzB7fE6SLfRzmmx0SSZ8vXUTPbFXs8UpYSRAPu+0BV/8JiVMpq6+lU5TSIGwVSn
 ZbOQ==
X-Gm-Message-State: AOAM531NJ+fsU/LF6p16zSYbrXd8fhhwPGkZwsnGkhbRgjdIeMM6dI7N
 1kIAhv6uavV1pGVp/MRMHMWihA==
X-Google-Smtp-Source: ABdhPJz86bFhflLs7CghxzpISFfVhT4PLe1hRqnLAjFri5fiuIo3PTpO8gVVH55zfoykehzJoHbsqA==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr519127wmk.4.1604946153142;
 Mon, 09 Nov 2020 10:22:33 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 09/23] mtd: spinand: toshiba: Demote non-conformant
 kernel-doc header
Date: Mon,  9 Nov 2020 18:21:52 +0000
Message-Id: <20201109182206.3037326-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132234_209586_529B68FF 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/spi/toshiba.c:36: warning: Function parameter or member 'write_cache_variants' not described in 'SPINAND_OP_VARIANTS'
 drivers/mtd/nand/spi/toshiba.c:36: warning: Function parameter or member '0' not described in 'SPINAND_OP_VARIANTS'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/toshiba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 21fde28756742..7380b1ebaccd5 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -28,7 +28,7 @@ static SPINAND_OP_VARIANTS(update_cache_x4_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-/**
+/*
  * Backward compatibility for 1st generation Serial NAND devices
  * which don't support Quad Program Load operation.
  */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
