Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1864B606A332
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SuV7AhIu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oxhv49Is
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hc+3j/mde6ENX2i78HUuhlW3jaZs097rgL/JbEmsRUM=; b=SuV7AhIu7taE5A9nKt8J5XpCq4
	kXCfYqoJinhXGuoFxgyhhnR+DgQoWJaHS9SodjxHggzb1+ZBGaJlfpL07AsjCoROOiSyeSVChDN6A
	abwxVXDi92W61DdCAENzKlz5K7+2g/G1E5uCPAc8vp1vOA8yzW81RInFGC1yYuSM7Pix+sf23It8+
	mRPyIy32BZmKfpZLF5opNT7nnzLMH2W5F09lrpSUJS/zioWEApxastGLE8+v32VNNIxV4Es38eoN5
	q+/6ABUBjpLa+JtfkhHvTt27JM3xAEtg1RRo0hD4b9xXjb0eVVi6aPIGUVhO1002y856LOAaRgwyZ
	TNeXaw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHK2-0000000AvJg-30WR;
	Wed, 25 Nov 2026 18:02:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHK0-0000000AvGo-04IW
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 18:02:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4B8271A17F9;
	Wed, 25 Nov 2026 18:02:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EAC360480;
	Wed, 25 Nov 2026 18:02:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A9E111E6B0DE;
	Wed, 25 Nov 2026 19:02:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tCuIzxl3yS7yER97h03fbHyTUvRxC3cOGhv0cQ+k4KI=;
	b=Oxhv49Isr1blQ1tRXrq61D4mu/qNgs9Aw4FD1PlbFUy67HK/EUPfrYSriu05myDYKM+FSR
	VZpA8hSk5VE0mWJ8mhF2CzaazmvhjO/7tatFROW8XpIh4XIJpkLszxo9x2aknyXbiu16ki
	Y07pQC2YY79X5UZ1NosZagGRNGE5i9fmkKJ+34lOeSVrA4Wwr5HFgT9mny3tP3wWufvSdZ
	0Ulcjk+oafCAONiVlcf4yBcrYmVr7Tyl6BtXgKo7VHiy/RnYahLNpMvYRQDWAU+W/e3Pnp
	uKdCVLyafJE4zissHm7bjm2aMeUhn6RKzYeJpdPfR/TxAU/RjcKJTeQnWBK2fA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/4] mtd: spi-nor: macronix: Improve general support
Date: Wed, 25 Nov 2026 19:01:33 +0100
Message-Id: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNyw6CMBCF4Vchs3YMBRHDqxgWbRlxEntxSgkJ4
 d1tZPmdxfl3SCRMCYZqB6GVEwdfoC4V2Lf2MyFPxdDUzV2ppkOnrQTPG+aYFiHt2M+YIqMPgvZ
 D2ueIun60nTKGejVBuYpCL97+med4WuibS205RzA6EdrgHC9DtfbXG4ptYTyOH9iogCmiAAAA
X-Change-ID: 20261125-macronix-upstreaming-spi-nor-cleanup-a08351bbe71d
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
X-CRM114-CacheID: sfid-20261125_100220_225854_4564CBB1 
X-CRM114-Status: UNSURE (   8.58  )
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

There are multiple ongoing issues with the current state of the Macronix
vendor driver:
- wrong RDCR opcode in general
- erroneous QER handling
- issues with locking

This series aims at fixing all those open points. One reason they have
stayed for so long, is because there was no easy way to define a clean
per-vendor RDCR opcode nor to easily hook fixups to JEDEC IDs *and*
extra conditions. This is all possible now thanks to the recently merged
heavy QER handling rework, so let's use these capabilities.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (4):
      mtd: spi-nor: macronix: Clear the default RDCR opcode
      mtd: spi-nor: macronix: Clear the RDCR opcode on MX25L3255E
      mtd: spi-nor: macronix: Enable RDCR for the parts that support it
      mtd: spi-nor: macronix: Describe locking support for MX25L51245G

 drivers/mtd/spi-nor/macronix.c | 91 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 6 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20261125-macronix-upstreaming-spi-nor-cleanup-a08351bbe71d

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
