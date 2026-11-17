Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26964606A32A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vpNM7jFV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iSc8KB3k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FTeZYDGZ6L6smaHw5PIxLfWoM8+w56QHO93CP3YXNuE=; b=vpNM7jFVzFGI/NuxWOjALPmGes
	92yIdlDzYxtBE4c9jWwcmUhh68pNTC0Az8MXWVVChoOC7iCGxsA8xJF757RnS0CMWBgRmYbYAAxDU
	Gd0NKW3h8sFRHH3ccyojZeOJk0Xgp6ixT4x78LrfJoRW8S7uO8VKHx73Nk+cxLsrjKLPcZ6xbGeEh
	K6JORxweqDUsaDuQGzeQxW32fzThq0egwZTm69t6hT/cjj5NkWzu1krHH1WIqyYkHWccZ/OPbrYCE
	aOOQ0PHqKVv4lRbQ0Que0didPyvyxtlV+6oH3AMS7BLSUM2ZhSJ/BWPhpn45FT9YgfbySs/E6DVZF
	XQ6RjT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdm-000000056sr-0qAR;
	Tue, 17 Nov 2026 09:38:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdj-000000056oz-48c7
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B683C4EDBE
	for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 09:38:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C0965FC81;
	Tue, 17 Nov 2026 09:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC65F11BC0493;
	Tue, 17 Nov 2026 10:38:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908289; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=CZ87Wox43t0Jo/dky+kjMqQf6H/f4c/RMbSUMAnICCw=;
	b=iSc8KB3kQbTV/BByqc0IPv8ejI7dg0oV1b+7qodf4ShocMFu1pd2p535z93aaGnhsziu0J
	4e8Lu5Ah33hm3y3PxKE/GS2rV1bSiMCtmRGKpu71BXpmR+5UA1f1+wn7rVCAhBq94pNEnT
	c6Uw51Hv1ibeohFGzWQ7Od2OxHJBCsi9QyxvTYvIVQD3z7gHnl3pYFI4KoFrcbuvR9o4da
	QBa/VKg5eNwOKGaZ3U6fl3j7S2V8SBZODzHU2FvmZY7Uwe2sKLkEN3mQU+0e4QTypSH7sJ
	oGL3Zi/ae6UcvhAZ65SgACzbdUDU7PnI3Dt9b4AFlQ5M9WTDOLtvdpPeueWVUA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 04/12] mtd: physmap: Remove #ifdef guards around shutdown callback
Date: Tue, 17 Nov 2026 10:37:42 +0100
Message-ID: <20261117093751.14988-5-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013812_204649_D0334F61 
X-CRM114-Status: GOOD (  11.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

physmap_flash_shutdown() calls mtd_suspend() and mtd_resume().

Unlike what their names suggest, those two functions aren't related to
CONFIG_PM, and neither is the platform_driver.shutdown() callback.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v2: Don't use pm_ptr(), and rewrite commit message
---
 drivers/mtd/maps/physmap-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index dcda7685fc99..672747890972 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -600,7 +600,6 @@ static int physmap_flash_probe(struct platform_device *dev)
 	return err;
 }
 
-#ifdef CONFIG_PM
 static void physmap_flash_shutdown(struct platform_device *dev)
 {
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
@@ -610,9 +609,6 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 		if (mtd_suspend(info->mtds[i]) == 0)
 			mtd_resume(info->mtds[i]);
 }
-#else
-#define physmap_flash_shutdown NULL
-#endif
 
 static struct platform_driver physmap_flash_driver = {
 	.probe		= physmap_flash_probe,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
