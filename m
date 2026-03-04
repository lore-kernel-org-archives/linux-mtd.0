Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CB0EFCE4B
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2026 21:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t0bPC1G3TJZ5pZCiy8JYO/7Ax2mJoHEZF4sgSEDu2Kc=; b=4t9u8LDIdDxdUU
	Jjk1Ac+YQWBbE4IdmUzEwhfnlKrAJIQ7x3DBhHIEIcwXkmgyk0MaOsztvF/La0sSw0HLmf5gCJyO0
	FhA2+7nHKaCEIdLYHjRqp0P8c3AWZuw6SLmI2jV5HJj5Blk17e0JVwcncKUtfn4KOoRSYR05z+k8J
	5cMu7BMjrTSt6ba4ncRhhJ92Cfkp9JFWMYV0sAdbBOmyps0hbzqOolucPPVzZLhwLmFBBBdeAayKh
	LDeQdW1DvK//Yza566X+dQFl4BfHjepXf6qhq0jCVJd1N2O0b9+/rNAXCXUUCia/TDxcFjkYzSKgP
	CAzQoo7LbAqeCawcvJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtc0-00000000VBV-1j61;
	Wed, 04 Mar 2026 21:18:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtbv-00000000VBA-1NH6
	for linux-mtd@lists.infradead.org;
	Wed, 04 Mar 2026 21:18:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48372efa020so65328755e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2026 13:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772659105; x=1773263905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9QvjHp8PfoTUpkZ9GZXFo2vz0XN8DGSQuJNmycudMJg=;
        b=hz+P9+u/4xK6ILI+4VXLNOuUPikqVRSzEvem2fRg95IIgHex+9z7A6H7g5+jiDrIbv
         j4Kv/dE31F3s2whl5/rAL45aSZ5M5rOgj62wT45xe7SApWK+nwtdmMLnOgL3HhGHd2GZ
         fVQFJtMuF/F7W/XKqO9uH+aQYE4dJJOCF5uVlKrC1exJQBhpxp/gFE4HAc79cpnXN5Lk
         6eTvAiaFXIvI9vObU1o7G9biMteJkZxiYCa6pFHot9eVFGGgV8kjci5WLs8xe7EU31Ko
         suAUfKGuomEi4Vyef0sJbCNzgDFI6Dc0jKh/Z4SBMPGDQxpLPpXhDCu48qsgVf/2SxUA
         TjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772659105; x=1773263905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QvjHp8PfoTUpkZ9GZXFo2vz0XN8DGSQuJNmycudMJg=;
        b=OLErc3Qx6bzRbo1uIABJFHS+aBBLJUIJsP9viESrv+6Xltq4O3L9rlf9u74PMKhtXW
         QLwms8CpUwXa6IxdTHNOCRnACDq2Jy+Wa1N0TIwaMn4gcv9cp5uNDz8mMRBjASVZ9aj2
         dfIeuxUJ3EB2ywjIRf9Otryj4NAvWLGrmx0Ef8rNSR+aKW/eidG6QeHux043wSb+8Ae5
         gqbz8qntVDI50S5H1A90t1lJLO44kdTYEtu1fo9Z1XUHrnrPDRWOpFxYYopfbF+HAw6F
         XWSAU+8BDtWd06yj6T6dj8d1UeWNEU9WAkzsMmZkJxs2OsTb3dXwE00wuZJg8B9DX/kX
         WSHg==
X-Forwarded-Encrypted: i=1; AJvYcCUf64LMxfkoMOGZHDVbwE/iwSfP2vVwQuuhM/GjfWqpbTZaVQ2SFTUrinJXaq2oohlzocZhuOzBJjk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBoAIgXVxPDzTS52QJ10lsCi+YIrCO+tTl492oxMho20A0NFgk
	m9+SpzoEi2mfF+fYM3UcVujFF4UTgk+Y3R24r6rHl1viFAuGy12F39g+
X-Gm-Gg: ATEYQzwVJL7sED+1qn/sJteuLbFNtaovzi2A+OWQCXwW38YiiPnyVZVB3H7CFXdLp6P
	eVemHGAz1NX2tMmF24zGVsbF/r8t/Nzi2g0fX0NaIf2ZaWEQ70roedOPRUeNghbpVshflSqE7kn
	eXiPSRbV5yH6PVGUwD1phAaCH4jSwSMJZoXQ4H7qhJcSgiVp2swm/lKu20baU1Sw8qD3vzAY6nX
	UaMftaNMyFlDjRUoWEB+KV3K5FKwiuCko+Ew81HfShtGrznYWOkzjD+UjKxcWCs/nA1nr4Pyzfd
	YmhTqN7Cu9I9hWKVmIS6APmj+e0dz6WXiqQHjUlCa3eoJz4+90lEV5AmBe9xYzkJNEcw5cdLlod
	G4Bi+QWAQdlUlQifo1EjsewzmAUevPwOXw44PX5w4h1FiB1vgvVWuYXdu8xVLZG+xCwXPXze18y
	khkkNdU8BrxFbTos+CBzyW8GCRX4lsKHJq+8f5z52n
X-Received: by 2002:a05:600c:138a:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4851989ca9cmr64359365e9.28.1772659104632;
        Wed, 04 Mar 2026 13:18:24 -0800 (PST)
Received: from localhost ([2a02:a03f:b7dc:2b00:a97a:8551:7733:cb60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187b6fedsm97409655e9.1.2026.03.04.13.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:18:24 -0800 (PST)
From: Olivier Sobrie <olivier@sobrie.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: pl353: make sure optimal timings are applied
Date: Wed,  4 Mar 2026 22:18:23 +0100
Message-ID: <20260304211823.569972-1-olivier@sobrie.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_131827_374861_8C9F57F0 
X-CRM114-Status: GOOD (  13.81  )
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

Timings of the nand are adjusted by pl35x_nfc_setup_interface() but
actually applied by the pl35x_nand_select_target() function.
If there is only one nand chip, the pl35x_nand_select_target() will only
apply the timings once since the test at its beginning will always be true
after the first call to this function. As a result, the hardware will
keep using the default timings set at boot to detect the nand chip, not
the optimal ones.

With this patch, we program directly the new timings when
pl35x_nfc_setup_interface() is called.

Signed-off-by: Olivier Sobrie <olivier@sobrie.be>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 947fd86ac5fa..f2c65eb7a8d9 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -862,6 +862,9 @@ static int pl35x_nfc_setup_interface(struct nand_chip *chip, int cs,
 			  PL35X_SMC_NAND_TAR_CYCLES(tmgs.t_ar) |
 			  PL35X_SMC_NAND_TRR_CYCLES(tmgs.t_rr);
 
+	writel(plnand->timings, nfc->conf_regs + PL35X_SMC_CYCLES);
+	pl35x_smc_update_regs(nfc);
+
 	return 0;
 }
 
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
