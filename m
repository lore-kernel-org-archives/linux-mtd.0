Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E160A3832
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OtXrSH+o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k32GMRHa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GohZLjhdgJHHbL963lg5qDQvVaOVV5xnHGZ0lbAQ1S4=; b=OtXrSH+oWryg0A/mIPerLeoVte
	6WTlhAvrMx4vUc9Mp4hMigi6YIPJTLO35V0U/niL5NilfkxOYvA9eaqClcxqdzkvNLCHgXZLicjOv
	ZXVN843j9hkIqDTZ060crqJSKzmO5dUeFWscnhmdga1OIPHasEcfvq41kh5pvn9hb1vVQArlHkydU
	ua/LmXBqvhlTJXUY7TM/tqlcQ0xlctJRuOY99C7ytwfwT7p8SJ5guS/g11bEQzrL2XdBHUC7W9HRU
	aOwhoIVg3sdN+q5ZNHXVuPW5sX+XQiPOhATNONtcc6rppIRMSgRHkK4eqeBKpHuM4sVWrYdDE9uBR
	t1ypyexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF8-00000001ZVT-2gFv;
	Mon, 09 Nov 2026 19:41:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF6-00000001ZSl-00xv
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:41:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-491846221ffso915772f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 11:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253282; x=1794858082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZi3AbEuRwrPOxFpdt26jeERVpxEwSJfhncQlRMhB9g=;
        b=k32GMRHaPFZRJN/0ei8xzzC+nX4RSjV8+y+ryN++Y+VReS96YjwvU47rTiQi4MXhWl
         Py71VmH7KGUeSA1TdYd6gehENaJrMlWxb4TOXcQf3AH8fDeZVJZg7Pff1PbfBNl6X9Io
         rJK0o79uYqahQQMZ2F/ngLHFnuVkY99vHwJdagbm3ssZqO3KrdfjkJ0vCls0AhpHCKeQ
         Ol4cJ+bbbDoS3PbwR+xlGpH8G+Q1UdhxO3HnoauHBelHtp6uzQTwkObhgEpLCcq5soMi
         B1mNefMZTgZAM8uH15dH1vyR0bYUEb6Rw77k9u7vmdtOuTrZWPABhpVJ6YIIwDYCTZol
         I6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253282; x=1794858082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZi3AbEuRwrPOxFpdt26jeERVpxEwSJfhncQlRMhB9g=;
        b=C30zcjwejDu89qNzPPyCygMd40jpvsDZj+vZ9ydBjtfVw+lyVIKd8AT2boWVCx8t7x
         H2zLb4K3EsgiD/qB6v/VgVgbBg78t0oBxqBCn5rJJ866GkaLia7n4dEyxz96gNzoRugz
         65YJLEyqftBCs1epyjfjxLOsZ59naBqoluzyVmYwN4gOuvcRP/5Q8mo/7CmneBRcJYSB
         2t9yrg9s7sAzwLmMWL4WPcHj+4kNCBT9s3CyLPMRDTlKkt9VsAEku2WC8D/CkMITBIOZ
         yW62mmKBUdrXFlwehr8VDGFfxVj9/lLOA3KqUZPV2x+2wvmK7dAD/YwRSzCBp7jbFDv/
         WlWA==
X-Forwarded-Encrypted: i=1; AL+hErFfs8NzuTharnXuF4MKporF1NyLav6VJnHd9bPOyzDAmR3IE4wYoTVYBJ7jmTfoVuDpLHdjQoObs6k=@lists.infradead.org
X-Gm-Message-State: APuU4Z+9iy0E+6aReZDQvY+55piyhOSU8qEimpA/euu67G5tdsXe/a8w
	4AqoRuT+M67jZZZMeX/zGTsvNL2d3v8qRZyDPXGymCbyUG5Z2XnH20nP
X-Gm-Gg: AYBFou1jcVC+uVd3pk8tZTI7FF+ZMHZegkayLhA9wkDwoHQV620mrdXoy4wpQBi1qR5
	oYPFB5y8TL+lzZef1qaSmAKTFfniLvjMzv7YdjWkZs8TxIG1QvYakyCRZ4o8O+rMW73JuruhvNe
	g00d+d33klKuImihslo0lZtOBVgQoG7eFloWBWQTowpT9cNPzAS3Mb4RzuOTDx52++5+oJPcXHO
	K5/RJptLr/yCZDvaFbOxsxUld7eKq0fymIRyR7lcTl6qXUBvN32P1ugb1ll7PbTMoC5kNA3g39w
	yfkRBYsXUxAcsICGPEQMO/OOMuZfYbh2zQJDnvWWKh+EOZy7k+6K2gowkDFXlyYisugluTvaP1F
	RLwHtTVGp9VATB40n43qSnwU3EO9Vytrja6w8/MfruXXzbfzPB+0ypgsv+vDr8dgsO5VmzffSNc
	SlmHHqtgDyyV7moP4+V5VweMjT7UgYUKo2j4kEykv4nb5tAj8YCZFM+ATZGqXdFSUrj2GuAI6mV
	ERndAbemLHstavbnCYTChMOiGlxGG/gv6Sd0bVZgBnJJdZGboThAzuRMhnYSWAq4ld/iE/LnyE6
	y7CTR+L8LIJfnu/qc4+z5fKeZSZQQ9s5Rr19ZX2qQCSebcy/Q+lUV3xMFQ==
X-Received: by 2002:a05:6000:4028:b0:48e:2f7e:bdbb with SMTP id ffacd0b85a97d-49830d81993mr835355f8f.50.1794253282019;
        Mon, 09 Nov 2026 11:41:22 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:21 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:07 +0100
Subject: [PATCH 6/7] spi: spi-qpic-snand: use the common
 qcom_nandc_set_read_loc_last() function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-qpic-snand-use-common-functions-v1-6-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_114124_067501_F6E29F85 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The common function from the 'qpic_common' module provides the same
functionality as the locally implemented counterpart.

Use the common function and remove the local one in order to reduce
code duplication.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index ad91edd5f6df..4105a04afcdb 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -122,27 +122,6 @@ struct qpic_spi_nand {
 	bool quad_mode;
 };
 
-static void qcom_spi_set_read_loc_last(struct qcom_nand_controller *snandc,
-				       int reg, int cw_offset, int read_size,
-				       int is_last_read_loc)
-{
-	__le32 locreg_val;
-	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
-		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
-		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
-
-	locreg_val = cpu_to_le32(val);
-
-	if (reg == NAND_READ_LOCATION_LAST_CW_0)
-		snandc->regs->read_location_last0 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_LAST_CW_1)
-		snandc->regs->read_location_last1 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_LAST_CW_2)
-		snandc->regs->read_location_last2 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_LAST_CW_3)
-		snandc->regs->read_location_last3 = locreg_val;
-}
-
 static struct qcom_nand_controller *nand_to_qcom_snand(struct nand_device *nand)
 {
 	struct nand_ecc_engine *eng = nand->ecc.engine;
@@ -490,8 +469,9 @@ static void qcom_spi_set_read_loc(struct qcom_nand_controller *snandc, int cw, i
 	reg_base += reg * 4;
 
 	if (cw == (num_cw - 1))
-		return qcom_spi_set_read_loc_last(snandc, reg_base, cw_offset,
-						  read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_last(snandc, reg_base, cw_offset,
+						    read_size,
+						    is_last_read_loc);
 	else
 		return qcom_nandc_set_read_loc_first(snandc, reg_base,
 						     cw_offset,

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
