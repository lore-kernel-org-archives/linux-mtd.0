Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F405BC10F03
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:39:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCA1C206BA
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XNQnxBwx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="c8tpYGFJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCA1C206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iBWS25OWcDNeguiQ4N2z4BIrBRUrFpQZSSFDbgJ7n4=; b=XNQnxBwxjDVxiB
	CdyJoaCtcZ6Aahe+6YN6pTa53RKFkPKcJfBF4eVFKJiM0OPXCUY6jUg1rfJtxGDlsvCLgHNqLdjqW
	aDW2JKk5NMJQ7ZO15nFhyKEpVdSjw9f5Ir1Q/yeVIxsz23ZJ2Pn/kl3AXpl+QwM5h2M5yH8qa2ik5
	9e+yepWRh+yMqgFY25LqtUV5i0BFanUuBzC5cVtVpAr/AxZl6qv0s2/r4vO6VmRP4s12rvu8Psob/
	TqoDRVospYQ/BXR7iuGxWLM0Hw6dEWDup79YgdupZSZ+MUHIHR4J2IJsEdYdlwygq8mja10TpnP+X
	ZaCpfZ66ZcGbcDw2wO0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzm7o-0004pk-Jy; Fri, 01 Mar 2019 17:39:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzm7d-0004b1-5t; Fri, 01 Mar 2019 17:38:58 +0000
Received: by mail-wm1-x341.google.com with SMTP id e74so13190468wmg.3;
 Fri, 01 Mar 2019 09:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oq1NBNm7cacxaNq8LhHi5ab7jL27LRskn76/oRv86xo=;
 b=c8tpYGFJYKz4ZF6FXSQquU3Fm5435+e8eY+mx9p/62fxOei9RK280tntkwDFZOE85G
 NnDSmHoRQF2B7/5aBPDtQFPjOs0ahZ44U/751ED8ch94W4L5UawctNA9jhjr8Y+zarlM
 LPNSR6jbb5airKrvent2+aBuouKL/yIJBGUpYRWbUKgX6ToTPOPEnbPamFxbtfFGCb3q
 Gti9pttWYvqO24XS6Cg/T+GbYks4ibGZ9fgv6GFOLU9FIetERhkvOLigaWEs4WjCOIYU
 nvx0XK3V+NkBVgFWPyFoXyrWucPBEWsjh/rq2Iwt2lpWVLTOcpPuPThgMrs+8gU6L3WS
 CdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oq1NBNm7cacxaNq8LhHi5ab7jL27LRskn76/oRv86xo=;
 b=hKisHYJ3afHK639v5w7qEki3mXTjwHqNVfkktYrj2rznYbKXfQzL3ffN5gP6uElum3
 5H5AmD01GZNXVpiAu4jDZRb/op9WRmLTgHI+DJNg3bojOgJuNNu6G/BrOBxTVhMj6Z19
 N0SXCsIb3xtUrjIlh3t3cfKY+Dp5W6gF9NzL6hN7q0hFi+I1bRUxgtIqqc3149Fk25GV
 w0rTECtlinpqTTT5CaezqqtECv9GNp67ncOsuluDSKXpPcJ42kGYxzH7hHvM8omaIIMo
 0nLnLw/IiOTj5yfOUGteSXrWq6ZFji/ZzNxmix9sAYtfQil+YGzql1rMqLlyE92Id1lt
 S1WA==
X-Gm-Message-State: AHQUAuYjOQ7RqoEAHZWlXwGdA3JY2O+Yv1ltT1qlvRUerjI/h1beYt04
 2Bu++NYp3lKW8z6deHUeujzKJz0v
X-Google-Smtp-Source: AHgI3IYq1Ld3vaGWPBjr1KBASjs74zkk5b42jI/B51TIsHzBuf5ubjXGZ9z28w8cVMNofYavIqKxeQ==
X-Received: by 2002:a1c:a186:: with SMTP id k128mr3863770wme.54.1551461935041; 
 Fri, 01 Mar 2019 09:38:55 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD7109200428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d710:9200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id y5sm48577069wrd.97.2019.03.01.09.38.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 09:38:54 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 liang.yang@amlogic.com
Subject: [PATCH 1/2] mtd: rawnand: meson: add missing ENOMEM check in
 meson_nfc_read_buf()
Date: Fri,  1 Mar 2019 18:38:19 +0100
Message-Id: <20190301173820.30776-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301173820.30776-1-martin.blumenstingl@googlemail.com>
References: <20190301173820.30776-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_093857_216916_683F3B0E 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

kzalloc() can return NULL if memory could not be allocated. Check the
return value of the kzalloc() call in meson_nfc_read_buf() to make it
consistent with other memory allocations within the meson_nand driver.

Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
