Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81400CD37A7
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NrXyKEAudbeuVpSqKKxcsXkp4GyYBLpOudIaDEGiiuA=; b=UjVgy2yF4n+gaG
	s1ifnk7rQN8NGUPHEIgkmC9UDa1E0RLf8/hlwe5YfzW57M7vUArnQhU53l0nD3p9/sZcAtA0MQvM8
	unoEky7aYhucF+71Xgk1CGSBqPhJhZrZRUU98s9sbIHoahmNeSvtMc6rXi6Gk7SF8hLTt1ogPC4pf
	ypDpH6Pin1+3XRtmc1Q9VfLVjTsQXKtdEfM2QbiP/cUFogd2V/oZS6xYxEkQsMZByI+yAvHzAxB70
	YNrK74pRcez7/hibRLXDGLzuI8ZSbh3OvC/bT5l22HAg9j+UPNhJV2P1YjKcTRu8kiXn0JlSsas31
	9YPiX46BSTpEpr5DsLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFBQ-00BIrr-0j;
	Fri, 15 Sep 2023 20:12:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFBL-00BIov-2a
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:12:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf5c314a57so21372915ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 13:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808771; x=1695413571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0w8YyWBkyxxpFXFEsJXWeSdcXhaKX7qg2CNvqyy5fgg=;
        b=UfZchBJHf7/EB1Pf42S4o+0Y/FwU4C18EJN8JXXEE085AcdDGqus7Rjjll3AZyqwLT
         11cipSnn/rgLe+1gf/1+28cLwj/aK1cappX0E0CY1MoN4CihpqPcvluuEaw8dQY8bHn9
         diJwO6Ryo7sPqqWoS3shi0zXK4W0/oeVEbbOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808771; x=1695413571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0w8YyWBkyxxpFXFEsJXWeSdcXhaKX7qg2CNvqyy5fgg=;
        b=N495QPZ/nm5LoNVC1S63NCin4hNGS4ke9KZjtO1xG4T3uBFRPE41yTGhGIBJqL/XBc
         JPCtgDlUHynB70qHAR76LcbGfzxzYOaFC+ilBfKoIcAAoMQYjoLXfz0j1kQEr6L+3jin
         V4b+yjNJ0LDIc6R9TB8F8vEcIrGCxp7PbhRqJ/QZEvjotucrVyuaxmOosH/w8HOK8DPI
         e/2zfpdb14ihI55Cdm5wdXaJ9U4SR9ZJsa9roJh9RGBPWfsnVv8e0IsplN5zXP1tOAda
         zhe7jfbIk1/z9bUL1kNcQJxpsvFfACdZstld2j5pKn9UzR+yqFRCH7Rpn0XyZ84l+zkI
         b3pg==
X-Gm-Message-State: AOJu0YxjkI6CdD1xMB5wtOolgCNv0x5FrsogsVOatWnPXctbKu6DNOYe
	lU/1EYdWIvdsSrd6WxCn/1LZ4w==
X-Google-Smtp-Source: AGHT+IGEP+XX4TcWFwL6riCxf7EV59zw6/4+xl/jX5TKVK+vuyzRqiTZSZ3ZHUIdArWZJdh1HlOnLQ==
X-Received: by 2002:a17:902:ecc5:b0:1bf:13a7:d3ef with SMTP id a5-20020a170902ecc500b001bf13a7d3efmr3048022plh.66.1694808771246;
        Fri, 15 Sep 2023 13:12:51 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b001bd41b70b65sm3864242plo.49.2023.09.15.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: rawnand: meson: Annotate struct meson_nfc_nand_chip with __counted_by
Date: Fri, 15 Sep 2023 13:12:49 -0700
Message-Id: <20230915201249.never.509-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=keescook@chromium.org;
 h=from:subject:message-id; bh=viN3aFTUGlYqsHbJQcNa6oOS8nJqeFdRFpqtC0E5D+8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLrBAAO11BUsQ+oKxBzlepi1zMsCl8lRLHvB4
 qk/2KM3zKKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6wQAKCRCJcvTf3G3A
 JtFUD/4hfU9qPge0NwGnOrmrFpYmEsF1rZXGB7tjkgsjW4R11jE9il/8UIN9g8stacwGCBzLUSS
 mH+V4qUpwjDF0Vgztzj5EOz7jL0SUK05t+kAfxhir1eu+TnBxzScuL5kBFOGrCgttmRtseZC1QI
 W+9JjUA8xzBc0eX1m4eYJ0HXcBky9b9mgpiVTgrh5ZL5aFlaEXos2XiL4dRwbR5e72Zb3wUCnDv
 yMj9FU25KEJUcfcKLFE5fwvgnTk4zYKoVa001Mc8YJgJAxBrKtX9htMtzaR4HmBK4KEEkMnMehB
 HVDtcTnjsrQ7AmRrkuLkAj1Bah6SCH5LQEhEg0xmyLSD4csxgBeBSJ4a6wbKdwMAzkIbm1o5ACt
 NqIVZYqLASf787XFgOE8PA+1FJHr9EnDESUCgjWz64KdBIhs4l2CJyA6id6v3XYLU5vzdkJrAqK
 HJfrvwTc7Bg2Vs1RoOyXRXGcdwYb4stM2Vp0f7BGUhvRDk5F+Vh6M80kPxS/rJwv+KWuAeCipEw
 RWcbhpHBVe4oPJ/HWaMDO+RcXNJscIUwz7fU3UMhLSggbkK/h4czEGJTOmpoOncxQK921laWWKB
 59G8tSqmjF3lRjjxBh3wvyKvp8D/Fiu7/pHROejMOREf89AymCCZDQtmwn6ug7Eu9gcc3qEKHQm
 gzt6Re4 SCuWvuVA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131251_848375_29D726EF 
X-CRM114-Status: GOOD (  12.16  )
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

As found with Coccinelle[1], add __counted_by for struct meson_nfc_nand_chip.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Liang Yang <liang.yang@amlogic.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/nand/raw/meson_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 25e3c1cb605e..378f28ce6a74 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -128,7 +128,7 @@ struct meson_nfc_nand_chip {
 	u8 *data_buf;
 	__le64 *info_buf;
 	u32 nsels;
-	u8 sels[];
+	u8 sels[] __counted_by(nsels);
 };
 
 struct meson_nand_ecc {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
