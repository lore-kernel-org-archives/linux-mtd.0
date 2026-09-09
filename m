Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0634C79FB7
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 22:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iy+hq5mCjsjfBIkfHHE6aTIoeBvNEDbuAEsziBK0ub0=; b=qRHWCW5x/2y76J
	ffAfMVtlkk+C/zUGmz9ntzjriLWtZv1Z9JFyco4509QMXuxJXaaRoVz6+0cEUmcEPnjs/2EwnJbbb
	dJ3n9nZW+foceqiMNArorR9pimcnXBQdKhLba9n1r2YqErLQCAFu+vlCcrGta0yasr1SDBEhsOAL3
	sgAYM72A2vFdUkbKOvNAf9droWKdppkfBc51bJyqey12nVzBgDBLZOGC92LW2/y5iZEYQtr03qpHC
	8DnnavyYR/5cwEBIU2Gc73yc6hsY/MAMlEJCwYH/oFydXNVQL619JdOnqzWqnCj+3DmzhWmowAOSz
	o1dmKz8na/YowAcOydaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Qt4-0000000D1lE-07Zc;
	Wed, 09 Sep 2026 22:35:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Qt1-0000000D1kp-3woy
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 22:35:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d91ff7d9acso56218115ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 15:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788993323; x=1789598123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2mR7d/eCrXCqtnsUBaBZRSoRQmcpPDbLqLjlbgkBnc=;
        b=alO/JQ3caF6nZVji7tVojQhggYmymg3H/L4GWUgMGS62MrBbizGcY3lHU63lKTtFZc
         /RPAyiDvn2omiy7PV/9nZ7BZspwDTNPlatslSGAPY1usuOWxbV/Yowlqd3N5lhPab18A
         Zf+RA1WZiawu5QwS7ITIguAyhjvUgolWoYZeYhUKe4L8P18Q34CujzBYCxJFvEzT5gsX
         nudwZuxyJbmjkQ68DD2ykuceUhmBeWGbSi1/i0Qc1WuVXTfCWuxppuBhomphvJAkPNfj
         QFb6iWdAVRLZeydMGDI4kjOHRHdD2ccfl8wAI/1+lhucQl78k17VuOvdKQ5OQeMXaLbT
         4J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993323; x=1789598123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2mR7d/eCrXCqtnsUBaBZRSoRQmcpPDbLqLjlbgkBnc=;
        b=LsJj27uuyTsSvRHDvP+Z5Ed9B0YYPu8zuuhWHpPpZ63MVGpwuWypy93cgcW2I6DG1G
         SvPlBMsi/0c3qAJqY9fMMTbU+eGKSZaTeZrWKzvb9tG4/uoiLGsy4JSeCKsB8TJFpvuW
         Xx7ZbLjzyNfA8X8Q2y7FQb6MPUJwfnf0yQUafjaiPLu11P1OiUHOO6uC79IC7i7wAL0V
         bHS5OgyRPZH/q8FvPBJkFaoDCjd/erPVwawG2Y6EyVX7UPFFwIpd0XDsmyNhNQJE6I7o
         praxk6RcA++yBGHApssjbMIilos9+KjKuRkN7tixowSGnbd+2XgoM3qZ5sA6fKzNdAXr
         syew==
X-Gm-Message-State: AFuF++lKAP74dG7jJxeIUU6jkX82OgFkyLg0X7pUbvNHmBDyhbDoeT/l
	ah7+lUt9HnokxzBtJEr5OntVmLWaFc8Yi8UPtNlCzznZPpLK8CfR12B6DmCVWg==
X-Gm-Gg: AYBFou3W8tdnHGgmjzSCgZ9gnKWr450ibOrI6dXQPCJKOMxkrVDTz1+bAfoE7CTdwCB
	6xo+ejHEBOkvsBIjD4pReNJdL/RleFRqnF83/V3ddXufn+B0KvLmosP3XPAFMBL2fJt0NCIewoR
	d5ZncY74etrKKhiVGTKxCVdEU1pcOAaV8KUrBxv8ICda/IhuNwgGulk2SlJrkOVmNGWeO6LzB3k
	9M8obXl+5R6S2nC/OBla2KCxuIppxovo6iYNWRI6+g0E76tEGVzPtUIOcrTkSjVK0/OJQP0AZxL
	XEUgbkwo25JeDpsTRafuwOxoYhTad0fyYhbkf473sHJNqE0Ufl3TIi5z5jyc3a/wHHKdw4sLgJh
	GWbGAXxS2DRAGuVRwUt7VNXkml7xNFfZb2y7csDDi/SBadDk4SlG+Astq+gl13QC2Ab5V9q9tiY
	nDkH/XpiQYISbbwTJ/bts1g9jT84YgWcFfD+R6gQ7edMla20bqz2ZP8GwXXFxsabXdXE89OWNw+
	h8myehGDv8Mmhc2zfDmB7Zfz87b5f8Jc1b9l2BfQAHmW7y41uEzUfgCB9HENsXzucUoBAaBj6WN
	blEB8cBBR8FBeRhOHQ/xsV5ZRq5chDYxbtPLns0tEAdqRrYX
X-Received: by 2002:a17:902:7004:b0:2d8:d4d3:3fbc with SMTP id d9443c01a7336-2db12629346mr405572845ad.16.1788993322973;
        Wed, 09 Sep 2026 15:35:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497df04sm79247975ad.41.2026.09.09.15.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:35:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: ndfc: use devm_kasprintf for mtd name
Date: Wed,  9 Sep 2026 15:35:21 -0700
Message-ID: <20260909223521.67572-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_153524_002687_313730E7 
X-CRM114-Status: GOOD (  11.91  )
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

Convert the mtd->name allocation from kasprintf() plus a manual kfree()
in the error path and in ndfc_remove() to the managed
devm_kasprintf() helper. The name is now released automatically with
the device, removing the need for explicit cleanup.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d6db04d48c45..d7b119028a71 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -162,8 +162,8 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 		return -ENODEV;
 	nand_set_flash_node(chip, flash_np);
 
-	mtd->name = kasprintf(GFP_KERNEL, "%s.%pOFn", dev_name(&ndfc->ofdev->dev),
-			      flash_np);
+	mtd->name = devm_kasprintf(&ndfc->ofdev->dev, GFP_KERNEL, "%s.%pOFn",
+				   dev_name(&ndfc->ofdev->dev), flash_np);
 	if (!mtd->name) {
 		ret = -ENOMEM;
 		goto err;
@@ -177,8 +177,6 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 
 err:
 	of_node_put(flash_np);
-	if (ret)
-		kfree(mtd->name);
 	return ret;
 }
 
@@ -246,7 +244,6 @@ static void ndfc_remove(struct platform_device *ofdev)
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
 	nand_cleanup(chip);
-	kfree(mtd->name);
 }
 
 static const struct of_device_id ndfc_match[] = {
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
