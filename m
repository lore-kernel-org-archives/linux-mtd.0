Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96828CC6B19
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmedCQ+oay0JmsEJy8UneFXYBJllzYG7gMP540OiHUI=; b=QP0EsQYrW3r/de
	0FEBGfsICbIaHEMPeQvxZSMir/G6NaVRbdO+/nP899/fgwf1n5WPrXQIAXduhSBWrYaI2bPuIvvAE
	b8WaT8YddUdjHIWjvCtGCUrErEVs1BO1ncPV7XLEsI9edsqDg/lDZHlofBeZ+9PSF2tZhCeMoEdJD
	Kzam58tS1XijOMBSK7gT5xPzA0JCxVBeR8V/EiODYqd5NqfGWlaTYI+6NwzwPAyZHQmrHvbONxskS
	+JHMZiSkLCtfUX32XTyvu0rr8VbgHod00DXilaECRvjrh4Spo1Y2lIHMyKTEUnQE1pLqhdAMJRnV5
	h1XTc1aTRUTo5NCQndtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSi-0000000DX3B-18UH;
	Tue, 13 Oct 2026 16:34:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSY-0000000DWzT-1JT1
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27888C653F7;
	Tue, 13 Oct 2026 16:35:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CFA060362;
	Tue, 13 Oct 2026 16:34:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F8C311D717B4;
	Tue, 13 Oct 2026 18:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j/cXexyZ7T30AM1csq7xc9wIhMFboTJ8migmpErDMkQ=;
	b=WuyHtFaTySo2iv/SBA20f+Gtj11qdNir8FeHbWfBtcbrnNt17uBbzXJBOU+HCVK5PPkYxT
	nrzBQaT/d9N/Otm3iiiPCRA/DAH3Jx+HvNXZwm+K3vfetl8LA+ESiS/kgAtsuMYtZ1bc0V
	TmQS83IT00p+LksJWzNzofPxA0WxpAWeN5T1z1zkxG8d0ZtKQcUV3Fe7GIvPYaXAlw/obG
	upGx/wzQL2cVluImdIQ7ElyGMOvp43fRmuPy+x30wMW8Ne1p7gBmq+zsoqlYgKNNo+qroH
	VsViiDS0n34iMazGKgmYZaW6Mv4Bjnm0KJKqzS0nEc1D2UWbaXI1k/bTBaigUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:52 +0200
Subject: [PATCH v3 02/17] mtd: spi-nor: swp: Fix SR2 initialization
MIME-Version: 1.0
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-2-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093438_522538_5C6D79F6 
X-CRM114-Status: GOOD (  11.26  )
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

The purpose of the original change was to make sure the SR2 buffer was
returned initialized. One of the goals being to be able to compare
it. While iterating over the implementation of this function, I believe
the return -EINVAL that was initially there has been turned into a
return 0, which does not completely make sense since we already return 0
just below.

Just make sure SR2 is correctly initialized when returning from this
helper.

Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 7e667e4ca84d..6c56fda3913e 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -223,7 +223,7 @@ static int spi_nor_read_sr2_careful(struct spi_nor *nor, u8 *sr2)
 		 */
 		*sr2 = params->qe_mask[1];
 	} else {
-		return 0;
+		*sr2 = 0;
 	}
 
 	return 0;

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
