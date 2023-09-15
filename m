Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FF3CD37A9
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UZp/NXSjneo19EBCmhT/NA1GtewXdjnmxf2jF7r/aOA=; b=yjzHcZUU6Qr7jP
	tG7muA+62HNPQQBrJpXMin60it/6IftViO1nv38sQDb/Dt9GedRtKAx1MyWcS+yf2inKXdZK3fuME
	aH8sXJ8k+9MUdBrMiV5sz3gwk38yKBhrd49JFVAmvqp7dLEC56vTChX5A+BH2x2SNRxu7tZ5wvJqw
	F9ySxlLyGPpzBotF1YPPT6AcXR+3VdekieIBHYsoMGo7bEqE9ZiM7qWWmy3405DRzYr/4u5BTDgEt
	Ivez0FnaaxRN2NgUXhYm21GV+2ieTBEbKEjFGF/vq/lcwzF2sP4m3fwtPrLD0/5nxlUA6f60gWR0N
	grxItA5+Cc7Rc2TevHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFBL-00BIod-07;
	Fri, 15 Sep 2023 20:12:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFBI-00BIme-0d
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:12:49 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c39a4f14bcso23406255ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 13:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808765; x=1695413565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9ednYaRcJqbNHBCr/S6Xdi9dFFsTXXFXM7WGc+jfHE=;
        b=BCTCIfeQyu7kfKc03x31ZVW3dSI0bfbOLNdsHJzO5mp0GiWdzxJHzWa/J8vLLeFBAc
         ajqa436J3QPtTawUyHAXqdWeD13JomqOpX+XduS4VYz0i3Pb9tKuBo+I0wM+zGqEEwt5
         wdBki3owpMsQbz8TN4Dr2JL7UuGGrxHkT7fjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808765; x=1695413565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9ednYaRcJqbNHBCr/S6Xdi9dFFsTXXFXM7WGc+jfHE=;
        b=SWJuOprBonfj9Y9LRT2fphlsSjQCUyh0/FWzzRuk9mJEDe58H8IKpPCrchvJcr0XJv
         Nk0TZgtB5gNG9xsfL/WK9VpQAbB3VGI/KFWBW/EAk/LZgyMO+ZeqOIG5UO9vyT5teXWr
         v1e+ZSjW2Rrqp2FnM75w31NXvBlTCP2FXHv2cwohxk5cx0cuyp2U3TdQY0SOaTWkur9R
         SEri9bDEcNNxxw1pc6+yNmh0gR1b1/mTiVgH3KG19jYb5qQ2LwiOltIxSduiB3DTtLxy
         6D23Q9X1d0NXlD3W6JAVo7plGbGyw37y2KuSOfJy4fO0U5QA3rRixYSEdZvUAfv0fKNA
         vImw==
X-Gm-Message-State: AOJu0Yzoq9h236U9h8QDx5HZwBLUt5JzFnyq5Puw6moGmohHrAXbsZ75
	Dywq8Wdu3cKiaXVD0io+Ml0e8A==
X-Google-Smtp-Source: AGHT+IF26agxIuVbx2bzTaD9bnr+Fu0VoE03C3/1yq+KoExa8nJ3wdcTmCK/3DSQQpd1lF7ovsqncw==
X-Received: by 2002:a17:902:b494:b0:1bc:6c8:cded with SMTP id y20-20020a170902b49400b001bc06c8cdedmr2417137plr.67.1694808765369;
        Fri, 15 Sep 2023 13:12:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902c3ca00b001c3cbedbc47sm3859508plj.6.2023.09.15.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:44 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: marvell: Annotate struct marvell_nand_chip with __counted_by
Date: Fri, 15 Sep 2023 13:12:43 -0700
Message-Id: <20230915201243.never.235-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=keescook@chromium.org;
 h=from:subject:message-id; bh=TQ33NzB9u1hD2EeLpj7Zf3S9y0fIk3egTEL+4CNIaZM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLq7Uo+K8oyZTYA57xeasyFe+Qr+U0ga005PU
 otIx9G3DgCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6uwAKCRCJcvTf3G3A
 JsKoD/4pERGmBwMG1bnu0pOlCoKD7XbCGlqkd/EhEKPpQocWXRVqfmHIwKg9nm+oRxEEY/fQgRJ
 HPDNMYrW4NCVpCfktLjVuNqULEYV1xQhPXiRPbtPoctSpCffUAcDGeSdxZ+ADTtOMCf9YMxZ86M
 XeE5QMBNAWO10BnFaiCeF+DVmCbhIPN3voMjzZNhZrbp+4ZZHnkStN1CWXoqUdEFxmjTfye2xEo
 6GSoFfDAUz4lsOp4p23NBSGDoXS+hoVMhk5NCWJ5o2m1Tg3GM58ZAevy+KZG+bCZy68wh4S7FQQ
 QX6fTuhdxeEsnWoOJeYfaHXkjDTJNn+kizzywtJNe5YfkZ6Sfc/NeMytmeOyQl/MskHmZDM30j8
 naA4EfZc8RPme4ulzyVc2SWSMilvBlKUGF/rWF40drwKmQVBJN3ppGzcxkvvYuLlswVxmMnufHb
 Veidh2Y/zUi/crLXAwAyph5HkKkLM3ugeU+mHQP/jsi1T4ckqzw0U9EHXgkUVm03oZ1pnzc86v9
 0ztGQr/8O+Sgok15/8FkWTTeS4qXajh/GTDLetIc4wxK21KZzQNRlQuTIXTCJUL3M9ZHuV3Wm0z
 EfwVgQMW9MD9gPWZdJUzuZuFMYiEzHmKD0j52m0w7qb8t4STrDA6+OKfBN50dsM0Pivr2OSq6hz
 afLGe7T gFR43eRA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131248_235392_05BDAF54 
X-CRM114-Status: GOOD (  12.39  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct marvell_nand_chip.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/marvell_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index b841a81cb128..a46698744850 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -348,7 +348,7 @@ struct marvell_nand_chip {
 	int addr_cyc;
 	int selected_die;
 	unsigned int nsels;
-	struct marvell_nand_chip_sel sels[];
+	struct marvell_nand_chip_sel sels[] __counted_by(nsels);
 };
 
 static inline struct marvell_nand_chip *to_marvell_nand(struct nand_chip *chip)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
