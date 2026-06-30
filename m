Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB80C43602
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 01:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CS6dBkW7bqy+RKM3l5JnidF6WxzvNS5uo0K4+JfK0x0=; b=KWXGdQIC/RmgX8
	bjUdBYKaGDU3K1RPIUSi04596OlzD4lfgv0RBZje44mNaWRJa87qQ5xL/mB/OSnPt+NKcTNdywa83
	QM88hxMSX7OkFuDPUIoHB2pcYb1zB68i5AmcC82QzSJ9KrHT6TG2/89Mfh/gBc9Zw6rvYmB4YxqxO
	AEwJweDOk/a1SY7DHOayb6nfX5M/Tfjgsu1zc6R8eiRTNCTIb3EyLJ2xRdWLxUghr9pXyFx+V1EQ0
	iQ8qqeEQUo4Aj22lAMwD6TAE690QOYkyCccWJKWrF+0nb/+Pz16Z08vWlzMkqaG+W03GVHxdAHKCS
	WdoikjPHU+xGxNHk68KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNCM-0000000Feq8-1iax;
	Tue, 30 Jun 2026 01:23:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNCK-0000000FepP-0VX6
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jun 2026 01:23:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c82538b6b0so26990955ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2026 18:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782615; x=1783387415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMntIY/oIRlFlSwXUFg7FvdarFRfsXqKfjADcyhhzcM=;
        b=rwVMHIjaJmJ8P88hS1Qg85bF0YrB631+H2HJdJaePYdhcKRREmZ1Swj6nAQOhV+R59
         GS2izM5CPscHd9fuFACrjSKaYy84jaluLM8P7ZypchZVCBeYbTVFrztozpheMu8Hbq71
         qPwt+vuqzRGrnvpi0t44Zcsw2aJOmBAT823GFtvd2F31vnjSqhQvZiFrmnT//f36binl
         1uySiBEUwUk6R5ObQ90eT3+IFT0gx4mwyKNGvL50obP1C3az92ItbJvE4ZZUegUrpcyo
         Xj3AUtJdvfSKv+6YFYR+fDbMHXf5IYcqYiI7v4dJ4leTBTqPkAO0hse8N+mPnvbAOd+N
         j18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782615; x=1783387415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMntIY/oIRlFlSwXUFg7FvdarFRfsXqKfjADcyhhzcM=;
        b=H8/9kF39GleQrCrz1TITJU1kXlUA+ZWgbv5PoSARRDyoRe5V/97LoGGAiL1nhjsLem
         0kPyoab3WQp5Won/R6Az58OFmmBcJRItkM88OXjFemqQdeBx6Y53qbyv+P4tOdCa9KgG
         QcWMPZHdWUYSSZoplpdR9fM8WI1hRXeq9XRHxjYDeOVKcwsMoZPOjKPI8+4KYNkI94/F
         lYT3lOABUjlPVSl3dLbMjzDFhNjT3iWLPVO0u+1DYjMKUHIAlyf0UuYnurqiCr2nLC+k
         tNGeYIRVl0q/GTlDRyNfBQen2zZG9qNoRyxcksR5z/EwEX5+5IIb8xfitxi8wao3CoT9
         /feA==
X-Gm-Message-State: AOJu0YyC2TbsfHO8ZQl1R/+zIGFXi1QDFSdLSNKYhcJLt2uT2Is1vvmp
	uJ5LKzZdDGUjFb9zD3HnyMpGuaGTnUF2SZLU7A9ajY0fPqmYDU+gG2eXGTmU7CqV
X-Gm-Gg: AfdE7ckmGJEjcRICbnYOduTCuY1mQN7l1AWJ/rAfFyl2NHz4nzL4K5ADry90395NfCN
	xlmTLMIWx0Tl18KDga2VAGZmoDZt0qIjl0i1SFJZJvcY4EeJMxKpZE2Crz5/55yYL0mqFRX0GCW
	t6XzyJEHQEWgKT216crgkyljCLrKFnrNmpZJU5YIvSeyg4BFoAitVHKUZugHmiM+x8IyM1wXU6E
	frtXfAt++Q+me/F6w2Wfu+TcGfnSBZ0KEGeqM59emypPzG71phijoxCdXv4cBCpNLSIi/Elznc3
	CNdYvZ202d9Xq8EOf3d435g0KMZ9sOOqkuDtzLmikpQ9vWLAiJQZQBTXkSByPhbtdyUr4BV4i41
	nKAIEof4XiGDmcQLNaRlOEaikugchjF/kbWmOOTUMWtyX5tbUCj6/SWGd7pQ8RtNZbwf1Qbexdy
	7e2qhTilkANCjBMdiOIS7bZ93KeI1YIc7OpbE3vrr0MEU0L9z6yiSWCaW1U1jD8wEpy8ey/jPwK
	L2oiaf5d3drgDm8Fa1V
X-Received: by 2002:a17:902:dac5:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2ca2d3eb9b1mr11411705ad.0.1782782614641;
        Mon, 29 Jun 2026 18:23:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382c5c48sm2440165ad.78.2026.06.29.18.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:23:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: atmel: use struct_size
Date: Mon, 29 Jun 2026 18:23:32 -0700
Message-ID: <20260630012332.1471829-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_182336_151626_F9982A6A 
X-CRM114-Status: GOOD (  10.37  )
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

The comment above makes it clear that this is a single element for
legacy handling. Clarify that with struct_size and avoid manual pointer
math.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index e7fdf532c5fe..8a19408abb63 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1799,8 +1799,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 	 * Legacy bindings only allow connecting a single NAND with a unique CS
 	 * line to the controller.
 	 */
-	nand = devm_kzalloc(nc->dev, sizeof(*nand) + sizeof(*nand->cs),
-			    GFP_KERNEL);
+	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
