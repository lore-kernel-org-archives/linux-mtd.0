Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D00CC88E40
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eupl2wNQE00LsAuY0FbvPMIJILrb519ch621480P9pc=; b=457jt9Vbic8rQL
	RZYT39au3+2tSuBGykqRZhOMl2OKIJrpODiOm1gT5VGvX9nHaedcSR+cPMTggWbi+ZU4jIzKf2DdE
	ln5ezsYo9zLO7Qi2QQ32zrTBzM57MQVYwB14w7DDHfMk2w32I66dAgPTqBXAaChNpeknrHKJLpG8T
	MQiI8caHiza1S+1xlUyYLZooOJwo6AHDlm/3hd40TkiN1MKr9JE3x1JnBYlzA7YYjvp3F1npLDQW/
	rYTv11JluisFz2wmJUUORi7tbbfHKgChBDbifpQlSfBsHvvSO3vgUIvmVNmRc0zvLkEEOFLf4KLFo
	nMlb2yWftobkyQipHeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTD-00000001MhX-2jwS;
	Sun, 13 Sep 2026 04:05:35 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSx-00000001MFQ-0nRu
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:21 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-46f415ce6deso1178459fac.2
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272318; x=1789877118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb1UAgJ8R3xqyuxnkYr/GKcQBuP99rDSmeFz/RErrU8=;
        b=hcVN53PFvG3/avzDX6kvBgqj3PvsQ5a6rmQiyra2dm1p1jnBNF0fIf0xVUSQAkRwpD
         7pYerR7tpQdqeqtlWQ++mkSOBZJrQwOAMkwOJHThJuaWiGL8KjeA0KM2iLwJydj1nQqk
         PGWpcFKRYfg8hhDqN4fmGCQhiVCMoLqSpz6hZTdczacGokSl8eX2SNMMkoq71fPnJsa+
         nleF5tO3tvfsdLeZCUZloL1fZEBhfrOuSN4aN2Fsu+KWMxSUcU8f/htiqG/eyslbr4Rc
         mH1qT+eT54IqA6wUCFS65jsDIk2ZhFLDgcToxo406hyEFdylUN+rDGhSPl2YpSKWRQSa
         w+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272318; x=1789877118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hb1UAgJ8R3xqyuxnkYr/GKcQBuP99rDSmeFz/RErrU8=;
        b=DqMbKJHMnhWpKhgHaS3tY/UFZh7wHSGEhz96hi6906YHQLYtyrbnkWFwVz0Vea8aQW
         JzNaUCqZ1iiMmdNpEs7c9mlcb4B0RZ4/QauvM0ynUaHz4J54pZDa8ziJjqJs/0U0wUJp
         2lQehrf3Ed8rju5DpokFwZrXQ9+N5gISvISkkYErfAgCQT5rkHbv+W+loiVJOc0CWcUT
         udkO2m7ypPWdKw4C3KThU993ltpnUY2TFYhM93IfZuFK8xGf2I1jLW4bDaQ99t7IL022
         XlAEFD0hdVSlJnEXdriQiuSyOXuY0cZ1mFTcjyHAzccVX3Ti9ESYf0u9ZyxhqhT9OJMy
         vwIQ==
X-Gm-Message-State: AFuF++nfA9wfUld8Ay55fqHV8MFBvClR9MQeAzFlcqTM0GaKHjyZudRx
	rs0D45S6K+0ps0Dl1cSyOzDs+SSzND5sS+zWrJ38xe1P3ms8ouxgBWPG
X-Gm-Gg: AYBFou3TUFwJEoZyxmttzE7UyBrGQ0Msr5oxQv4MqY0dbeujBnGNwvrEbBBFM7yEPXk
	DD31UuOEQdaGBMPT9HbUm8GR5vR2sfSz/8/bN4iUORmf6p/0zdbzivGA3rjWgmuVZVIlTBqKNPr
	ywNeuTs7iTncr977yqiPVrAloTFuRqWyA7hqCgkLu9heLcrVHZnkpEsha/ZHVWC/NtdLV4TMqzm
	UcDphWMgmZEKZzRMVZUke+tzpx3mO7dpVI8wkUPyAh/VYPbC5uIUcXXbxel++UB+LZInVU2k5c1
	MVgWgGx1yWfXUYbeqvtAzYnRJgRf/a8Pdu/oU2j77WW7cHu2oN1t1SGr/8c2kVsYeZ2p/UACrLf
	8oDNTu2kjSMbvqt4ihHCKTTA+J0g7s3l6WF5eEpWujA30be0g8uU70tDEW0AsUsv6OdUGRbkBTL
	iv75k2NmfOn27ePEYh4blnbTmh3eMPyq40J6nxCzphDsAmf1rjW3NJYTGszhkj7CJtCKZEDcKqt
	wVRgkvseVkbLew7Hq5vb3BYg3GNDNImX4B+nKAUoFXbZHJ3U/kJCE4OPiv8xsPyuw2QEuIMizuj
	uE0xGchyJLGlqSwGaX+nbOvPgT6ycvsfpn0Znrqow3A/G17U+VkgmGEeuGgVL3TEbx/Vd7XQiDx
	xUWg7Hc/6ueCZlPlQ5aAJYvPAxwiTiHDzzg0zO1tD
X-Received: by 2002:a05:6870:8306:b0:469:fb51:b351 with SMTP id 586e51a60fabf-47de8fd0c3fmr7839424fac.17.1789272317809;
        Sat, 12 Sep 2026 21:05:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:58 -0600
Subject: [PATCH v4 07/17] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-7-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210519_275966_02690211 
X-CRM114-Status: GOOD (  12.89  )
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

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 72b79f893e29..41d6560d7df7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1843,15 +1843,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
