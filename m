Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC8960A262B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g4ZD6BOG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=siCXiFrU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6QyuPojO+LtrwVh6pffqOZfkzjgQs0x2N4f0P0h5mQo=; b=g4ZD6BOGdWO8laAEOS85WJnCJn
	W6pDLVQs1VVk+19v7bvvV/O2oUyaCbxWkW4LS963Lu0+PIZ4lTvqeK9sAOmsxr+wbbWWM7/9t0jOT
	Gq6uHHdIA+nNNVOGk/MvfTHGSktlf66P9MLKSUMfDSMeHjwc+F0fZJBufXk7X7e/npX24tVuc8hLi
	2O8IVN4apK03yAhPGVBnpJwgX4Hr+jcnIo91McBBc56gFP38bYSx+jjtkqcpOPn58gzoizFUaHq3J
	9WqHOnXNNfV24p++dv/c9aMiISiLOMhiTkJDhVbehbm+9IWsD0PJdyldff8yJzzKT0Yy4k/QSyiQz
	XMd45rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfi-0000000CHBf-04le;
	Fri, 30 Oct 2026 17:45:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfc-0000000CH86-3xEI
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:45:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 784691A13C4;
	Fri, 30 Oct 2026 17:45:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46A0C603C2;
	Fri, 30 Oct 2026 17:45:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BADF10328D09;
	Fri, 30 Oct 2026 18:45:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sZ6FwVvEh8JAexAhWjFL05QbCtG3fHADbVqm2cgHr0Y=;
	b=siCXiFrU2YGSW2nrrzUiJXsMcKlawjdZ0tesbwm3powIRk9EW1xmmToy2eIJlDGvWYE/LW
	WrBggYcOuP8C+lDLv5DZIQexDWUW+6XrGbbbri2416dQ97kyIHkRvYFsUX5r57txOnn8vg
	nEJzjkP+ZnwbpplEMm14UdX8JQiwSfVX1YItZNbSer9tTDZBGdT17KmeoHl4BrX15oZJtu
	wa655301n+h+JfJayfABfnYWaxrKRWUzkqQmSZOkxDFZ2zKpq1EZuxAyLwtoh27mqvKr8B
	Q2NRB7H6PrZkn4Xnkjw9BcKVDOShtVAgbfyngsXar7qKt7oyZLDrRTW7Duq09g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:28 +0100
Subject: [PATCH 04/13] mtd: spinand: winbond: Rename the ->set_cont_read()
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-4-91f67407dc8b@bootlin.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261030_104541_138006_A2C8FD2D 
X-CRM114-Status: UNSURE (   8.29  )
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
index e3be93690bb7..c6f7f0a42722 100644
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
