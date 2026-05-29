Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCEBCD6E4A
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjlUhtnEsBJhauY1wjR3+Z83vMqPzBuT4X/yfnsROzM=; b=wODuUDsyGARa36
	Zqdg7uKJyuODzsPKmb/h9ldAXVzeWmJUDYQ0armhbGdgFh02XM+GEJ0UBVJ5oGzpBCpZN8enfLvuj
	q2XEr2DJ+0PCobqIGOKpo8PjMzETWCocUTKUT58KxqRDr9yBs44GYzxjAwDYkwqlIzl6NiMiyTKZW
	ejNJaB0r4B4FKRDrXfAuMXmWGhLHGGEmE+UamK0H38hWCiV89wBNYdqrnwftSNp2UbRR0qQcYUDps
	uM6Sa5vvSatAbwT+tjFssXNVHXDOwNtk70r3ZYj7F6xLTIfR+paefHkC7rmuJGuzvACIWLn4sPKvc
	aa8bOy7OAn6EUOusRXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3Z-00000007gCM-3mUz;
	Fri, 29 May 2026 15:23:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3Y-00000007g9I-29PT
	for linux-mtd@bombadil.infradead.org;
	Fri, 29 May 2026 15:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=e7PYvw/mcdWD1pSzU5NrKhgjpHMePQN/D/onC8gCFqM=; b=Jfc8kEXUVPhac8j4syIHMowrnU
	4KzNlKRsUKoBEY/5bamqE+s1r8/ZKbif9Any3mrSgXIbTC206puHFTy3RONmS4swGbJjZ9HSFp3RP
	X76zXC9wTADBJ45vPRA+HZEUhyGMxc1ysfWlhRKN1so8wPXNjQitACqWCJannKYZSXUe3cU0Rg3c4
	3UDpNTT6uKmzoPTeNr9GfyTzzXxJMzVV39x3qRo56mf8vb7zMiZ4sStCpZp50zL8Q8JUleKrgIvMq
	iUMHdoPIkfF/y4ezXl4+wK5bVXMJ5zmXQObwxaVTqfBTVs3kgy+JddWrFn03/eV8bZ430Q88a72Yb
	5HLzZNoQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3S-00000001ftG-1fsc
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:23:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1616E1A373B;
	Fri, 29 May 2026 15:23:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DED9C601FA;
	Fri, 29 May 2026 15:23:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1032710888CCE;
	Fri, 29 May 2026 17:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e7PYvw/mcdWD1pSzU5NrKhgjpHMePQN/D/onC8gCFqM=;
	b=O/PWxj4UA+LPsaoauxl4TeiTvRZMohyVEVHApY0skxaSj6Trl9BQSltShW2sZWh69YhDUK
	mkGQq6eVlWT+6/i/smbWW344cI/DmhprK8tvALhZ6okUAlKYr8Xj4en0nNsS+by2MkKenE
	nDMNmSNNfS8kabhAT9OdnJm/39IGtaBEy/zk8+2DQNOPmcwDKpPj45pFDiwOBjCq9ITg91
	sf8HW6gZ+TNNAcjZckIny1IdDyOGCe74FEXTz1YQbfn7ay5JDo0aah3ZGTUL92vspzjjy2
	kXJYmf/QiiHmP3Znb+MJZEz9/vEyxeGcNg8iLUT+hF4VOTUng0uneNk9NZUzSg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:41 +0200
Subject: [PATCH 21/30] mtd: spi-nor: winbond: W25Q128JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-21-87e5d3122244@bootlin.com>
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
X-CRM114-CacheID: sfid-20260529_162322_826372_CAA9AA4B 
X-CRM114-Status: GOOD (  11.06  )
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

This chip does not advertise it correctly but it supports 1-1-4 page
programs, add the flag manually:

Before:

$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 553 KiB/s
page write speed is 548 KiB/s
2 page write speed is 550 KiB/s

After:

$ flash_speed /dev/mtd0 -c10 -d
eraseblock write speed is 1628 KiB/s
page write speed is 1600 KiB/s
2 page write speed is 1612 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
+ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 3715e269cb7f..695e1b2fddf5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -302,7 +302,7 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q128JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x18),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
