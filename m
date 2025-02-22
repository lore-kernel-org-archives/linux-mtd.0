Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F393C021B2
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Feb 2025 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iZ0v5USDuIaZrmkKgvX4S753nGz4nLTx+BhlZteu678=; b=Oaw1/B/wZPUTeF
	WbVogOyzxFQkqta4miNo7c2Rvwhi0Fzmrcy3p3WTTvl6v70PGLndgMZJGX8WrMtR6uSw319DKDJ6S
	gMukVyBn54P8iGPYFhc/MoIMnmmdx3zpgf9YKlkyAfwC5MmQfNiziNau+oZAO1MzIqueS06e7QGtO
	1RHlRO+OFY73sR2KkAq8P/jIDe/i2WN3uza2pslzLwxmAOGl284eWa2eog/EcWjhniHumX7ke2Ztw
	prcGg/vlsUyn69IGiL1s+CVNSoEg5uBzea6vqk/JLpbh/p2k/8Lnh0txPQyc3oVBbmIaiUeluNUFO
	Q5MYlo7x2iZa+SAL0u2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlv2c-00000008bMB-0h02;
	Sat, 22 Feb 2025 19:19:58 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlv2Z-00000008bLK-10cA
	for linux-mtd@lists.infradead.org;
	Sat, 22 Feb 2025 19:19:56 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z0cJM2lr7z9snx;
	Sat, 22 Feb 2025 20:19:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1740251987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5b6ehKCWNH72ToV9CKBN72vhsFPXWtjWbIceXxBIUQg=;
	b=C8qqaaTNpnIbwIbem6hbEmowvFzu34PishhG4VM6bU1Q0Ku6S15gIiyKty38oofGAozrRs
	YrXzjmDm12VvU9q8rOujPZfvAQe1H22HGWI4E4WHelfbUasdCVKAFkwaMP/0fzpqx0DNZ7
	qxX7J9EgnXI2gP2mRnA0/XxiIgKvduVx+YbJW82TNoBz80BW2NPndLEBvwrrm6mm+v6EGt
	TLE1udKEtDLHbLNmi4t+bkp5AXp1qKeS4LAh18nAAPofWp2LGJiEPpxYi3OrCzc1YR4bRs
	9NPbAD8lEWbzlrc2cnVRv/N/jcWzOS9z51Djx1JkW5TWLkKfoi6odcRa5sldzQ==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Sat, 22 Feb 2025 14:19:43 -0500
Subject: [PATCH] mtd: rawnand: use kcalloc() instead of kzalloc()
MIME-Version: 1.0
Message-Id: <20250222-mtd-nand-kzalloc-v1-1-fbb41db6fd8e@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIAE4jumcC/x3MQQ5AMBBA0avIrE1SgwRXEYtqBxOUtCJC3F1j+
 Rb/PxDYCwdokgc8nxJkcxFZmoCZtBsZxUYDKSoVEeF6WHTaWZxvvSybQaqNUVWWVz0VELPd8yD
 Xv2y79/0Aw7Y8gGIAAAA=
X-Change-ID: 20250222-mtd-nand-kzalloc-29cc08138b24
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=yOvvdjiU0jdJ3UdjDOTfD6mRKuTsj9mR2aIGQknKyaM=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBPOVM5ai9XOTIzbnYvUHlpOTNtQmJML0NsMlZVUzNOClZleVhiY2VlMHJCN3J2OUZl
 ZDZPVWhZR01TNEdXVEZGbHY4NXlta1BOV2NvN1B6cjBnUXpoNVVKWkFnREY2Y0EKVENUZ0E4UC9
 6S0NjL0djdGgyMGNMSyt6Q3kvMGxQdHlZNVBJeHlYQlA5dkVuWVhMUk96RkdQNTdtOTI5R1RIRg
 pvdittMHNFZGJXZkxObXl1WGNvZkdIRlBndDh6M2FScmtqOHpBS2tHU2RNPQo9dDFVRQotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Rspamd-Queue-Id: 4Z0cJM2lr7z9snx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_111955_545912_00E94AB1 
X-CRM114-Status: GOOD (  10.25  )
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

We are trying to get rid of all multiplications from allocation
functions to prevent integer overflows[1]. Here the multiplication is
obviously safe, but using kcalloc() is more appropriate and improves
readability. This patch has no effect on runtime behavior.

Link: https://github.com/KSPP/linux/issues/162 [1]
Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 drivers/mtd/nand/raw/nand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 53e16d39af4bf95c16505e0b528da1f3ba832010..13e4060bd1b6a1a360d430260b881edc8a3abeff 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1833,7 +1833,7 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
 
 		/* READ_ID data bytes are received twice in NV-DDR mode */
 		if (len && nand_interface_is_nvddr(conf)) {
-			ddrbuf = kzalloc(len * 2, GFP_KERNEL);
+			ddrbuf = kcalloc(2, len, GFP_KERNEL);
 			if (!ddrbuf)
 				return -ENOMEM;
 
@@ -2203,7 +2203,7 @@ int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
 		 * twice.
 		 */
 		if (force_8bit && nand_interface_is_nvddr(conf)) {
-			ddrbuf = kzalloc(len * 2, GFP_KERNEL);
+			ddrbuf = kcalloc(2, len, GFP_KERNEL);
 			if (!ddrbuf)
 				return -ENOMEM;
 

---
base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
change-id: 20250222-mtd-nand-kzalloc-29cc08138b24

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
