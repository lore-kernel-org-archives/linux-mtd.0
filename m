Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E69E85371
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAYpxVdDoLM90R2rQGJRDGAUhcd0daEnoNJup/t16GI=; b=nUtUdGkI8f5/Y1
	OcBk3mPi1YI2YAIJE/RYpagR5a8coHSK+tcAp3eaD677m7rNgKkabCMAAeX2xJxDToXjdXWCFa153
	iCXH/i1X9J36mckFi6OkIYja5XMqBZqVpgFYFv1sc93Lzc492/IJlhrixkfeVZ2L2k//Cv1qSm7tS
	l4st6qbY4qQ1N19aJZJVgXspKAccJBXTMCTx0YzHp3qtHiRvpDTV8Qg/Qd/2UFYGsbZdj6eCRVaIR
	+5uYKwnDee2mEuvcw04aM97TFmSetYkDy0ZQmqY2T0vATaykEUIIIO8q+WRTtwM3wRcIJ2ffD9UMJ
	fFvzddDjZwFLMA7mBGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5h-00000002Gh7-1NMa;
	Fri, 03 Apr 2026 16:09:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5d-00000002GYl-3Rpg
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:09:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E7157C59F67;
	Fri,  3 Apr 2026 16:10:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA8F4603C1;
	Fri,  3 Apr 2026 16:09:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3AE3104500FB;
	Fri,  3 Apr 2026 18:09:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FOjmpf/BiPzAyc0p3HUqSMX9zMlXNwI7+2z6Kuibe7o=;
	b=yyYukdm86ZsAGlKG/3f3PQKPIfYDuOQx1VPnli+S74aXqfjp+2mQ6UJdTZrIw7f5QNqyg5
	mIBaOo+eM2CRlZuu25RWyN/8ozqLlk+5J3tDVYK5Q1/OtwfZUTiLVaeYyLIKG6pItD8dlF
	NgcpnYshN4V9VkyuV0dEWYBQ7mFQyUhs7OYcMl2IxBxlr56JhFCmWH3ATvDRVQc8whNV78
	Ox4uaIbR40Low5OEyUCaXsP88triWvZ1obqchLLc0mtfQQV5MnvYiv4lDPVG/z1h6pxcWB
	xdfeeEWalx9p4oJYuqgMsrN+zYk9GZ1QnUtt/WPsRjGpOI4/NF+Vadya2kOTwQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:21 +0200
Subject: [PATCH v4 03/27] mtd: spi-nor: swp: Improve locking user
 experience
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-3-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_090946_025940_BA2011A9 
X-CRM114-Status: GOOD (  14.62  )
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

In the case of the first block being locked (or the few first blocks),
if the user want to fully unlock the device it has two possibilities:
- either it asks to unlock the entire device, and this works;
- or it asks to unlock just the block(s) that are currently locked,
  which fails.

It fails because the conditions "can_be_top" and "can_be_bottom" are
true. Indeed, in this case, we unlock everything, so the TB bit does not
matter. However in the current implementation, use_top would be true (as
this is the favourite option) and lock_len, which in practice should be
reduced down to 0, is set to "nor->params->size - (ofs + len)" which is
a positive number. This is wrong.

An easy way is to simply add an extra condition. In the unlock() path,
if we can achieve the same result from both sides, it means we unlock
everything and lock_len must simply be 0. A comment is added to clarify
that logic.

Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
Cc: stable@kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/swp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 9b07f83aeac7..1d50db1ef1a0 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -280,8 +280,15 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	/* Prefer top, if both are valid */
 	use_top = can_be_top;
 
-	/* lock_len: length of region that should remain locked */
-	if (use_top)
+	/*
+	 * lock_len: length of region that should remain locked.
+	 *
+	 * When can_be_top and can_be_bottom booleans are true, both adjacent
+	 * regions are unlocked, thus the entire flash can be unlocked.
+	 */
+	if (can_be_top && can_be_bottom)
+		lock_len = 0;
+	else if (use_top)
 		lock_len = nor->params->size - (ofs + len);
 	else
 		lock_len = ofs;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
