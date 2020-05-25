Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04D3C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 12:19:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63FD32073B
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 12:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UvoLqXJm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khV9PF9K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63FD32073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fDexUg6GjQRZHnOdSnS3DSQF7RgmaF0URw8OCo8P2wQ=; b=UvoLqXJmmpgz2z42JLMJTMASmE
	F/oL5h3+oSZ3iTNAtUjb7oG6Iv05MF9U83wHLKwLK4f6r3dgQMrXg8NQUr5206E07ptXlyD2DF5EL
	tpzO4cC0tMQIOwU9feIQIuoRE3vC1GMHn86PndOKHUPsDG875xJLqdUp2DMqZfZ+/en4Ds0B6pAOS
	mq47IJBCfvqkNxRTEFhAhg39Wve8KwH2uXMWFbjFJtYZq1b2AIzCyn5kAza+JVkrNaZFlcgfcwSwr
	SmewF0F3IM036D9V7RdJY2EvgPu2tmhsZSNypO6m+jQYiOSrIXd0Fpa/NjVhL5ZMRUQ50E1dF8O9/
	kjXldoAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdC4v-0002Dp-KW; Mon, 25 May 2020 12:19:37 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdC4D-0001aL-RT
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 12:18:56 +0000
Received: by mail-wr1-x444.google.com with SMTP id t18so2840529wru.6
 for <linux-mtd@lists.infradead.org>; Mon, 25 May 2020 05:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tnV8x4gDO8btvOVgLJWVb0PglojCJzIhWmSmYw6JRuo=;
 b=khV9PF9KpiDl49HySg78jC0TRfHV/Si5sxE4YDcm778rH0yaE+qRRwBfAKjEFSdABq
 A4CCPq42e89TP8EPxRT7FBRDbascYSyTlhjByqpMMZQijym73ljxwVDr0adYBjMGsDfE
 zaUOs0zPKzsMZi4j0Iy4oshxnDwQ37j5iCSU2McXnZ8yoEc8vZERkiDwZAdpNg/a4KSp
 i0DTcsMu3kliDNwcHQZh4X5rFccgbykTqLaTOMBK7nN5b7n9Z0UTwOrzGyZTfoQD08X/
 WilJ9n+3Ew1ROt2YHnKnnsan9wPYS0cxALDPENp9bgrKA3zVWB0sl4jYaPVlNuwkgbZJ
 fWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tnV8x4gDO8btvOVgLJWVb0PglojCJzIhWmSmYw6JRuo=;
 b=bjSuPdOaxUHjpxvfi1Q+vfCfxsOPgXnGM6ldcpTAoa1x72DLp6mwKjQTrO8bbFjMqV
 Q4+XKoYvbPDZG2BHh1Vqi0kPYqjRkt1Rnw2vzq3LUusVWWFjyvOdDv19cQa/9pY/Bu3I
 L+nzJW2qtZHzapFI1pKHHNyhOA+ddhenIMKuvF6D03oR4DhtDU6uogOvHeQ5NH3dmXhP
 LErUGI4/EYxpynXaj/VNrwzwZlH0fwvzJ7JOP3F09EmOPjlp3T7AhDFY3+gDin4dh79v
 QaMPqGS1hB/Ts3KwAi/CTPG4MxVEofY/mrgzLnEoCIzVR7dtt+4yLDICxSgqCsYMnjwf
 xa/A==
X-Gm-Message-State: AOAM532wGm59zb3UycNucSVhKK8F5AAUBLj/hXZEPmz4mwiKXeQiEvN0
 JA1SUIWLQJzl3SPXKbUmDQ0=
X-Google-Smtp-Source: ABdhPJwhkTEgjfw66VRA50ZFlbixY2EdnhRPhZB3HXoieFs2HwDvJp6n9u+S57CVfs0NzxlZ1CnYAQ==
X-Received: by 2002:a5d:4745:: with SMTP id o5mr16181013wrs.128.1590409131497; 
 Mon, 25 May 2020 05:18:51 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.203.62])
 by smtp.gmail.com with ESMTPSA id 10sm18136635wmw.26.2020.05.25.05.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 05:18:51 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v6 4/5] mtd: rawnand: Introduce a new function
 nand_check_is_erased_page()
Date: Mon, 25 May 2020 14:18:12 +0200
Message-Id: <20200525121814.31934-5-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525121814.31934-1-huobean@gmail.com>
References: <20200525121814.31934-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_051853_893771_C6A10D3E 
X-CRM114-Status: GOOD (  12.14  )
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
 drivers/mtd/nand/raw/nand_base.c | 40 ++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index ab39bb33e688..05ee32106af9 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2697,6 +2697,46 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
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
+	return true;
+}
+EXPORT_SYMBOL(nand_check_is_erased_page);
+
 /**
  * nand_read_page_raw_notsupp - dummy read raw page function
  * @chip: nand chip info structure
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index ae1cc60260a7..44c2715691bb 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1339,6 +1339,8 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
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
