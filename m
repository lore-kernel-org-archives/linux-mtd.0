Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC1F606A330
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lu55MKtc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bgJdhsR6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VaIXYH0pe2ohnicQiQ5qmVx0Sh/9T1VXIGcOin5YyDw=; b=Lu55MKtcyCy7+/zBJaY9ZQLao+
	GD8I3SgKJHEOGSM1blXPxtdgRz+LpnKZjOdJOzOaDO4rUOdavxpZlMHlwlVyQGdB1oc7b+a+QrjjL
	zh3JC6tX5mPQoD8hf0IECk1r5UdBf2/DfmsxqxItMpYxsNj6MlTuHnGUChdTWMbYfC8dUVvH/Rzjo
	Qg1taeen9rpLAp5BMF7Lr25+dXO9g3VIZLzIV/lDXNlvr3UgWcpROsZ9hiK2yhICr8drUkhBIJE/B
	Ray6nSBbKZ1O03jHmIyQHyjqPabUUTn7nNkBQwqyOO33WCQRwM9VLeZWbvhWqNvY/A1mmi4Z0H2p9
	iG5X3isQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfu-0000000CHWf-399E;
	Fri, 30 Oct 2026 17:45:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfq-0000000CHNX-2X0p
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:45:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C2D6C4E413A1;
	Fri, 30 Oct 2026 17:45:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96C3F603C2;
	Fri, 30 Oct 2026 17:45:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA87A103290E8;
	Fri, 30 Oct 2026 18:45:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382350; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6SLabFxTzzPS4n99rNoWuXAxfwruMyDcyDAWnNc343o=;
	b=bgJdhsR6lfV0J+usiXw2M+Tfzkswwj22dgsNvoPncWH5jeUhS8J4K9wK+v2Lc2menXRcpn
	SAjIZtBEHDPDwiGXf+l1IZdkXVnPXFyGnLm6TWZ6wP2kGgYMsCzsQH3+UFqIb0Yn1Gn/Fs
	rhuCih9SdSISOQCqFRUbGTixo7f64go9uzNEnhg9haYBWK9+XnkILRD1/l+xQQwTQDAxr9
	bbq4Ic5F0LRcWy8SCl4uGuIMwSvPvIfBZzr6SWY5wSnpGhPaJa9f2w/l9JnRdJpumFtcto
	RUXnarrXluGMZmtzQBCH07A6OZ/h7fr8ZDY37soYmilmwqYCvtGZfU42257zsA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:35 +0100
Subject: [PATCH 11/13] mtd: spinand: winbond: Add continuous read support
 for W25N04LV
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-11-91f67407dc8b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261030_104554_806589_86538BB5 
X-CRM114-Status: UNSURE (   8.77  )
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
index 933a85bb79b0..6dd3341c6dd7 100644
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
