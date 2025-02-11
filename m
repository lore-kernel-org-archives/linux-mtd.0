Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD06C021A4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUsfIypsyhAhRsyAVy4ayMxTeAGYaX5RJSvIgPmoJy0=; b=fgk06ykWq7bRyE
	qHFIzSmnDejTSaihw0AI45EZ4UBZIzgZG75UROI5rfq4yL9FV8nkTXF3kCkyGerAglEpRmu/aRHzV
	N9lHzOAsRAURerIcU9EIMOqtsTCtt1OmupEXtIJ36C0ngJXxu3Cr9EAlvfEyhD1hJmAtGC3tReHgq
	sYWZV2SL9+MtZh8HCZ2XDVAqYvjeTZ0MQSVp9GEYqr2BD/kjdEJQzDTNeikU5O5kBJd9gdabRMC3B
	wIKyMFm5tNRuDpFx+iy624WDJR57pTBNQtZvC0T63NeAM2ht+dTI6VaREKN1JzaYgYErOdx44D3Cj
	8RBeF900k/G+Vqeg5lSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmgH-00000003C59-1ew4;
	Tue, 11 Feb 2025 09:35:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmba-00000003AzN-18KH
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 09:30:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so52712215e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2025 01:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739266256; x=1739871056; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yExLMLYCeWgfPAg8dv/C3ycaxjv+o/aMZg2SZJq4U/c=;
        b=iEwpXFRL/gZLqZouFnAA7tvkGFgz6EQOySwMxxeS4IG2vl+iZB/K6xfPgAjWJiLdOF
         nyDpCMZC4prdQddVt2VtscmRiQg0xX7nF1x/q0E8oTPdaLuhWhgmizN9D6dBW8BwvbEL
         3eKssBPPlGfRVMI0tlZh/5eurkAi1Hp5RmZWA6TDPEzGPLDGLw35Z4BY7uyn5LjdLHfR
         5Gwse879uxI26s6DGpkfEGuXsD9LMZvSsskdRQztj9ePSCkavPNOS65gbp4dyZix5/9E
         qjDxyaSAwJQkzASNPA3kuX814xGzfPWmDuSSHSO+SFnbL9Nkj79V2XcYJ4yPWJyqZ7yL
         y3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266256; x=1739871056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yExLMLYCeWgfPAg8dv/C3ycaxjv+o/aMZg2SZJq4U/c=;
        b=STfjqCjlm+zm4eMZDD14byDR8zhJFnrenfav6sbsIb4Qd8C+m6gLHzb+jKIeIQ/CqS
         biWJxc3OV08TyBp16G68nStlLM3e9/VI/+XEgGRMBLiPgE1vj4Fhx2NvItU5Vjzbfrk1
         Kv5xw/7aEjgcEV1v1k8MO4vnpIftc1TS5qzHkmh2QMZWXrtMfuYsbxNG6ZeS9+U/WbrV
         S/YTilf4w2z9rrKVw6srQ5jzeQf1mOHkVx8vLPWwYEg5hBzdu9Jp1+ZxknzsPX/LVOyu
         PnsLDKCf1045lotnQ7IPGWDNJ6lzTs9Z9GQEF4GpuvMvtmlyNuXY/QimWQhYdS0vxuyW
         EWow==
X-Gm-Message-State: AOJu0YwtasniAwooQTMb5vX+J/3qW8mPYejO729tifswSs0yNxr08Avc
	pX/CYE5I53OFQoHtyhJ6O05gGGKa7g02H7cZMkhokXLXi18a78AKarz51S2rXac=
X-Gm-Gg: ASbGncsf3P9bdjVO3Ym+Hgtv+GaM84O0XKi1mrfLR2AhOyuND7VFdt0b6KdK1hcwcP8
	VY+3WXE3qWjchr6lq5Bu9/VYtJUbxhQ7a/U+VdovGXBouG014Ol8tqwGS3kzhTOOaeWCs4/P0WJ
	TYtmQvAYWW+7KbQaAfjZM2qy9qljqrKfsZP72bbXAhqN0ECcEkE0JeBwXI813xfPj1ZVwCdUqiD
	7n+O4zMeuJgHH1bPP/00V0eVjNkiMyuzQVfLAT61UdnYpptNyn8RNy2T262otwUKZRdkcEOs9UR
	0WA1VblQQ3uZrwtmRfFmBO4PAJd4q2vUKtbM3zrhaPmZtOdgY1e1fBV908P8/LJ1MUN/0UU=
X-Google-Smtp-Source: AGHT+IGnPHCTuUJLNxNW+8FrO/x/ilNOPLhSCK9CbmM8yRSZ+1JxBJpmZu1Hul9+oawgshMY1YBAVA==
X-Received: by 2002:a5d:47a6:0:b0:38d:d6cc:a6e1 with SMTP id ffacd0b85a97d-38dd6ccae82mr9537099f8f.28.1739266256526;
        Tue, 11 Feb 2025 01:30:56 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc672b55bsm12591296f8f.79.2025.02.11.01.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:30:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 11 Feb 2025 09:30:53 +0000
Subject: [PATCH 1/2] mtd: spi-nor: sort headers alphabetically
MIME-Version: 1.0
Message-Id: <20250211-spi-nor-guard-mutex-v1-1-05ed77a484d9@linaro.org>
References: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
In-Reply-To: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739266254; l=819;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=yHR7fmZ2/v4fPjI6lJk75oX1K0Ixzxl2HWQK1pCqNbs=;
 b=jRD2FuvxlKXrQY2PB6zLOHVnD7bkUrVQk6+dxMacV2L7fyr3pJ5CDh56ppe6qZw39nYoSxGuU
 B/oagtN2SJQBw2LdBeBzYRUbvHEw7kAGJ1smKNeFa9YSax+xqeXCFKp
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_013058_362907_80B859C2 
X-CRM114-Status: GOOD (  10.54  )
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

Sorting headers alphabetically helps locating duplicates,
and makes it easier to figure out where to insert new headers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 19eb98bd6821..1bb4a500be6e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -7,10 +7,10 @@
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
 
-#include <linux/err.h>
-#include <linux/errno.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>

-- 
2.48.1.502.g6dc24dfdaf-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
