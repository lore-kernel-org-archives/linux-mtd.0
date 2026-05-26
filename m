Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0D3CD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9JkuzC6H088Z3QTsspqLLoXgn2A3YFs1q7hMLr23lE=; b=YGQA1yZGdJqYKV
	hcztNzB/b/VPe2Ykq2FRZk5FyO6H0kOgAI9/x+FzGQC+/GP7TxQiMiUITiJsJ3F64dZmRKpdG1qYu
	5Ljh8lVi4ubmoeQJ2O/kxJnyG5Z4/B85+/hWRfLpaC6TzLPkguM9KSG+DbeX4OZq03v8to1JnWb9P
	wZTqZePyilBCf2i0DiVxx4Mx10nWva1+LVVRQInY6oIHbi7WF7fUhi90eLIrW4HHSbYXAfA6EiYWn
	PNAZjTXRcCqqDUDF5x7x4ulZzWjGM6HEDdNHSA2oSdi7v5wWgh96VIOX+rzUdMHF/+LNvzar2745L
	p2dDZkroCuz03cbsdSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDO-00000002FTI-3QBS;
	Tue, 26 May 2026 14:57:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDL-00000002FPw-3b97
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B96E1A36C7;
	Tue, 26 May 2026 14:57:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 506566073B;
	Tue, 26 May 2026 14:57:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C023108888D1;
	Tue, 26 May 2026 16:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807421; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iZVfwXti7mgN9Olb9lOr+m0/DhUZ8APrEW8sGpVUAYk=;
	b=UU+fmt/4GQ50P2IDxoAbpueD3idCqNLIRbvP31PhuXXkj9caJn4JnGbE6Z6VWA7dYtrnIv
	OIkGVG86xL6essWMcMQhueMhfRQT0hWejV7DXJ0djsv9KvDZEFSdmsSyEzaKNRb6+T/bkU
	KnExbWVfV5L4vxo2IktNdG9GIM4a02BYbEfKGPWd2lP8UhkSZZvbPh3rcB8rD8MrJHzgmI
	QfwP+TCOCohVZ8VXc1O/K6vND8Zyy+Jj+w+FrbmjluWHETk9icyqBcsmyv2PrBjtal2yRP
	2B8PALm/PfLE0BBTK0FBMySgf/4RBX0ozqHr5KfROm3rEM47Ud8C90iapsCGuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:32 +0200
Subject: [PATCH v6 08/28] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-8-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_075704_045686_34804C91 
X-CRM114-Status: GOOD (  11.08  )
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

Add more details about how these requests are actually handled in the
SPI NOR core. Their behaviour was not entirely clear to me at first, and
explaining them in plain English sounds the way to go.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
// Lock first 8 blocks
$ flash_lock -l /dev/mtd0 $((0 * $ss)) $((8 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff |   locked | 8
 02000000-0fffffff | unlocked | 56
// Unlock exactly 4 blocks (doable)
$ flash_lock -u /dev/mtd0 $((4 * $ss)) $((10 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00ffffff |   locked | 4
 01000000-0fffffff | unlocked | 60
$ flash_lock -l /dev/mtd0 $((0 * $ss)) $((8 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff |   locked | 8
 02000000-0fffffff | unlocked | 56
// Unlock only 3 blocks (impossible) -> rounded up to 4 unlocked blocks
$ flash_lock -u /dev/mtd0 $((5 * $ss)) $((10 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00ffffff |   locked | 4
 01000000-0fffffff | unlocked | 60
$ flash_lock -l /dev/mtd0 $((0 * $ss)) $((8 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff |   locked | 8
 02000000-0fffffff | unlocked | 56
// Unlock 5 blocks (impossible) -> rounded up to 6 unlocked blocks
$ flash_lock -u /dev/mtd0 $((3 * $ss)) $((10 * $bps)); show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff |   locked | 2
 00800000-0fffffff | unlocked | 62
---
 drivers/mtd/spi-nor/core.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e838c40a2589..65bb4b5e1e2b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -279,9 +279,14 @@ struct spi_nor_erase_map {
 
 /**
  * struct spi_nor_locking_ops - SPI NOR locking methods
- * @lock:	lock a region of the SPI NOR.
- * @unlock:	unlock a region of the SPI NOR.
- * @is_locked:	check if a region of the SPI NOR is completely locked
+ * @lock:	lock a region of the SPI NOR, never locks more than what is
+ *		requested, ie. may lock less.
+ * @unlock:	unlock a region of the SPI NOR, may unlock more than what is
+ *		requested.
+ * @is_locked:	check if a region of the SPI NOR is completely locked, returns
+ *		false otherwise. This feedback may be misleading because users
+ *		may get an "unlocked" status even though a subpart of the region
+ *		is effectively locked.
  */
 struct spi_nor_locking_ops {
 	int (*lock)(struct spi_nor *nor, loff_t ofs, u64 len);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
