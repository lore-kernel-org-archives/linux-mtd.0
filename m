Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B63E8537F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9w7E6Yn3V5sXB/iFvxH9OwvHzettYnUA1jjtaH/97us=; b=10yEi8/ESToier
	hdVdEr2QottOXVTBAhvFHZMX8IhI/eTtu+YG2+G0kEDlbnJXQEkXFIx25rlhP/Wgq797WxSbV2Z3D
	QSWl9d0IQ5oaTyfWh+qVPf1Ef6sXjS5ScGQnstaj/qHzPVJAuxjIkNpwuv2cl9r9pOCvBWLU8YUz0
	zul51byv0CPKZr+EhDinnjED9D+OE+H5DRTgWZFFn5hWXiaKMMXTh7OlkiOwFvz/0I3ovnuqVJbgn
	fPTsHMGQJNMRxB2MdIOG0CEwhr8/hsMotLL7JNXDNzF0bOttyKHCzhyqHY/VvmIqdD0HPVGwVLGJ3
	x63L+jBbgZgRjFeLhBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5t-00000002Gyw-30Uy;
	Fri, 03 Apr 2026 16:10:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5q-00000002Gsy-07kV
	for linux-mtd@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tFedJhlwMXaI/keWu4o5kk0Lj8Dpliq7e9ukabUVktc=; b=qTz5oSSDumTCumDm99um27KAfm
	Hcg6b5x3SM59Nh+WEv2D+Lpyo+bJ3mhINbEhe6ZOZizg4Tvk482vZBTsByPWkt6h6g/KHJlBTF0Te
	EqkvJrhLxKa8qxU6hyu8J9IOAPHehvgBQjW5WlnAm7lr4wQMmkFTkIIvs4/RDfZQsdtgLsNU4btTw
	HTYF6ykaf8RHhJvYS6ia5tVPRRyN/7NZjKFxPcgfoinM3YtfEEFhSTwtNWkG1ibK6hWSXPVMgHRZ9
	u00Q+kpINM4U7WrKU9PUEMetQ/AeQHN/15+Nn3ozBzYfFso1rW73gG3rSgGVuVx/W4Oh8d7d7iSBp
	qLbS9aNw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5m-00000004OKc-1g4k
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:09:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 47EC81A312B;
	Fri,  3 Apr 2026 16:09:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E72F603C1;
	Fri,  3 Apr 2026 16:09:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52F0510450103;
	Fri,  3 Apr 2026 18:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232592; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tFedJhlwMXaI/keWu4o5kk0Lj8Dpliq7e9ukabUVktc=;
	b=lvA4n3WWkwT+4QMF+Rrao8+Z7oiN4v5mOxgXfzmPLYv4BJ+sMBFUM3JFq7QphWgVyL4+/X
	/sSihHBKuCalFojGjweW8+QBvVNLbWWYMLz03xX8J6fQYMznczIaHwhjoMGdJewqRqzuTp
	4GqzuTbaAePzTVkXhOrD47J/HEFnhpJY4fxDHMGQrCyhL9hvNroEHxA5A7sQxif0DnlzaX
	KDFtVOc+mfDJctN3JF29BIK6K5TBwraB3p+jt4fxI2IHuKgsciwtuK3YkYAowEFhKxP+sE
	CqU3/3LGmEdQMiEZvfgzOM4Ag1dqn29q2eGhZAATSgaWDCnsADlW5gC5R2cSaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:25 +0200
Subject: [PATCH v4 07/27] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-7-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
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
X-CRM114-CacheID: sfid-20260403_170954_554331_FA024D79 
X-CRM114-Status: UNSURE (   8.57  )
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
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
