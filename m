Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163EAC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8pyvQpFmwprenEfKG+azVaUHQimrRG6ldmndPUpp9o=; b=QYWccsDTk2t9dJ
	lLth/pLHAcMdvtt8tKldTyKiE444o5ucMAlDsKl/2ZZyA7BUJc12rPuMVJfaDaffofLYrFsRa0IeO
	yCy3P7mLhKa7fjiuMCG7C/lzqqew+yqvFvzLLt+X4p2Q0YeCZOc+3zIJNl5DWyEozHDzEf06Ez3RR
	O+faYcNbGnJbWxTciBRnXdQ3/RuMcmU15RUQa5mmIStEJNUIckgCzOQQtLDFBsVXUNbgphW178ftP
	/SFOPdy7RfNwdnmssIphoH0uNUvFlfkeQxeDMqiGsPiZ5UJwl2d8uR1hZEgRzclp5/YFiLLKZoP5q
	rqo/A8ROUOIgUO+KB7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTIs-00Coh6-Sl; Thu, 21 Apr 2022 09:40:47 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTIo-00Coes-JW
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 09:40:44 +0000
Received: by mail-pg1-x52f.google.com with SMTP id q19so4184935pgm.6
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PnmA4OlyOKb+tK1Gp4N4BGNbArlq9yiZfVL+OmEnjO0=;
 b=V53otJ4omuD90Rhsi5YKwQmlQKV3PutwgohSueOC9KaTPJB5ZV0gjjmSssKHdK6sAE
 xulV5+XZGSilO6Xy8XQn1p5PIB96TWHkvMhL75O9ao9YuTtwcHged0tshVd/IDzeVl9C
 VT5GinkP8aAC6iYTEj0wACvU+awLaYrq0iBl8PsxWdN9zZwflP2TJPOa8C7cYTBw8LNS
 +hU6J22r+Mn0ybl2frRKpHeR0Dw+LYzy6yTLqz3bPV3tQj7RJudSuMQ3jquAnspIhGSG
 Rzcnw8yH7UKkvfdVpkygO27gmj49xW8NQy4slmfg2qD4LdXRAuFfDKIq8RVJPpwv4J1u
 1RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PnmA4OlyOKb+tK1Gp4N4BGNbArlq9yiZfVL+OmEnjO0=;
 b=F7Nw1B92SYJaJCay/We7xD0AAMGU49OQEH5WuMjUQmtLtj1uEQmC1jW54NR7T+UjEs
 PFmnD0ZI5WyuIE8YQohSCQZXGUWu+/KpXPx5qQ3Ay1Fp55zNhLTBeIC/nPnjSFPFZzQq
 NYScNoAYHF7HuO44etjqt7F+uhOVDE6t5GDtdJSNHGnodH67WDvwZv1xxP/36maJaeGo
 8w06K07+4xdY41yb6oz0+ZI1ayTARFw9OIAI7zoWvvbptFe+6CIZxHheHqE4drQ/vpZx
 WtBsvZj8GKanaKeBby4JyRA7hL+dWnQJWs6x9W+UrDCWB5JdmXdw/GHVUdFS61wCp8aN
 VRrg==
X-Gm-Message-State: AOAM5332N2XjRIj6UeZmlcJkjYMmTocoLbDPJXpldR/f3kXiGKcptZHn
 KYDRBkT2ucFQY1LzOXNaemlhWCnV25E=
X-Google-Smtp-Source: ABdhPJydec3pfSXNesMKAzOkY9nvnqh4LBL1gILafsOKHGCEvkzJH0aZJGeGv+ctRWVTKwfZMGG5Tw==
X-Received: by 2002:a63:ad0c:0:b0:374:50b4:c955 with SMTP id
 g12-20020a63ad0c000000b0037450b4c955mr22807625pgf.530.1650534041221; 
 Thu, 21 Apr 2022 02:40:41 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 k198-20020a633dcf000000b003aa9116ba17sm1503970pga.35.2022.04.21.02.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:40:40 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
Date: Thu, 21 Apr 2022 18:40:21 +0900
Message-Id: <d705a2c1fc8d0a59c93454aa05642aafe4fc960b.1650532121.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_024042_689914_D010FA8C 
X-CRM114-Status: GOOD (  13.92  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

In 4BAIT parse, keep nor->addr_width because it may be used as
current address mode in SMPT parse later on.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 7 ++++++-
 drivers/mtd/spi-nor/sfdp.c | 1 -
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 40ba45328975..87603a99938f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2210,7 +2210,12 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 static int spi_nor_set_addr_width(struct spi_nor *nor)
 {
 	if (nor->addr_width) {
-		/* already configured from SFDP */
+		/*
+		 * Already configured from SFDP. Use an address width of 4 in
+		 * case the device has 4byte opcodes.
+		 */
+		if (nor->addr_width == 3 && nor->flags & SNOR_F_HAS_4BAIT)
+			nor->addr_width = 4;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
 		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c5dd79ef75c8..9aeefd070475 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1211,7 +1211,6 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	 * Spansion memory. However this quirk is no longer needed with new
 	 * SFDP compliant memories.
 	 */
-	nor->addr_width = 4;
 	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
 	/* fall through */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
