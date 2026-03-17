Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D75FD7075
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5r0y88QPsIFRwaI0fkh7tL00IZmy4bZzYlaZZQyKVsk=; b=iLsw4oOLwKZzpA
	pSmU4QIHzrp9uWNhSMDomJVwEPQ8GzEB+ufe2zveLlgO6YKgl8MK1FWNE3cdWgpU13+2hg3xyq4Uh
	85UpPsSJRaeeW8HsVNB635uRnnCTGARti7svYXUTNEtZbbaLLu/ae+I8m25f4Phs5o2iZPPxhRe0C
	1TLQ9j2X4WQO/w741yb6nER+8Q1VyHpfIRhSITFPVn4aLzXPWZxGw6IETssfKlAxgY1zu8l2N3yrC
	Ve2jlHxhBvPS4pT6p65cRbDe17W9Nn2IrncPXQsOzxon0Rydy5KTGP/kxRz/k/sBEgkfpD0VFcH8V
	MU4E3YuMoC3/G+AZBYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rb2-00000005zL7-35lq;
	Tue, 17 Mar 2026 10:24:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rb0-00000005zJs-3Cnp
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 10:24:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57F7E1A2E5D;
	Tue, 17 Mar 2026 10:24:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2865C5FC9A;
	Tue, 17 Mar 2026 10:24:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7B071045044E;
	Tue, 17 Mar 2026 11:24:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=stZFrqO/Xzy7EKE+3DmnORMCs6+d8LeG2HLgrVddfK8=;
	b=REG75wJrdnrSUys1HmGfgvjtUIaQ6yoQ2IVEN4Gc6xbRsqOBDltE+bKOz6Jpwa5bRs7yb5
	Sabt2T1OeR3MJ60Muo54fBvsoWvkqIe8vE9M3T6q9cplXbTd2D4gV7IhR/sy4TwCyMdHBv
	BzzJ11Es8Xi+6pwqEYMzjCIrJT4RuCV9S6PgRON04eCdsr38spvdId6KBA54zTPQMXHDzz
	Rh7bs8PApT6np//vDxKrhaPWFVQAZs+bnPOBNdePmFlJ41TvbXEbAL1md7uXxmV+5qOQaH
	xhh14SGnMfDnfoXt03ZBRHVgmATkNYeHoNoHG/ldAALVCa4k40PxWgoSiPyn6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:05 +0100
Subject: [PATCH v3 02/27] mtd: spi-nor: debugfs: Fix the flags list
MIME-Version: 1.0
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-2-2ca9ea4e7b9b@bootlin.com>
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
In-Reply-To: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_032418_959303_71D98B34 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

As mentioned above the spi_nor_option_flags enumeration in core.h, this
list should be kept in sync with the one in the core.

Add the missing flag.

Fixes: 6a42bc97ccda ("mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode")
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index fa6956144d2e..d700e0b27182 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -28,6 +28,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(RWW),
 	SNOR_F_NAME(ECC),
 	SNOR_F_NAME(NO_WP),
+	SNOR_F_NAME(SWAP16),
 };
 #undef SNOR_F_NAME
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
