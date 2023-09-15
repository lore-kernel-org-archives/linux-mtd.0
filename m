Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C69CD379F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EAKKLq/+F6ILDPfRq4k3n32RWwE7YtxJpRhNXjDlPBs=; b=Y2uLf12ILQyQse
	kA9ArtUaUShPxD1H1ImQstLHs/Wr/ynBCKa3b+BXGoq13eVsg1eADOkG2S3EtI4s3G1++/5k58vrW
	2vR+nBrFTGRwSBUNF1PwY0A+DfzspsCbOPpNN8BVtXTPCHaOuNkXuUzKpEZuEGEAqEVqaFeDw9CaK
	/+HJ4P1KOD5c71xEyw27XKBM57XAIoAqyOu9CfUWpC4Vcn8718VIS2hWJPJI/cNlErlM8A7Vfryye
	Zxn5/h3xTKC90mwMm/M0BcWXOogykVkgxAD6SjOcBIa9EUtvP/qU9Awg9bW7yFAsyaK7Fkcv8Q3KN
	+eA4ASqwb+QYUZ5RdRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFAv-00BIg9-2v;
	Fri, 15 Sep 2023 20:12:25 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFAs-00BIey-3B
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:12:24 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68fb2e9ebbfso2122303b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808742; x=1695413542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vbgir45P8c3Pig3O82d5C6ZtsdrQshUxHqzUl7LRBJ8=;
        b=If/mm0JhnnKXdUWbQGSQkE+OerpS9Fs4+8tkRkQ60jJ+WGWtWaZaz0xvAU61JLYZFY
         229Aqn1Ii7yj+4LLZBfGT4bhhzHCuoChR2nTyHMAggrXdhLYDb/zRK/iMHeZ0BL0IbHH
         29rLIHWVT1sxFTWv9gRvteiJj6/0LCgy9aWAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808742; x=1695413542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbgir45P8c3Pig3O82d5C6ZtsdrQshUxHqzUl7LRBJ8=;
        b=nhhFKhT/Rb7XPfInMuEemGr++0jv1xep19iS36splMIMBgj/8OrP+G7tPRCzCSOttM
         etoW1FXOdbPL0T3egnVOpYavlWB/w5MKsDIHL/q/FaxgmPqBoDE4Cyws8PHBKvA5U+lz
         7DJKT4VOHWXaBFd+bj2NYCO+x0QZKvTERBYNFiHsbhatjUcmboSui5yK4kpmr4vaZX9M
         JQWwD8FWBmSLSz85Nn64ToKf6k6cHv5WAI1gcB3S8c7a4rGqXzqT5hzbHxJqbI+leBdG
         gOutEdhvavUJiPkuPxdoqlfX5naIXhE3utfj9iVcDu7UW1rzbwcudY/VpHEuPAX3zQqc
         nTOw==
X-Gm-Message-State: AOJu0YxPhDMIhl7hDRNht7hOyYkeyi796wAPQO03hKEkUk0mEtbKIwAn
	q/nt5AcMqsemmE1RXYVztskAzw==
X-Google-Smtp-Source: AGHT+IFhBgyUlPiD5xyzulG3JBRm1U+iu40tZkfPFsrc4zrlynDTyADHna0tENdTjWY4mEIPQKAfVA==
X-Received: by 2002:a05:6a20:160e:b0:14b:887a:6d70 with SMTP id l14-20020a056a20160e00b0014b887a6d70mr3499753pzj.15.1694808742247;
        Fri, 15 Sep 2023 13:12:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a21-20020a62e215000000b0068c6e666066sm3327765pfi.111.2023.09.15.13.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: atmel: Annotate struct atmel_nand with __counted_by
Date: Fri, 15 Sep 2023 13:12:20 -0700
Message-Id: <20230915201219.never.352-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=keescook@chromium.org;
 h=from:subject:message-id; bh=Tdr7pAr2Wb4/8w/gmPSQOqizdA4eTmvQlqS8OoRKddg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLqkv2XZPgk3DLyZFw3FAR71jSeYJBJnbdcTE
 k2PsyMAmBKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6pAAKCRCJcvTf3G3A
 JoNrD/9bXYCBxADrZNHe5KYuXZa2MpAe6bX4jbfGcBcOh/Ugaq5DHdiRZ1029txqS953Eg+J7pJ
 4a2Ae0PAfgHBWg+DTNZgpFuZdZVjmmA+C2Jek1oRG9j1sOPzK5g3dEKzqM0T3SCSG9ltaBGAaXB
 4mJ4oJVZsywrSPmpnBsHloni/CITMF65he+pl9MzG+gt8XiGtiVO9x82Ja5P+VDx3HnlQtkfvwJ
 uiZaJb0o3mZArnjWMPTMzx5Vr8FDd1RgiqgfdCuANBN9rBs4ZPZKbqK6dHz3KMLFxw34Vs9g5DW
 QL1OeYO/nsO9COQqGEG+Eju7ASKKedTGsFLqzdxxeORZre7+qJJkxSs/UcA8DHWkYS/HpZtvLtF
 BSBdlZHteJ/HlYfTPTWd/jIBjFsSdRUkKzIgDb4BPhSyHbrZ0jKOCs79l2Fk9mhZ+7DpLh83VpG
 lnaDwD5gbMFG6RFosKr+j2LMBNcqtLSNBJC57ZcgvECQNgGy3oFq+m0Mne3Sg68G3TnakTjFtI0
 lFmUUvubrfVj6jPZfm113wYcvENBIVGjC59zqFpg4AUbAOpULsLLbf4ihMaxOXG2yCI6Nb8bnRT
 tUygiBi5+DcAgoQCg4tO393PtyIKRx54A5CsFCeC8iCVwKqdd+FnSBzCCQOZkxU93X7wLijiaWp
 EOhkDTw GDHW+fKw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131223_020276_9FE13629 
X-CRM114-Status: GOOD (  12.92  )
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

As found with Coccinelle[1], add __counted_by for struct atmel_nand.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 3f494f7c7ecb..4cb478bbee4a 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -165,7 +165,7 @@ struct atmel_nand {
 	struct atmel_pmecc_user *pmecc;
 	struct gpio_desc *cdgpio;
 	int numcs;
-	struct atmel_nand_cs cs[];
+	struct atmel_nand_cs cs[] __counted_by(numcs);
 };
 
 static inline struct atmel_nand *to_atmel_nand(struct nand_chip *chip)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
