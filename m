Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BEACAC5B0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Oct 2025 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hu0eVkN5s3ov73X22Sy8SkuiheJ+S7A8JgmTZwQNJ8o=; b=nwAtIZAFR5SjDH
	2peNYwWjD81ie2cV5SXGIfTqbfoIBs0nOZYGeG2IX5YCAY/T1eMbD//bttTBIgNowqUb33rJF3bZ5
	Y7ucaH+aKxZJYBGg37inuhaeNfPQY5+8+0ha+qgZGAE1Uc6NRSFgPTwiP7fHeozoU8xdQE7E8Vx6F
	iLr1nayxWs2qgIZ9Y+VWOIcE8EjyrNqBLDSTume5HTPqvntFFqYYaVTNgOcjfI+5UWqvw2IItw/I4
	QBYSjGKApfa0n5kIjnaKwnU7pih4xfxWmCQYZDG3y8rNnp+TXXboC0U7IJOoavRqw75GlP48bduOX
	RDWFFojswI2z+BOihnTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4c7H-0000000BxxK-45MS;
	Fri, 03 Oct 2025 09:30:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4c7E-0000000BxwG-3q5j
	for linux-mtd@lists.infradead.org;
	Fri, 03 Oct 2025 09:30:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3ee130237a8so1361467f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2025 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759483815; x=1760088615; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhgLDi6NThV7CDsUpk/weXQLRMerlf2Ax6eN1eI2x/g=;
        b=BFb5Zq+OYof0HLohBcbKpvC7bwF2/OYDNKF0bYcRDy7EurYNWh1EzYlyQbZzgnHh6l
         UYnADxuyHkx7X8JkZCPHRr9u4gmCJZh12+fUz4a4djempSxS9HMRuR+Gg4l0guoxW6Dw
         s3Cjry0fmFef/aPIOV7ZGVn3EUzhtA8fq3OA06WF+fm1erGM58GdIAjjnSRibgWaa8uE
         vGbRXWtByUvPiQ+xHc3zxHnXSBQTj4SelzGf3+N3O/UhOK7BLGKOIpDbVSklXLTNZQ9l
         rN7ovZ2bI404QQVo+nD4jobvgJa9RQ9uP+rmw6Nv8mh1EI86fKAhd3rGEVeDPveIzaFz
         49VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759483815; x=1760088615;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhgLDi6NThV7CDsUpk/weXQLRMerlf2Ax6eN1eI2x/g=;
        b=c4RVLckQdHtzSB8GTuPTBMDBo22nGeSBhGAXCQCkpd1QWNsI0zR6zCPpTA9RQGWB3S
         cgX6MFej5dZ8ZKnaRKl252ACBsAndwAkz835RG8Y2gy3xf8HQj66DuBQCjIFh0kEYQt9
         H2hsa4dQQ4gLTgQykj5v+URZ2iqRgvJcxwoGzI5tNvxRLTV6gax5sAgVNmYJiryAERnm
         /oXXE9WC1F3g7XvuIQwi2576jqRpjTHGiWjLk42XyvcCj9ysbvqO7nMurW06CnHm0LoI
         Li3HoShU0cL00DMChQEWn+tu2plikxS8sIi/C8E+txof+YJG6W/qk+031DoFHj9DieU4
         pp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXI7likSxDrK2SrQCgfYZzzRdMmINgvaIV0PWovx6UD1ahtWO/gAw5DC5L6xXzPzqbt922OHeIMaQA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTLaKqnkOLe6aWeB9Jwaph+mfgUARbAmlNadk76OkZ6b2dSqjE
	kqAb3w6CGpFQa5aHvjPsQKnshkEkjC9GAgxWNlNj1xmSXWh3jzo1qAsCZ3tWPWUIj0ACx6jq+jJ
	j6IKX
X-Gm-Gg: ASbGnctED+qpwlCCfa8xnEneyLf3mSGL8JuEPYKJHjtuYQ2RvOAxNaHx6Le3n2rqVHq
	CgKbetLtZIivTbRmbGnztF3AP5gpzGybpsjBBRSCPQOZFif/Qz29yynv07QJf2eYnJpk2g3QOSg
	DLJrz6TrMRUzBPRaQs23IDTc5drwDvg11iFXoiqUebWDuTCrQDnro6fEEvHgS1ZeApwnmSv94GT
	HPODjyguHGlzYFHLQFm+syQq4YoTyHZXro2g1xUO13/G32dT14mFhNgA7RTsf3DuMZtKfQVjZpB
	fFLoI9bBlymKpQ+VKXE7JOHHpaAijZqCSmcZSlXD8hwZrZUGep50N0LqwUbpanrRbiyV7mGsh+i
	Ule84x1CT9GD+G1hatzluYC8ZVxYUXDoFJidFqfBAfbavGndE7cHX73On
X-Google-Smtp-Source: AGHT+IHx8gWCZHt+AQN+RQlxboRGMUkamgU3aSxPItSzubRdggN8p2qx6XItQb7Bkrq5pYJJkn1S/w==
X-Received: by 2002:a05:6000:2283:b0:40f:288e:996f with SMTP id ffacd0b85a97d-425671c2f8fmr1476726f8f.63.1759483814628;
        Fri, 03 Oct 2025 02:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f01absm7082890f8f.44.2025.10.03.02.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 02:30:14 -0700 (PDT)
Date: Fri, 3 Oct 2025 12:30:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: nand: realtek-ecc: Fix a IS_ERR() vs NULL bug in
 probe
Message-ID: <aN-XoqpP2Jz75pjj@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_023016_959592_CB1AF2ED 
X-CRM114-Status: GOOD (  12.65  )
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

The dma_alloc_noncoherent() function doesn't return error pointers, it
returns NULL on error.  Fix the error checking to match.

Fixes: 3148d0e5b1c5 ("mtd: nand: realtek-ecc: Add Realtek external ECC engine support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/nand/ecc-realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ecc-realtek.c b/drivers/mtd/nand/ecc-realtek.c
index 7d718934c909..7c275f1eb4a7 100644
--- a/drivers/mtd/nand/ecc-realtek.c
+++ b/drivers/mtd/nand/ecc-realtek.c
@@ -418,8 +418,8 @@ static int rtl_ecc_probe(struct platform_device *pdev)
 
 	rtlc->buf = dma_alloc_noncoherent(dev, RTL_ECC_DMA_SIZE, &rtlc->buf_dma,
 					  DMA_BIDIRECTIONAL, GFP_KERNEL);
-	if (IS_ERR(rtlc->buf))
-		return PTR_ERR(rtlc->buf);
+	if (!rtlc->buf)
+		return -ENOMEM;
 
 	rtlc->dev = dev;
 	rtlc->engine.dev = dev;
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
