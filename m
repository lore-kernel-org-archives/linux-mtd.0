Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2856DC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:47:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF653213F2
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:47:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sZpb/JN+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aWzaZ5KD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF653213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQCRNZCFKzekdOzIo3JCeZaRSGnLU5I+Xr/Oh12yYNo=; b=sZpb/JN+jvCREh
	6P5+b6iVlbbA+3F5DsuEQZbdxJgGqpR4qFRqhiMgZgjgRVHezxIoio/HcmLelSn+0NRgNqBm6wK9h
	4NlcH4vu6HriWbnCS0M+ZJ50QJ1CPEEA1ZzSHxs+gNA+ztayPQsZDb32tjjZ2zXUDwRqk2gLCuttO
	JhspiEC/+jrQ9OrAhW3Z4a9yU1vT1AVmKjNRGGcsPRTna2ttOhPPdNBw9eXEIIRsRViFy8w559Twj
	/nJzRy4ubxdCmEPnOunM2OGJ+vR71kSdxjJGOPtWZGAe7ONw6gBw5TpXfEdfKqEOvf1Ju74WvXDhX
	zZ26/nKE5AsYDRYkecSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5zAc-0000K9-6c; Mon, 18 Mar 2019 20:47:42 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5zAQ-000050-QE; Mon, 18 Mar 2019 20:47:31 +0000
Received: by mail-wm1-x343.google.com with SMTP id t124so14249683wma.4;
 Mon, 18 Mar 2019 13:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gTFecInQYP9wwQj812Skvi7oL3bq5LWKLMuFYZPP1Fw=;
 b=aWzaZ5KD2byT04qun1TNGBXfcx+En48cCP1ycdeUE8xD7chQW38vxt7jkkE/Hs78O9
 FIpluGwpjRIZDbTOrh+0dzzkBI/mYBwzt3VXj1bV+o6+RANctLylQwmqv74UHzYp7Xa7
 Zw5v0OWk8pPOW7oTR+Hgp/EQxj5MKmHjFostPcrdNrbyLUBbB6psN1T33l2dHEk5FfcU
 liIhRDgS0fRwJ7QdnxAdD8VOR+F/GOGYgLKRykWRDRCsjbyHgcI4hhqjamNbclw6wn7q
 EuS/w8Wh0LS/xOfxOdwGxlv1Ph8fpX6I6d0mcCOL+GUKe/ihjtYFzbM3r4CU9X+Kp87C
 zJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gTFecInQYP9wwQj812Skvi7oL3bq5LWKLMuFYZPP1Fw=;
 b=CWY6+7scrY5BrkVxfzN8THyPDePEqKF2R+dwe8yd23YS0CviY27XtW6CMXrdlX3wZc
 6cneFWSDxeNL/VmgfXtWj4GVa4AnCi0pBnoKl02afrPh8FsU+UClCA4KJ9PZpsTQtjjD
 nJUYbzmKuKZ20viZIOxflwEu5ffi/VTo/eOTNeuBy18mDvhBYNXwx5ypkN5cRLyYSW8S
 P4qDlQQ3Cg1Fm0iKiVvBionVJkc2vduNA1yhJ2q9LSlQF4isG+t7K3C/UeyL+sgrZEi9
 LcGnAu0d6H8w2EKEE1vJshGFKzyvnKiQSy/pAdMoGa6cFmidxvlQLCVJkSxJ8OKnn1lR
 7+oA==
X-Gm-Message-State: APjAAAVRRF+SBgSZJ6FXpgNoyQhYHl6z/24uz/zhXc9GOLgurDkM763A
 zGNGrpMFrTNeeRJTPRyp1Pu2SRka
X-Google-Smtp-Source: APXvYqzOc9VNDbIX90H22bol5C6f4c1+BmYF1lTwu47Lth9itBXQhxsE2FeL557FDL+RUmR2PEqSCg==
X-Received: by 2002:a1c:7c0c:: with SMTP id x12mr627498wmc.38.1552942048819;
 Mon, 18 Mar 2019 13:47:28 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900918378ACFECF051C.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:9183:78ac:fecf:51c])
 by smtp.googlemail.com with ESMTPSA id y12sm224849wma.44.2019.03.18.13.47.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Mar 2019 13:47:28 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 bbrezillon@kernel.org, miquel.raynal@bootlin.com
Subject: [PATCH v2 1/2] mtd: rawnand: meson: add missing ENOMEM check in
 meson_nfc_read_buf()
Date: Mon, 18 Mar 2019 21:47:21 +0100
Message-Id: <20190318204722.9901-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
References: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_134730_851849_9EA81FFD 
X-CRM114-Status: GOOD (  10.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 liang.yang@amlogic.com, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

kzalloc() can return NULL if memory could not be allocated. Check the
return value of the kzalloc() call in meson_nfc_read_buf() to make it
consistent with other memory allocations within the meson_nand driver.

Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 3e8aa71407b5..a1d8506b61c7 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -528,6 +528,9 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 	u8 *info;
 
 	info = kzalloc(PER_INFO_BYTE, GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
 	ret = meson_nfc_dma_buffer_setup(nand, buf, len, info,
 					 PER_INFO_BYTE, DMA_FROM_DEVICE);
 	if (ret)
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
