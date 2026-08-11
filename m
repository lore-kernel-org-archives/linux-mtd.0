Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE209C5B56A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 15:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lVfv1ovFALUQ+LRlObKsR5/k6ICJhyMb08P38uX6m6k=; b=Dg8n29R1VRqALV
	p+x3cWkqxakfqZcrQPtILRjl3c/NBXmhIMUYi7PIw/hJWwHzwT77LA40gHgK9LBqkESI3HonX609s
	/5K6j+nHLm1+vPMNjI8HnLSgDQNsDuYSvyY2gGuejY1jyTF0GBGL18/VaS+CNJUimTwHbFQGtImeZ
	CrFH/xo8nvdQotftDOGVc+Oj0uK+8Kl8EjT9Op9Yi3dwchNzargc/TnjvBZlCZcZ+bcrkNBdHEFqa
	S67vB2fhOXBpBkOH6+VYSSMZhIKiZeT6sDC7Gl24PWyvhKwDnIKNA0sdjDQbDqYa58r7hGRaoyYPZ
	SesfdVMdTDcZcZn7zyNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoqJ-0000000EPmK-3xcz;
	Tue, 11 Aug 2026 15:56:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoqG-0000000EPld-35rm
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 15:56:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C3B1C4E41104;
	Tue, 11 Aug 2026 15:56:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 886F46033C;
	Tue, 11 Aug 2026 15:56:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D713F11C48F35;
	Tue, 11 Aug 2026 17:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786463792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=sUAApDZy3TlhNssmNMcIyrNULeU6ZVOdmp1OkjzAjKo=;
	b=oxMhnriFxidKy7FBTEfY3kg0UBi9PtHQY6bNLRlOisFm6gPyq0htsBUXu25gLORpFEEsGS
	UUezthrqAQtAkI9mGsEwqeykCp1l5G8Gy9jnzRUQrdKZEtvbbFQS3tziAYDFt/4yH/zwT+
	EOKfSeGCvAck19dB9/rjCdB8aKhIh9nfhQP/QHb0/EPdhQTLsM/C0xtUq33uxkPY7c2E9J
	i3HhHL7p25hLZC5/AZAWDGEcQypQ+h942TFKQCV/8dUsflb6Jjuuz7lQUXtGFOWU6FXDKW
	LieqxAM3uTQiCdSFFZ1EIo5ywRuGVuHF8AuZJ1GXAgVY2cQT8YLnaNcQdFQ7Jg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 11 Aug 2026 17:56:23 +0200
Subject: [PATCH] mtd: spi-nor: Unprepare legacy controllers upon RWW wait
 interruption
MIME-Version: 1.0
Message-Id: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LSwqAMAwA0atI1gbaIvVzFXEhbdRs2pKACuLdL
 S4fwzygJEwKU/OA0MnKOVXYtoFwrGkn5FgNzjhvBmuxkGhGuS7c+CZFY32I0bnRdz3Uqwj9oU7
 z8r4fI5qHn2EAAAA=
X-Change-ID: 20260811-perso-rww-fixes-016cdd229647
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_085640_920594_7FD8E4F2 
X-CRM114-Status: UNSURE (   6.41  )
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

All the parallel locking helpers (spi_nor_prep_and_lock(),
spi_nor_prep_and_lock_pe() and spi_nor_prep_and_lock_rd()) call
spi_nor_prep() then wait with a killable sleep. If the sleep gets
killed, we leave the controller in its prepared state.

Call ->unprepare() in these cases.

Fixes: 74df43b3f626 ("mtd: spi-nor: Enhance locking to support reads while writes")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..250e996284f9 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1346,6 +1346,9 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_exclusive(nor));
 
+	if (ret)
+		spi_nor_unprep(nor);
+
 	return ret;
 }
 
@@ -1417,6 +1420,9 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_pe(nor, start, len));
 
+	if (ret)
+		spi_nor_unprep(nor);
+
 	return ret;
 }
 
@@ -1490,6 +1496,9 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_rd(nor, start, len));
 
+	if (ret)
+		spi_nor_unprep(nor);
+
 	return ret;
 }
 

---
base-commit: db5f6418501f9795a96026b764d747179a231b2b
change-id: 20260811-perso-rww-fixes-016cdd229647

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
