Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E287C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFzX7zuGs4qLmfwfJW60rx8byiAfk05aax8vRWtGyZo=; b=tOojELap7tfYO5
	GwDGh/a/JD1zYOqD16xIHLC0y8heItEXL+P97DKSuRgFKawVOrxmUYvqo6MGIHGQZ2OY0o49u7RPR
	JAYcHz2W3n7+JI+cO229MPOmz6kTSvUR01QM52ML14x67BHWNyAlVxhFZEwOjmVg9Il2Cu5lVBJ/t
	8OlQAWTdcAhu859byn6n8nJqsAPT7U8cWIDzYgFdD5xb7OQzM7uU0L1q5lRiB2VMIeLzMcQbF5TQ0
	HMHrWeo+iSYLbYZ35dsClhiDSsEA3h6B9FZLquGAv2jquQPumvivCyMei1ykBas0skfNXwR1+fHl2
	dzKy4ROXtou902M+eZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxY-00000002DYN-3XjL;
	Mon, 14 Sep 2026 03:02:20 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxF-00000002CyA-3f2k
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:02:07 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-8050801d337so1103290a34.2
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354921; x=1789959721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=kqrXGvk3se7ZX8mPprMjO1v7+EZDPTkeYTNCy4iFFH9DdiHct8NAOEnAHnTQfnaJ++
         rrSz55pbivEAZkjJWmb2nBX4j/GMQteADCg0BSSNZEoiC3vWHuUSZndJE74sbnmoX9w5
         DZVNb6YIMUnWqwiHjMa8ds/HmWP0u0g/PChhDm3EhOyWxJvGSWTUu2/4ikQOM0deoKUS
         t72E5yBUXyvZCK6BTqft+zMOZk6BpJYbD8z4JcO4gpdGT90WEFUq+Wu1vfQigGJNXlnB
         ktxEZfncG0zSp2qBEnSpy304h9mGUQZ+ImGDHCPVX2vb8oqBta0GPKlee6HJVccrF38A
         pjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354921; x=1789959721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=Vfqq/XNj+NqMMrNN33eJI0Eds8UJPQw164uY5MhjCfTUIQCVFX7LDp2JQw5N/kAUQZ
         +cJgANiJzVZzCLTdS8EGXKDn0Ug3mDrZIgk3oZWkbpfEqG5PfSZRaSEc6EAKbLjzjQ++
         ZL4dHXheFKYltWxCgXrs9Bpg2MDJsWEOc+RoAa21mWyaHKnrEtkDBjZDBmESuTpX+toL
         Gp84PZVSpdkfxgsrT7oxQBgBgIViAsN/DKhxxTmlrgXZy9emnspPQQka/BWoSaZOnIFY
         8w0+yo155gljn5lS+ulFPo/y2vCdDPLtf0Xs7pVhN6J0JXtw5OVHRcv98ihJH3B+/NND
         0Bzw==
X-Gm-Message-State: AFuF++khGsaQyKf01tpTF+M98vTj9aqweubXeTajWxi5gzBWmInYbIGE
	BPaixDoi5DNRQ08notddQn5ykMjhuGA4tJUMzsVJUiYXgYE5JT+A7IdR
X-Gm-Gg: AYBFou1ZTFaBWbnh2JwHCSr3qUiKPGi3y7OXs5xnrgw1WUspN9HCza26nQlQ7wOFzu+
	xRhfuLeXYuLptFNUjGOxt6dQsJ/CARIkLJal/IIAEbul9eB9z2T7/wuuB+0TL+F9LS/ZPxkvm/M
	3iRAI7bd+9aIIRIUvR8b/mmPSnAat4LmPMsi8rfprHV+2i9bQIe6QfONdPjtjXwrP4PNaJdZIh2
	M//24IGslYQGULFQv2Msh6spywW+II/MhZ3W4X0vtuteWuHHNO/qyMIa+VzToI94dqKnNyn+jM7
	EeG0o1e2ckJJzzy8nSoalEUQhS3/OyNG1XxyhwA1UTnKe3CX2AihF441BddLtpM9ZPM+CIjvtqC
	LUmACb14jxbhAc8+SKO6kODKbGX0u4YYD7Ebgc8RQsro4zDydbKzoX02p0/0gT/XrSatsJtlOYD
	QRl0nNXFgt3lzXdFfT+BsVeZTDL2a80NFZxLzJ5NbO1zU4lh8Ix/BF5D5V582gJ08iUJPocSIpZ
	dBQMaDYjbYaB/UUybsTDsu1Aa8A62KPhxt8K+sOHr5xANx4298rYIy75b8EKH3cEs+JavzGLAFH
	klCB+IUTMgyNMi4U5XByoRYv8/gt171vN9xtfWUZdGsUMRW62SCyYXY9nvf/rB3eQG44KSDJ1vt
	W4wJnAF3mre4wglMXVypt2Obx0YHV/w==
X-Received: by 2002:a05:6830:81fb:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-80897097a7cmr492616a34.2.1789354920841;
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:21 -0600
Subject: [PATCH v5 15/18] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-15-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200202_183624_8A878C13 
X-CRM114-Status: GOOD (  16.31  )
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3fb61a10a441..b7ac8d7b0301 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1421,14 +1421,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, ecc->bytes);
+					    nand->oob_poi + off, len);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1439,10 +1453,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, len);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
