Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F760A2600
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cPbRbg7+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlfLBUSz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IXNDlUovJLM+vfu7q+1bb1JL7PpXeDiWRLHFMPhxXPE=; b=cPbRbg7+/dnedHEpKB3YpiRUv5
	hbAYyWxWDjkMn3KkNhDttuk/NWb5Ls6erluM7Z7cTTbkBD2Ow1fhln08cmHd6PcBZcjk7t5IAAQ14
	UM1QrYDyzfYxNOR9E3Cc9CyuIC5SR40k02Al7b8aK5Ju3Koq2+h3EDroxX90R1xhufMcIKMRZj7uJ
	kcg70q49G6V3p+Ik2QZ0ynLF2CYCyXh3myEzHwaAiX8s77R3QOSphvW0uOu/pJqSdDJ5g1qeQKvvE
	/UzApCu5pc1Z1SrFDqbR/O+MlGlwKQdti/bxxxEv+9n1mb4Hek2bPad9lO2g4cyrobz7cofr+Wz3x
	2vBD1HMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF5-00000001ZT6-0GsM;
	Mon, 09 Nov 2026 19:41:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF1-00000001ZQp-3fjI
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:41:21 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e10a70540so794898f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 11:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253276; x=1794858076; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRwbk6U1HajIppxtFUV5odMGeHrOR5vt/U9rXvrWZSQ=;
        b=jlfLBUSz5fkWE/HrcstWuJgXrNsrk3ugdzdmjW0/KEOAAU9Xjy3GMrF0+KEfSRIz74
         dZVGNW2IpHn++M8rX2443Bbo1UjfKzkCHDqC0HMrORGN9dOw8Kz8o0QfosaNThSUtAZq
         DMOTrSa7A2ON6aMlDPhikHiq97ipK5qrtgug+TVPpK7I2UAwKPxVNDPhGK/NEKMY+Uwz
         imAHD8cGqOpd6YAtjT9A0hIAA/+ZLxyjDVpr843gtQ5+Oyr6KYnqjcnPEMCh/2so3Lpx
         V0+kUjM2NOCXpo9v5GrmIOH9RL+EPQgnueCAb5bDxAsViw9iF0wD8tiXPVLuqwhTBeFA
         m01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253276; x=1794858076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRwbk6U1HajIppxtFUV5odMGeHrOR5vt/U9rXvrWZSQ=;
        b=an1e3kzpIlIl5MEzTvwKfoxxNmkdKhOQuLVjZAo08fuSNb5DnQVUoLrj/pD2Bt/NuE
         WgVf+sJ5VIduC8fCZ9nrrK0Xf4DfSirosAsk5VQpftutCsRosNZpNIeTVE3U1EihARTL
         qnPqFALqybPRBnxklYRo2gFMMeba59PKxNqDU8X0idzb/+4knTj4IxkgIOfutFBZoFh3
         tV9OGrAl+G76hJMlBYViv/wvSooZ/JObXf6CrxEfJfQH2ii2JTs4Wk4NbogK4EBVzQeX
         ObiKO/FM+oBDkyQxtzZLy7HudYBaoJkur+5ldCMPoBGicrv9PWNWHQQ336c7S99iefZx
         ApRA==
X-Forwarded-Encrypted: i=1; AL+hErG8l/xpb7XRjdb0+WX0weZNp+lEMcl7xRgs8uXlFFR2WPd7CFhjR3CVMpov04knOyKL9YKCYPpLzgI=@lists.infradead.org
X-Gm-Message-State: APuU4Z8ENS1OEQexEk8gA9FWVjT0rhWXOt65XzSlNyFJxHerz+B8UYqK
	H6uCWnqdWGVa16F2j5y1WqDqMU1Tihug0PDySPCkKOm0n9LiWD2s6hzv
X-Gm-Gg: AYBFou1Zubvg2IdoDXEIJMxlnZcOCKR0FQxYy0uzHATHXyu816HIXMpIhJAQcibxMgq
	ufNKYUEiBlwaDGWzg85ecsIn2dSMrqbEO27gI7o6v884pxEEHt4hu7SWz9R28RZe5pXC9MCluqS
	sb+FZwB78c4kbKt1s5+CitRwCF0e8A5mKlD066UkcGQrSPoqXZOE+okTS0j2oJGSB97bETnlgB0
	HgzvIBJxSZR1HvB61Y0ac5s28p6rST19wueatv79J3ciMtGd4hRfNYBBAm+AWhgSnARC81QqiQZ
	D1Y0ZTJIfVtoQJ90ZiZ1nITVYD2OJ+7c565iZLS9kWAQXSoDHtHz9u4NwqDBkE7GG11MOC3jEZD
	uIBdzlJxNUckoChyo0DKbVolLpO0Rl75qt4ruC9rf+4sglmob6caKotBLTzgTXODPKXSOVmkEus
	o/UNFwKkmQRDWg7t6DFcU/H1Qe19bX8w7W3oOTv7eOCRoFW68atkem89vWEOtBfyIRKMgLtG+ct
	0CZcSbM9duZrcrxluX2ws5QfyAPCIytwuFCgb3kYozRWwy34Cxnpcjy9RmOsLzkCLAeVh1Q6DWB
	H/NZ6nCT2eqD1A+KRM18kVJ5CYWBfEdjJyYhRgBthXu6thftodIi27pMlL8UhRlIfkeEK2jbpHn
	3nOo=
X-Received: by 2002:a05:6000:25fa:b0:492:e1a6:90eb with SMTP id ffacd0b85a97d-4982f1c0674mr682603f8f.10.1794253275742;
        Mon, 09 Nov 2026 11:41:15 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:15 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:02 +0100
Subject: [PATCH 1/7] spi: spi-qpic-snand: use the common
 qcom_nandc_check_flash_errors() function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-qpic-snand-use-common-functions-v1-1-1e8601e2db84@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_114119_933289_224BB904 
X-CRM114-Status: GOOD (  12.62  )
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
 drivers/spi/spi-qpic-snand.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 41685a286e38..981e16221b59 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -592,22 +592,6 @@ static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *sna
 	qcom_spi_config_cw_read(snandc, use_ecc, cw);
 }
 
-static int qcom_spi_check_raw_flash_errors(struct qcom_nand_controller *snandc, int cw_cnt)
-{
-	int i;
-
-	qcom_nandc_dev_to_mem(snandc, true);
-
-	for (i = 0; i < cw_cnt; i++) {
-		u32 flash = le32_to_cpu(snandc->reg_read_buf[i]);
-
-		if (flash & (FS_OP_ERR | FS_MPU_ERR))
-			return -EIO;
-	}
-
-	return 0;
-}
-
 static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 				 const struct spi_mem_op *op)
 {
@@ -651,7 +635,7 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 		return ret;
 	}
 
-	ret = qcom_spi_check_raw_flash_errors(snandc, 1);
+	ret = qcom_nandc_check_flash_errors(snandc, 1);
 	if (ret)
 		return ret;
 
@@ -819,7 +803,7 @@ static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_bu
 		return ret;
 	}
 
-	return qcom_spi_check_raw_flash_errors(snandc, 1);
+	return qcom_nandc_check_flash_errors(snandc, 1);
 }
 
 static int qcom_spi_read_page_raw(struct qcom_nand_controller *snandc,

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
