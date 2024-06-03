Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1B8C27C52
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3EyxrcWxjhiBzMIhQS5eJZmFnFkKh97HzuKLZ35s0Y=; b=e97VcEdRKakpmb
	U14z0xQfdinSWeQtsjfASA3BAN9oI2GNujXfxDnyCQAdKfZWw4lzJbTCEvIroGHwrVrPKd0//1Fgs
	dCBrGK9soFUr944jKY/xkNQVarp1+Yx4+ck3op0/IJndfkshrferTaRJhYE/K7KvlnAjHnU6GSQGE
	e1synAISJ3WtPwBOaJ9ojH4hcCJy2oAU244anABq8Ub15+EDmMIETcyonMTr0Y4eOkWffF52nrlza
	9tR+tfs/aAvB84WUjOY8wp7Vw6PzV0lsIXWcYgWqmtdHAbhczvJ3Fv5AOsTC3GS3fSXSEId4vl3oG
	Get50oGXogAX+CWpuC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7RM-0000000Gqli-0rCW;
	Mon, 03 Jun 2024 13:09:32 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7RJ-0000000Gqkd-0jy6
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 13:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=yWPnlogaHh1JsL53cSK4pYNGOrysHKRUndRnVu5uc+I=; b=X42HGf6fDs6AH4hrcHpFTigVUQ
	JXBhAayDNx6JW6H4at5aHlLCPGP2MEI3wn8YvMOR22uVY3txUxIyONQq+3lo5bM4LEufvzJFDou0y
	hHfUeCp+m5gF44noUEln3sMNjCVmp+psws+7Kj4Oyk67j2ogboIp+dsBu032A/3lRmFE/fL/S/ara
	lm+EZcywGMlgNi1IZbCoOahGx/vvZexFSH1JIkFnyIfv4ctDB5g9zQFc4LuZR56jcObETxzwNlUjv
	0FfdJyNFZC/XPrfetYVV/t/C9tOSw3ZjS+kp2RIdegdi008Npw7a/hwaL/9NHz0PqBFIFoiq9eIj1
	ygKxbjIg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sE7RG-000Jq5-Rc; Mon, 03 Jun 2024 15:09:23 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sE7RD-000OBK-0M;
	Mon, 03 Jun 2024 15:09:22 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 03 Jun 2024 15:09:16 +0200
Subject: [PATCH v2 2/2] mtd: spi-nor: macronix: enable quad/dual speed for
 mx25l3205d chips
MIME-Version: 1.0
Message-Id: <20240603-macronix-mx25l3205d-fixups-v2-2-ff98da26835c@geanix.com>
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
In-Reply-To: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717420161; l=2314;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=JrPkztMV1oVuJInQdJCGTwXrnR2sny7JLQNFMwZiGqI=;
 b=r2twQhKkwoLRO9cMomnNAR7zW1jlOojkKaQjaxiKs/NC9BJ0HTW+Q9gAyyyswv9wpH1yGlWfo
 iSRfVKgPE95AD6kemUU69utK5WxyRHanyPX/DbQbDTmjjaq++aFWYDq
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27295/Mon Jun  3 10:28:26 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_060929_694074_90D8410F 
X-CRM114-Status: GOOD (  15.53  )
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

Macronix engineers apparantly do not understand the purpose of having
an ID actually identify the chip and its capabilities. Sigh.

The original Macronix SPI NOR flash that identifies itself as 0xC22016
with RDID was MX25L3205D. This chip does not support SFDP, but does
support the 2READ command (1-2-2).

When Macronix announced EoL for MX25L3205D, the recommended
replacement part was MX25L3206E, which conveniently also identifies
itself as 0xC22016. It does not support 2READ, but supports DREAD
(1-1-2) instead, and supports SFDP for discovering this.

When Macronix announced EoL for MX25L3206E, the recommended
replacement part was MX25L3233F, which also identifies itself as
0xC22016. It supports DREAD, 2READ, and the quad modes QREAD (1-1-4)
and 4READ (1-4-4). This also support SFDP.

So far, all of these chips have been handled the same way by the Linux
driver. The SFDP information have not been read, and no dual and quad
read modes have been enabled.

The trouble begins when we want to enable the faster read modes. The
RDID command only return the same 3 bytes for all 3 chips, so that
doesn't really help.

Instead, we can use the SPI_NOR_TRY_SFDP flag, which forces the spi-nor
system to try using SFDP, but fallback to the parameters specified in
struct flash_info.

This way, boards using MX25L3205D will continue as before this change.
That is without taking advantage of the 1-2-2 that it supports.

For MX25L3206E and MX25L3233F, the SFDP parameters are used, and they will
therefore be using the optimal dual or quad mode supported by the flash
and the SPI controller it is attached to.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/spi-nor/macronix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..090f28e05a5d 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -61,7 +61,7 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x20, 0x16),
 		.name = "mx25l3205d",
 		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_TRY_SFDP,
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x17),
 		.name = "mx25l6405d",

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
