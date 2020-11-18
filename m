Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2587C56201
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:26:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71506246B0
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 18:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lz10+qhB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uzvyO82l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71506246B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g86/gmM6Eo8JGsOMcXBf99t1drVcMlIjCWL61NAzsIA=; b=lz10+qhBjQMtYDRS6SdEnA0P8
	/iPN0Q04ibMzb7rTdJYaqREh43o9M3caVgXuDg8dDmCyr1Hk7BCV+9tIytDvR9muSFXMbqtO39Uh/
	griagVA2Xbf0URVUWeIi8Zc+uHo90AH3sbrUnvtdTF0X/7O2Z7OOyfwhuKo/yuCLmjo8ZqaQgDex2
	eqeTpPTXcgcirAz6obxF/wNCBLEh2AH5vra4NjYEXBRkMkpa0V2tKfJftc8YbaGD7KZpDrsRSJBX4
	ptcnRqt0+QTwJg4XqvCAav21McHABFF6/jsb9p0SxIOJJHy7nbBio/rQFh+/6+2/IhRVyY9/Atyhn
	ZTaRtMK3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfS8s-0000Op-9m; Wed, 18 Nov 2020 18:25:18 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfS8l-0000Mm-1b
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 18:25:13 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AIIP5gc027610;
 Wed, 18 Nov 2020 12:25:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605723906;
 bh=zSk2OmwjXqRIgo7+aCQ6LTl6i2h5xxN0VQcRF07W/2Q=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=uzvyO82lukuxYX269bQFjETA/R7dR3MLDPiLrINTQTv5Q/9oZmmGsdzCK3ALR0BhG
 ROrvJ3PozfghZ0L+s6DfhAGMDueNh1rwbB+9GodwEyePgT2L7aI2RNF1rkrT0ZtQbX
 n5xI8I68O60fUCrnc9BdqPbUNPG7RhrCeQde4QKw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AIIP5da000696
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 12:25:05 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 18
 Nov 2020 12:25:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 18 Nov 2020 12:25:05 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AIIP0Dv022682;
 Wed, 18 Nov 2020 12:25:03 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] UBI: Do not zero out EC and VID on ECC-ed NOR flashes
Date: Wed, 18 Nov 2020 23:54:57 +0530
Message-ID: <20201118182459.18197-2-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118182459.18197-1-p.yadav@ti.com>
References: <20201118182459.18197-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_132511_215152_72CD8372 
X-CRM114-Status: GOOD (  18.42  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For NOR flashes EC and VID are zeroed out before an erase is issued to
make sure UBI does not mistakenly treat the PEB as used and associate it
with an LEB.

But on some flashes, like the Cypress Semper S28 SPI NOR flash family,
multi-pass page programming is not allowed on the default ECC scheme.
This means zeroing out these magic numbers will result in the flash
throwing a page programming error.

Do not zero out EC and VID for such flashes. A writesize > 1 is an
indication of an ECC-ed flash.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

Notes:
    Changes in v2:
    
    - Use mtd->writesize to check if multi-pass programming can be done
      instead of using MTD_NO_MULTI_PASS_WRITE.
    - Remove the assertion that a NOR flash most have writesize of 1.

 drivers/mtd/ubi/build.c | 4 +---
 drivers/mtd/ubi/io.c    | 9 ++++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index e85b04e9716b..25fd7816b1f4 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -628,10 +628,8 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 		ubi->bad_peb_limit = get_bad_peb_limit(ubi, max_beb_per1024);
 	}
 
-	if (ubi->mtd->type == MTD_NORFLASH) {
-		ubi_assert(ubi->mtd->writesize == 1);
+	if (ubi->mtd->type == MTD_NORFLASH)
 		ubi->nor_flash = 1;
-	}
 
 	ubi->min_io_size = ubi->mtd->writesize;
 	ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 14d890b00d2c..2f3312c31e51 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -535,7 +535,14 @@ int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
 		return -EROFS;
 	}
 
-	if (ubi->nor_flash) {
+	/*
+	 * If the flash is ECC-ed then we have to erase the ECC block before we
+	 * can write to it. But the write is in preparation to an erase in the
+	 * first place. This means we cannot zero out EC and VID before the
+	 * erase and we just have to hope the flash starts erasing from the
+	 * start of the page.
+	 */
+	if (ubi->nor_flash && ubi->mtd->writesize == 1) {
 		err = nor_erase_prepare(ubi, pnum);
 		if (err)
 			return err;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
