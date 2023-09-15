Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99F4CD379F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cd38msCGBL2SP/ol2ogw/H+w/KQ3arQTHuo4OKQAbxM=; b=GRhMCJtw8pevjE
	NnaHpq9js3W1IsHnY/RTEsX9JxlELyY0NASmWNv5EqH2Wszb7IlPD1T6CGHG3W6m4aAyTYEpgMc7v
	aE2FqTbF2OXO7fMvvy+Vs37HGPX1dHzYwz05HtlXlMsZfVww1GyjM1rORuCkhyTwPozUjgfOoTmbn
	JEC+xkmVpAPDkU6A1U0eL4UzKANeurUcOMjXS15ucSdoEfouqRz7Ro86HhxFztmWBqI5vJHo7eNY5
	H3UeBkMije8q8INm7I0rpzQrIrlAtAOXkf4aXCe8KWgzr6R8p747omwOzeQjnX6d4AwpUtISPLtxf
	wBs9zW6Nnq+OhQU/0I2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFBW-00BIx1-1u;
	Fri, 15 Sep 2023 20:13:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFBQ-00BIry-2V
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:12:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68fc081cd46so2440893b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 13:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808776; x=1695413576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BZJf9s84lU3CfTi9HxKXU6WVEhOLwpzo38ws2QVZ2w=;
        b=AwyLk4hi9tSk+9mFOucBpmi+BPrVeKBuyHlTlctEkezs4lJJBOsXpjIP+AfdIy9TiE
         dkru/XP1KYE9aPccVf9duzNs0pZ0al/elEBEZGTM9n/+qVXwyVZGODeyguQ/t//UGng4
         0nSSRGY5GKbxjtGOMFmdO95MPm/wkJ1RUmww8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808776; x=1695413576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BZJf9s84lU3CfTi9HxKXU6WVEhOLwpzo38ws2QVZ2w=;
        b=vtO0aPxhdapVESvbxiR2CK724LiXrHdEzVRVsEJ8FuY2UIeu/vBOpoiF9cXtY6v8RN
         iRYLanM/yLq2kfh/s2sXh1D43ePYYzqo2qE5fucBK813YpsA7vzXxj9mAhWI3vlHSBii
         DOISpCcYEMTxVO1/piH4jueivwhnL0jABWV1FBJw0Nx0XOVLpPZ0u3zvzHWL8HHVCDN5
         Tm4oOAD7UEM88IbFq7YImTxR4P0z/8Sq76ph3zj0qZ2bBmAJuRzsGlWapcFYv7HKL/VQ
         /Gso+V/h0ubol09YjKCHJvRD/AZ9plz7hP1kAzxznBWRfT7obWmyO5HwiltGPuKtZxKR
         WDvw==
X-Gm-Message-State: AOJu0YyzH3Ho0UXtAvsMcal7gnwaWZ9uk2Ys49REV8nyadUcS71egUOW
	SX09JHU5nQYZpKUr8g+8YIExFQ==
X-Google-Smtp-Source: AGHT+IHmQbOxLY0L8bXhn+zKOM/BnwaC8qXFTLFQ0kYWZVSH2PXuzlce8g/QsH9C+n/HCzeTj7zpsw==
X-Received: by 2002:a05:6a20:320d:b0:14b:8023:33c8 with SMTP id hl13-20020a056a20320d00b0014b802333c8mr2750657pzc.2.1694808776017;
        Fri, 15 Sep 2023 13:12:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z16-20020a656650000000b00565dd935938sm2758499pgv.85.2023.09.15.13.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:55 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: renesas: Annotate struct rnand_chip with __counted_by
Date: Fri, 15 Sep 2023 13:12:54 -0700
Message-Id: <20230915201254.never.511-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=keescook@chromium.org;
 h=from:subject:message-id; bh=0FPGmCgvWt7RjvkdTmKw5gfdGmdouZ3tE6ulzomUB2U=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLrGeRmtf7v7PuHT27LUye5Sm4GLfRpWtonSx
 p2dIfmBTvuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6xgAKCRCJcvTf3G3A
 Jm5IEAC1QGXYJ9yOV0x64S8RCZrHbM5hI5qcR13CwhzHoqjMh2ZYHbyfI3r1NJdJai/+Lz6k2Qy
 mEzqHCjkI/Mub7jmWbQpzrff0loovqVfED8gwE3LDnt21UZALC2CHMhkeynTeqfx3blquFl/4/S
 2xcPtvU8OQdr4PA1CDlZv4sIuMDjCztn2Z379LJlimR60iSZgkxcdJGE81pVkF5tD8CRvh5ckn/
 JnHJ6MpjFjETsFnCbayrzEsvZTQXAA065p7EpTafPz7trWTN7hjj9nKUDG6aT8lnlALZDWgWf4v
 BWN3h57Y4cSYBG8z29PniByDsPlVzYfW3J9Lxd1C8430W9VDbH3xu/q957gWp4Bl5U7aQK8QsIJ
 dAf3OzpoL/ONx8PDuObWUgww//y8mHbjqvRqowuTA+VlchilOGBE0+qz4C6cxLvbBjTSm/XOW4W
 Q1R+0c+bJtRPYdANjaXw2lFzNTlXg+iHDbwsQsN/6BeNu06htsCNR+N9BpRebycxfmHrIqO86hb
 oluyC6avf43e1QhfZDl7ViR+6olmcuXajW1hbv4PdUXKzeEqvPZwfbcZzp4kFfYDCyMAV9oifxd
 yG29Z874XY7Xo5PDqIiflaj4hU2414puFaXtfq8yfQFSglCTM0E+X5RDD2qWfvNo2QdF212WR4F
 x/g2isV w/p8A3kA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131256_821480_0BF4BFD0 
X-CRM114-Status: GOOD (  12.36  )
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

As found with Coccinelle[1], add __counted_by for struct rnand_chip.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 589021ea9eb2..c9a01feff8df 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -210,7 +210,7 @@ struct rnand_chip {
 	u32 tim_gen_seq1;
 	u32 tim_gen_seq2;
 	u32 tim_gen_seq3;
-	struct rnand_chip_sel sels[];
+	struct rnand_chip_sel sels[] __counted_by(nsels);
 };
 
 struct rnandc {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
