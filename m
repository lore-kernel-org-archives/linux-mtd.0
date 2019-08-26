Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04B9C3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 20:00:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18C3206E0
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 20:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DNbKo8Kw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIzOpVBU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18C3206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0LBR6zTrrtUUWtjNRAzzmvRKqNVoNB8ZINNVx8wEfyA=; b=DNb
	Ko8KwmGiqzGzOZptN5qRCn5KrbPfMDZkJ7DX4Ze+W3psyb+zLqQ3MX/+/V80M9Qm4IY4sRG1pZN5M
	1PDComPHmScBNyX2qioIzhSWDH2tsqz73cNDI9/D4EIMvoCuJvUOXIBcvBNTPDW4iPCemrZOSV5wY
	wWQByAau/ztRvPhS8S7fGzH3e2bAwdQRMSNHQACG4SMjvHwSuUvsVfxO5Oy0238W0xx11YMpX/SWk
	qiUJs7WErCxhWidxOi3pSnEIK1vBEut3qiD05Spt7v5OW5Wb47CGPDQRjYXc4P3QrWzn3QDhYPE+/
	yeMq70o05JPuw3T55FldsnA9GP/7t8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2L9v-0005Mf-O3; Mon, 26 Aug 2019 20:00:11 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2L9t-0005MH-Gr
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 20:00:10 +0000
Received: by mail-qk1-x743.google.com with SMTP id f10so593645qkg.7
 for <linux-mtd@lists.infradead.org>; Mon, 26 Aug 2019 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gitDgFWFiAYObukIncRSKd/yXSxIJk3TvsvI290/qpE=;
 b=oIzOpVBUIqARd9JSnQKGSgho33n8HXF2OOd7R0omV7BwwD25PhxIL3stBWornrozZF
 WzlALopXzBZ4rNYOM4KvOE8t3g59UDIgDxaRZJ4QRXLvoEyjq5FKaBjGEQiGY8OULRRu
 OxAGCWUw4pWCzyzcIwZrJU8fUZW56+ACHmPRXAIbWCkEcDWGIomyhD1kCK9hFcdTOgfS
 cCknx4o2c9HCNb/msQvOPHCA8OmpexJ9JUxijeXcVL9HUYsobTa4YNVvythBmZh/BAfP
 1UIKoEj5GCgg7uhMigiIxbNePJSfCdqAWUImWE9zfNduNQXqGD1R11av8oRtWwDOOqj7
 FBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gitDgFWFiAYObukIncRSKd/yXSxIJk3TvsvI290/qpE=;
 b=i00HJbKDgNjZE85il+ULTwyiiM9dHf3kNlZYV6aMuRJvSczIQ6WRX4bHRbeyq8uL0x
 +dogSqgAlgR7wDgyXgaEl70LDnsflZvcFQy1KbJUfL6hazjevIu+JObLKQolKD2/EYVl
 yrfmg5eZ/mwpJpKfW0CSCjsT6UanQGc3tF5zQ3GZxnNBlCNnUROQoVVH1bdo+k5nbhUh
 oz6FG86AYxXd0fUeucqDS5xXM1tV5mQi9yMi+pnJKt/xP97d3mNTkdnZdxX+4/K5aVu+
 gBvCBg77WqEIevhB1wTTfQNh7p29SK8O4IW7+WLvfWBckSFeELS55Q2+YzHM7iJtkaLD
 mv7g==
X-Gm-Message-State: APjAAAWg+hMtrXg8dN6KY42iAyaODbwujGd/fbHbhnPpqhvHj/vsRhIO
 HqALcpx8jgnpyimTedNrcDE=
X-Google-Smtp-Source: APXvYqx+npWZxLi5RVoB/r0dxsKSw3thcAXr+4bhSJrIlPweDmqSsBRnOLgADnGU+RGN9y54jdtzAQ==
X-Received: by 2002:a05:620a:7c8:: with SMTP id
 8mr17339442qkb.424.1566849608340; 
 Mon, 26 Aug 2019 13:00:08 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id o21sm6588663qkk.100.2019.08.26.13.00.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 13:00:07 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: kdasu.kdev@gmail.com
Subject: [PATCH] mtd: rawnand: brcmnand: Fix ecc chunk calculation for erased
 page bitfips
Date: Mon, 26 Aug 2019 15:57:56 -0400
Message-Id: <1566849476-41546-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_130009_587785_B365DC6F 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Marek Vasut <marek.vasut@gmail.com>, Claire Lin <claire.lin@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Claire Lin <claire.lin@broadcom.com>

In brcmstb_nand_verify_erased_page(), fix ecc chunk pointer calculation
while correcting erased page bitflip.

Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflips")
Signed-off-by: Claire Lin <claire.lin@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 33310b8..15ef30b 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1792,6 +1792,7 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 	int bitflips = 0;
 	int page = addr >> chip->page_shift;
 	int ret;
+	void *ecc_chunk;
 
 	if (!buf)
 		buf = nand_get_data_buf(chip);
@@ -1804,7 +1805,9 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 		return ret;
 
 	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
-		ret = nand_check_erased_ecc_chunk(buf, chip->ecc.size,
+		ecc_chunk = buf + chip->ecc.size * i;
+		ret = nand_check_erased_ecc_chunk(ecc_chunk,
+						  chip->ecc.size,
 						  oob, sas, NULL, 0,
 						  chip->ecc.strength);
 		if (ret < 0)
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
