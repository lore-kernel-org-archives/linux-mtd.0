Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35497C79F9F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/DHB3EU7oI+QSXQVmOLXTokTJg87EtkkKIeisXgXCBE=; b=ZEY46gc+axHLSk
	rIa/4EGECZxBfqEIb/JC09Hmp5l1+A+wg+GPJQzrl407hMZ288OqIlrrBwqRMRpVYSxSlDftUoKzc
	wDg+qBX7vvBmyYpPO4AfYmtvd8RSQ7kUueY+Hb/nPZOJOccHyAgYM8Qcrgn1CRTU2tLkIR/LTjhkO
	+Cj+KfFuA4z+EXEYg6s2yNUlW5EF4U6YYJ+Fn0Q+iWMsZmRIRteVmy93yR99vPFS/6DUow8RGBLtd
	WYfMy0CXZGTJcmFakDLA0FWk4qusphekdTXIXK9U2K5FLaOAnS7H2LpJOIiIIchf8A9b6F5RR79tE
	LOFChhFo2qH50uWKUcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4h6J-0000000EsNJ-3Zn7;
	Thu, 10 Sep 2026 15:54:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4h6I-0000000EsMx-3TX1
	for linux-mtd@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jl7790YgbMBOjnlOoriMqH8m/WMLfDdz/gkAjzom5pk=; b=R1YIT8lMnK9QF8w5QClJ9zJ0rW
	9JvKYxNPDeRBdu2KTrZAD6EsOTSG7qyZhSU99c96hDv8tfLPkFhLuR6fg2qgZGEGQTTWu2bRer/7I
	Isgv1+tlUO5Shjex2ZMsPNHXvKL7SBiJ8WLZk+JLjhy3EgdJgs0lnQgfrn8kn1wE1cU7KoZSJKGUl
	fJYi1w+BFioQFHHUaVQdSR73CG/ridl2B2pcHPpNDUnA6pYR7ZJuTr/s8Gi6IzhLYp+0IKWDbBMSc
	74Ae2iEd310F0BYVpTf+t/gEH9PN9Hn9a1sczbKqOfjcLcYriEZ624EegvpQCe4xy3CTOknNrDdD9
	ucnkv6yw==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4h6G-00000002hrd-0QUN
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 15:54:09 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1166632a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2026 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789055645; x=1789660445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jl7790YgbMBOjnlOoriMqH8m/WMLfDdz/gkAjzom5pk=;
        b=Ad4rISXZTyvNR0cfDTRb/KYEqwdlVN249TeA+Cu1m3BFzU+k4uv5biNCpkf5w1il7U
         Fem7bcnfQprgamjGPvzt1SnXgXfkYM5PFjXp85MtkZ552AC5ACAPTd9rRF25mjn+Zot3
         6fI0T6Lu33uuwePT0HaVkz+FilaZs0sHztgXTPldQHSOkpHmie8vdPrned0mdcoQUKXv
         94Cde4y/JA8agLA7OMk2FFrxe8WoZ/kq3uIQcz9MKOA4/QXxDCfQ/tN1+OmupaJxGW3p
         3p+eyEJnakkKlpqnrO/AHp71n9tm1A6AoUqZ4MHKBLMUqrMbJuP6TT3Ucl3DFDexEK7R
         O4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789055645; x=1789660445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jl7790YgbMBOjnlOoriMqH8m/WMLfDdz/gkAjzom5pk=;
        b=r7jEICuw38IG5AOf7Vu9el/SA0FOSJDzgLuGBiGUuIro/Mc/5iA+F5gIK9ALdi7vj1
         EItdDHFq8dWIxwTKruV87AuzKSM0/4RFHABH1iw+XzudSpR7VTn6fu/oI0/CEfjwsxhv
         ZP8WFmgBOU9nLytNOdCikP706GPpev1mBL7FNEW14tig4Ra2XNnTKVXRB9taD3vAkww9
         3LsMvV0EcG7ESHMxvVcWfm5BXUL4Iy3pb0AZjoeXR2IMh7NVBsfLyAvIxfNTpd/pNMZ+
         sE2JLSwni53PlXz6X1oojEbZ1WldwwqGUAMP4fKtw3A8Dh49ry7r1ccLoltkhjJ1U1s5
         VOig==
X-Gm-Message-State: AFuF++msxV2U8WGDwtmfUinYyQSo4qwM8pUzGXiczqlVfWoWrlj+O228
	9a66q2QziUks/p6PkTc3/zIAfbcO5mlNode052yOJgmhvjYhBQcv5Mex8iR+ow==
X-Gm-Gg: AYBFou0OVyiVQ0Tv21Yhs1XaHS/JCoe494jOQJjZ+YZeeLd69Okx54alQFkChrHWf5W
	2wmNXOK/Lugm8ciMFt2lfoazy81miiZAMnxaYZmo8PsgmoEdFs0xzGteBKBWHmF9gcq8TQBp07W
	kKA6XzS0mo90cNUeS5BJGhFQVH2OvyntkD61okqTs3/Gzzrha/Ki590PBRW6oOrD54q8PMqHi2f
	ylnCkhxVtJY1lta/vDQzRHvJyhk8D6CdXbsMlsVMYIh/FdiNH6qmEPhV6PCwm1TipuDyP9dtHgU
	eowDrYnHRRoCI4aw+M4ue0F87BrEpeg7XbhiPpwyPo1WPD+gxAA6IrrIj7JHAcevVEWIyyoUwcO
	Cxwf6WSIB5c1T14ArMA3PiKynoViLqZ1lYrHgb+VV8xnxZyj+SohrcDE937tYiNrV3+Yb1v0k+F
	LpqINQ3VJ0j0zAMXMMvzF8lhlmOt5We1OIKPWjerOfa1Z7lZJS0Q1UDpeCneK8C1jSbpv9fbAD4
	CDNc922
X-Received: by 2002:a17:90b:3d81:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39d77d1752cmr6498826a91.30.1789055645401;
        Thu, 10 Sep 2026 08:54:05 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.196.141])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm64763657c88.5.2026.09.10.08.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:54:04 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH] mtd: spinand: Only touch the QE bit on chips that have one
Date: Thu, 10 Sep 2026 19:53:55 +0400
Message-Id: <20260910155355.3534491-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_165408_203923_5FA48CD3 
X-CRM114-Status: GOOD (  14.56  )
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

Since commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
steps in one single function") spinand_init_quad_enable() is called
unconditionally and clears bit 0 of the configuration register even on
chips without SPINAND_HAS_QE_BIT. On such chips that bit can have another
meaning: on the Winbond W25N02KV it is H-DIS (Hold Disable, default 1),
and clearing it enables the /HOLD function, after which erase and program
operations silently stop taking effect on MT7986 boards.

Only program the QE bit when the chip declares SPINAND_HAS_QE_BIT, as
before.

Fixes: be0b86c648bf ("mtd: spinand: Gather all the bus interface steps in one single function")
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 43bbe2629b85..9fc1512e4fe2 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1781,7 +1781,7 @@ static int spinand_detect(struct spinand_device *spinand)
 static int spinand_configure_chip(struct spinand_device *spinand)
 {
 	bool odtr = false, quad_enable = false;
-	int ret;
+	int ret = 0;
 
 	if (spinand->odtr_op_templates.read_cache &&
 	    spinand->odtr_op_templates.write_cache &&
@@ -1808,16 +1808,21 @@ static int spinand_configure_chip(struct spinand_device *spinand)
 	}
 
 try_ssdr:
+	/*
+	 * Only touch the QE bit on chips that actually have one. On other
+	 * chips bit 0 of the configuration register may have a different
+	 * meaning (e.g. H-DIS on the Winbond W25N02KV).
+	 */
 	if (spinand->flags & SPINAND_HAS_QE_BIT) {
 		if (spinand->ssdr_op_templates.read_cache->data.buswidth == 4 ||
 		    spinand->ssdr_op_templates.write_cache->data.buswidth == 4 ||
 		    spinand->ssdr_op_templates.update_cache->data.buswidth == 4)
 			quad_enable = true;
-	}
 
-	ret = spinand_init_quad_enable(spinand, quad_enable);
-	if (ret)
-		return ret;
+		ret = spinand_init_quad_enable(spinand, quad_enable);
+		if (ret)
+			return ret;
+	}
 
 	if (spinand->configure_chip) {
 		ret = spinand->configure_chip(spinand, SSDR);

base-commit: 21f027016b1290d13c30b198ae7a00e6b3d1d5a5
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
