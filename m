Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53670C9832E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 19:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b92jMkmmDSx+PzPXSjaBGEDSZcRhqHOFW9mD5/eX8+Y=; b=ApDC0c4jnd/rff
	rrz+5foGn1BBXuR2fLTX4KDRfgybfwmrTfPhRZBHwZtgr0LzCxRfYYWIuwz7nb1LkDhTDhyKXaEcd
	BUbAFlz0FT/DcDb7xX5u1KlTFQsc7CWn3aPVbZChFX2wk6i6HVjIuT4BycdRUYHh6HsVrtisI5W6C
	ioB8unTIouDI450o3owc04KB1MIt7cscIXrtarDZ+w2akq57BaozJScUskAmG5VfgIvfxPePhjFoZ
	xbNjUjCPM2mjzJF2akIrp2Xd+AQn0U9iRiLxXIH7VtxOe8j9mVrvMBu2Cx91lQpecx2jiIs1+671a
	4Ee31AwajwDXisTua5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFn-0000000EDbX-1QWv;
	Fri, 25 Sep 2026 19:06:39 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFk-0000000EDXu-0OrX
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:38 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so739196f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363194; x=1790967994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKydHBQhZg4wQNNFJ7SLaFYuzOXlWjr3DhFhWOomnTs=;
        b=c7VYnBI4XFS+JBKhZ689Fa5NhDRA+KSZRe5GUK9TqwxxeWF0+bvn0cbacc4wJCpoS6
         T7K0jRC3SHnPCoE8nNU3Fn8ljtfMfexACg09eD+hM5T/DrEO1W725Iy5sESSQOFZu3Tl
         TS46lLb62XneH4Z3DNN3P5L2WcNciUpqGmjKAl/+dMZCLJYhH2Wt/DP6QZobrDr3Q+8i
         ONmlVao3CaSA5i1zSFp4CxGQvtahdCsOX6rrNJlWeC8smiG8zPKI8zN46+k2B3X0e3Vg
         sEQGX/XHHWBh7vQWml+bFg4diLGCgeoUr8F8K0ht4gacA5PKYlUFG6TIZSL6zcfnZZIN
         DTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363194; x=1790967994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKydHBQhZg4wQNNFJ7SLaFYuzOXlWjr3DhFhWOomnTs=;
        b=loA934hOxladz1W46TfTMGEAVb+69CM94WGvjFNyyzhFfel4bxQMJQhhz244KeWtV4
         lylfKzWmHtt8T+Q3g8tEmUMHgqV+EKYlyypE3GMRadzOVdaJpjUHX7dUQy9xno+GJcae
         Je2Z3UkhlcxzXy4Zkmiq+30l1AmucAjTaVlyV0NAsuxIFldMC3My0dpv7VtUVAE08IQ4
         kwGUQFTbR540xkWk7PwEGkHviQ0wbAULR//eQ8+LNpOIbkNWSUi+UyXCH5XInrldxWD1
         cVM0CDLHMxsN05yMe+KZDpsPS/HITMJgA5M2lhLJSjF6tG7vzzc66uEj47hxun6A6YrY
         VIew==
X-Forwarded-Encrypted: i=1; AKwUvBzMCPu9yYO1bygnRtYRWYlqCyrTC1VXBpRVtgJge9DLjkQz1NXvJfMwQ6UOV8LsqbtumvWNZmKfDGA=@lists.infradead.org
X-Gm-Message-State: AFuF++mAubpykwNTqX+UOZ6wa1Pl3XG9tJb8K4Ga7ph6ZNqA4r7ufj6W
	Nk+wb0Xb4OQ78IBEn8fIkbyb9aQ5CTCyfh/xreuMq9tB1UpoiCCd5y5E
X-Gm-Gg: AYBFou3xbZ6Jc3w0H7FqeLMbsliAma+qgY+QSMIq5vPAMa26KJv4wkrqglZ9XZK51lq
	POpPyrAgkXFzux1Lse7hlmvF1hfcFKaeoVMaIy3ioujDoz6mlEmlmgmOLe53zuZeh2aQai1+L/b
	/52YnDGDW1coXqApEnx2OjPpukqnZHw54t/tK+PBdMcS1RQlnnsDG6+CRdtKdNa16Iyb/R5qDD3
	3SH2jKOA+5PS6omiHD/Xw5s/Q4i0w7/jRN/cK/WLBcepBn6AU5xXL4c+zkBrYuVL8fz7FJAtofR
	nsm8ppicsyn4bF+AtGgrgnmjareJbWmC0/6Pssod14WMncXunBrgc4PlT3tLBiskWIvoRg+5VzO
	+Ch244Gn7BVOAS5QHngIGSMBXb7PNOpgwt+RwC0dV2VFl3jidWR3rTdhQnYb3i/CuTlMn4n/MpY
	S+lhrTnC7zjwR4pynKw1OYl2w1dHdppCJHr8irieeeRBT0P2ZcNCIDYmQwTviX/LKkMrIvVXrw1
	Y+Npa+JWL4KHQqVZjraNPVik34=
X-Received: by 2002:a05:6000:2083:b0:487:27f6:a4e4 with SMTP id ffacd0b85a97d-488716bc8c3mr10976651f8f.52.1790363194187;
        Fri, 25 Sep 2026 12:06:34 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:33 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:16 +0200
Subject: [PATCH v2 7/8] mtd: rawnand: qcom: rename 'nand_stats' structure
MIME-Version: 1.0
Message-Id: <20260925-qcom_nandc-share-more-code-v2-7-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_120636_196459_FC4182D4 
X-CRM114-Status: GOOD (  14.41  )
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
Changes in v2:
  - No changes.
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
