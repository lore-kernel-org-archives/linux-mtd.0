Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E250FCD379F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YwYZtYRdd+ajXFouZ3phDnjZqrR2VPY5XwvYK9IdMJE=; b=c3I2oRv12o867D
	ehTKchPtRI8bHq3C1d1Ir56nENlMfih+JZlOwyjJLp0Bo3tIlJqC5wF8Sim69HZ6eWJQm5nf7wMmC
	BThkLK24NHCxT6F1cgbJStQ1ZC3GurtcQctAocpC8DDxKxlIWsW6LOnS+72pwaZyUWDhKe58VoEMC
	0IjNHNdxB3JL+XE2j+WIfnKLFP8o6ye4zjtvlC+KRzWR+FyXcAcm+wa9cP0tptDBqzG2COgS8co4i
	gx+AO9EAGgqE50tHgT2WWxppzBzjT8LJBGwPZP8GI/hi45VUryftTTosrqI+wNmZFEI51aGy7Jz3k
	qV5mumibMqP3MhF6lHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFBe-00BJ1b-1X;
	Fri, 15 Sep 2023 20:13:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFBa-00BIxR-03
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:13:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c0ecb9a075so21478765ad.2
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808783; x=1695413583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2M49lx0SrOSxw3SwYD5z4lDni11acdMA1KrbMre3cHA=;
        b=mI62oJIyLe5qELxjfkNZpm19IJG+Te/J1W+0J+ZT6YHthFJdvKTAJwIVkq6OvNupDH
         Vn3y/o33TVL2xx8aREy5yOJkrTWW6XQLCaW1+JFfDcy55vJRzIYNUs2ggEr+eFsOJs2s
         VGPUpCoTvtXSpFJ6knrEVUJ3YU81FZhkctbUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808783; x=1695413583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2M49lx0SrOSxw3SwYD5z4lDni11acdMA1KrbMre3cHA=;
        b=a9YKl1mzzTURXoYy/nruPUo0zH61o1GAJvp9sZX59FKvbO50MoR5u3bOZXMY/yfrKE
         VWqultZcseuUxFJHWFC6IGvDqa1oPPqLMiVPz0RNVptk1TbzsUGL3kw60AaV9RNt/UE+
         QOdQtRFt6l8uVtm4F1mSLX8OhcOhPdFRsquHCOTglnib3xZtrCh54r0hzemu9LM6QkZo
         lhMLFh9ZtN+YmqhMk8L0IyqTxn4fV9xAK0awpevgILB2e5e+U9LPSM0x84cAe31CH5pF
         EDO4UbIxXd8Rvz2CXE8RwPfiuhMuB7/ncoNekEbC1rALQg63SBr9v5IN/yqcSobifH5a
         hEZA==
X-Gm-Message-State: AOJu0YxK8nz+MzqRYxd639uskQjuBrrGhALKwr8NDX5lEhfYTtyB1aX6
	UQab/qYOsOJB1x6YS/D92mt0/Q==
X-Google-Smtp-Source: AGHT+IHmJsBEHRSFwHd9H6oVJRsl62rZFBTkjbPN1AjmLjm/eZ5VnEB4AJ5MbrK8A+rBSdegqn0n2A==
X-Received: by 2002:a17:902:db08:b0:1be:1fc:8ce0 with SMTP id m8-20020a170902db0800b001be01fc8ce0mr3734260plx.12.1694808782967;
        Fri, 15 Sep 2023 13:13:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001bdd512df9csm218663plb.74.2023.09.15.13.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:13:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Manuel Dipolt <mdipolt@robart.cc>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: sunxi: Annotate struct sunxi_nand_chip with __counted_by
Date: Fri, 15 Sep 2023 13:13:01 -0700
Message-Id: <20230915201300.never.057-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533; i=keescook@chromium.org;
 h=from:subject:message-id; bh=9LgHW2ESmAWnpC8VkPKIjSNhD9+xewvO1BU6xLYCYys=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLrN7bH2fSvx7Pk5xVsFyM9ZP63U7SCER0Gx/
 1a7bYV9DdCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6zQAKCRCJcvTf3G3A
 JjKID/9gXg8w66qZfCGmvAX8Ub+SGXwCmA3YOfUDES+znbHz9/CripNvDDfLLhe5EVL5h3kJO6m
 35FkrSXVpHWljoV3QAOyH34CLD+X7WoBY2hQCne3oLauVtJFKYHDi+1xiM60MUD1cJm+7bbrPJR
 Ywyhs6nkYn/yLxhuQB0Fg1lA7qfOoQSt/ZGI/pRPV9ehSOb6n0owmVEYm1v+VZjAxzACRWjjEzJ
 +MmwR6qVCBlwlOD/h9f+V0KeODYE1O4HuqtBZSp8eTEEP1kjtc92Zh+EPRzpvDwywIzQFygFFgU
 R5CTNEBEP+5eUFeKYDnan3QUhZzTJnNk5c9NXJ3lpIe9/q204g/M2+fpbPFY1UGEagTqKyI43tG
 eh/NDIHf3zTaM5cZpHL++wvYoz1PzEpxmgQMhi/gkJKk8p9LixpYEHQx1WGSlvkbLs22CqHGZB0
 +qB8wd1Rlxqkds0B9k3Nm73iul/qPyRkx82+hWrle4r77c4F0aMZyQJx1sSZXAL74oUSuZ2n14m
 /04J/LRUq8a/BALl+3ZyJVurqFg5w7rtQEcqho0TVyRT8YEn9PvICX4HaJwQuPcfk7mY79YwlIv
 qzUUZprHpLJZTbfjJvdTAgUje2fPni05Ab33Ntka+sBFJpOgRhy66zEWzU5ChzUyC4SK2vfYD4t
 b0+mhO7 VDdYbzZw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131306_075936_4F5FADD8 
X-CRM114-Status: GOOD (  13.64  )
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

As found with Coccinelle[1], add __counted_by for struct sunxi_nand_chip.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Manuel Dipolt <mdipolt@robart.cc>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9abf38049d35..4ec17c8bce5a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -197,7 +197,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	int nsels;
-	struct sunxi_nand_chip_sel sels[];
+	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
 
 static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
