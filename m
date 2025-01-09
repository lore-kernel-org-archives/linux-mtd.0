Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AC6E77199
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W/OXPg52GK+Gx/k2hwU3xPgKkxOh+axdjXHB9WRvJ+M=; b=YV4veSRdN5h+eP
	Q541fVARTNIBL+pR2xAwh925Su1E4dHejQj0RvEX4nteox525CHcAMZr6ClE9+qLAkKX1qetSD6kG
	GfLsjNdyz6mhZ8zRylUX+IDQVjsCVIuOh97NPbsvA0BUh3b7sZjA0IWNf4IH3VvEgTPzHdfl/EZ4W
	MzeVk/i9pdYj4IM2CqUe6FRu4ujhISniWAZ3ATcCmywMBP5hdc9di0QkgfE2j4c8RmrWyp2kyedJq
	+yTvElNRO7E+8JRLd/rE2RcUuZ3SlPUJ+1C8cd2Rf+1hJGl6kkAYvfUbexj5lvkxZoKRVLD2/73Ut
	uY7eEE9Hh2Ojcqv/T9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVnNh-0000000B6YK-3cQz;
	Thu, 09 Jan 2025 07:55:05 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVnNB-0000000B6Pn-2LbA
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 07:54:35 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30229d5b21cso5357371fa.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2025 23:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736409271; x=1737014071; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8V4crV2FeWRfveitKpJ63XibO/TLrojs3TWs8+SPtXk=;
        b=Ds2D/s+23wyeVvf8ZdIDtnjEYMUsDTojNy4Y8NcIII45ZD+5F1mh1gpWelglGUAo/y
         LWmn3Ib3yzu7NfWvwPiLDr46rn8r208PA1mvbHUTmHH4+bUpuaXHHqAqUfiWwjnYvQKh
         IejHCVPxEslnP3tSGwFrkRyZP1guCkeBPNKWgMHFCo65YS9/DKteO6H3tBUZR8foqj/W
         ZYmLm5PmRkeb1fq5gnqFVi9saPuhHbRZiEGnSdBFpg7U+rciyi3bN6i6C5bpee7TrWRi
         7E6xCzcL+1fR+76TI7xUwiNJwkLoH8NIGdAybjuOr+5SV2MCq/YGuKC0RDs4B8pHF3ya
         I+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736409271; x=1737014071;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8V4crV2FeWRfveitKpJ63XibO/TLrojs3TWs8+SPtXk=;
        b=do4Ru96goAT9JjG3FvAYXNv1PglmG6pNQFBL3NSqxzdTrPDAxGVYRF8p8VmHjKwMmp
         daYmb8bHs1Y+2B36YrkSy+HpkSYyGJpvao/VF8ql0PNWLzwkZLLPYTleB+2YXGNfPZfH
         nlEnUTHHFWEq4MuuJTQFxJUy3C63aLm5+kRsx8+59MuG/QLx+vXq3VXgkM8FEz7onI5+
         MsI+ffjTx3ATZ75+xBFeRjaIdwzDSli+YjvvywEDGq46S7Op6ZqZdG8oofhAgiIyL+YK
         HXL44EnaMT9YLlYO9Y39eDm5gzj+5IyRNRqOAuzDUdqjfvnX4vUofUc0QZrdgpw9A/aj
         XYiA==
X-Gm-Message-State: AOJu0YzyDQt2s4Guct9jO2VlAmW6hKVogw54041wLqFEdYDjVCJIVTlf
	rs6n3R+QYKZsjPxF4oDBa6KwUz6SyGUAbcnamxD9VJ2OKaYUThF5
X-Gm-Gg: ASbGncts3LdKNi46D9sH4iY6UeoOZ9bU/6w4TD+9qIpwlgNAE1lpH6XfSsal4tbYxcP
	qtz4pBpdzmfGRoMhUvZU2Swwred4HrkoRQ1mTEMrO1XgFq8Kniwq82OmnooQ6bq8P9DTPo1Kp7w
	oKzXwj6wVP5Nj9V6viDamDanrZF8XHILeSfJkDqbA/0Niw16VdAk3NKtckwUF01SX6VU307HdBE
	QweyzqxcZqlusDVACiVgHCj1uCyBU07XYH2OvYillcI9zdrLwfjEOiHegMEkyGQG6mMXeTbB0n8
	dw53QIOTn3taLfBjYGRq5lz4bQ==
X-Google-Smtp-Source: AGHT+IH5z3Xpigl2EfMVodGcxZpLyeffhttGD26F/U84usfTRlkz8O6vjYHadTbndFGsc9jDImeejA==
X-Received: by 2002:a05:651c:501:b0:305:d86a:4f01 with SMTP id 38308e7fff4ca-305f45db5d9mr14749801fa.31.1736409270899;
        Wed, 08 Jan 2025 23:54:30 -0800 (PST)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ebb63sm1128391fa.96.2025.01.08.23.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:54:29 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 09 Jan 2025 08:54:18 +0100
Subject: [PATCH] mtd: rawnand: davinci: add ROM supported OOB layout
MIME-Version: 1.0
Message-Id: <20250109-davinci-nand-v1-1-d5b3cc305143@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKmAf2cC/x3MQQqAIBBA0avIrBPUaGFXiRaTjjWbKRQkEO+et
 HyL/xsUykwFVtUgU+XCtwzYSUG4UE7SHIfBGbcYa7yOWFkCa0GJOnhymFxKMx4wkidT4vffbXv
 vH3iVhAdeAAAA
X-Change-ID: 20250109-davinci-nand-c9e2af2ff3ab
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@combitech.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3052;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=7wtVSdDhd9RCbheH5qAQfpjpLNHqvdb68FH8XOizzf8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnf4CuU6mlBZudKUeuHm6XJupTA6e72JBGqioQM
 WsQ8qLybSKJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ3+ArgAKCRCIgE5vWV1S
 MvYIEACARwCEwh6ecW1tRRev+hpYjiYBKCAwKvgUqadahrltf2fBcgiul+LO2JkelBSZw4UeCJa
 DLIumMyDE/egJXZchGSZZb9HQVW7jt2axsSuaagjy95YIXYi2m7TrRrEZivtqPKINBGOjW4Dr1y
 ngh7jputcNJLK5M0301n6h3uAbkgbq0g/tLDVbWIrOKUttYnLXZSZFM4gnbNoDowKCSayVWb7Uz
 G0++ybtXZu4TLSXkmhu9wQ1PLHS0Aw+moMxg84HSp7HphZcPAuiHi8etWji6IViUQq/SCI6P1Fx
 2IIDFWdPgpF2cZ6gEZkGg6yX59yGzeg35+K7BJw1VU84x9mUV0DQ/6W5oNIJlWdfo974Po1ldDs
 AnERFeEYUWFYVN4gGaX2OoW1ze2RFoRuykOAw0KbEb2APzV4ZaTlpUF/4s6jt46hTVdYteBz+vZ
 3iD5PrsDizG7WAdc1zcXYDiBcboMDftC6tABxihj3JS0HM2YjubCErWDeMcyg3gvsq7duiCTGaD
 eBMRznzlsp55LPwrMmvKtKTCU+jUXsC9AcKGuzixnket5wVYNFfRwCOWnO0Fni62BGkMBIWBCox
 dqddf9oO+r25by0Ci4xnfCHOrYMmHpTLzH//zroG0x5aa32/eAG/kMjWf4tXYD52mWL/SuPXype
 6h1lQKu9r5KPBFQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_235433_648644_970933EF 
X-CRM114-Status: GOOD (  16.24  )
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

From: Marcus Folkesson <marcus.folkesson@combitech.com>

Add support for the OOB layout used by the ROM bootloader.
The same layout is used by both Keystone [1] and OMAPL138/DA850 [2]
which currently is the only users of davinci-nand.

Only select this layout if the `nand-is-boot-medium` property is set.
This to avoid breaking any existing devices out there.

[1] https://www.ti.com/lit/ug/spruhj3/spruhj3.pdf
[2] https://www.ti.com/lit/an/sprab41f/sprab41f.pdf

Signed-off-by: Marcus Folkesson <marcus.folkesson@combitech.com>
---
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 45 +++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 1f8354acfb50b2f4d155cdfc03afcf2863539f66..09119a8db0210cb14236dd2f8872c18fcb9be7d8 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -479,6 +479,44 @@ static const struct mtd_ooblayout_ops hwecc4_small_ooblayout_ops = {
 	.free = hwecc4_ooblayout_small_free,
 };
 
+static int hwecc4_ooblayout_large_ecc(struct mtd_info *mtd, int section,
+				       struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
+	int nregions = total_ecc_bytes / 10; /* 10 bytes per chunk */
+
+	if (section >= nregions)
+		return -ERANGE;
+
+	oobregion->offset = (section * 16) + 6;
+	oobregion->length = 10;
+
+	return 0;
+}
+
+static int hwecc4_ooblayout_large_free(struct mtd_info *mtd, int section,
+				       struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
+	int nregions = total_ecc_bytes / 10; /* 10 bytes per chunk */
+
+	/* First region is used for BBT */
+	if (section >= (nregions - 1))
+		return -ERANGE;
+
+	oobregion->offset = ((section + 1) * 16);
+	oobregion->length = 6;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops hwecc4_large_ooblayout_ops = {
+	.ecc = hwecc4_ooblayout_large_ecc,
+	.free = hwecc4_ooblayout_large_free,
+};
+
 #if defined(CONFIG_OF)
 static const struct of_device_id davinci_nand_of_match[] = {
 	{.compatible = "ti,davinci-nand", },
@@ -638,9 +676,12 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 				mtd_set_ooblayout(mtd,
 						  &hwecc4_small_ooblayout_ops);
 			} else if (chunks == 4 || chunks == 8) {
-				mtd_set_ooblayout(mtd,
-						  nand_get_large_page_ooblayout());
 				chip->ecc.read_page = nand_read_page_hwecc_oob_first;
+
+				if (chip->options & NAND_IS_BOOT_MEDIUM)
+					mtd_set_ooblayout(mtd, &hwecc4_large_ooblayout_ops);
+				else
+					mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
 			} else {
 				return -EIO;
 			}

---
base-commit: eea6e4b4dfb8859446177c32961c96726d0117be
change-id: 20250109-davinci-nand-c9e2af2ff3ab

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
