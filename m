Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096FBD75BA2
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 02:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pfd1PKiM03qQQMAiOmCBdcNhHZRXzyHKorekeYN6dls=; b=1B6laMlAUioq0v
	TBejDJ/ojM/buMEoKZXiT3h25zk8aV3qmd/B152SGldqe3F914610fFQ+rKcdluo6MGViupBdmH9R
	xDvSDzzNCMPj6j5BrO4Cark69ezHwdmQoAuPczOrHLGm26oIuKtWfgQxr+8rOXD36f4yhxiSK5dY7
	OMUHZWI+2Rzvdx9Cng7Ul0qb67JBF+hnS8Df9WQ7eTetmTP4fh7C6CG2sBP5lyjLYQ5X7F+IhaB+2
	RMqixbzlo7NlB0DwxkEaqRXNRREydhIOmidoudojgvplDFoCugPYJekQKzoI2O0l6yuuMEQAeRRYP
	JhCGrPTlxgQuRqlJl+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwcy-0000000GZum-0ynb;
	Thu, 21 Nov 2024 02:09:04 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwcw-0000000GZu7-0U8Z
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 02:09:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-212776d6449so3667495ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2024 18:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154941; x=1732759741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jmu4MyOZ/hSDv3HHRy9BIOsWJO0xmFQ6N7YEUPlcf7o=;
        b=Alp6fd/CU7s7w2G9LPAPHkpe808yXWL8ujoXoYGyIzCAr85wIbQRlMak/m2duI3a3Q
         I6vKt7VQTylU5787nRAyqFmJt/KYWmHtzJ9CM4IwFRymvG0HQYr+0bVsfKgwd7aAh6TO
         3n3YKNvd17DMx/Vt8f+Kk3lXKzT8ljzJD4E4VcgOsXg6p7rJF2NQt2CKr+onDALaFZeS
         J5drkhI1GmyWI4Ir4CCRsUxbKqlQGVVQqyQGT82WWYOCJmoe9uNzfWSD05U2mSJl0C3Y
         hn9i4T+QVLoi/bYwVBgQcmhDs0cmp2eUJ3DGtW2dbzMfhG3cxFShhhw2Ny8dbb2du3O8
         Og8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154941; x=1732759741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jmu4MyOZ/hSDv3HHRy9BIOsWJO0xmFQ6N7YEUPlcf7o=;
        b=TsRTo12Jfj5F7qKU5gKKkjw099PV8yR7eXXHGn2nGcao5+vtAaSgvquseLZuFtfMO8
         lO9EujgMuH6pDD+GwOsIT5l/ZX0xkPElCf1OLGJT4XvUyIx09HoW0DzYaYgP0PWUlwyj
         b+Mr4tIE116DOHL/YUtYNcDLJChrTK93zIRxPML9ojReXhInoNqj5chEr0HT8R5jTVRx
         64+MO1AEtjRi0HAay8rN5fHnlyNIg7+7U5clAF0pTimdc1Q5Ifx5bPVAnP+DryfxfO5+
         rTORI32fs5C4psAnQhvb4IF8av0J9LSzkFVArjEXhV46fm1/V9qiJ7ejtXoBul7V8qTJ
         gefg==
X-Gm-Message-State: AOJu0YzjWTG7Enmiz5Al2kTibEWpJFnj/7xsrgOoFshITENAbxRpNUtf
	CMl3wHp856A1Aq5by8n8XDaCk+EZzqQpOLp48UtWgOEm1q4IFiDXnNQR7Ib+
X-Gm-Gg: ASbGncvsQO9pWyMsvyGvSZNgknQPhbF7IAWELEX/sqOfxIV9vhZiNCzd+wzphBzkWDc
	wvUHUkPNJwuP8B/hXESd29aoC/Xd8iBiTJ8p5e2wY5s5wYf6pB8HA8HkMI7FxGv3gSQFcaJFCGG
	BjSJFscMetIz8AqIr/rmR1ZENPaPyqxV3CpW+131JOyUjPy8JetlSM7bnIDPMpeoOYzIlDVoD4x
	ofjlHemRzyRemkYleMdH9YckOdfW/4WpasIsIfTELqzJt70vxyU9lugqvAN6B+UbWxakvmRbHoL
	6AsE1RVqbwFUrLry9Nx4d/0/Q4Enayb1KDrxXA==
X-Google-Smtp-Source: AGHT+IFRqA3lCIp5SCgAZXNAv1XMFtzLxe79dhMH7U2STYq1L9H6Es/UnEFUbbmDkuG4amH9XTyxUA==
X-Received: by 2002:a17:902:ccc9:b0:20c:8dff:b4ed with SMTP id d9443c01a7336-2126fb34cabmr53322945ad.16.1732154941018;
        Wed, 20 Nov 2024 18:09:01 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-40-130.msd.spmode.ne.jp. [49.98.40.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212878a5d2dsm2388615ad.77.2024.11.20.18.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:09:00 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	kr.kim@skyhighmemory.com,
	zhi.feng@skyhighmemory.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 1/3] mtd: spinand: Remove write_enable_op() in markbad()
Date: Thu, 21 Nov 2024 11:08:41 +0900
Message-Id: <8be5cb694a763d3a74d9c3c7e76dd98b7b1333f6.1732152768.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732152768.git.Takahiro.Kuwano@infineon.com>
References: <cover.1732152768.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_180902_155467_D01DA13A 
X-CRM114-Status: GOOD (  10.12  )
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

We don't have to call spinand_write_enable_op() in spinand_markbad() as
it is called in spinand_write_page().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/nand/spi/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4d76f9f71a0e..47c369f2925d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -942,10 +942,6 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	if (ret)
 		return ret;
 
-	ret = spinand_write_enable_op(spinand);
-	if (ret)
-		return ret;
-
 	return spinand_write_page(spinand, &req);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
