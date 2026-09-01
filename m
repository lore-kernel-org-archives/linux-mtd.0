Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD15CC61DD3
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J38f5y+voTiyDgjckDRzydL/IESwVqjaRkHOUq+RXCc=; b=n08SXLONPny0Wl
	h1JWWzkxDsT1+f6v4xIcYGTVeZLv5S48YwCLnBt4uARP8UKHqWEIWgWLzFJaEpBoSrYnDthjhcudf
	l2+Y4xziCKp8R1/iuoQAlSolxTo7u7zi+Zd/UMuLdjqG6l/KaNYgH3rAFHOFSEqKVfyhwa188AfxR
	bKEm83BxK0dRSq9RrGJGKfw5FklQ6ULqenEtwCopoRraUgoIpgmFJ7m/gMO9xbtkCkpM8j/9PXMau
	ByRdDFJT+w4/w+EKf2DXmkTTnSaTOcZskFe3hbcqCmpGMemI7WYDgo2hTqTQxVCgUKC3cEX3KR3kq
	+w7CffISMvxDmKBJXU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1J5O-0000000B90a-3nTl;
	Tue, 01 Sep 2026 07:39:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1J5M-0000000B8zF-2hDp
	for linux-mtd@lists.infradead.org;
	Tue, 01 Sep 2026 07:39:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso392948f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2026 00:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248351; x=1788853151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uf8LcBflWgrQbjztzyHrlB9MgJL24SoJuvS1BisUWl0=;
        b=KqSQKfEf6ftFHgbwyPXz+xiVbFib3Th4njH3pEp0q4rYE8qsBYWQj/Fajil0I+hQ/G
         anTjJb5YtFfMby1oy6mF7jotLj4qvMPusyo3vKm2HvFNZjb+WIepnZdkTSII80ADwti2
         LAf9fmYpwR6ytYZUBH32qSrqafxjLFVKFnAdylEb+9yvmv3Iw5zcufuFokkrAVuFZ97B
         dR9oQNjxDyq4+ox6qq6SToHriQznUKgNUQqEzPr1ZoELoXoTmh9e9+6ywKcXBehPE6Ra
         OqSXXxrUhYgKyh8X0dsTssfSdy/wY9MWA86VWNyuyovoCd9E1IWpvmhaliqNHZPBtYiR
         e7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248351; x=1788853151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uf8LcBflWgrQbjztzyHrlB9MgJL24SoJuvS1BisUWl0=;
        b=D44CBJo5V4mNRwlkIfzIojgb33i/Ul3JKq28AjvMRD5qSVtzPZgJA42DMrGZ/ZgR8t
         AyPisDp+Ut+oLnLRDhzD2Z0gLIctjm3Grs7jOop5izLlak87xqduT9BWgLO94Hi9oj4P
         fZ83fUif59LnwDpZ9NK0nep8QDpwYqlw5xt/R6OOYY2avOiCGMI5JLTiTmPBv+YPMpwb
         OIJszGr99pYB1H9mjkSpzCsmdHL7jKGlCtVAaNbNkEUzqeooC11YizrdTKSR/vJdeKwK
         Kz0kC9PlhVCjjWhKYYeqyrmPKm3Yt6EbvjXJXQe89y1eDGJSk26edFhnRxLnYzmcjspJ
         Jc2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwOTTviuHSYsZfMj8/wfm2p381eSFtyTv2qzgo05lWXxCRUK7Lbi+bUZhW08NfXnPkgwiRPvGpSqR0=@lists.infradead.org
X-Gm-Message-State: AFuF++nYfJMmtyKwas86DTlVwGZWSHj9e0Gv83fpEID4QtkAhcv1Q5S8
	KqvxHFBVNJax1MZJOaRel6kQepUrU752r41IcegM9CMmT1TXP4vdan6b
X-Gm-Gg: AYBFou3OdLPkCnPcyv2y9N92SrYLPfw7+PUs4cz1VVZqpVWNpZc5fJ+LgmnHVOCv6xI
	PEZqSUXsf4dmhYyIoEfqMfmf/Ua0U3IyWh0Nzcr6NhqMXOQMm6zmIrG5NYrWyH3NRV/lJHeoOyM
	n1J9FHQXdFcnxrq/BgqnBQjqEiF8WljSEajiohwso5HpTA33QhehhkmpBn91H1kWdOkqHyYPefr
	4/8u/GuQ67J9rZmlVeewCr1MQRCke/jpc6wAobgQmiAdtDSuOG05BKPzFCfxd4fREXQHUnYD8T2
	LWHZ7RAUGNBLoA0XFA37Iu7SLq3x1Jz9qLuJi39DOACN2QXo0n84EelUNeGcRxqkFygPS48AW1w
	MNQg9stT55K9u0Zk77lYAnicO5vsdvuFL5tqbbdstgp9w1RHGsKZUQp6RTH50PkR8LMQxFBWGyg
	jFRXj2zize2e77oU+QdZtrA7yh/qupHJ3KdAI97BKssMDhKVDJ4FKmCF29T9j9nA/Dyg==
X-Received: by 2002:a05:6000:22c9:b0:482:f2c1:c721 with SMTP id ffacd0b85a97d-482f798962cmr49380335f8f.5.1788248350669;
        Tue, 01 Sep 2026 00:39:10 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c460sm3014790f8f.13.2026.09.01.00.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:39:10 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Edward Karpicz <webmaster@toradex.com>
Subject: [PATCH v3 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
Date: Tue,  1 Sep 2026 09:39:07 +0200
Message-ID: <20260901073907.2443698-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260901073907.2443698-1-mehmet.fide@gmail.com>
References: <20260901073907.2443698-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_003912_708082_59A223FE 
X-CRM114-Status: GOOD (  22.70  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When the ECC engine fails to decode a page, the driver re-reads the OOB
area with the engine bypassed, but runs the erased-page check for the
data area on the buffer left in the controller SRAM by the failed
transfer.

That buffer does not hold what is on the flash: the failing engine
writes a bogus single-bit "correction" into it. In the 60-byte ECC mode
the all-0xff content of an erased page always decodes to the same error
location, so every erased page shows one stale zero bit at data offset
0x5FD, which the erased-page check then reports as a corrected bitflip.

Edward Karpicz discovered this behaviour and identified the offset on a
Colibri VF61; the analysis and the fix build on his finding. Measured
with an instrumented driver on a Colibri VF50 (MX30LF1G18AC, 32-bit
ECC): reading a 126 MiB partition with nanddump increased the corrected
counter by 18035, exactly one per erased page, while raw reads of the
same pages return clean 0xff. A v4.4 kernel on the VF61 (MX30LF4G28AC)
accumulates the same false counts, so the behaviour follows the
controller rather than the chip or the driver generation. Neither the
Vybrid reference manual nor the published mask set errata (VFXXX_2N02G)
document it. The 45-byte ECC mode is not affected.

Restoring the known byte is not enough: on pages that fail to decode
with content other than all-0xff the engine writes its correction
wherever the syndrome points (measured at a different offset on such a
page), so the check has to run on what the flash holds. Re-read the data
area with the ECC engine bypassed, exactly as already done for the OOB
area. The corrected counter then stays at zero on both boards.

Reported-by: Edward Karpicz <webmaster@toradex.com>
Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bsp-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v3:
 - read and check with mtd->writesize instead of chip.ecc.size; equal
   on this controller, but clearer (Miquel)
 - reword the erased-page threshold comment to match the code; the
   threshold itself stays as is for this series (Miquel)
v2:
 - the no-ECC re-read and the erased-page check use the clamped spare
   size instead of mtd->oobsize
 - condense the re-read comment to one line
 - Reported-by/Link trailer order fixed (checkpatch)

 drivers/mtd/nand/raw/vf610_nfc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 1c3e7b167e53..1b9b370adfab 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -519,6 +519,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	u8 ecc_status;
 	u8 ecc_count;
 	int flips_threshold = nfc->chip.ecc.strength / 2;
+	int ret;
 
 	ecc_status = vf610_nfc_read(nfc, ecc_status_off) & 0xff;
 	ecc_count = ecc_status & ECC_STATUS_ERR_COUNT;
@@ -526,15 +527,21 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	if (!(ecc_status & ECC_STATUS_MASK))
 		return ecc_count;
 
+	/* The failed decode leaves a bogus correction in SRAM; re-read without ECC */
 	nfc->data_access = true;
-	nand_read_oob_op(&nfc->chip, page, 0, oob, vf610_nfc_spare_size(mtd));
+	ret = nand_read_page_op(&nfc->chip, page, 0, dat, mtd->writesize);
+	if (!ret)
+		ret = nand_read_oob_op(&nfc->chip, page, 0, oob,
+				       vf610_nfc_spare_size(mtd));
 	nfc->data_access = false;
+	if (ret)
+		return ret;
 
 	/*
-	 * On an erased page, bit count (including OOB) should be zero or
-	 * at least less then half of the ECC strength.
+	 * Run the erased-page check with the driver's historic threshold
+	 * of half the ECC strength.
 	 */
-	return nand_check_erased_ecc_chunk(dat, nfc->chip.ecc.size, oob,
+	return nand_check_erased_ecc_chunk(dat, mtd->writesize, oob,
 					   vf610_nfc_spare_size(mtd), NULL, 0,
 					   flips_threshold);
 }
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
