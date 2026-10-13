Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF92CC6B19
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaGxNAD3tgMLzqrAq/NYqflCa65bChfbt6Ercdaav34=; b=Cr0I/CIX8p6RSb
	uahABvbK84GcqKwqkchlmvzj6xJ2+wfNiSOHQsGkUKQmNPVp1/aXF6iLL2wWDqOHRQfwamogbDu3L
	HimOWvtjvG8C4ab/iHlDrnWIEDUpN7tVxxdscnfsVH3IjBS2GDZ9rqYg6ZaDSxRrp6cF5gFZDzTuP
	uAhRmuK3/eErEdx4IdgVquaUeDX0TMVZmEnGccMw5VlidpysJcFpbMFIIdwSImMxLtsjISJUrS4c+
	f1c5OPf8Ih19y4F1gUw6pnvXehX5Il73tkSX5EH0rSRyF16ioryWQGZ/yBNAuoaaSzWtrglrfWy47
	SW1Zb7zimNoDhYsR5q9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSk-0000000DX6A-3L0w;
	Tue, 13 Oct 2026 16:34:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSb-0000000DX0E-1Wi9
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AB2FA1A1218;
	Tue, 13 Oct 2026 16:34:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8030A60362;
	Tue, 13 Oct 2026 16:34:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B684211D717D2;
	Tue, 13 Oct 2026 18:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ear8Ahh2j2AUiHu3vy3cVps1i5/MTD54IMpodJAajE0=;
	b=Un1ZGeDo+v5uZvuZLUUztm0Ihm2gkmU4S+FyxfnYZASvaAMZKYrJ+4qZPXBeva0IrmmwY8
	cjo5/tlRmWNRcdYYuLAVzXtPoAgAwuQP/XC0P8Nq5xNMxiiSehRGHElc9ywrQe9PoXB9vc
	LY8Fi9b5qd2s8aRrWOFLgmx/ZThZB1OnX8+ei2nss9ogrSB4d/4wXEcb213QCfhfr0K2nF
	gsJdtG955CgiCh7YZijjgLCQRckmfZg4XhLe0SkVH7iWo8tJYa/kcdNOLC9MNj8itZdLT9
	x1izQ0rOmozphVi8593Du0VyaU/cJwY5DtUH+mVzbF6SNGRX7euNqJWsVbWNBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:54 +0200
Subject: [PATCH v3 04/17] mtd: spi-nor: Fix comment indentation to clarify
 the intent
MIME-Version: 1.0
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-4-6dde1d513df8@bootlin.com>
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
X-CRM114-CacheID: sfid-20261013_093441_990944_B00ADE0E 
X-CRM114-Status: UNSURE (   8.69  )
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

The comment is misaligned with the content it describes and this kind of
bothered me when I first read that code. Move it to the correct
indentation level for the sake of clarity.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4b9e0410f2f5..2bbec3feda39 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2459,7 +2459,8 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map)
 		 */
 		if (!erase && tested_erase->size)
 			erase = tested_erase;
-			/* keep iterating to find the wanted_size */
+
+		/* keep iterating to find the wanted_size */
 	}
 
 	if (!erase)

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
