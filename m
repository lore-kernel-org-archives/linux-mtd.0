Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DD4C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 14:44:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B1D21743
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 14:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jafova4j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6m0bG+u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B1D21743
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Siq1RqzIn7b2y1ixXxigXwsVZshNa1a5WRYEEPJvQ+8=; b=jafova4j8qRjwc4WamkZvkpgpi
	8VZrA/gDPqKY0zZRFBdadxCMSwTyTwOJCwkcVtrJxUK01jSBlPudjnL8e0Mc+Izb8pVm2Bxb+jdCH
	sQ7+ghUdDmO//AKTzf4KGRPhMploqnWjObs/sJL8wy/6HkbJ2ysN4r60nPzpxwjbJrXBS5K31wb5M
	PDeLzy+x3H2lsDj9LUyXJn5et0n3uiLxMlwld9nDOUA9bqhOBaO6j+WSNYECd3/ymO7MKocSwq0N2
	PDz8BHJcI8zCxPlhYxt4uDP7f29Vgfp2UWJBY49NVaA9ws/F/c5f/0biv2rUVL152MlKPlDiq3WUW
	RGPTIeKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT60b-0007bH-EB; Tue, 21 May 2019 14:44:53 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT60X-0007Wr-Tk
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 14:44:51 +0000
Received: by mail-pl1-x642.google.com with SMTP id r18so8540348pls.13
 for <linux-mtd@lists.infradead.org>; Tue, 21 May 2019 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+YjYseCZQLoFuFy6wB+/po9n3RrWPo0OCVJ23Hjgjzo=;
 b=N6m0bG+uzJyuf+DqjNJb+TpKxpL8saEuXMtNVMAixVRdWPgVWnBoBFB7DwGf9okZiV
 WRgwu0rORwzAJV2dJpMizvWiHbdB41xYe/NhwVp9xt2c8g99kmJn200iR1u0cFu20XxB
 GcwSlvogROTc7LhP5sKxeE2aSz2Mm3hVynpdoo6GKB0sl2Y5Ydtdo+3pcWh8qwiFzOQe
 mjqp+Nxj/BS3fy90oYbWqkX+wBLUsmLLutQSjodabbSB/SyQotvIJsi64hz8AWByWo/q
 9ZahZpO9zY/2dd4dkgGHoJvI1tbjbIYBxQ/LiylAu96Zy9W+6Ke8oib2Q390RvuXCjbR
 2LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+YjYseCZQLoFuFy6wB+/po9n3RrWPo0OCVJ23Hjgjzo=;
 b=sF2bFNspGt/nB5N+62U9kAyAOr6bw2sCHqnzTWUhdeg6vf2Gx66esyq70attfyA3iY
 RgC7y29SXNbXwaz8FOYBQqMtrGMPtTowpCGT3RpyGBRWg5RXkJuwis1v/CzdhDl5LG59
 p7MZg1ECtCYHcjyNcTQHyQAqxXP0SU1F4DprNsTITZHud58kiAiM76x0inn1+fzppr4s
 PAaErC5XsEE0mJn/F0Ox5zdZ4nc/qhJbGQBjVOvFSpAFQ6Fx0+jCQyaoHmdK6zUgngC7
 fBISQmyoWMVeumN7eniAq1qxt/CV+KcspO6Z8LqVtfd9Sgibz5Ghm8RGK7Gm0EvvDuQI
 ybEg==
X-Gm-Message-State: APjAAAX8I+myeA1awdIx6pZh1bYs58Tv/pomVyFuvRzzzLzwgI9CjQ3Q
 QpRzgvrburcUJshJiURtj3LDUDDP
X-Google-Smtp-Source: APXvYqwfIL0O2kND4Rj47U/np0ygx/4AxrznFqfRoEJlDQJHOBU7SmyycyslnSilj8K1SoQPunggKQ==
X-Received: by 2002:a17:902:3103:: with SMTP id
 w3mr7998295plb.329.1558449888952; 
 Tue, 21 May 2019 07:44:48 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id g17sm13227945pfb.56.2019.05.21.07.44.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 07:44:48 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/2] mtd: nand: raw: brcmnand: fallback to detected
 ecc-strength, ecc-step-size
Date: Tue, 21 May 2019 10:44:22 -0400
Message-Id: <1558449865-36852-2-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
In-Reply-To: <1558449865-36852-1-git-send-email-kdasu.kdev@gmail.com>
References: <1558449865-36852-1-git-send-email-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_074450_426852_B2FA81D3 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change supports nand-ecc-step-size and nand-ecc-strength fields in
brcmnand DT node to be optional.
see: Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt

If both nand-ecc-strength and nand-ecc-step-size are not specified in
device tree node for NAND, raw NAND layer does detect ECC information by
reading ONFI extended parameter page for parts using ONFI >= 2.1.
In case of non-ONFI NAND parts there could be a nand_id table entry with
ECC information. If there is valid device tree entry for nand-ecc-strength
and nand-ecc-step-size fields it still shall override the detected values.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index ce0b8ff..1bdd490 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2144,6 +2144,17 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 		return -EINVAL;
 	}
 
+	if (chip->ecc.mode != NAND_ECC_NONE &&
+	    (!chip->ecc.size || !chip->ecc.strength)) {
+		if (chip->base.eccreq.step_size && chip->base.eccreq.strength) {
+			/* use detected ECC parameters */
+			chip->ecc.size = chip->base.eccreq.step_size;
+			chip->ecc.strength = chip->base.eccreq.strength;
+			dev_info(ctrl->dev, "Using ECC step-size %d, strength %d\n",
+				chip->ecc.size, chip->ecc.strength);
+		}
+	}
+
 	switch (chip->ecc.size) {
 	case 512:
 		if (chip->ecc.algo == NAND_ECC_HAMMING)
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
