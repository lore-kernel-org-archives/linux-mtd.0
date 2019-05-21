Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E5FC46470
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 14:44:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5529721743
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 14:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gpyH4TVu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgF2gub7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5529721743
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8vmAD8zAqi7pitPhpNIyOpgum/YKIkqe6uoxVhd+Rs4=; b=gpy
	H4TVui36SMZF016XeOp+KKQpeQNDOTg2+SzbFbzcJQlnUhTIS32PpS6UZ3ZtT7YwNnyagmQao71lj
	hO4YrBL3wi/YYY/Ib9T/J4Rr2Vp06AbJ0Izw1/S1AifkVZtSrmfwaxPppOnG3OYYLOMz6q+FzQj4T
	qOfDW1oMaAh+TPL2t04/s2mhh/fIue5y1zgCTiAbVUDAMC7CgKQAr5sp/a/Vy7SaosqBGV6iwzpX3
	M57rfS9Lzn3aZMe1JTCgJQA8eASd8w1lv4lf6EGfrO25eq/I9N91rpn3NU2x2B3hrMphEl+yis5o8
	JsWdwIhEVJBffnEFUJ0gecZOINY+Kyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT60S-0007Qi-Re; Tue, 21 May 2019 14:44:44 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT60P-0007Q2-7q
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 14:44:42 +0000
Received: by mail-pl1-x643.google.com with SMTP id d21so8570511plr.3
 for <linux-mtd@lists.infradead.org>; Tue, 21 May 2019 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5hSVFJBohFjK9FSeZbvc1XbTRHdPXQ9DePHe1SZpJps=;
 b=EgF2gub7T32hGBYch+5cag0ZHP3ftygxoSFTghzmsNn/7gpMaWPzWBT/hsD1KGrUAe
 GqFIr7bTRXjgk9pJRFBfcmZ2TgJEnFJFzxET9by/Nv16VQ/vpPg6CUr0kTFbESqb+uuo
 rsoo3PnXAMRqZrrB6KEaH+p9eeKUA8FEauSpG8IrB1tMG6omnk39ivcyPQnLKICAY/Vq
 jTyFOLlJjDStRXaxZEeuPEc/oJ1wZLbCNmRcJBJEjuZBMZvpWR+bDmuvrlUzTvgjRBPy
 NT/1D5F0Ru7j8gsRKQJnyFb+H07quREQS/uXsrfbaZzLxRI+1HVlT+sxohAt/c6gVTnQ
 H6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5hSVFJBohFjK9FSeZbvc1XbTRHdPXQ9DePHe1SZpJps=;
 b=FRPCUTPiBSMqO4pUF6MJQPaix2OQ5p2IIq28l0gb9YALKEOUIvqNx+S1DG3QuTrNcW
 VDGR42+/A9a+UpZIgGrYKGMUg7nvjuZxBHLk3ll4V6gDDO8Cy81GedeuzZY+HPftFn+j
 rKdj2m9dbJUaJt+xerwnkH8tcxihNyxRSE2IHwODCfzY/dwWBqu6Ni3gNo20Fa8fNg2h
 a6CbQ3hwLaj8e1X7IGfY8785BjFRSYIvjfML+qRt7S/Bf8utGnzeAUDNk8O01P0yr8Ex
 rCV/i1pPxxueKA6jQCZMbWM6BYlk5y7IYdnM1Xs0NmvIKiYqjopqwf/hITTM5t2FAN4q
 2VCQ==
X-Gm-Message-State: APjAAAXP26Z5H9SS6AYZIgTOKv5KtQmYisre1u7ne5lZchzz+Xcf4umM
 Bj2FVCFH4nEByWuzVydwgCTqPh6r
X-Google-Smtp-Source: APXvYqwN5M46bLj4p1rW2xAHz/GQgxgVKlmBJe3gqKesdGm7yuComflkxTKuJS1Bz2EF1upSxW6XBQ==
X-Received: by 2002:a17:902:521:: with SMTP id
 30mr44314557plf.62.1558449880398; 
 Tue, 21 May 2019 07:44:40 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id g17sm13227945pfb.56.2019.05.21.07.44.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 07:44:39 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: mtd: brcmnand: Make nand-ecc-strength and
 nand-ecc-step-size optional
Date: Tue, 21 May 2019 10:44:21 -0400
Message-Id: <1558449865-36852-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_074441_313734_855F378C 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

nand-ecc-strength and nand-ecc-step-size can be made optional as
brcmnand driver can support using raw NAND layer detected values.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index bcda1df..0d952af 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -101,12 +101,12 @@ Required properties:
                               number (e.g., 0, 1, 2, etc.)
 - #address-cells            : see partition.txt
 - #size-cells               : see partition.txt
-- nand-ecc-strength         : see nand.txt
-- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
 
 Optional properties:
+- nand-ecc-strength         : see nand-controller.yaml
+- nand-ecc-step-size        : must be 512 or 1024. See nand-controller.yaml
 - nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
-                              chip-select. See nand.txt
+                              chip-select. See nand-controller.yaml
 - brcm,nand-oob-sector-size : integer, to denote the spare area sector size
                               expected for the ECC layout in use. This size, in
                               addition to the strength and step-size,
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
