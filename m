Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDB2CD6E56
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mf/35/jUtdB5ZNm4wY6NA9HaQLdcyrEQmZ6R5bs5VS4=; b=S75TSYXDQ3X6oo
	Za5jsP2dPb6tA/ChUsnZU/8BWp5BMACkUJyqVA3S4FH1aCljteSNgjPpwYIQ3klKyvgoB5843SmXQ
	yVHGCCAv/OC6PNtqSfIWOfwSwXOmuYwr+EY5yii8LVVqRkmqknfWnGzvE+mt3EoYauVgLE1+hz7tA
	chDETqkbUdwPkt8aDcv/gi2UR1kNuMe8LovYboqCcHel8Mogfwoh6q4Def4Z6iV+H1OnLBfWEMA1p
	Nfn8YRVzm9M4QT7BXLkFlFq+YaCkljVbRiocrYoV+wFeZ+RormvI4HeugfO2Vuj2fNO5bXGDf81Oe
	929eH4CN9zGhCe+ZB/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz31-00000007fH4-14lV;
	Fri, 29 May 2026 15:22:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2w-00000007fCp-0zo6
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:22:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D33B51A373A
	for <linux-mtd@lists.infradead.org>; Fri, 29 May 2026 15:22:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A250A601FA;
	Fri, 29 May 2026 15:22:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBFF210888CD5;
	Fri, 29 May 2026 17:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5zhdANzp5DoAG55BOQ7zmeZdLYq6QkMMT4qZ1lxHZHY=;
	b=p4CkG2hdupfiuqfStVHk2Mybd8xHUcwVVN5pCqQaVKSo5nlgDOQEaDJq4KobGNYz1SK5al
	6BaCyEly3fNDi8BGO8vru1TiHt11AY4vJ/CWV2x0Igbk3NvFMHNIWFe6u0wGL1vcstwvwE
	n8yTnyBe5xhr3Km39OuGrytyFE7fAYiSQEdAyHkzUinn0YEyLyIfw96jmwR2UkloRJ+X/Y
	IRjR1jYGePNNYN2L9hJZkx0w58HWZR7tGq9LzivmIKZi16+N07cslm1QwdYJ9mNlFPuoPx
	EOHDSe25s3uQ9iP2FjAsaPraFSRH92vDsOs+BdG5bfRCJloN8hV+1A/On0eDdQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:25 +0200
Subject: [PATCH 05/30] mtd: spi-nor: winbond: W25Q32JV-Q/N: Drop redundant
 data
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-5-87e5d3122244@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_082250_412096_2489192E 
X-CRM114-Status: UNSURE (   9.05  )
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

This chip has correct SFDP support, all fields are correctly filled so
we can drop them from the table:

$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 40 16 00 00 00
size		4.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | HAS_16BIT_SR | NO_READ_CR | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

[...]

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef4016
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450050100ff00050110800000ffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0144eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14c2e96376337a757a75
f7a2d55c19f74dffe930f880
$ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
e002d5482ce24cecf678c171745e3e90b7fb6cb588739ca63151ed333b09b35a  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 40 16 00 00 00
size		4.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | HAS_16BIT_SR | NO_READ_CR | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

opcodes
 read		0xeb
  dummy cycles	6
 erase		0xd8
 program	0x02
 8D extension	none

protocols
 read		1S-4S-4S
 write		1S-1S-1S
 register	1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-003fffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff | unlocked | 64
$ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x03
  mode cycles	0
  dummy cycles	0
 1S-1S-2S
  opcode	0x3b
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbb
  mode cycles	2
  dummy cycles	2
 1S-1S-4S
  opcode	0x6b
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	0

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02
---
 drivers/mtd/spi-nor/winbond.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 4300f0419f13..524c4ae565c2 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -200,8 +200,6 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q32JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x16),
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
 	}, {
 		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
