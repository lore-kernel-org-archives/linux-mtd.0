Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BD3C98328
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLe5MWZH81Ed3XTiJePwN3JwKmxvEzK5hdHj5HB2jXQ=; b=LEIxdmDTLl0e7P
	LcqCKoiH+RZavo3yzZcl/9xFnN1W3daxizywN1FUvO9O7RstUyNN+7zRAzo5Lu+QQJgC1YHBdUbj1
	GdkU0UJq3q31D7+t8y89HeJ13rd0+fJV2pTpl3I6daypUCH1RmAnmq2fkTV6xz4j1kcAFKDNYPd9g
	WPI5vovgz+BTZzrMD7GWvtyLGuAevh0WQpvNSG6h6hWiCQvxW5Bp3dSjAbxZZ4TBnvQdCx+OKxowU
	OhbTkmfd83sh/AvU0XIJX5kSbYbczJCoRkDt/BLdZFTBMRJomhL7+imujuewZAs3MjWdxHMlbtutw
	dG++/anWHRzD2KEggKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgX-0000000C6LL-34mi;
	Thu, 24 Sep 2026 20:04:49 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgU-0000000C6H8-0DpS
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:04:47 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso1377245e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280284; x=1790885084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0y5oWVOEfEuW6A10hQnlv/3kONdwnVhlYIyafjNsQ=;
        b=k7SHOGWNpmxIeKYYr9C3e60ItjAN2JF2z6Pfd2nGzL2BrdOu+jwK0HlRc2EhZg9FND
         Rb8f6F4QhQHgjghcqaY5JSonqCl0t20HT31szR7KVuWQFdueX6FdDHTPYAaJ00FfR6IE
         wxXCLoT6M4xrtLCaGjPO4ccZ8szrr4qEVGdeoVJN3SRxYP1gqyS1CUyKHwWtnqQduzfH
         lZnG4vAiuZEIiZibUfx1Hfij63mXvo7CoeiXXjb5vsin9v3s1illztrIBUCqcivBfB4f
         /ETfBEu7ErKvtQwQGK05c63HW4jAKGoxay6la5m45Fcj2ui2eEl3U3rv2ueT18IL4MvE
         sP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280284; x=1790885084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FR0y5oWVOEfEuW6A10hQnlv/3kONdwnVhlYIyafjNsQ=;
        b=cHjcW9nLD+GD1r9c8zX2VfgxqGLcWjRuE8KTz97iCa3CMzHYRolb9fFyAwOh4FiGux
         2q8gnqyAOK0yS23EPuiPFoM1x5/YE2Ob8oETJb35wOyxVTcmb9Ue1fx75b5wDOKda/VT
         1Xd5wnSNBtfyS1nMhYRrtFVSn0EjmyckGiAbPclZ2ThxsEnAgpz3YdhXkdWwlIX8/6yo
         gDRsJl7Af5fmjmzu+gz266a2pOmZUY4vTaYxPEvuj1WcLU6k/V41rENFRjW2ykJVre7w
         SPy4S1LV9QLdxuU4/Hjg+V7PbILJQj0cZjWteAqele9soAFUfRU/p7aq8K3iBde8/Z0v
         KiiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPHACcCf6avhau6zTTtii14FuJJWFmB42CWkytUfKJao1xwF+4glr2Ppb0aP+TCtmTbde0SvKV9ns=@lists.infradead.org
X-Gm-Message-State: AFuF++l/BOwoQZ2NrCjh/aS3vb0K6u9nuPxK3tQrpZ0DdU/3gSH0XGyk
	ThODmRp+5dU7lokGmJYlYBp5fvFPT134TzlBZCo3FTe5WKkZZVLY85sq
X-Gm-Gg: AYBFou0MqwFVx4cOz/eR4WlB1cO8BXmoWcbaRlh0PjyOqAyIVIJwP79zU1hJbRUKQrE
	7hgzeQ4j5iWRwLNnMLme+a5U5fENTRrRwAunGjvqNDAyEmP1dgBIyxmca+4dxnjuEbuzg6x5ImY
	nMm2ogVg7EK5kmYEtDWgBZROixJ429+15sWRHpKInTrkhsPk3eQlKW4AxrlFi4RKVVXVHtvRWx4
	aRrAUQu7ZmlPlRsOMTTZ2NOiICxzUL9JZPwhwhM6sD1/tQ8cZU4PLhUHvf+MrDl21rBnb+Hi/sh
	5Oh7sehb+Y7yoYaMkx1N7dXGH89AEcQJE4i7S75+SBrTG0SeY4t2benImV7dSi+j5C2Sk9bKOuN
	+MR3eE1XiHbVA2w+G49AXIEn6iSywWN1ZO4B+zQEpktEPMfpY0gwxMKLPoYY/8dUFA5FIURYSTZ
	S3lA4bp6yE9AEQtENYeUA6myf1M1p7X1F2hmrg5fltHINknGYY2oWFL2zOEHdHNfaRqe4lPSCWc
	Nah12uEWcH9j1mg9Wz/j2BNA8Lq
X-Received: by 2002:a05:600c:a10d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-49fe8bf91bbmr39325455e9.4.1790280284310;
        Thu, 24 Sep 2026 13:04:44 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:43 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:22 +0200
Subject: [PATCH 7/8] mtd: rawnand: qcom: rename 'nand_stats' structure
MIME-Version: 1.0
Message-Id: <20260924-qcom_nandc-share-more-code-v1-7-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_130446_135366_F0938E30 
X-CRM114-Status: GOOD (  14.10  )
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

Give 'read_stats' structure a 'qcom_nandc' prefix to indicate that
it corresponds to the Qualcomm NAND driver. The definition is going
to be moved into a common header this helps to avoid global namespace
pollution/collision.

No functional changes. This is in preparation of moving the declaration
into the 'nand-qpic-common.h' header to allow reusing it from the
'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index cc1e64ac4245..99fe2c434ce7 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -438,7 +438,7 @@ static bool erased_chunk_check_and_fixup(u8 *data_buf, int data_len)
 	return true;
 }
 
-struct read_stats {
+struct qcom_nandc_read_stats {
 	__le32 flash;
 	__le32 buffer;
 	__le32 erased_cw;
@@ -619,12 +619,12 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	unsigned int max_bitflips = 0, uncorrectable_cws = 0;
-	struct read_stats *buf;
+	struct qcom_nandc_read_stats *buf;
 	bool flash_op_err = false, erased;
 	int i;
 	u8 *data_buf_start = data_buf, *oob_buf_start = oob_buf;
 
-	buf = (struct read_stats *)nandc->reg_read_buf;
+	buf = (struct qcom_nandc_read_stats *)nandc->reg_read_buf;
 	qcom_nandc_dev_to_mem(nandc, true);
 
 	for (i = 0; i < ecc->steps; i++, buf++) {

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
