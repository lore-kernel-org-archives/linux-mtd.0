Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3268BE8B388
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNhn8b542GKA+xWvFEoiCBoWOp/EzYqr6VDYO3QyHtA=; b=v9rir/Qfkv+GDv
	bMLFTbEyAfhKnO15S4DDeSPR6bpshS725cPrjXEaL906Byl1/P/gz/A6gS+jfTPCehm7+/2MVLiEW
	snF8AUF8TsOcijncmLBB28ontRSvrup+HO8deQqwSosqRQH/Sv0tk7XYdgDv0VqyUK+aLfaNqci1+
	3gX+0mc4bYX3dWive9peSaDTmEzAH1fsfYEt6pKt3u8TVtmNs/XaduP5NThx4iXt4TkSUtbI/yZqV
	4wxfDWcLTaxLpyoAFb+nwMTMfHiowBo3G4bLy+HhjNXlt4rfFBM+cOcwJm0/rTlwoIMKVshUHNQUY
	AQcUh6Muy4ZkJton6y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngtA-00000008roc-2I4E;
	Wed, 04 Feb 2026 17:42:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngt7-00000008rnh-3LEH
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 17:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D63E4437C0;
	Wed,  4 Feb 2026 17:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5741C19423;
	Wed,  4 Feb 2026 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770226920;
	bh=5NcYr0RmNIwDSQZUlX4Xhwef5nxy4bSG12gyI9oSkxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AlY7qhLdbkBZ7kgZekFSJja9pmI3EHUxsJWSxX+X+pEKmqSn+uCHlBYs603rjhOle
	 fNx3fFgYL1vY1MupNe3IwOjnQK/3wARMzv/aEgbg9WFJyZBCOFZQv9xJp5HWJacY8M
	 hakCn04RC9EVFdYUES54FZefymISc7aEfPfaywK3zur+HggdsqnTWpaFGeL9XWSP6r
	 O/WhiIlMwky4uXTZ3UaJJNMwJ3y7u7DgXpbtxD4u/x+hJAkdzEO+Y65MSKjSNn78wL
	 zNf14+Rw5IzpMnT++G9YxTgWsn/CHuADXpeNO8C0ClPhctHPvcrCzOuIy9vx24Fjp5
	 W3Boqz8hiVZyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A11E83EF6;
	Wed,  4 Feb 2026 17:42:00 +0000 (UTC)
From: Andrea Scian via B4 Relay <devnull+andrea.scian.dave.eu@kernel.org>
Date: Wed, 04 Feb 2026 18:41:44 +0100
Subject: [PATCH v3 1/2] mtd: rawnand: pl353: Fix software ECC support
MIME-Version: 1.0
Message-Id: <20260204-pl353-soft-ecc-support-v3-1-fd8ee7595cc1@dave.eu>
References: <20260204-pl353-soft-ecc-support-v3-0-fd8ee7595cc1@dave.eu>
In-Reply-To: <20260204-pl353-soft-ecc-support-v3-0-fd8ee7595cc1@dave.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrea Scian <andrea.scian@dave.eu>, stable@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770226919; l=1000;
 i=andrea.scian@dave.eu; s=20260121; h=from:subject:message-id;
 bh=A80dHB4AMIcsHk3PCD1NFYNrqV41Ik2X1cY9lUFAPTA=;
 b=iAQcNioIIB5TAEIv9MmTY44uveT4rvHhfdbQpBSpr7ostFz/xAFDnN7lF94kScPxOIGsQm562
 KpwdPwUU+/7BzpHKEJ0WuSgJqx8o+mjJKfGi9ysnyQ19rw26BL0jy6l
X-Developer-Key: i=andrea.scian@dave.eu; a=ed25519;
 pk=PMQL72nEsyoiJCobnq0uEXwUFpVmkwoWIx317WvaQOU=
X-Endpoint-Received: by B4 Relay for andrea.scian@dave.eu/20260121 with
 auth_id=613
X-Original-From: Andrea Scian <andrea.scian@dave.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094201_861970_2FD1FCFD 
X-CRM114-Status: UNSURE (   8.76  )
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
Reply-To: andrea.scian@dave.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Andrea Scian <andrea.scian@dave.eu>

We need to set also write_page_raw in ecc structure to allow
choosing SW ECC instead of HW one, otherwise write operation fail.

Fixes: 08d8c62164a322 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
Cc: stable@kernel.org
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 11bd90e3f18cb..7f012b7c3eaec 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -976,6 +976,7 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 		fallthrough;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
+		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
