Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30864C98326
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbhpUAhY+obTCupUytSkwXexA3c1+6lLwG5wt/QDoFM=; b=we7dy6LkloHDO2
	kS8MF3l/uCGoZiJ83puRTeo+RqheIs66klpPcZt49QUX8RBi2G1xxBKF3ntBm+1uVUuE3hbzcw9F9
	VbTKDT9aUTVY9heXKNFvvNuy4n/DRh5IqiNDWwPQZSohiZHWGplfQUYrhB+r4Xak/ovN9S/ftLIUJ
	zdn32S5JODr2meMqPkgUqXJiwV7yPvAoz1ysSEJValbqQPJzqsj7Svsn8sC/jXIknXi2aE1wHzOwk
	dz/kzOHBN9DxqteHWO8jDWaz6Aoub150doacmh35lf0SfsJYW1gT5KywwcOTwqYkGBwUIxbg+LEmg
	99TYaRI0RKjR0YbT4uIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgP-0000000C6Ey-2aCX;
	Thu, 24 Sep 2026 20:04:41 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgM-0000000C6Db-1T60
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:04:39 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so1268765e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280276; x=1790885076; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84MNNzdj38+RRn+cQS3dhseIihk2PiT9tbM5RlyvpmU=;
        b=BB4L2PUZE6dbklPfsBDy25g5xwP6lBIPLA8ZHzOAde66GnVdu8PTiGS/1LtwzKUVK0
         IJetXFDWaXEtT+WaHWzGsi7d6QTAu49gli+5tdtJ/IsqPq6ZaHuQjxFMOIk0GSCHfFsi
         l9ycxX9Js68ff4dSWJNadsCcXREY/ZcaPeBiy7Y69o/IXzwX1mTiekBV2tkCKyfDzFRi
         oXMe4lC1afcpSxmtYkKThNs51e6sZY+/N8RzxTkFAhktYVbxvPIla0W472VAjl570GRc
         r5bmw9Yxx1vZbtp3PeZwE5WwJN+nfb/JtDw56gAVPvC/HKtqWz41ZS5vqFsIAWjJ9t1B
         RsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280276; x=1790885076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84MNNzdj38+RRn+cQS3dhseIihk2PiT9tbM5RlyvpmU=;
        b=n3JL6a+I90z6x6SFn/K4w5WRDn/qcbxAq+I9ODXZEO00+ALZVbUbKQ1OKAs9eZo+MN
         q+j232sg9CzFZBjl3W+BJVpwFah7gneX85JUol4JnbsflHKWtRznXBCZUzbWWfPDDZyP
         byvOpfb9v+19j1hmvpALYsbYXDC7n76gPmnUxYpQDtTK4LxhaIg9uUs5j8YptztixsQs
         bD8tA+R6r60+mSdJvfrRg8sMRrmo579NhaBe0kvXMVOb64CyoybR1lsKWthcYBxB/90r
         z1Dcxp7DwUtx7y51Hn5lSRZxrUTiOMZnJzhM30SS12U2jXqdQneKRuQbTfuoR8kP36CR
         s7ag==
X-Forwarded-Encrypted: i=1; AKwUvBxDq38BzQA4JzXRCaRQc0ECUf1HzrHR5YUMrCZSDRo2lf8ZytwT5ajVqgtfXpHlEnQWh+The9PM4ec=@lists.infradead.org
X-Gm-Message-State: AFuF++lsY1m4zxMFtJkDm/v9dx144t8pjGKyV6+uml7PGsh/Rz+CXdm1
	VRaHVUqyjzjYzZtJEIaHz9beAt5T8dZGS0JRgJ62xI72IfueirpxwWcN
X-Gm-Gg: AYBFou2yT/cQ30wgG3JSesfeStooxHJ8j+EjJVj36vDbNgtYGXJFKY3ST44A2VCTgLi
	S5JJ23h5FOFT8oJ2hLW8agZ/wP263Mh+yfshyEFf5KdBs1eFP0XnzrO1Zp/VI0q3f8GLLLce19Z
	mvqYpY4+mXYAEpLXLaJnQ88YDb+hh2f4P2jtlWbLk3L0lScF3scW739OD1Wd9ZTpMzOCUfTyy8L
	B4wYx9I59VjlRL8sAVepqhpFT/uxhmCPyfiplrWvbRIqPPtdoEljl9qQ4zxRkuXqP+BdfR/GLia
	NhN5KQpTjAPBFucu9BU08QSeJN+QgFs8lVGUmDyekkfK4quUOQoPcJAXcrhTC+NIHIvVh/7josz
	bYhiU3pywK7NhWOcKxH/XX1Ayw1IwACmL1wKw2c8MwYCpJE1hUoOyFrj+BrbrCgUsLujvTtVTBR
	NJ3twV3DjQmDEaTGwd/5n+Nz6JoyiK/VT6+rRHBLrCY/Ra7Zj+L1pV9mx9EUdKJt0IcNZFa+Cxp
	bpRXg9Ug+7x0KVG/JNeYgHcwi2XfISD6ri6sg==
X-Received: by 2002:a05:600c:a013:b0:49d:2555:1a6d with SMTP id 5b1f17b1804b1-49fe66f1ac3mr55486165e9.16.1790280276412;
        Thu, 24 Sep 2026 13:04:36 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:35 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:16 +0200
Subject: [PATCH 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
MIME-Version: 1.0
Message-Id: <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
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
X-CRM114-CacheID: sfid-20260924_130438_412706_A6B5E268 
X-CRM114-Status: GOOD (  15.53  )
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

The function gets a 'qcom_nand_host' pointer as a parameter but it is
only used to extract the nand controller's private structure from that.
In order to make the function more generic, change the declaration to
get a 'qcom_nandc_controller' pointer directly, and update the callers
accordingly.

While at it, also change the function name to use a 'qpic_nandc' prefix.

No functional changes. This is in preparation of moving the function
into the 'qpic_common' code to allow reusing it from the 'spi-qpic-snand'
driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d7642db2e2df..12bfb14cd9a3 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -449,10 +449,9 @@ struct read_stats {
 };
 
 /* reads back FLASH_STATUS register set by the controller */
-static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
+static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
+					 int cw_cnt)
 {
-	struct nand_chip *chip = &host->chip;
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	int i;
 
 	qcom_nandc_dev_to_mem(nandc, true);
@@ -538,7 +537,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 		return ret;
 	}
 
-	return check_flash_errors(host, 1);
+	return qcom_nandc_check_flash_errors(nandc, 1);
 }
 
 /*
@@ -1181,7 +1180,7 @@ static int qcom_nandc_block_bad(struct nand_chip *chip, loff_t ofs)
 	if (ret)
 		goto err;
 
-	if (check_flash_errors(host, 1)) {
+	if (qcom_nandc_check_flash_errors(nandc, 1)) {
 		dev_warn(nandc->dev, "error when trying to read BBM\n");
 		goto err;
 	}

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
