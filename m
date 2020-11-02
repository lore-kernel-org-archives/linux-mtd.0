Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32206C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:58:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EFC222BA
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pl5FWAVE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGwwhJqO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EFC222BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7exq9FZcK91QKadC7LkoAj/07LRwSH4wl7Rr5Ki/KgE=; b=pl5FWAVEt+buC98DmtNiesS62
	xKoU1/pPBzjnpNZoCPJCCNIbmWPAALiM/H9a1xFcIcDFyFIbvzsi/mB73Gduu6cNg7YdI1vVOsGIM
	8wj31r0F5SASKmW51PXU6h/9Bx8uAI+uLxRGbQYEsLJVtiAyAVmmsjEPynHQvFsZTWa7CFGrCkPbJ
	VBzboTNrX+GMGSeqkiTjvE/VuKvi/8fsqusS2C706yhOZ25CAOIlC8ZjZhBlurVzD5LnUabXjyFWq
	B3LJfu3IC3eGQcsvm8eAyjUtpEDh28eqNo0GciJdN8czHm7aCRBAZEu3pvJKAexes9QNppNiKEn7M
	TJhejsQKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYRi-0002bk-S9; Mon, 02 Nov 2020 11:56:24 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPr-0001xT-B9
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id n18so14243144wrs.5
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaSgExpL1nCtBP1Xc6kSLtHGXCrLErSmtz6Y4QPAfFg=;
 b=UGwwhJqOoS3Rp/Ibr7m1kmtFcpqS/DaYg6/MLmYIqmIHmjm18yFoO74jKG+i2V9K34
 pF9yjLX9yOJfMjmjH8lLEHNSwiAXsJsVyQLkKRiR+RV/VYnDMYRr6W8EKP39qT++Jzfp
 W2e5HuMxV96fNdA/uRR2Nxge8NqFjcke6ahjWYWGWYt9iY6fnMBppf25H2VuBm57fakY
 OaMOFoQxa8FyJERKQ4tMXIbXdmkS3gh3EG6rK6PoNJr2sJNN/Q0ArDqW2Wu6WjFXufkb
 E9X0oUn660fm6tbwBtDAfXHUJJdegDkvFYYIvSLWMpgYcHCfkGV8Hp5qVtjRwtSWJwsU
 Ll/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DaSgExpL1nCtBP1Xc6kSLtHGXCrLErSmtz6Y4QPAfFg=;
 b=lc4OPDmr1li7/U6BakSQKP6oJap06JneWQgNVvUABp4L89Dh+GTZ540WZW8wUwwKti
 +MvKlNrmoML/xXMi0CL/dRkHJNoq2n1Jjyu1305VJE0EqsrndNvaMvZnc9f2UqipZNVP
 ZbBcgBcNUV8m4SVHyc5zbF110n5JBrCwZDfc2BOIxNsy7g+Hx4XRwx6wcHmVFnsG8ziI
 GUkdtIgEy2XfG+kGIoa83g+PmCIiyckb1ytUJYp6UrmWCu5kWHy/o13lSjaYjd5NzkXS
 LbTeIqsLjfkwsFBkUqsNQEGAkUj2Zt0gMKzcWFT1lV0kjJo+/2q/Rx9OeYYzRQ0C53HM
 mEwg==
X-Gm-Message-State: AOAM530Y3icHujcEh+Avk+JNLZnlCLlbQ5kd3D0xZLV1hCeYgD3mncxJ
 PgDGT9J8m2i1ELweFtbzzc7XEg==
X-Google-Smtp-Source: ABdhPJwyWOeESSW2N5ZEBETQvar05vBOvWfj5hR9v638iZ8Jd5zKk7f0XzxPcmaEsUmVjPC2epzmHQ==
X-Received: by 2002:adf:ab02:: with SMTP id q2mr11068973wrc.320.1604318066256; 
 Mon, 02 Nov 2020 03:54:26 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 10/23] mtd: ubi: kapi: Correct documentation for
 'ubi_leb_read_sg's 'sgl' parameter
Date: Mon,  2 Nov 2020 11:53:53 +0000
Message-Id: <20201102115406.1074327-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065427_553737_B5221713 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: Richard Weinberger <richard@nod.at>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/ubi/kapi.c:464: warning: Function parameter or member 'sgl' not described in 'ubi_leb_read_sg'
 drivers/mtd/ubi/kapi.c:464: warning: Excess function parameter 'buf' description in 'ubi_leb_read_sg'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/kapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 9718f5aaaf694..0fce99ff29b58 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -450,7 +450,7 @@ EXPORT_SYMBOL_GPL(ubi_leb_read);
  * ubi_leb_read_sg - read data into a scatter gather list.
  * @desc: volume descriptor
  * @lnum: logical eraseblock number to read from
- * @buf: buffer where to store the read data
+ * @sgl: UBI scatter gather list to store the read data
  * @offset: offset within the logical eraseblock to read from
  * @len: how many bytes to read
  * @check: whether UBI has to check the read data's CRC or not.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
