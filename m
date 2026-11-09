Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8638A606D82F
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 01:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I4ZYVtI8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQR6A+ln
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ANc4+nOUh6tXWoZm0C7B/BhOdnen9H331Ds1cwbt1mk=; b=I4ZYVtI8ru6v0LVh6C2c/5h4J2
	CXzWpC0U3rmPSmmPbZz9/SauEYiDe6HQ4sW38Y6R6MGaZjtJKGFLgL2SNV/3mDvsgyXq5XOC7836D
	szMg9pLvz4R07u/kpMW/42tsmVD9rO7dGc9iOPS+Vc3Ey/c8KvdeUZWNl3nprisfRVEIsE2LXPQkl
	saTYgpUhioWDvqhaaJlYTGuXZQREZSrYw8jp3skUWYlgASruohNswr3WWzqCFe1GJooikwymd5aNI
	PQ+gxBL75AppKy5MApT1/YvuDrG4HnsotAdDj1LbH8hrqL3HuMo5QrzMaalbvBKobAfyataALA25h
	qhQeiMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECT-0000000H3K0-1kuA;
	Mon, 09 Nov 2026 01:29:33 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECQ-0000000H3IW-1I2f
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 01:29:31 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7f84a55e31aso174277a34.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 17:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187769; x=1794792569; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHxPvkIQbIOFnf0PNycsyarZgqZPtDrXH02YRkVpewI=;
        b=DQR6A+ln/t5qy4v4g6gcdwDZSMzY/9Q0gHrM4efJEUzoiZ9lLAoTofqoFahnH19U25
         9qCDPh6P5+7A3SXrchRySfI2edRdmFgVfKSH5a854Ww3+qQaypWFKG41eVpeBVQOYXw9
         NQKgFgeE63ksP3xABl/DFtgc/Rd7vbQuiQPd4oZ2j809n3AASdJ5mUNwjoU4Q9ORmMtB
         0+jkb6rbTbuk8tW6h7QqyVIQ47Y2ub2G9JJrciiIWIVooHgv1D5fpbWzxOJkbp9s+glf
         c7Mu50WWtq/i9cuVFuD1Q2OGlawGw4sa2nCNh0I+BXNn0T+o0d48Q/4KtndN7Su0yhdW
         on0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187769; x=1794792569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHxPvkIQbIOFnf0PNycsyarZgqZPtDrXH02YRkVpewI=;
        b=nd8jHaxwLDB05BbV0OpqZhFKEAA5KnA3MPcSqX0gJukr6TA8DDGhPBoAG5SBXQNa0y
         pCxvNmc9g3nPCkUACGzScsxm/VBOH2wbF9+UamOJwp6gmkOSnSFSIAWaDUxh6S0/Snnr
         jzJQDm9R/FtfXb7I0UsGxKJrMLxhjYbAPmIK5QEowZSCxiWSxjBr+yPAlEwQOSFHB56x
         1/HhCPEL+ceG9VmAGMUsF1qI1/KkmUgFebdJfG5oFyzV0L63Vn7/w8fesJgCx4n4bzSB
         29gg52Rjj9UBeltiHFyt0x18UqDm3rW4m5GqgRff29x6+jbq3pBo5t8oQE1QtlKzN+hu
         1KIA==
X-Forwarded-Encrypted: i=1; AL+hErEV7VnUt9i33p5oyxFazMldemweE4vcknGBH1CbDb0EYzScZvT/WbaoIkQiGX3JsQFYabG4GWJTlXg=@lists.infradead.org
X-Gm-Message-State: APuU4Z9vIXCyCEUTR6tV0QdwYQ3QaUPy1Nb0oLC+xmVXnRCNqOI19UMj
	oOlCPySmGA+5lJL+7PGKCVNZKLvNzWXfDhALlwZz059V7UI8BtWQmFEb
X-Gm-Gg: AYBFou0rjJX4XbmxjrwQf1cWRHBec6qkZdduJ8dMOfODJdNfjXOlZ7olABbffPwHtj+
	NMtkZ050bdMNHAxaiKx7yJjxBSmMD57iGsv5kPqagTWUWvW9kIQtcKxupG6Xqle9lDTa12+uKJL
	WBrFDjdATplA55sX/ieTA9StYGexfknozLiMF3CRMbHfe+fDWJhJApv7JHIHz/eIcoAxQxCqyZS
	2qfmoKPED3nA62epW/D5lUM8/4vdRZ3FKidar7zP+6YrUGCEe6qseY1swJnSC4t7ePLPXVb4lQO
	ebOZcjFahVWUQ4dirhSTN6ip9BXCHjfGS5OIP5Uph/5CGQQprdrx4CCULvrAYuHxF4Kjoypfip/
	eEjgHCJ0mNoOjeRZTBAtrEreAL58lOTSLNLrRxtOH6A1p2uh1ClWmqXr15f0wQgLYFcfII2ipYk
	UH2+3KvpXKwJFvRm3G1DKAjJ0GH0285ka9xlZlA+4+FtfjejFh5FMWGpLDP4nT8QMYSa4sLjiAw
	f84kuwMmGBF96NKXsW6Lr17aNrc9WFp2LQtvHNExhkEZjO24Hh+fa6AhZmKHYCRpkiD1n7wBfcL
	xvMm1pwQMq5CgTuwQw+Re94X8K3jaJiFOfQMim6pUHet5WNEWcWjChFXMxIRYzKUTHsTEtjX900
	/aigX6i91ja6bR2/d/PUYTkD7l4oglylhR/NhtG7P1cRu9lZGruslUCWD3Vpc6+umQ7OXlTje4e
	HkLupmwP+OmzBnRLBxNyN2W5/jxCNZYwJTykKBnMkG4j9jIgFQdR3S2Ye1/vPQYukDH8F8X4svG
	Q==
X-Received: by 2002:a05:6808:538a:b0:4bc:cf33:7024 with SMTP id 5614622812f47-568143c75b4mr1962246b6e.42.1794187769024;
        Sun, 08 Nov 2026 17:29:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 18:29:21 -0700
Subject: [PATCH 2/4] mtd: rawnand: sm_common: avoid recursive locking when
 marking bad blocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-2-56d08c0571a2@gmail.com>
References: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
In-Reply-To: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_172930_363112_7BFEBCC0 
X-CRM114-Status: GOOD (  18.08  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

nand_block_markbad_lowlevel() holds the NAND chip and controller locks
when it invokes the legacy block_markbad callback. sm_block_markbad()
calls mtd_write_oob(), which re-enters nand_write_oob() and waits for the
same locks, deadlocking the bad-block marking operation.

Write the marker through the chip's OOB callback under the existing locks.
Keep the reset, target selection, write-protection check and page-cache
invalidation performed by the OOB write path, including the broken-xD
write-protection exception. Preserve the 0x0f marker and fill the rest of
the OOB with 0xff.

Use the OOB callback's return value directly. This also avoids comparing
an 8-byte OOB write on 256-byte-page cards against the 16-byte sector OOB
size and incorrectly reporting a successful write as an error.

Fixes: 5a0edb251ae9 ("mtd: nand: refactor chip->block_markbad interface")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sm_common.c | 44 ++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index a3a3a05cc5a4..a6387111d271 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -100,30 +100,38 @@ static const struct mtd_ooblayout_ops oob_sm_small_ops = {
 static int sm_block_markbad(struct nand_chip *chip, loff_t ofs)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct mtd_oob_ops ops = { };
-	struct sm_oob oob;
+	int chipnr = ofs >> chip->chip_shift;
+	int page = ofs >> chip->page_shift;
+	u8 status;
 	int ret;
 
-	memset(&oob, -1, SM_OOB_SIZE);
-	oob.block_status = 0x0F;
+	ret = nand_reset(chip, chipnr);
+	if (ret)
+		return ret;
 
-	/* As long as this function is called on erase block boundaries
-		it will work correctly for 256 byte nand */
-	ops.mode = MTD_OPS_PLACE_OOB;
-	ops.ooboffs = 0;
-	ops.ooblen = mtd->oobsize;
-	ops.oobbuf = (void *)&oob;
-	ops.datbuf = NULL;
+	nand_select_target(chip, chipnr);
+	if (!(chip->options & NAND_BROKEN_XD) &&
+	    !chip->controller->controller_wp) {
+		ret = nand_status_op(chip, &status);
+		if (ret)
+			goto out;
+		if (!(status & NAND_STATUS_WP)) {
+			ret = -EROFS;
+			goto out;
+		}
+	}
 
+	if (page == chip->pagecache.page)
+		chip->pagecache.page = -1;
 
-	ret = mtd_write_oob(mtd, ofs, &ops);
-	if (ret < 0 || ops.oobretlen != SM_OOB_SIZE) {
-		pr_notice("sm_common: can't mark sector at %i as bad\n",
-			  (int)ofs);
-		return -EIO;
-	}
+	memset(chip->oob_poi, 0xff, mtd->oobsize);
+	chip->oob_poi[chip->badblockpos] = 0x0f;
 
-	return 0;
+	/* The NAND core already holds the chip and controller locks. */
+	ret = chip->ecc.write_oob(chip, page & chip->pagemask);
+out:
+	nand_deselect_target(chip);
+	return ret;
 }
 
 static struct nand_flash_dev nand_smartmedia_flash_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
