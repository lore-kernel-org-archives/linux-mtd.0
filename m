Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E1FC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC31206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tKGPoY+4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGUTJ2y/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC31206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xfOpUHalt/uWCucBY9pPZLouihvqfMmYZyuc0vNtkaQ=; b=tKGPoY+48H+Sx3e3QBPnP8Ruin
	uZOZllhCr8pqiI+n9d1M+pXGGlF/zLha7+e87wBCwAGCDzoM7ifFPp2krnfS45+TM+cOp+oZ3QZLm
	eVTNZEmiTuqznJ8i0qzrODecF5El2qbAOVzl9hUzEHOmTKxhF1VrMoZMDFZhOPnpV5AwjNaaVHEX4
	/6Lv7LZk5j62Fu8uYZ6ohXDNOHiaHW6V+n4Ovom4N9bp5PkWkzYpOhIWuU6WuF+WEiSZWX9xWLt7P
	JI2iFKBAYsjx/8OTcknvKx9feG2dAPVOhJgF4ytNyR124u8/PIetEGAWG8G63e46AfvVTDTiv9+sU
	aHq8afvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaz8x-0001fA-2D; Tue, 19 May 2020 10:06:39 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaz7r-0000lA-45
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 10:05:32 +0000
Received: by mail-wm1-x343.google.com with SMTP id g14so2046106wme.1
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Fw6/rheGBigvdKbfBBLuoQxU/TmSkSKuizeWdRgiMEo=;
 b=hGUTJ2y/M09GYiVoHWGGBKpUiYz1GB5jJCOesi2TVqLthpfUikFEUWC5P3uLgIOXmC
 qBfz931F8DcSOe55dQwLqdxoyqB+JL9wLiRwSTjs/X4+6cjJOzDABLIvjDo3JFQpPTfe
 c+FXQb/oMHrskFnQlSi/UxGLySkikNij9tlBns6dZDl0fEZcG7f9xadmypxmpo1GpmxN
 HmcuEzoqWFKPGoYCRo9kD1zLLOyIzio7azxRr17RBJdEPFi+/hyQjQUr7pTeahNCMRli
 eNudUA0Graz/NNVBhcY6lswQUW/zKcCkeA4VRfukeEeepXX4wf/L8FoofzQLaZkFy3Sz
 l+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Fw6/rheGBigvdKbfBBLuoQxU/TmSkSKuizeWdRgiMEo=;
 b=kpLQaVVfoCbpK4xpruUo9G0nWQuqUn1cfymOppN8iCcKs0TgTBXkGj1uenB0sppbkx
 2YcT+SkfCT/LkpbAN11qLV2cN6+6Q5063s/g9pHnD0UQgUTLQSzSFdYpVqNkK12JGnbh
 AX+zSOoJiyO03rAlMkrEF+H+iCHe3lwSk5BKM3NzN1ctVNFsnRNiEwYCEUWzbw4sDFoX
 S+cNxaTTHTy5Leo+wsxJhTSkG4/blp7stFxoIg5TJ0hNKKxXLuFss+jKZk4iVl434FiF
 rmhXvX2/hfpUdptOEWw7RmP3eb9/CzK3eohDkeoZSVYFJk2jTP/x6AMUDODnHa8KoLpY
 qBcQ==
X-Gm-Message-State: AOAM532xb5FyAc9oAlOLgqXyW5oZj+/NQWmBJ820s3f6ykX0G/7S2FqW
 VE2lwvIgqpB3Yq4qF4c49XRaIfdfYD19hg==
X-Google-Smtp-Source: ABdhPJyUb2Endq5jxFpTICyzKH30uYBBl5l6QVXyVjVUFOjdiwVK78zZ8wgpgPwWAmEoIX2dt553Rg==
X-Received: by 2002:a1c:6156:: with SMTP id v83mr4443501wmb.28.1589882728852; 
 Tue, 19 May 2020 03:05:28 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.86.140])
 by smtp.gmail.com with ESMTPSA id b18sm19968008wrn.82.2020.05.19.03.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:05:28 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v5 4/5] mtd: rawnand: Introduce a new function
 nand_check_is_erased_page()
Date: Tue, 19 May 2020 12:05:06 +0200
Message-Id: <20200519100507.19323-5-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519100507.19323-1-huobean@gmail.com>
References: <20200519100507.19323-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_030531_195984_10E37CA7 
X-CRM114-Status: GOOD (  12.43  )
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
index 09ee490c08a9..932a8cae4e84 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2646,6 +2646,46 @@ int nand_check_erased_ecc_chunk(void *data, int datalen,
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
