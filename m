Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B38C19F21
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jul 2022 06:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g4XkalAzUW9caPm/KRLlN04DYacb+Azelj2mSMjeEoQ=; b=e/owAUGC1hNLTp
	lq5CtpU9zKyDKRuKXleXPGYqysQRDNQkZl12lKnOkJl5XSvvK4I40g1udgWGKmV2F/RzVY1VVmeJR
	RXGkqBieISue32TZNKkxsZ9XLUJUYC3HpgWdrUKzVu2AZa/8KLFmAJFnvV3nDr4aPUi1m+dbABIgQ
	oedcWSOrC3jv8hdFH34V7FEIciRSp618CVRQvyi05WxfD5qomFs6pYnhBlBrpaAXxhfXmR+Fdx4m4
	pgSVF98ylThST0A3HXwroThD/69R4UsSjPlmGEFQTTZWhTQM2cPVUY1z8yevvv2VzF5tbONBU530U
	TKKDBZwcocoyycLK3eQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGa8e-009jDO-D6; Wed, 27 Jul 2022 06:03:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGa8c-009jAo-AA
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2022 06:03:19 +0000
Received: by mail-pj1-x1030.google.com with SMTP id x24-20020a17090ab01800b001f21556cf48so1118061pjq.4
        for <linux-mtd@lists.infradead.org>; Tue, 26 Jul 2022 23:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pHInnhZIapp9ygsJkxHnw8j0AydAm5/Szf/QJZReVwc=;
        b=hOvYEhU98x/GDtGnYnmoR6BJRBXACIoTfxIQJjyK99pcrQKlqKNDGNPCCYvtelWyQZ
         Y183bzy65rDmM1fHouJFY5e0lrHP2DA9cKq0IlsKAlZP4ykSykOuwcz45eXUJsECIkle
         4QKLBROzWhdgL0/SYmLwbPvvfb4CZI6QgsS1oLhLUB1IiQ8o6Xu3pTgvADuCETctHgQd
         3jXASagP1pGOOnh0jhs5ikPcA8d9CtYGSAujv/q62h9Q70hMpicy3GAHNw+nqitfpaG/
         KuGd3q+ZwR1SrHcxOZAo5iWuejtHg7RvbLN2OnmlD5lrihO9XLpQ8t3iTyoV88opuaSb
         hOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pHInnhZIapp9ygsJkxHnw8j0AydAm5/Szf/QJZReVwc=;
        b=8EOT+WUQvoS5VKfdOz9Sssr7ZX5TA7S8Bs7+Nv0sfynmC6NyAOZUvkuw0eH0B32q9g
         hUApQaqYspGpV8Hy3FlrwbD2tsm/OH/ezMfS/yjpcSN5uEIxPNKE1hK0iF6rVhEho1BG
         xCQ0Tub5xUM0PLn1F/nCKeY8ieu9pnkKq9WqIByov9dB0DlzutJaTPTfi+2wBbQIOA7w
         KjmNbF/N11ZxsSK86/0gC+b4IVhwnb0lwc9aJvdZB4o+PlMuApXHbbNAezWGrXLsVcUa
         tMn48Rv0FM10Ojnz9dA/Ig9lppi/fNcrh4uen/z958f6HSCMOlruY4WPAMbx/s6ek+3a
         CX+g==
X-Gm-Message-State: AJIora+ji34S3LtHcc0KAfJZwCzeyj5vZdW/28nI0Iz3YAIq0k2fw938
	fbRkTf6v7hteWmcwjgWhE+Y=
X-Google-Smtp-Source: AGRyM1vMfbDk3zJiVxRQkUQY+kK8oss494ogdScYinwu4OCsDie7+BNXRUd0jGmYyMuCmXwyi8JrxQ==
X-Received: by 2002:a17:902:d2d1:b0:16d:37b3:f8b3 with SMTP id n17-20020a170902d2d100b0016d37b3f8b3mr19612626plc.98.1658901794902;
        Tue, 26 Jul 2022 23:03:14 -0700 (PDT)
Received: from localhost.localdomain ([43.132.141.3])
        by smtp.gmail.com with ESMTPSA id j1-20020a654d41000000b003fadd680908sm11252628pgt.83.2022.07.26.23.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:03:14 -0700 (PDT)
From: Zeng Jingxiang <zengjx95@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zeng Jingxiang <linuszeng@tencent.com>
Subject: [PATCH] mtd: physmap-core: Fix NULL pointer dereferencing in of_select_probe_type()
Date: Wed, 27 Jul 2022 14:03:02 +0800
Message-Id: <20220727060302.1560325-1-zengjx95@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_230318_376644_D63CEF1F 
X-CRM114-Status: GOOD (  10.43  )
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

From: Zeng Jingxiang <linuszeng@tencent.com>

Coverity complains of a possible NULL dereference:

in of_select_probe_type():
1. returned_null: of_match_device() returns NULL.
2. var_assigned: match = NULL return value from of_match_device()
309	match = of_match_device(of_flash_match, &dev->dev);

3.dereference: Dereferencing the NULL pointer match.
310	probe_type = match->data;

Signed-off-by: Zeng Jingxiang <linuszeng@tencent.com>
---
 drivers/mtd/maps/physmap-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 4f63b8430c71..69d0ab1f6f94 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -307,6 +307,9 @@ static const char *of_select_probe_type(struct platform_device *dev)
 	const char *probe_type;
 
 	match = of_match_device(of_flash_match, &dev->dev);
+	if (!match)
+		return NULL;
+
 	probe_type = match->data;
 	if (probe_type)
 		return probe_type;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
