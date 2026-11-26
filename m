Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DACE606A681
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KFUGXdCZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hBnwyFWC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aOdoxs/JYqYOppDPH0gOuBL1FNOY5VUxDXsQw0bhdwM=; b=KFUGXdCZBq/BGWFV59fra4dUBl
	J0ZFkqupiDe0xThbxJ4EcaP7svOcVZR+1f/OfF6dWsZVhvFfaseFn+vH1O7+Vt+BeXQg/sK8SVeEL
	Uf5P5r7b0yiVRbckLM6zJHiUiav03Xlrv8zwy94Hk8Aa83ivG52faHZUqhTFxbQRj+SVhsGF+pNEt
	SSTN+y1yKFQdjjRGKw5NF3rXhH5A09IzynTFz0SSrueYR8dhzQ726UoROOy3/PHC2NoBtdS+ZcCfs
	KN0L20uaP2HYFnMUd0jjGAIHux8TvC5P3QNjd6tOlb/C5oRhxUd/phS66CH67xpAyk68FNNQoFXLW
	M9+bPNTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZkL-0000000DPpC-2jyP;
	Thu, 26 Nov 2026 13:42:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZkI-0000000DPms-40dY
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 13:42:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E0491A1815;
	Thu, 26 Nov 2026 13:42:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F17EB604ED;
	Thu, 26 Nov 2026 13:42:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3020D11E682FC;
	Thu, 26 Nov 2026 14:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tcpLrBX/t5+43fRsmRy2vkgzzwO0kLioQKusayRaqCE=;
	b=hBnwyFWCDuGhklgN8a+pXBIjLFWtvoEwOPMGV1dHtxBVRq8UeK1QskqIup6fnn+MAs+QI3
	f/zvDOMS0z7s7Or8/KFs+ytNkYJk0nP4y8xpXAuRM7Ogn+abtq+n+Y3LW4l+hOEPKHL6G2
	T/xjQh/UdSh5fXNDte2v0g6Lmg04d3fi04hhxQLD4QQdkw48PWiCIqHeD4fcRnpg4aml91
	CvnjML+7w8cTbHiCPO28bVs3FuGwLifnhB6316FTAB9SbfkggYi4O3tbutgbcqpIaT3lMP
	sx1k9m8BZDoZE5Qq1SSJgFTg3Z7jv176zGI+A70r+rNsT0x5jK8GfsyTpOfgrg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 14:42:26 +0100
Subject: [PATCH v2 1/4] mtd: spi-nor: macronix: Clear the default RDCR
 opcode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-1-672a59abed62@bootlin.com>
References: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
In-Reply-To: <20261126-macronix-upstreaming-spi-nor-cleanup-v2-0-672a59abed62@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_054243_143345_8384509A 
X-CRM114-Status: GOOD (  11.28  )
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

The core defaults opcodes.read_sr2 to the JEDEC RDCR opcode (0x35) and
opcodes.write_sr1_and_sr2 to the 16-bit Write Status command. Macronix
flashes do not use 0x35 to access their configuration register; they
read it with 0x15, and some parts have no configuration register at all.
A 16-bit write would then send zeroes to a register we cannot read.

Clear the RDCR opcode and default to 1-byte SR1 writes in the
manufacturer default_init, which runs after the core default and before
the SFDP parsing. Parts that do support the vendor opcode can opt in from
their own fixup, and SFDP will still select 16-bit writes for parts that
require them.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1c..163f1006130b 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -333,6 +333,16 @@ static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->qe_mask[0] = BIT(6);
 	nor->params->qe_mask[1] = 0;
+
+	/*
+	 * The JEDEC RDCR opcode (0x35) is not valid for Macronix: some parts
+	 * have no CR at all, others use 0x15. Clear the core default. Parts
+	 * that do support the vendor opcode but do not carry proper SFDP tables
+	 * can opt-in from their own fixup.
+	 */
+	nor->params->opcodes.read_sr2 = 0;
+	nor->params->opcodes.write_sr1 = SPINOR_OP_WRSR;
+	nor->params->opcodes.write_sr1_and_sr2 = 0;
 }
 
 static int macronix_nor_late_init(struct spi_nor *nor)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
