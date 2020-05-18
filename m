Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8442C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 14:01:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D0C20756
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 14:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DLvXjoGw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvwBdK3J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5D0C20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WxKbg3K405E3juDFAoP7FzgOyGFbQtP43J8fhXQbMNY=; b=DLvXjoGwokxanZt/lsROpCj7sx
	cOLzRawsqNslRvCm6eDSoul6SOj+OriOKmi3CQzwUuon+MtgdBNm8IVcF2wsqRdotUmhFKBXIOEqv
	GsyAilL4aFmyW7tKp91f0XQiGdy0ForhK0u2aX429Zi2PCiym33xopti2ZUwtvj/pU8Czen8ydMtv
	LQHV7Bn1KDWktdM12D595QdFAItglPWiCoEFe5FHX/g8uzA9jS9RSFWlwWZVF50ZVe4VxPtdH+qP9
	Kg1YJDXK+kJEL9es2LkWl0jVe/0ILwd4KCs+V1iR0gHPdp0Smcrtl29/3L8sigrJrOIPwfvwjl2kY
	F5rdtNyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jagKR-0004Ab-EA; Mon, 18 May 2020 14:01:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jagJK-0001NH-CI
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 14:00:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id u188so10555333wmu.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2020 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FX8TNCptGGK3iFTps84rr7nd+amFy6w3yf6z9n1Ntbk=;
 b=fvwBdK3JrAS72Dg6AZKgn0+tDykNrwg7gBBpffsQZ1vQJ0XMc/ibB4ETfko3UFcvST
 wXEiRcfmAFxQk1Ap53rY1dn8+X5QKy3BM6uQlY303heMxa2vmCiQKYw1oaGrlW9D5DFt
 Fk/uURXAqymSJp/MsSIAaWuQtrIMI3Na2Z000BEEd5hINmqMOu6abWDn48bd7VOcE5s+
 u97yG3gsaeqvHfIK6Bc4JXtWeInBjO9fGvS1oiosg9mcB0Q7/JjkgP8ece6UfwzsShyk
 HRDrV4NAy3UiHCStXLEzW3uI9OW1Jh19OiO3rYAtTLU/HmAE4eCbWOOJrUl/qxzQLSWf
 bJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FX8TNCptGGK3iFTps84rr7nd+amFy6w3yf6z9n1Ntbk=;
 b=W5EwKyLm4/gCQgTCsD2XXXGSYQC3J7MialuBEMzpddpI+Yt/cw3vGvRZ4ACoiKEHQg
 3GtfyIdISgmwHRcB8uBFOCXEUexIAxrKLIl5y8ZUnK1wJ+1iUwTpOFC1Rn2BZfS6knib
 q8tZHY87GC+X5WL38/JBRmhH9UAamUyAzwW8pZRazzuNbkEsTmg0pcTAM3s5OqsBpGup
 NlYyD9GbTtjnY5wK4AhsXu6Po4C+LJH67bvxEPMiGacPJuhBCHw6JjE8uCFJVuUecz+d
 3bXKUrqoT5R6F49ILyup3phZpZejP2D116msCH9uJCxlITSP8AZhaMu2EnOhr5dVWAjv
 95Ww==
X-Gm-Message-State: AOAM533om0v1W6oFowN5zEQvjLYvrqc+fqhZEsHEoJN7lVj0AI3Dvct9
 J4V+xunt1GahY5KmyE3JKiE=
X-Google-Smtp-Source: ABdhPJwQczAFkXPerpxOthlTabAANkJyTxrBuMCTEbYwFXhB9QX9Ob73IFV5eoS0xDp0Z2eDCKOEqA==
X-Received: by 2002:a1c:cc1a:: with SMTP id h26mr18839093wmb.127.1589810404636; 
 Mon, 18 May 2020 07:00:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:598:b884:8d4:84ab:c471:b6eb:fcab])
 by smtp.gmail.com with ESMTPSA id
 81sm18114519wme.16.2020.05.18.07.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:00:04 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v4 4/5] mtd: rawnand: Introduce a new function
 nand_check_is_erased_page()
Date: Mon, 18 May 2020 15:59:42 +0200
Message-Id: <20200518135943.11749-5-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518135943.11749-1-huobean@gmail.com>
References: <20200518135943.11749-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_070006_450443_8309A621 
X-CRM114-Status: GOOD (  12.10  )
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
Cc: huobean@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bean Huo <beanhuo@micron.com>

Add a new function nand_check_is_erased_page() in nand_base.c, which is
used to check whether one programmable page is empty or already programmed.

Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 drivers/mtd/nand/raw/nand_base.c | 41 ++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 09ee490c08a9..2b9862d9979b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2646,6 +2646,47 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
 }
 EXPORT_SYMBOL(nand_check_erased_ecc_chunk);
 
+/**
+ * nand_check_is_erased_page - check if this page is a empty page
+ * @chip: nand chip info structure
+ * @page_data: data buffer containing the data in the page being checked
+ * @oob: indicate if chip->oob_poi points to oob date of the page
+ *
+ * Returns true if this is an un-programmed page, false otherwise.
+ */
+int nand_check_is_erased_page(struct nand_chip *chip, u8 *page_data, bool oob)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret, i;
+	u8 *databuf, *eccbuf = NULL;
+	struct mtd_oob_region oobregion;
+	int datasize, eccbytes = 0;
+
+	databuf = page_data;
+	datasize = chip->ecc.size;
+
+	if (oob) {
+		mtd_ooblayout_ecc(mtd, 0, &oobregion);
+		eccbuf = chip->oob_poi + oobregion.offset;
+		eccbytes = chip->ecc.bytes;
+	}
+	max_bitflips = 0;
+
+	for (i = 0; i < chip->ecc.steps; i++) {
+		ret = nand_check_erased_ecc_chunk(databuf, datasize,
+						  eccbuf, eccbytes,
+						  NULL, 0, chip->ecc.strength);
+		if (ret < 0)
+			return false;
+
+		databuf += chip->ecc.size;
+		eccbuf += chip->ecc.bytes;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(nand_check_is_erased_page);
+
 /**
  * nand_read_page_raw_notsupp - dummy read raw page function
  * @chip: nand chip info structure
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 3d75e50e5b75..718ce81eb111 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1337,6 +1337,8 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
 				void *extraoob, int extraooblen,
 				int threshold);
 
+int nand_check_is_erased_page(struct nand_chip *chip, u8 *page_data, bool oob);
+
 int nand_ecc_choose_conf(struct nand_chip *chip,
 			 const struct nand_ecc_caps *caps, int oobavail);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
