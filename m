Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5E4C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zI67GY8IEl5FhOa0rBNd0y8WZegF0n8lRYeW7d0pcM8=; b=M2MtX24jREb1wY
	niP6s3YdrWutU8gy+IqZGWUT/RLvwHm2hpOo5dFFTnajfGM5QL1qL8Iye8ac3exhyFPOXKhTrd0Ym
	83dmMs0LlblJSxXMA7j6W2RKJSG4T7Py4KtFgSmKPaQUxN/zJpbYvxJmT3dnr2/bsrnU95fd82CnW
	fAfi2TFK9EiZGRIPBtL/hKWKDkFugpSVUTrBYPn4/MLDGIYEo7cw9G76taVTVooMU2SrtvOOiiW0e
	nD8iqXYkdl/93uFWo48rGhbsZxN+PlY7UI9n9p2tgab9KrPD2/xkXbn9wP5Cej1FiJz+0VaHV0bLJ
	uonp/J5PobgvuBmjdRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZo-00000002rCV-2uzz;
	Fri, 04 Sep 2026 17:19:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZm-00000002r7Y-04v1
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bqlhbAubgWuqU29MNBuwd9nih6Xl1orrSpLe2WsNOyQ=; b=IAbUuQYRzxaZ/0DLRHijTDjgsc
	2A5NLq/xdBbTEAO0b4010Zk8Ct9KjAoLKY1YyRtXyC4EYWofmgOE4aAV1pdfJ+7s/2Apc4WjzfpeV
	9Fh0NQYBVdFZLd44Y0VvoJLFAz8lDxy10atX+31Mp2bk1AM8xw2jJwp7lWdHg5WWeIumJJ9qce4yM
	0S8Z3jv2YrZ+FRZiX7gq8DZHz4MLu6KFHUBH9NgujiBlgP+lslvjqnQ0nyOsG+RmR7X11YmM5/okD
	1j7+WcNIpT/RwsgFChHSaV/dzJbkq6kc1Z1qshNNB6lXlQJatahKVLs8PzbgwYCpjzLrvCuTaMXiv
	QsioD6Bw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZi-0000000EKvf-1BMK
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C6B34E41516;
	Fri,  4 Sep 2026 17:19:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70A6E6057F;
	Fri,  4 Sep 2026 17:19:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF67B11C78705;
	Fri,  4 Sep 2026 19:19:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bqlhbAubgWuqU29MNBuwd9nih6Xl1orrSpLe2WsNOyQ=;
	b=oDxB9rL+Jo/ZJj5UlKlAMwi6Fh+8AQ7goQ2EkWpHIbg0taZxIyNXLgDnNc8gTjQXqazTP3
	NbqycRT0J0QkNv2hcNRRv69F5XwhUuqtk0XBatgk8CgDqEhSmzQesXwPlKa1rc37uN1bOO
	qxu99gJXPWVv+S1RcSRMlQHLYMfUXi+WsFW0F1FGBClrZmF1C/v4YS2PwO3siY4T+BX8Ls
	obaoh9/zrdo4skzIB2Mmm8BVaGdQY0oJRM7TNks3PlL9O6hh3p54TipR70Bn5PjpsK/fZm
	XnqQwbxhw6dSJXirNq0o8HZe4AxH+BStpSGznfzu59RTAhKpLSnMe+2mSTdxJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:08 +0200
Subject: [PATCH v6 15/26] mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-15-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181939_362397_7D245CB1 
X-CRM114-Status: GOOD (  13.88  )
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

The SFDP table does not advertize the locking capabilities of the
device, flag these capabilities.

The CMP capability was historically not supported by non-SFDP chips, so
let's make sure the bit remains disabled for them, for backward
compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ alias show_sectors='grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0
/params'
$ flash_lock -u /dev/mtd0
$ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: unlocked
Return code: 0
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_read
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_test
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff | unlocked | 64
$ flash_lock -l /dev/mtd0
$ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: locked
Return code: 1
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_read
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_test
$ dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
$ sha256sum spi*
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_read
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_read2
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_test
5b69b16c88c3ae48213c359d2f9fd7f0583e513dabb224b3404bc93a5e173253  spi_test2
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff |   locked | 64
$ flash_lock -u /dev/mtd0
$ size=$(cat /sys/class/mtd/mtd0/size)
$ nblocks=$(grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params | sed -e 's/.*
unlocked | //')
$
$ bs=$(($size / $nblocks))
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff | unlocked | 62
 003e0000-003fffff |   locked | 2
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last one
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff | unlocked | 63
 003f0000-003fffff |   locked | 1
$ flash_lock -u /dev/mtd0
$ all_but_one=$((($size / $bs) - 1))
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-003fffff |   locked | 63
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-003fffff |   locked | 62
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff |   locked | 63
 003f0000-003fffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff |   locked | 62
 003e0000-003fffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index cc428a11c99f..0bec3887b570 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -203,7 +203,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
-		.flags = SPI_NOR_QUAD_PP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),
@@ -522,6 +522,9 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 		/* SPI_NOR_QUAD_PP was unsupported */
 		p->hwcaps.mask &= ~SNOR_HWCAPS_PP_1_1_4;
 		spi_nor_set_pp_settings(&p->page_programs[SNOR_CMD_PP_1_1_4], 0, 0);
+
+		/* SPI_NOR_HAS_CMP was unsupported */
+		nor->params->flags &= ~SNOR_F_HAS_SR2_CMP_BIT6;
 	}
 
 	return 0;

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
