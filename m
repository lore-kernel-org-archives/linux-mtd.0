Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795CFCD379F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LsuijqrG8Mh6OmY13a88Cnr5IhbpathG4OhiLzb2RFI=; b=gPNJo0CBR/UVti
	stn1GBaHdxHJTSB7ecQTvxTgzO06HMZplFMJcyf3JqwbxAcYlh9L7yKjP4hMVxLQPqyi53BkyFBcj
	cynZwOpKGTskCgczJuEKdu/5addH9mrfAT2EdAqV3YZEZBuPZ5FT3o3Elklmd/qhSdRnOwoqUGJpa
	1vwoSgi7vxXfxNpCLl1P/NLbfxaGQChdYG0g5o3KfesUQb154rSw5qJFtvM+MEwlEZSvOONXnnA0y
	5ILDSI042ydqAWyKv+DZPPTJ0fAGDp0OKDspF7fElXvzCzfj6z3fzdTlUZN1V0S1VunsBOe9lucjX
	LWayXDg8IBLpxAoBqlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFB3-00BIij-1S;
	Fri, 15 Sep 2023 20:12:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFB1-00BIhs-15
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:12:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-69002ef0104so2131412b3a.1
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 13:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808750; x=1695413550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y1ORwL4JwevQxgf11GzdpKoTIBTsgU2jnKyI5O4kARU=;
        b=X8I/H7WIMkyZ6RUGHUF1ymjC065X4fMgYl7dGcjvKiyVuqwdRaRDkNeVvX8f8XG4Y9
         yiNysMi9QhyL5pFpqV9HBKZEiyCm0APymruDXEpLHRLWDVIzRlgPB87fqgKSeMDcKKEI
         BwZB6GRRI0+kvmQatoGVh8HfmtGIbnRbxvB24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808750; x=1695413550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1ORwL4JwevQxgf11GzdpKoTIBTsgU2jnKyI5O4kARU=;
        b=JDlFXiAZugoc/5w5mbFkgnKgw7wsCp7ixbcFkN+j/tz3DP8UqxQ/kwAMAuHxWXGb7L
         b49QKmTX+PZ++Lkim6zDxk395XAhS/mtmrFgYJ9v30Cpgyr76xv5+0X41xH9qgPh0SAf
         llMZFC2iL24nhrwZbM+IT8YfTMckSG6WOZMEe4JsK6I/v9mDQcmm3KdjjNf0sSsdLhOR
         DZGLQJ02FeXEorTx1iCddm8tDTFSJxnm83C7rpKQMrva5PDsD89Dnpc964iuiN+EwcIx
         1XUnXP9sdbIdkPMTTK6pZBjXWk3yD7kLZsM35IA8X4m/zcuPx3pRUCk0iloJlYr0tQO4
         zNIg==
X-Gm-Message-State: AOJu0YzdNCbq4b77jKtxUf5fIC/0BDXiiVKdtLPfWuxW0OAQlKJibJ7Q
	QonK3bhPuk+mS8qxUtOMIgfW8Q==
X-Google-Smtp-Source: AGHT+IGM69XeyMqXrJENXIIbK0AJFt00kniNdSM5fG+ubnbAoFnmRMBQxlen4CPemfd4BQw4M58I3A==
X-Received: by 2002:a05:6a00:22ce:b0:68e:2cf2:1613 with SMTP id f14-20020a056a0022ce00b0068e2cf21613mr3157316pfj.3.1694808749928;
        Fri, 15 Sep 2023 13:12:29 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v14-20020aa7850e000000b00682c864f35bsm3433733pfn.140.2023.09.15.13.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:29 -0700 (PDT)
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
Subject: [PATCH] mtd: rawnand: denali: Annotate struct denali_chip with __counted_by
Date: Fri, 15 Sep 2023 13:12:28 -0700
Message-Id: <20230915201227.never.483-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=keescook@chromium.org;
 h=from:subject:message-id; bh=HPftxSeIdfi4GNcmfYxSI30gQxrnfduSUhsbK/q4I2U=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLqrBhnZOaQvbWWLFylIXxeEofmGqQfAApeF0
 9Efh0UjrZ+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6qwAKCRCJcvTf3G3A
 Juq0EAC1p8IKMh8ULf/+9eqSBMFztVKVRNhwH84rJGBubRqa9GmRqG9lJA7HsGhBtR+V+fxtD32
 aZqVfOA9y1Z9LppySZJxzizv01l84QfPm4/2t+Z6lFiJsmAsrSfnLhKi+4RtQgh/ftLa7YFffLk
 DHuuIKIAr+KyklVs9AVhAsQa4PCcANGLyCFK8hImwQQcjhzFhdPLkAwiF4lF5nX9W6Ph/MgtwdG
 zuc4D9tgk1+sUx9keYPl/Q5y7CJOh98r7YuhmgOI5jFo5tGDPtsT5q1JIuXKyIFZktCSc1ZTEIY
 rcFm8dhnnPjfekYmEhvgLkk5F0V9B5sZRpWoRfVctss6CF4CsZTwyEg2FyE3uwdD9Wf1ltQvV82
 wjMq4iftY52seKEp3LGSC5l0D9FbQim2DxswJ4uvsGRT2wPtMXtt0wDgtXR5g9s89pJ9ivLoJMR
 PbNoWJx0vydQXRqqtjv5uI0YdmQ/vBrFSMHF3UwdwPoEdIx2WTk4DephZgfErE3HEzwEEBfa5+z
 apHYb19IwNM3IQ/5LAZm0UrxW8gMt0rwV5Tna98A/fk7W7OntvQEEsHZWKl+Ve3+4Z+drf2kUSA
 a0SDFp8ERUWM1k583PrxiuMXYrA5doWz1lHk5TI+q/wpsU0abnhFZBJk5QtqN/L+ZGsIrQNhKiu
 cL+/10l bmZkd82g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131231_378127_DF08A272 
X-CRM114-Status: GOOD (  12.80  )
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

As found with Coccinelle[1], add __counted_by for struct denali_chip.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/denali.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/denali.h b/drivers/mtd/nand/raw/denali.h
index ac46eb7956ce..5f2fab022fc5 100644
--- a/drivers/mtd/nand/raw/denali.h
+++ b/drivers/mtd/nand/raw/denali.h
@@ -328,7 +328,7 @@ struct denali_chip {
 	struct nand_chip chip;
 	struct list_head node;
 	unsigned int nsels;
-	struct denali_chip_sel sels[];
+	struct denali_chip_sel sels[] __counted_by(nsels);
 };
 
 /**
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
