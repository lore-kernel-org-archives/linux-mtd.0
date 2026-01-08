Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4F7D1D478
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gLYYZKaYiJk26By7Mm1VobXsD3dfM0AgmXOuVKGoFY=; b=VPpqY+D0JNBfOx
	u6KQrrGVzMqpZNyRjkWpj0UAFDw6+ikEFMtn73lwVxXXgkEAvDRUIdJYDe/BsDA8vFWvfaaoLi98g
	R0w8Qw67vrNsGhH98ZKqJnnklBvVF5sXlrlmSuli99qhMultoptttDhA/qmFZUX5E0UqIKQO5PjvB
	CTl+As6gfKHWswT4dozQzZEY7pz1bVOJJ4NUzwftRe7ydCKAy3J9ek/+pNOXtSa1LuC6JEz2y/Zvc
	SLx20aMLkDsn2gVrLAG3j+U15v7IF4ygyN54SZ0Uu1v0iGaNci+vO1lEd9898OD/xXsChPTNY95wy
	PEJuGU7HZL7ecAMpqkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLo-00000000FHa-0b45;
	Thu, 08 Jan 2026 16:59:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtLh-00000000FBi-1wms
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 16:59:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 12A024E42000;
	Thu,  8 Jan 2026 16:59:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DAE496072B;
	Thu,  8 Jan 2026 16:58:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FB31103C8826;
	Thu,  8 Jan 2026 17:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767891539; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uBSfAslupKiDUjYa9VdOz+tUE+1u7aYrr2OFADafudU=;
	b=p5TMnORkhvGqujqrzItf79wUsWyjUlCV+E+vju41eFJ++qmKaf4qaWOLk+009IVSmHZrEG
	L08bNaOVOOBr1e8U91J3p2l4E9+a79klICA+OMCk467mwon+9Iu5M209lRXDsYYUdLtBNh
	zyOnba9EqmmpCRcnGJ7OycYQL5ImNaSC1nmvKb0K2oG3BBBFKt0ss1tBKAEok/12HDjjyy
	oHrUMaW1Jfvd3LM7Dxu5Htba64tM0F35+B3/ub5AzJHtmmaXC2SJ4vLTL2XtcKTMvkvCqJ
	O+q8MHEwJfsL0pwsU8ihQ9/2FxMlOlcF6mj3LArL2zotoSgd8aHCRkQHNyZrtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 08 Jan 2026 17:57:40 +0100
Subject: [PATCH v2 07/27] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
MIME-Version: 1.0
Message-Id: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-7-c462ef806130@bootlin.com>
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_085901_940888_0CDFFF9F 
X-CRM114-Status: UNSURE (   9.82  )
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

Add comments about how these requests are actually handled in the SPI
NOR core. Their behaviour was not entirely clear to me at first, and
explaining them in plain English sounds the way to go.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 1d50db1ef1a0..64a917543928 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -346,6 +346,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
 }
 
+/*
+ * These ioctls behave according to the following rules:
+ * ->lock(): Never locks more than what is requested, ie. may lock less
+ * ->unlock(): Never unlocks more than what is requested, ie. may unlock less
+ * -is_locked(): Checks if the region is *fully* locked, returns false otherwise.
+ *               This feeback may be misleading because users may get an "unlocked"
+ *               status even though a subpart of the region is effectively locked.
+ */
 static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {
 	.lock = spi_nor_sr_lock,
 	.unlock = spi_nor_sr_unlock,

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
