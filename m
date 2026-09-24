Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6D1C98321
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFWYkWNCVAt+gZV+KKU0DOFyqOwGXJzUlgLMv9hg+bk=; b=tsScAOPSzte/HF
	ChhwnYHg09k4ZQ09KYvgP021QEFhHzsG2nlUxDrCV/0+pszLNOaFu+F9gwin14XwL/CXM8fjWOmWE
	XyoqOjLJgdRJdXnpAbLkSEd8B3wAqyuj23dIWa9Ea6YYqaVJTdcHkOcCAbqVogTBLBTepMNj5BFXq
	9oriUXR7IXY2JCAHuSyZRA/QBR5S69AEZfh2V+Y0m8UPej1d7iO6zm31S2soKv+uULJ6BeAlDMbLI
	MNOvhncN9IdJ5IJjKon25nd+nKbWealvw4mPGWvWJVcJl4z9qMa6eheHpFRFd6Y9ZOEzMAqq00dUZ
	NbGb1KdrsaSZKCvvxRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgX-0000000C6L8-2Xhd;
	Thu, 24 Sep 2026 20:04:49 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgS-0000000C6GR-2zvw
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:04:45 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843f22dc83so138795f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280283; x=1790885083; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbc6iQ0ywUYDK1nXJ/WmLZf8Dcp9GFj+ZSwYgXpoTt8=;
        b=YkgfdqxgriNbrZPrQQZmPk8MG0FJtbKV7mzYa9c4sIU9+9xp3W0plmBPK/z6fDq/A1
         EQSHfe9tk49mg4GjNLyyQTigtHZkNSilTyzH42/cCKpX69+B7xA3KH+SM3ciH1ldEREW
         +1cPKI6aNEm9ZujM8DWdBTBv8Q3huMYt186DAFvlMoujlU6iQNPAah2pHK/3kPDIh8vK
         B8v2fERwc35Ji82CbYi1YjzYhaV9lyuDLm7eAEV9UwrXiQZ0mGo8yr0kEFUJOidUKVMO
         DnKK9sqHE7qJB4uJaJZ9zxHl1VoxxLPb19Srypz5ZD9sr+SwDmvyUrLEHvVnXQmF3gv0
         geKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280283; x=1790885083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbc6iQ0ywUYDK1nXJ/WmLZf8Dcp9GFj+ZSwYgXpoTt8=;
        b=jhH7DVtxBOT5CKzJ0zDSw45t4gzSQUTC8UMhaSStZ430K7zRBhzLqKiUnS9ragx8Cd
         9Lyimb/ZmRuwBr7AAJcXz78twJlrsG3W/FH2lVzTyk/X7R3Hd7T/ZDcjP6fpOb2jd5rp
         F65NlatRbLX0TPt7Bjz/seq7TGkiPNZtdtOsn3tC5LWnc42t63rDvCjWVyvaRSEuC3VC
         8Pnwsp1MtLc7XrZObBO5bjehsvWz45HwivBqGI+lRdPHmX2UtpT59jmTwPXBQfJTZ7uV
         S54UqRarJ6kcBMRI7a0J45cEJZ4dbf9y7fqdNg/CDSXtUH50B4dEXmBUcw3xc8pSfdgj
         FdcA==
X-Forwarded-Encrypted: i=1; AKwUvByPwof6JOQz0ce3RpdeQr7HxNxwJeHDzO3EdhHXLBPtf57jVyfSkxFS0CXYE3YEbVG9NPPEvDppNVE=@lists.infradead.org
X-Gm-Message-State: AFuF++mOPWji0/PqkYqh/nGupCra/b8oO/gDxAxRpsmbfMmegM8HVGZL
	4QIn12eVJW38iVCUueKQFf1crI0vtKTicy7rHn+fkNLXazLwDkyG8SDn
X-Gm-Gg: AYBFou3z+Y+t8zYusycNNYR0LdwKriW7Xi4tumGubL3klUrK3Rj/IS2ziRqWi7etu8r
	buj3HcpwrXkVZvPi6VvbgD2zpTi4e3JGiv3xqKd9y27+3IhJbH+3uooCaA//N4cTaM3kbRwz0Qf
	/FEUgAKXkOb+ZqafuNxqpBJYG/Cayo8vrW0aV5DdlN3/lyt71DIoCzpVeA2h9xEXLuPceQQFzLr
	JMlIjdYES7ApT4NM82AC42RuGQEKFIXZGOx86Kjgt1Ms0iXE1ckxXF54tOv/VDCBxcrwem7zmpA
	EkcAPbvOEj3ru/YAD8foqDiu/HPplywMWJrGbTk8SLc1qR/gjnEF9UQWryaJvVUQ429Z1QUhlwN
	feEPQoVAWAUoHO3GnXi6/Ex2EOB3IZlwri7fDhiRZaySEUOACItVvM8d8TdIFS0xkNsFe5qjlaa
	t/iQ/EMXF+psGc0Zb8yHlVCmx1DaVgxcVFW7u2ybHC80z25chCbCzmd26icx6rok6gLmMkNQ/CO
	TGwRp4Rcrf/52FMm8bRaXrKwx0=
X-Received: by 2002:a05:6000:40db:b0:487:21be:dcc6 with SMTP id ffacd0b85a97d-48872a77f45mr6028406f8f.21.1790280283045;
        Thu, 24 Sep 2026 13:04:43 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:42 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:21 +0200
Subject: [PATCH 6/8] mtd: rawnand: qcom: make nandc_set_read_loc_last()
 more generic
MIME-Version: 1.0
Message-Id: <20260924-qcom_nandc-share-more-code-v1-6-f3012199b161@gmail.com>
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
X-CRM114-CacheID: sfid-20260924_130444_780788_1E60A1ED 
X-CRM114-Status: GOOD (  14.35  )
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

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qpic_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 96a1a5a03de8..cc1e64ac4245 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -181,8 +181,8 @@ static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
 }
 
 /**
- * nandc_set_read_loc_last - to set read location last register
- * @chip:		NAND Private Flash Chip Data
+ * qcom_nandc_set_read_loc_last - to set read location last register
+ * @nandc:		NAND controller's private data
  * @reg_base:		location register base
  * @cw_offset:		code word offset
  * @read_size:		code word read length
@@ -190,11 +190,10 @@ static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
  *
  * This function will set location last register value
  */
-static void nandc_set_read_loc_last(struct nand_chip *chip,
-				    int reg_base, u32 cw_offset,
-				    u32 read_size, u32 is_last_read_loc)
+static void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
+					 int reg_base, u32 cw_offset,
+					 u32 read_size, u32 is_last_read_loc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
 	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
 		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
@@ -226,8 +225,9 @@ static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 	reg_base += reg * 4;
 
 	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
-		return nandc_set_read_loc_last(chip, reg_base, cw_offset,
-				read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_last(nandc, reg_base, cw_offset,
+						    read_size,
+						    is_last_read_loc);
 	else
 		return qcom_nandc_set_read_loc_first(nandc, reg_base, cw_offset,
 						     read_size,
@@ -1916,7 +1916,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	len = nand_subop_get_data_len(subop, op_id);
 
 	if (nandc->props->qpic_version2)
-		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
+		qcom_nandc_set_read_loc_last(nandc, reg_base, 0, len, 1);
 	else
 		qcom_nandc_set_read_loc_first(nandc, reg_base, 0, len, 1);
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
