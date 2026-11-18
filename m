Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C360A2603
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZOHNdDZC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Roz0DwZh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dBrhBVfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4L9HiX3fG8UxBYlBbb8FS2zgNRaTWqAeLPtnwFfvqE0=; b=ZOHNdDZCVeyKDV3YaqNHK8fOC/
	WYMoCeDwQqzkBg2DXIMxKtXZosNYNJrHMhRmYlV1aLmrAj8Hm5AyqAUwkmvU/5Aadix3hyCiS4TVo
	S6TX05KeeAPj45gFkDyHVuwCOiJDCeGrDohS+r6ZYToFOCM/yohgdAogu4CmRDYrWm3PNFHE1F7mC
	tfh8hNlZu2hKJJDCpf2ITr0Eb52rclt0078F9y6DfRJBXXe9MxYwR6sOjuxTF8U4SUBLR0WsV1cK7
	5rutu/16onAox77urjK3HwXqV8YHy69zYqrBpW7em9WqwwYhgWznFP+mq5knraXeTtt8ViHwV89KN
	gNoCc8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9w-00000009ilK-2sTv;
	Wed, 18 Nov 2026 17:09:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9v-00000009igQ-1jnG
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Nov 2026 17:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jhW1mkgCFuh0fRPmYFCPQdZgB0bUNNcOnQ/ukpdLbcM=; b=Roz0DwZhsEHRhvEwp+Bs2geGFp
	rf+Kc9Bta3t4HkLWcFRatKEV82OJGFK81gnn3cWFWfaEVvlBohxEX6d5k1/d3tPVdaFRUxVX74Mzy
	A94ywdkyH106cId/PLLitRPAJ+4hCz/6H8kUg5D2Jqi2VwbuaF9o558eDd71x2uiKGTaM+r2S9Oom
	4yJGpAP5agGz6JYrJCY5zXBUkG66mHgnCameP0oSqCwfx+FDLH1EnYvQaQ8y0fCVQPiLLtUcsZFER
	AulwZOlEkJyk9z0Kx9xYNaV0ckkTipT0MbTTcOv+1VnaMaLQJaqmcsEYHWotkkxsEq3X8yg/ClhcQ
	RiQZvojg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj9m-0000000GKN7-19O0
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:09:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8026C4F77B;
	Wed, 18 Nov 2026 17:09:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF9E85FE9B;
	Wed, 18 Nov 2026 17:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E1B711BC2A23;
	Wed, 18 Nov 2026 18:09:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jhW1mkgCFuh0fRPmYFCPQdZgB0bUNNcOnQ/ukpdLbcM=;
	b=dBrhBVfQLfbia3syyRLpvhvT9Jcl/cRXLNRXMo0QFgnQpwr1X1jOzuhjB9Tvt4sUSBYWcj
	dX5UJjeer3TPGKc+aR8mU7ZY2rWze4kTSqbUkv0v0awz5i32maHELyju0IqB/nLuQ/AbGb
	T4bnqRdRRZTvcCW9iTk8ScumXeZGB5Ozh3gn1dRKi1rlwL9cxDsloy1wiZNLtdy9etw+Ib
	2I2N7vxfN9nEWCxPEOmtfqLFgNWmWvHX0v0K+5AOm8/wxB2LnSREB3m1btwTJwM2SkaVZy
	Fl4ObwKvhSaWswiIs795ZQPkKW3vmZLUJ3UQHh07VqDuAYSaJLSCHBDoG5OlgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 18:08:29 +0100
Subject: [PATCH v2 12/13] mtd: spinand: winbond: Add continuous read
 support for W25N02LW
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-winbond-master-w25nxxlvw-v2-12-55956313d6cb@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_170915_102038_019D8946 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

LW chips follow the existing patterns, we can reuse the existing
set_cont_read() helper as well as the existing continuous read variants.

$ nandcontreadtest /dev/mtd0
testing 2 blocks from 0 to 1 (2 good), seed 22
success: verified 262144 bytes read in 202.780 ms (1262.45 KiB/s)

$ flash_speed /dev/mtd0 -C
1 page read speed is 1185 KiB/s
2 page read speed is 1207 KiB/s
3 page read speed is 1223 KiB/s
4 page read speed is 1242 KiB/s
5 page read speed is 1250 KiB/s
6 page read speed is 1263 KiB/s
7 page read speed is 1260 KiB/s
8 page read speed is 1267 KiB/s
9 page read speed is 1260 KiB/s
10 page read speed is 1263 KiB/s
11 page read speed is 1264 KiB/s
12 page read speed is 1263 KiB/s
13 page read speed is 1253 KiB/s
14 page read speed is 1272 KiB/s
15 page read speed is 1276 KiB/s
16 page read speed is 1267 KiB/s
32 page read speed is 1280 KiB/s
64 page read speed is 1280 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 1dc6d78a515d..b5fc8106bdab 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -841,11 +841,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
