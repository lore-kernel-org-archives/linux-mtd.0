Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51238C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnD+A88wh7y44dGc/U3kzid24pOQHMLlg6dL3iMGVv0=; b=dvIYZcN1cMjbBR
	foU/+5kNC8FeNRQOv+E7Sz3lY1++vl01DH3lZnEPFS5KsAG2BJJ7t3trVNc4fWfD53jp7cjg6Iz0k
	+dosgHf8sq87+rcXkw+AYoddkfqefwrBNgocgyomwqsJp3DRMHMfFHqyRg1/5u1Wn8Wuajwf3GWpb
	bS7B4Fz8H2hqtVexBwTCy8UIQ2WKKOeotZQG/zVyOCmAtSNACFX3SLPAduE5MAXzTcEPF8+ISlGoG
	LtIr9RQb+4rq5B/euHNawJHkvOUtVY7HVu1mBNU3PI8Qbl5jXeLkQzraDRCo2+MxIJapLpS4IgLWK
	WrF175p04OBsD6hpbW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyeQG-008vLP-8z; Tue, 07 Jun 2022 18:59:24 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyeQD-008vJv-9H
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 18:59:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id o10so24175102edi.1
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DyxnsHEPQy+18RrjM3//AhUgPcQ0kT0sI745Z4VAeJE=;
        b=H3q85wc4yg44sgfztaKVLAPpzMow7sVm1AK8o0FhZsr6rujiHr/Gok2OsIcl/LHSGj
         kCQEF0bisZ/0ftAzthkfeuynaCdx4n27x1Ce5VNyIld4yXg5xC4L2NFa4PtsmEoTwa7v
         gEHM4ZEXlb1dJC7bb31mF0F303G5fexgexGyTaySj0cngeG/x8+hepbgIGfdxGDYdMyS
         y7OPYhDpJZQ9E7yUXoLqAqu0hqjlbeA1PBO7/cYTy+EL0SCt/3I7EKi0BnRpxuT3NZs8
         YwOOlDQ8RvwOWn+tBzIfnC8rYxq8scwu47Amo8yLkJ0dplgGxQu7XuvlOgjG5GxZ9pUV
         9jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DyxnsHEPQy+18RrjM3//AhUgPcQ0kT0sI745Z4VAeJE=;
        b=PtTvBCuamHtqk9BWyrap2WeyjwiSBlGnTy1+OWHr4YtFj90bArh7xiwPPnWGa4/3nw
         wJxDYGN36B+OjfMkzHUd0/8eJW0Un9ho4yj6RawYdbjAdo1F8A56cHQSO1wEApwIyfjn
         KRhMGPcc2edIeU3NZXlGiVgXtva/D5IbrTl/nmRwAIIvmnzrI5hkUaE3xBLn64RlEOv6
         dzKWeV/k39eKzP0ucpwJ2B999eKkBzy36mk72gXOdX+pg8fvnpJJijFVgdUmbJ3fFdMb
         5QM/uhyKjvhYKfbLHVBsIAKk2JhnM/nCbUwvoy8B2D/WP0ZozPrB4+OfyGITAu9+QMOl
         xArA==
X-Gm-Message-State: AOAM533uHc0wFyHGtx0syENNOH5lXAXTgMLRepUr0SEMRisRZf4lTFLO
	eh5wYvlTHz0KQ2BhdWxQqKwkF8whLCo=
X-Google-Smtp-Source: ABdhPJzjRVrt1zfL99KtMWNIkhtBabo4UvKOmvw75xuwW7g2c6o4hFLrTjfQjlYd8UGBTqli8rC+Gg==
X-Received: by 2002:a05:6402:3514:b0:42f:dd01:922 with SMTP id b20-20020a056402351400b0042fdd010922mr23010389edd.324.1654628358988;
        Tue, 07 Jun 2022 11:59:18 -0700 (PDT)
Received: from debian64.daheim (p5b0d7c72.dip0.t-ipconnect.de. [91.13.124.114])
        by smtp.gmail.com with ESMTPSA id d20-20020aa7ce14000000b0042dd4ccccf5sm10747484edv.82.2022.06.07.11.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:59:18 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.95)
	(envelope-from <chunkeey@gmail.com>)
	id 1nyeQA-004Ogh-4e;
	Tue, 07 Jun 2022 20:59:18 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: dev@aboehler.at,
	miquel.raynal@bootlin.com
Subject: [PATCH v2] Revert "mtd: rawnand: add support for Toshiba TC58NVG0S3HTA00 NAND flash"
Date: Tue,  7 Jun 2022 20:59:18 +0200
Message-Id: <20220607185918.1048204-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607081342.174b9584@xps-13>
References: <20220607081342.174b9584@xps-13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_115921_367348_A60073FE 
X-CRM114-Status: GOOD (  16.43  )
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

This reverts commit 3380557fc7e28d9bce7607e16d98f123d36da4ca.

It turned out this "4-byte" ID might have been an honest mistake.
Regrettably, the chip Andreas has might be a counterfeit or is
damaged in some other way and shouldn't have ended up in a router.

Andreas reported his chip is returning just four bytes:
"98 f1 80 15 00 00 00 00".

However, according to Kioxia/Toshiba's datasheet, there should
have been at least another byte that would have contained the
correct OOB size that Andreas needed.

Miquel and Andreas are both favoring reverting the patch over
further, possibly hacky modifications:
"[Reverting] is the safest option here. Apart from this device, we
do not know how many devices have these damaged/counterfeit chips.
If it is just a couple and only on Fritzboxes, as suggested in the
Github issue the patch could be carried through OpenWrt[...]"

Thanks to several users on the openwrt forum and github issue,
who stayed along for the ride:
 - Peter-vdL for reporting the issue and testing patches.
 - neg2led and Hannu Nyman who did all the
   datasheet digging and debugging.

Cc: Andreas Boehler <dev@aboehler.at>
Suggested-by: Andreas Boehler <dev@aboehler.at>
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://github.com/openwrt/openwrt/issues/9962
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

v1->v2
 - replaced the o-umlaut in Andreas' last name with "oe"
   <https://en.wikipedia.org/wiki/%C3%96>
   "In other languages that do not have the letter as part of
   the regular alphabet or in limited character sets such as
   ASCII, o-umlaut is frequently replaced with the digraph oe"
 - added note about why the revert option was taken
  (If the shout-out at the end is a problem, please just drop it
   then. I don't want to cause any privacy related stomage aches).
---
 drivers/mtd/nand/raw/nand_ids.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 88c2440b47d8..dacc5529b3df 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -29,9 +29,6 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"TC58NVG0S3E 1G 3.3V 8-bit",
 		{ .id = {0x98, 0xd1, 0x90, 0x15, 0x76, 0x14, 0x01, 0x00} },
 		  SZ_2K, SZ_128, SZ_128K, 0, 8, 64, NAND_ECC_INFO(1, SZ_512), },
-	{"TC58NVG0S3HTA00 1G 3.3V 8-bit",
-		{ .id = {0x98, 0xf1, 0x80, 0x15} },
-		  SZ_2K, SZ_128, SZ_128K, 0, 4, 128, NAND_ECC_INFO(8, SZ_512), },
 	{"TC58NVG2S0F 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08} },
 		  SZ_4K, SZ_512, SZ_256K, 0, 8, 224, NAND_ECC_INFO(4, SZ_512) },
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
