Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D47CA5FD4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVthADAOi/Ks56LhhQ/gkJJxHQJ8x+whHyYvR54XSYo=; b=3hDHSUoCpZhfos
	//+2FJDsx/sb11pqZPmKgLMfEtt/krZM6StRTzlzH284pjy+uTa+C5HmcNMDDN7ZIYdGYVW1jNAli
	NTTQy2fk334X2iAQNzD26QUMAiqqV8veREQV6qd3q+0c9DuWMTpkd5elIrnX318ttEZpgZHBYjTz1
	P/jE48TrCm2RmQ/vFO5HKSG75qVZ8A+zq2ZSBSoA3QTWuFZnyHdavR2sNMsjJK0EvLHxaqG3Nx4Wl
	aP0mB1QtMsXqNZQC/gTcsMiR7RvpytOOn/zNS6I8SXzt3JiYqZvN7TMPqfw/oEMu/goY1Hy+/eSqT
	CcjYSu8C3D15s5tD5SaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGl-0000000BYYU-2sqt;
	Fri, 02 Oct 2026 12:21:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGi-0000000BYWC-29HW
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:21:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 149BD4E4110F;
	Fri,  2 Oct 2026 12:21:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCEFC603DC;
	Fri,  2 Oct 2026 12:21:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDCFA103281E3;
	Fri,  2 Oct 2026 14:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lKU3bfFA3TBWByBniXLhckIqiCwee1j7ncswMHgAQeQ=;
	b=e6KGYanlIDFTY8WB/bUgBsQWMbLQfreIEBpim5uy9g2NcG9kpHip1tY2P1qFomYC/vdqTR
	utOpzqekHybyv3pmxD+zZ+vPCopUGqdFKA3e7ZkT/TGEKj0ZhAPzPcgVPAf7ntLokJdfnL
	kL6l35PXvQIPzfQsubb1HufFkylYyPppae4pZ2UUWLb50YpDHGCyhPskXaDpS5vymTc1Hy
	bkgvsfCnNuJtEC5n7TEkXOjY7aQNml8uZdYfbqHthDkw0SiTVdLKnJpCV0843xek3t8fkJ
	igFRb/oAvcDYBLow2AO1TqA4bv2vfe9NoaBRjdGXCbNoU0PVP+w66odMX872wA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:17 +0200
Subject: [PATCH 04/15] mtd: spi-nor: sfdp: Enhance a comment
MIME-Version: 1.0
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-4-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_052140_735135_6742DD1C 
X-CRM114-Status: GOOD (  11.03  )
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

While working in spi_nor_parse_sccr_mc(), the actual meaning of the
comment was not obvious to me. Not sure my proposal greatly improves it,
but at a first glane it feels clearer to me.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c21a6953db96..9d5c0bbb53ae 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1417,8 +1417,8 @@ static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
 	le32_to_cpu_array(dwords, sccr_mc_header->length);
 
 	/*
-	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
-	 * additional die. Hence, length = 2 * (number of additional dice).
+	 * There is a pair of DWORDs (volatile and non-volatile register offsets)
+	 * per additional die. Hence, length = 2 * (number of additional dice).
 	 */
 	n_dice = 1 + sccr_mc_header->length / 2;
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
