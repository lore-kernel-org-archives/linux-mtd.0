Return-Path: <SRS0=Mklv=BL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE64C433E1
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Aug 2020 12:25:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB9EA2076A
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Aug 2020 12:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wluygpMl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgKqoCrs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB9EA2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duusaUK6Etq3gyNP0XNHozTj4ep1GUeKh5chP0/tXFc=; b=wluygpMlI7yCcAVzrRYdHNN2Bf
	qt28EyPmu107uUE8nNnBGccZJO7mfgbZ7xE8N9cBXPta7QgLfwdE0JJe2fxIR17BZ0I4GtlTO3NlS
	z82+HsLmtZIv7R+vk2dYHye81c+ZU6BYI77TIqWHEkF+CUpCai3BfTyDoehyaC50fRb6IFf4NndvD
	I3cOP2k14GbPKvn5mYyrii3TVodZrYCk2eNzbMPBk/WhrqGJq+Z3gqLl1HOys8lA1lMb7g66YZ4MK
	nCFBqP6A7d4xpq/v56TU1Md3ZYn4IOVBi21wmn1xF3TOY/QeoNklajdvr3WV2EcpzdRIfy8zFgvZa
	IShviWsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1qZF-0005rI-GT; Sat, 01 Aug 2020 12:24:49 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1qZC-0005qG-Tj
 for linux-mtd@lists.infradead.org; Sat, 01 Aug 2020 12:24:47 +0000
Received: by mail-ed1-x543.google.com with SMTP id n2so24127285edr.5
 for <linux-mtd@lists.infradead.org>; Sat, 01 Aug 2020 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y/Cb7GKK5mO5miGjoqukiO9DrcaVbTzBZ/XAaAsprek=;
 b=hgKqoCrsgEvqzZxuemcdmAGc7l+erLtC0MIMuinBU6Z7xRXXMH08QxW5iaYUUehX4a
 N2jhjFbh6KSNqPO6rdIXcBDOVF+TC3NA3OpVybZTUL2FZnmU5fe1xan0Ku0OsTsKgJBT
 2Bl+4Fm9qSzXFiD2qF5WRx67/ES4EZypV3beloZaZm672olY421KHi08EwsFRo3ualou
 ugM9j06fc7F2D6U3a6xTJCuLmhn+UiqI0N3tIwyBhgTUcLrRz0fNiyAjWlAKP6mHkIdm
 eTJXEvhx4KUsgrDhJUp31wqdm0zs7H8VlSv9shvME6ij/bBn32Wm2j3Nlw+fMdhGApwy
 SPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y/Cb7GKK5mO5miGjoqukiO9DrcaVbTzBZ/XAaAsprek=;
 b=MucrY8bb12ad22HFHCLHBKlwOovvwOzRpqS4UPBVsyAYng5zn/I5BcJxaDru7Qj09g
 EDiZwymV0Ei5IKlmfrOTdK+uSxrKsc0pQDbP7lOm98+myx/lYKUPqNiTh2jnWDsqBo8d
 ohYjcoORcoQJLOXtWLnzkLrHRPFN88OWTVAKVuvkpUrb8TdMspiJFVYbRWLR+iRWOWmJ
 Ge2ojGCkMsLp3rwjYN4Nnlk/guhQx97BOnK9oENB6C38nmOcT480TNryL0fvBlPRnUcC
 +xb9ab1W441oLYDi0LSs7ewH5ejzC3PaJPz4eM1J7uMci0Yl3D1nEP7mZ8wPPpgpDP93
 BKiQ==
X-Gm-Message-State: AOAM531qa4BF9ilJ41i6yI3Z55zZuQPj/m3Rl5ko2kZ5JDW1ZhrSOW1Y
 gD4g0JFWvNQzVblgp8pm0pY=
X-Google-Smtp-Source: ABdhPJygCFTQRnLVaNC5h4/9yQOO7Dg3dB0ySHxdfO6WpfJvbhq/7rd7jFfxV5f6I7rAPQsprZz5+A==
X-Received: by 2002:a05:6402:13c4:: with SMTP id
 a4mr8165000edx.108.1596284686131; 
 Sat, 01 Aug 2020 05:24:46 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:45 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [RFC PATCH 16/17] mtd: Drop uses of pci_read_config_*() return value
Date: Sat,  1 Aug 2020 13:24:45 +0200
Message-Id: <20200801112446.149549-17-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_082446_970166_C2AAA0D6 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pci@vger.kernel.org, bjorn@helgaas.com,
 linux-kernel-mentees@lists.linuxfoundation.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/mtd/maps/ichxrom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/ichxrom.c b/drivers/mtd/maps/ichxrom.c
index fda72c5fd8f9..04728d902e49 100644
--- a/drivers/mtd/maps/ichxrom.c
+++ b/drivers/mtd/maps/ichxrom.c
@@ -61,8 +61,8 @@ static void ichxrom_cleanup(struct ichxrom_window *window)
 	int ret;
 
 	/* Disable writes through the rom window */
-	ret = pci_read_config_word(window->pdev, BIOS_CNTL, &word);
-	if (!ret)
+	pci_read_config_word(window->pdev, BIOS_CNTL, &word);
+	if (word != (u16)~0)
 		pci_write_config_word(window->pdev, BIOS_CNTL, word & ~1);
 	pci_dev_put(window->pdev);
 
-- 
2.18.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
