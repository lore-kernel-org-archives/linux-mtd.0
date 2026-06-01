Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4785FCD6E56
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvvYimxZbbrPJiEkZIIapEB6MlvzA6ZBjGZKyUYeO10=; b=VtBUHwBKqhK5cl
	z83dckB7yPq5+7prQbmqYQPlvMEnNW8+iRUvrh5qQW40qbuUr39GZBiqANerf5zbT6ac4R/d3DX/6
	GXh7Ni/ximY17DUoptVKlIgbIXxAAqnz88j5Yih6anLIc452UzjUGyQi0JofHmjyo/Nupx70lN/xu
	omhHh++owXRceha3ruZzQrWC9x9ncCiFdLuAhb2UNKH4Rm5EVZRiAYOg/g+iodnv0kwrQt5wHLg3E
	3VnVwxcIeuqkoN8iB5NFDS5Ld5VRJikhp9uDHesK4vEHyr9GlIDMr6fHHs2dqXIxem5UJLKBJK4OQ
	2ods6tBdeeQUXYAj4KoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2AW-0000000BAqh-1fcv;
	Mon, 01 Jun 2026 12:55:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2AV-0000000BAq2-2JeU
	for linux-mtd@bombadil.infradead.org;
	Mon, 01 Jun 2026 12:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9p6z7/d9i9lSMpov6UMYK7LeSDt2zL1nMGwV4PCKtI0=; b=XEt7/zY62Q1Z5qYf8oDN4mSmeH
	pAnpDFw/MG3Ap34RTvh0GLM4/7txrocflVh0rjIPxErYAoCO13/gZYoD4uBCvRq4aCh4ZDYTt+gFS
	i3YE1kAQfewwPACJBA7fBubOGI1WbJj6iId6C0cWO5nOpfQYhzXv0msLo5PweFr1cQsrOOVw4O9ZG
	7zo0NmH4EatnCokGmF5AJ76pHPB31hEa5bIMpS92oHrAC3OQJrTJKOXZeZQ46b12b+IEufLRmyF25
	vNhSwTiettFSXkNyDBYCw9C6XZ8HDIBAE7WeJQ2MowJ5h1CAxD/skupacfJO8L1meZkMHvVkYm9z7
	OI2lmMuQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2AO-00000006k7w-0uPH
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 12:54:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F68740AD4;
	Mon,  1 Jun 2026 12:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478521F00893;
	Mon,  1 Jun 2026 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780318489;
	bh=9p6z7/d9i9lSMpov6UMYK7LeSDt2zL1nMGwV4PCKtI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Li7n5zTZ2WzGjvmhb9rD5hJLYY2Qt0lzif3YjezZwDVW/IRXFbuB/LqnhG8RoaFoe
	 J0i2o6njeSXCaJoBUydIbH0rnNWfBYKMrCzUDBfvq82IgkWUjzcbivrwlutWr0Y4rP
	 thAyGeDei1gV/Ow1qg+pylzytYC1cXYOJkcw1HwEve1joEFwMKtb1MEEBahpOjtBic
	 oO6aBHH1M9ZHjPiFFHYQvCbh+JXvrzTmRHGDUZqn2//kGX8yUfITjC56k2bbQ4AKr8
	 IHaU2x5OmbvUFp2gkCpFRkSBe+zgxko9poaEWQIVm1QVQO0ZugLOzli1NLDuCE1C85
	 WtA/ZD7gPxohQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES flag on failure
Date: Mon,  1 Jun 2026 14:52:44 +0200
Message-ID: <20260601125438.3481722-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601125438.3481722-1-mwalle@kernel.org>
References: <20260601125438.3481722-1-mwalle@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_135452_793497_856BBE70 
X-CRM114-Status: GOOD (  12.23  )
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

This was introduced in commit 548ed6847f530 ("mtd: spi-nor: Add the
SNOR_F_4B_OPCODES flag"). It looks like it was the rollback mechanism if
parsing the SFDP failed, but was setting that flag first. Nowadays, that
flag can only be set if spi_nor_parse_4bait() was successful. IOW, the
flags won't be left in an undefined state if parsing SFDP fails.

Remove the unneeded code to be able to rework spi_nor_init_params().

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4046e137531f..fbf8c2d9c6b5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3066,10 +3066,8 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 
 	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
 
-	if (spi_nor_parse_sfdp(nor)) {
+	if (spi_nor_parse_sfdp(nor))
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
-		nor->flags &= ~SNOR_F_4B_OPCODES;
-	}
 }
 
 /**
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
