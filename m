Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18732C5AC67
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 06:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+G0nlQrb321mvxXhNkYXb2CqjUJvqy7Wejhz16WSdE=; b=BZ2xZoiFaDu5JX
	E/rMxCQPqX+OWNPVMoyvXNTcsfua9FVKkv4Y2rs6Pz7FEeYFy/F3Rg9471LObUYNKeZ00N6FPK48T
	r0W/eR4SJkWTdvWD8/ReM3UQc7ypXdocymtIa7O/WtuglCAvE4JpPpYJNJQ5DSH4556xHfHmhCh5q
	EPnu7IfW//pHCEpIBW83j6YYFN94nPSLVDhPJ2cSMYaXFqFQ5vRogqRlxBgXIzTkhnKYqBknZ05+F
	HtsQ57tlrsfjnXtXhqE7dNGK2LDY3XH2tYI1RSN7aHP0xnM13OZduJJtj8ETtTH9VbBK6nCAKOYQ2
	IM4dwMJD00n11ssJUpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZ8-0000000DMYc-2d8Q;
	Tue, 11 Aug 2026 06:02:22 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZ4-0000000DMTp-0jWl
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:20 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6aae36ea5c4so1562444eaf.1
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 23:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428137; x=1787032937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhlS5DCvXMRcCc3UaPNyrbXwvBz9PYUN+5lwYOhBUzE=;
        b=J60E70rmA4ekKChEpG0g0RTu17f+IFJFz0kBS1kH8NAAR1g7D4YI3X00bPKeeYb6+8
         BWebfnJn0N0OuVcajrsOAXR248020XOtZOfOpJ3nFkjhqUSKn7kZgElLbfq5OYXAiV4i
         ApbjBPFbFGT/pFYwc9vo2kYPyyyEwU07w5JPtsuiYjN3vT9j1+qs2aagHREkKs6gs8gd
         e095j2xqTMtHqWsZT4gwLAVScmkuW1tBe4/OGnT0de+akydbKfej9tJatoasqTK9oMdX
         OerygT3UDgHvx9uBCWvVxbKtTacYa1BJs8Bol+KiZlO3+A4+wGMs2OFUUcXmbcapuLQw
         LLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428137; x=1787032937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhlS5DCvXMRcCc3UaPNyrbXwvBz9PYUN+5lwYOhBUzE=;
        b=CBwJ6fZTGao5Lhn12reGFPVBuQxJ9/Y/NQa4zMB9LYnyV6CU7qrhVrmd3PohERKlrb
         sKmcVKTUg6MZDfcP180o3PlP50GfQdPcqGCrtLaq2eiWAbT1iToqnVORRn402E5mMaGX
         Y8zt4GMY0VsWpsQP+Z36eMvAT/wHjZTGp/6Zh5k1Y4TNItwlZqq78Y3j/33sJ2NGW9KW
         HZh+e980GECDLuwKYkw3nAQWP56DmiB2r1CezChZHfMYnlZmlPA1bEY4fmeJOpEhMwFX
         KWWH81SoJYpBXnZqRJXGO8bDGPSlwyhDHIRHrdjR/BMbHmqxNoFCbi8xZRpfocozNNzm
         iJPw==
X-Gm-Message-State: AOJu0YwVSUe0a72vJdI3evPJ2ePnqI0rt+IS6YdPVqd2Yihoqk2Abk76
	CIlaeQa33q7NdA54gEvuu77MVdbb/XvNWDUAHroa34Q+DGZxpLv5pmE4wYY97g==
X-Gm-Gg: AR+sD128moqCtlWUtoXfj+J/eYoh3VXCCNcHDpLNjFwXEf+4gflSlQLeft/86rQBgZS
	+Vf9BOgpyAwb2QoH5WaRrYC+6hPLWQsAJ3CAQNCRd0Ow51ZnDRScf6i2OkZUNkGcu2KE8NiIhZa
	gT7Zk4Pc5+awU25JVvLPE3AiLKV+5+MqfeNfdTDq87juovtvXJEvpbxe9PNDNq5I5CGAp7JGQae
	ZJroKTPuu7kuu7ifgmIYh0f6HsmmnItMZxuy6QilHD1TFbZhS+9dcw11MWIV51TaChwC7X2umUH
	jy5C0l/PBI0SCgB77o4s1F6VOMVQTnCm20RQAmHS+XzFOtS+Q/+joZSDPxMzfHQGVnyjbJ9Inae
	AlQ/XkNSXstml0QP7E9qG3RG6IHGLORbX+hXTtrwyd5UZcLAny3CsbL/oYY1G8+3gRjv4Ee6e4N
	ovT/CbMydzJ67v/3uPDQyLga0Z0b1+O3e1s4LWz8Wg9Kd43k+TMUuA7YfmtXDvBzYf3w51o58KQ
	I0BJO8ZpoeKkR2ERGA1vwvAppEDbxMDa6JoD9yXB4G6pLfGH4l9dnMxz7al1/D/F+1iXQvJHtjk
	UpmbgLaxw++fuu5DbIII89w4dNQAcdNxqQgjeGoFGvxRj+bdKp6BMK+7nCm1N2x+EdJnRZ4FQmQ
	U45oDh7ovgkz1TWOeLyQsxcD9Ucg=
X-Received: by 2002:a05:6820:198f:b0:6aa:d792:e078 with SMTP id 006d021491bc7-6b0a31e2b23mr332881eaf.27.1786428137224;
        Mon, 10 Aug 2026 23:02:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 00:02:01 -0600
Subject: [PATCH 3/3] mtd: rawnand: sunxi: use a stack buffer for BBM
 randomization
MIME-Version: 1.0
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-3-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230219_190852_3B1FF209 
X-CRM114-Status: GOOD (  13.06  )
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

Variable protected user-data lengths replaced the original four-byte
stack buffer with a heap allocation before compensating the bad block
marker. The allocation is unchecked, and a zero length returns
ZERO_SIZE_PTR which sunxi_nfc_randomize_bbm() dereferences.

The controller supports at most 32 protected user-data bytes per ECC
step, so use a zero-initialized buffer of that bounded size. This
removes the allocation failure path and keeps zero-sized invalid layouts
from dereferencing ZERO_SIZE_PTR.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 01a0d0fa7b62..83666dd6cb2a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -222,6 +222,7 @@
  * USER_DATA_LEN registers.
  */
 #define USER_DATA_SZ 4
+#define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
@@ -1003,11 +1004,10 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
-	u8 *user_data = NULL;
+	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
-		user_data = kmalloc(user_data_sz, GFP_KERNEL);
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
@@ -1040,7 +1040,6 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 		}
 	}
 
-	kfree(user_data);
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
