Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7578C982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewU36vlDlU8823Ki7eW28lyOM6kcCTloAVJPhKdMxu0=; b=gggOAVsx0hzgbO
	g+tyT559jubYX0Cyq6usyd7wWfRuPLRlQusur0UzbLIYXmfrIQnHgkrePM0NUbvbF0pm3TK3xSnIM
	ngPZ38hYS03qgUtuo7PW5P3naLLUabNPOJ+FS9P2pnt84Kabkt06BaXIg+VQu1bNPrCCznJ7RgNLY
	CI4m9ObtLhAtcrdzfS7q2h0aFGWODtUEdDNOum8VrYWYpW4IQG37TkpB1G+s/hZqSIaf8GZyx07fG
	5ByKWJJtBf0Godx4i0+xjVUbORGIY/q7VpqzE3/tyg5nKBEHIr/+TO0owbn3SnyGM01hwhqwnv+dS
	nL/3WZTFxn48Xmi9Fz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6N-0000000HXf4-2qOL;
	Sun, 20 Sep 2026 14:01:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6L-0000000HXcG-0iSh
	for linux-mtd@bombadil.infradead.org;
	Sun, 20 Sep 2026 14:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fyG6h/F5DGIOpU5ckjpkKd9PbF63MTcO+98o8dtj2n0=; b=J4I5kwoXIvayqQnBPWzZY78/1w
	U0ebe8FsuxJ7nc+WDg+8h7FCdoxMfCsEKLzcHkOuVcmp2GBvKKUO9/tKQpFHiPmlwIaBlzQqjEWvC
	u91fRMuFeME9u/ufVZFZ7T4oY8A3eOquqrGaaCiGhc8so1o0nvfVTygFFaEN5VKRlvb8Ry/tIcT/u
	hQlP6A0eaYZqfhWq36p9GGy650LOspHnGssMY3JC0n5/y3pvFqsIaQb6fffTm7FNysOUdOUeIDVgK
	2RUw8oXSJR2bl6DLrWhP24GM/v85Ec6r47VDYbd/0bEqhL4oJ4eNwUYQ00VGCHxDjx24VZOWXIHst
	6njabwNg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8I6F-0000000BPjs-0uBi
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:01:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 250071A07C4;
	Sun, 20 Sep 2026 14:00:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED9786033F;
	Sun, 20 Sep 2026 14:00:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0488210329071;
	Sun, 20 Sep 2026 16:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fyG6h/F5DGIOpU5ckjpkKd9PbF63MTcO+98o8dtj2n0=;
	b=kutltVmA6Q8VM+daXEd/lodcEhfkQcOq84sakVzzJbtnGaHdcy7SQ4cULToKI4KsO3rszL
	W1+Dwx2a5slxgGRwatkA/WMVeUNXXn0ngx8xC0Onwal8F/UhU0pABBBzRjovj/MXiS5fhC
	81Qpi2UBSWtevlgpbSx5oH2XZIyCUOBIFl8Jhp95GpVltCwLF7jPPkqNZ5hxJIk3kJFZbh
	f+OkuUqPD5IHXkqzYciIKomQgoaaZKmqkl4jsXrD0q06iiNUkTqx+b0L13paK4dctbGjr2
	1ajLkd/BWMmbKbAbLSqZ7yTP0CThUw3wgtfkWaINasX7Bj02O8VMVP3L7i4Lgw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:20 +0200
Subject: [PATCH v2 11/25] mtd: spi-nor: winbond: W25Q64JW-Q/N: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-11-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_150059_596882_0D34B6EB 
X-CRM114-Status: GOOD (  11.16  )
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

The benefit is not massive @25MHz, yet it is a supported feature
of the chip which is already handled by a flag, so let's enable it and
earn a few % write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 707 KiB/s
page write speed is 699 KiB/s
2 page write speed is 703 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 735 KiB/s
page write speed is 726 KiB/s
2 page write speed is 730 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
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
 1S-1S-4S
  opcode	0x32
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 022fcfd05da2..7e79a415db4b 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -334,7 +334,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x17),
 		.name = "w25q64dw",
 		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q128FW-G/Q, W25Q128JW-Q/N */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
