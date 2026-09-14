Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BDAC88E67
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 04:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uf+a0U1AMq2onzKU1FThTC/katPrMUzmw1vQKZ4QCVM=; b=D/MgPHjUQGeOMC
	6LpOvzuj6CYSqDPC85DrHaJ2KDjSg0BcMW1ic8lOUZLirAlB1VCbONeyzKtZVeAOz6ioovt2VNUCe
	99G/xEN8xDw4vT0D4pmj+CSz8wNWgWts972sjKRjqstpAsXe72ihOq9/AxTETaK34sqNBQ7tWOoTI
	vOGk8iLqQLad21SBr7KGa6sp/MjhXz4H41+h/NCZLryUO1LH98DS0xCl3STeVAtyNHRtfFqXlT8ud
	+c5Tkwi2cuYW70aQVfWvyt1QoSSP9uhuum3/MN7e5aBjOcAHg7wtkdJQ7+BDJO3+X+xAEpp5vw5kp
	UAiCUvpUteHixgoJT0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yeb-00000002LD0-1Lmb;
	Mon, 14 Sep 2026 04:50:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yeX-00000002LCY-3vdX
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 04:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7421447C5;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A85EC2BCFA;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789361447;
	bh=Z5CWLPifvsIxw2AX2DYTLeV1c5Mrmc8Q4NyyibtsTDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LiboKh9bDIZYQSfR8M7LDLY9UnHSAwaHdjerOZpVvIUtvNViQquq3RHYB6MxXmEAs
	 k1RoyudQkZEJQKKyfr7B487bLK7QZcMnGlOkc2jplUyqpfkJecCQMtuihlNyvIUzTA
	 2kGVMcqSwMx3IovGhEQuCCJf8dAvdJFqH7ssBV2MQeS1wxYxKf7UBk38PMRUznCQYL
	 FJA05PO5F0dYjdHvs/tz1pdvkuYl1qE5+gOvU8w/MwUFiq1mQm44BoVvMKgLErdZ9X
	 hm+C6FMxrlsIyC4hjJIkE4l9ZU0SAK2lwLchHecCJ+7uHL8+pVqM/j2/pGkw8YCQvN
	 CSsCZg2fcmcPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807B5C88E69;
	Mon, 14 Sep 2026 04:50:47 +0000 (UTC)
From: Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org>
Date: Mon, 14 Sep 2026 13:50:37 +0900
Subject: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
MIME-Version: 1.0
Message-Id: <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
In-Reply-To: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alexander Sverdlin <alex@sverdlin.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789361446; l=1111;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=rZ/ppqGkp79oofIgjp+2euFFx00lpMqR81jL20uurYg=;
 b=afD1LcUOLiZftmqkrFPqF/KTxnZRF8mPVBKSA7bPSLo5RV0+1PoKwVJ43wwJoIYUhPzYS2+9K
 HdcB9jBYcG0Aunc9iUZNcFjr34pqfo7BPM4UpUqY4k9as8A8K6FV1OQ
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-Endpoint-Received: by B4 Relay for takahiro.kuwano@infineon.com/20250227
 with auth_id=566
X-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
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
Reply-To: takahiro.kuwano@infineon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <takahiro.kuwano@infineon.com>

s25fs256s1 has incorrect SFDP entries, like s25fs512s and s25fs128s1.
Assign the common s25fs_s_nor_fixups to s25fs256s1 to fix its page size
and sector map.

Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6a62ca6f6451..bc50881d5648 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -1148,6 +1148,7 @@ static const struct spi_nor_fixups spansion_nor_fixups = {
 static const struct spi_nor_fixup spansion_fixups[] = {
 	{ .fixups = &spansion_nor_fixups },
 	{ .id = SNOR_ID(0x01, 0x02, 0x20, 0x4d, 0x00, 0x81), .fixups = &s25fs_s_nor_fixups },
+	{ .id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x01, 0x81), .fixups = &s25fs_s_nor_fixups },
 	{ .id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x81), .fixups = &s25fs_s_nor_fixups },
 	{ .id = SNOR_ID(0x01, 0x60, 0x17), .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0x01, 0x60, 0x18), .fixup_flags = SPI_NOR_4B_OPCODES },

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
