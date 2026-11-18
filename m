Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED30960A2603
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zohoh0ND;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DVhYeqe9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xJrAuTrm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b4QmxVEkKPPgWmCbsAr6TWIOKyHnQC55wvodGzyUcf8=; b=zohoh0ND87eCEOPQxS0m1C4q3n
	1OC2a6nFHLpknx7Es5XyKiOJ9AJ7AcbhaELIoFau1W+Nu1Lq0dqBLsdzkDaJ8ciAuuji7DFnK5+Z7
	udthnuf43cdbYTAuFK///E9hByiYwuXGdOM1nYY6CnFv+EWdE7QcxHP1uh+5ntwl2Wg9MsF2HtCYL
	DhtRCI2u0h5If0P05H94uh+QIY+gNqUXO4QUz1esIiJ36yIkHakqGpEUwjzORpSMe+Arj2YBhBBdH
	B4Wvqk5Lut/LNFRMpIFWPrFxXJtkIWZjUUz8CB8yJI8I4ygUl0q88BfPUJ4SxbknVZSK9W/EUY3W6
	1uX/v99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9t-00000009iav-1SSq;
	Wed, 18 Nov 2026 17:09:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9k-00000009iY3-0vbs
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Nov 2026 17:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fLqr/v68/oCbAC/szyoyk5IrhiQHgk4K8tIbryhT7Ag=; b=DVhYeqe99xIWrVFen9ih7LX7Vp
	CwCIYuCxhKal0pJULAU7oVrykS3AEh8JzCcmxg/giLoAPVIwzUI8udzKL4fm+xGOXdPV/AkQOZNSL
	PDZJdtSDOEZOKejtYS/rk0r7DTZljkL2Cj5jy95qU/LHF1ynmaxaTuveqJt9o5omYeU7g56XD0P4A
	Gu14X/6jg8ujsa3sI9Du8ts9yydHoFx4czVJKiXFjkKddlyNwJoF+xTFn7bRshvlM5gS6a8ZlBdnK
	qt+olScm/Snpbi8AnLEyNyg5EqPSA4WAMdIh+sd681O7FJWE41Bxw85jZn3yC1Yw6cpsYPLIuSr2G
	/cdocEmQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9g-0000000GKKu-2HBe
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:09:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 276514E415F3
	for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 17:09:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECAAE5FE9B;
	Wed, 18 Nov 2026 17:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A36511BC2A2D;
	Wed, 18 Nov 2026 18:09:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fLqr/v68/oCbAC/szyoyk5IrhiQHgk4K8tIbryhT7Ag=;
	b=xJrAuTrmVWZ0G2Hsq9tQoPRD6+uxXd/k88UB0spCmlPi51Ro8tbP2h3BZ5RqVG+kx1ycjw
	KLoA1/fjcSRwnejqpZ/gXUEA83vBuAWeIYbOY+phfgytIqOID5oxb3/ignhmfDne2Q3Z0c
	17fkKalqv++MGZfkKGqB6J7Vfhd5psDQ09cYZtoGrbr2AardIXjxJ1LEZMa+8wo0jdMWUy
	0xehm5sLvY2dYBzeBOZADV/qIb2FyLuGUYVNaF/j+ouJWyGqaOnOaOAkAvBPx3cnPppkts
	3oTa2TbtWbfZCM5XdgcGKGsJxfdRvpEBXn88r13lz1yjwbJ/ggucER60dymEKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:28 +0100
Subject: [PATCH v2 11/13] mtd: spinand: winbond: Add continuous read
 support for W25N04LV
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-11-55956313d6cb@bootlin.com>
References: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
In-Reply-To: <20261118-winbond-master-w25nxxlvw-v2-0-55956313d6cb@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_170908_450868_A97CF2A7 
X-CRM114-Status: GOOD (  10.05  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LV chips have DDR support, otherwise they support the same variants as
the other chips.

$ nandcontreadtest /dev/mtd0
testing 2 blocks from 0 to 1 (2 good), seed 29
success: verified 524288 bytes read in 291.735 ms (1755.02 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1673 KiB/s
2 page read speed is 1718 KiB/s
3 page read speed is 1737 KiB/s
4 page read speed is 1741 KiB/s
5 page read speed is 1764 KiB/s
6 page read speed is 1764 KiB/s
7 page read speed is 1762 KiB/s
8 page read speed is 1753 KiB/s
9 page read speed is 1774 KiB/s
10 page read speed is 1764 KiB/s
11 page read speed is 1774 KiB/s
12 page read speed is 1777 KiB/s
13 page read speed is 1777 KiB/s
14 page read speed is 1763 KiB/s
15 page read speed is 1777 KiB/s
16 page read speed is 1790 KiB/s
32 page read speed is 1777 KiB/s
64 page read speed is 1777 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index cdfd5a5778c6..1dc6d78a515d 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -882,11 +882,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8b, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&w25nxxlv_read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&w25nxxlv_read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&w25nxxlv_cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
