Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EA960A2603
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gb/g7ylh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FbzV8Wqa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=knTL8OclGN0NJUVQq/YM7Ry8jPbcUQS9+R5pQo7dpC4=; b=gb/g7ylh6+gLAe80L3FKqAMHHK
	vKZydlD8uA1qUN8lHRTzfH0BrLsVvBXbr6z2PlqrmZz2CF3BvtCLbRa+06QKwJj+gnyW+3zVGevyj
	hORVPwlmbpA+k32Ps3wtZYsASwMaRkfI0UVWcAQLgQby2ec4WYpbynxSHJYK52woBlXWC0hbKX5/s
	A376RfRUg1oVjMBApYYr9lt05wam87vit7H76MYHexUanYBpA2qLKT32mZhO/JSWYxMEld29wmCZT
	O9XsnivUEpiC6EVs8N49pmxkFm31IvjSjWXAp67qeEIFmt30ZXhnmHw5jnNlNCd+w0wuth28SosIG
	aAdMTIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9Q-00000009iAy-3rKC;
	Wed, 18 Nov 2026 17:08:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9M-00000009i6O-1F8Y
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:08:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D3E2C1A169B;
	Wed, 18 Nov 2026 17:08:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A45F85FE9B;
	Wed, 18 Nov 2026 17:08:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5131211BC2A15;
	Wed, 18 Nov 2026 18:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021725; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h5w2p/Bg6b5kyn0dfQ7CwRMHWskQibFA9qG03fWO+x8=;
	b=FbzV8WqarFjQDQfsmSzw+yk8Q12D183IBVOTIzJp0EvcbHmelFgu4RnguGykEcMRqgpjhe
	k65ICiQDTjUKQRgubwbSLbw5yaKelO+X4LUZJy/aGaAMKZJmxdyn+JDb7ksp4q5YCSHz5A
	Fft7kR7vTKIFxi7LdG0bN/ReS4JMI5TuOHi4bxG7a4zzYufHR3lps118oyv3QYxL4nStLO
	OpIPbwjibLclIADKlZt7RoGcv0Jos95mwrZRcuB1YzHbhlyEMR5mHX95NBKh1S93045Kgk
	fu+KuYXd7koNuxOs79LnfOO5bJPrMYGrNvVk+PGUwFcCEOzb6grrhABrqwMZQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:21 +0100
Subject: [PATCH v2 04/13] mtd: spinand: winbond: Rename the
 ->set_cont_read() helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-4-55956313d6cb@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_090848_507562_54A8363E 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

All W25N chips (KV, JV, LV, KW, JW, LW) seem to share the same helper.
W35N chips have one more item to configure in their callback, but
otherwise are also very close.

Rename the helper to clarify its use.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 0288788ff0d0..95b6c3b80eea 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -582,7 +582,7 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 	return w25n0xjw_set_sr4_hs(spinand, w25n0xjw_op_needs_hs(op));
 }
 
-static int w25n0xjw_set_cont_read(struct spinand_device *spinand, bool enable)
+static int w25n_set_cont_read(struct spinand_device *spinand, bool enable)
 {
 	u8 mask = enable ? 0 : WINBOND_CFG_BUF_READ;
 
@@ -726,7 +726,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&w25n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
-		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N01KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xae, 0x21),
 		     NAND_MEMORG(1, 2048, 96, 64, 1024, 20, 1, 1, 1),
@@ -772,7 +772,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
-		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N02KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -856,7 +856,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&cont_read_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status),
-		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
