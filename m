Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C36E8537F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0IiZiFch02/cuVmo34I/fTlUdYSnX5XJQCIC0LeNvk=; b=a6Ysu+kKaF0Zah
	0zAIefQkSb0pK1sGCn18IOCa6GdfKr0XVxh0YrwQA5t/BoGsMoAlx7jdmz6cxWIvuZ+AymqyYV3OP
	l6kz2SHygyk70dkEDDiEsGYR6DE8SwHG8YN0I2FLA9KG0KJ3LlnRwGKtJ3Rjk8n4RW44BM+FeZM44
	fbqC2xsmux9fFuHdPRGwKGqd2CNWvC1qUQddD6M/+m5pC9wEV1ARLBcAwNlO43RTodN2qi7TBripX
	I7oPFWs6/QgT48Gdjs0Rc17D8l7rwQ770yeXKR7ycGNSuJvnnlish4XGIlS2gUioJi0Ch06730s/i
	1BvVltAQrMZG3AsdLmQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5n-00000002Gpr-0QxS;
	Fri, 03 Apr 2026 16:09:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5j-00000002Gjr-3qln
	for linux-mtd@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=leC2dd2KClzTPcQ+8AI037xoM94Wj2JcMmNh8kB3Pi8=; b=C+k+jmdmLZ2qOVN86+/Z+ujOor
	0Dj32O2eSjjgR/t9mnmQ5ABBSiEn8npP/4fNYh2AaaD6llieWywO0Dis42DRcjIG60ePkwQS4Ql/Z
	+JE5DEWA7lNQok+/tHx2YHx5JMEGPlJsdVbklYQrGRhS4Yk1ReNUJMVjjqu9VNUbv9LqmeZQBdbTE
	iT+wkjGPGdhJspsil4Jro0SvPqm6crJ/3sap7OmAd3Mk8JXgdMpjOzC+ilHzu4e6UrnJvzgzSJCjq
	TjyF+MR5N6ggYTay8P2ilytwoUyKpi495lBqx+I78PDsGDg228Vafp3iuP/u6RnA5JAqjy89obTyD
	ki2oXPRg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5f-00000004OFY-3T5w
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:09:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE19C1A312C;
	Fri,  3 Apr 2026 16:09:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CE46603C1;
	Fri,  3 Apr 2026 16:09:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EDFF104500FB;
	Fri,  3 Apr 2026 18:09:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=leC2dd2KClzTPcQ+8AI037xoM94Wj2JcMmNh8kB3Pi8=;
	b=Hn4h7qIM4fJSHsGqMHx5JY8OqoBGLRKnqcJvlZopGP+HUvWSPk+5wKvKSgPr2E/5Uvg4Ax
	Q8uAUayCOe7YAnuqfmI+o4y0gnSD5fIQwjE/aBOMa2Z9wqFpkPh2gTavoc3kCqYJd6EkPD
	Su0lLda10KhbJ6wQmZYR/tLoQIWeuh+JVfekdpPK6G1a7cjbRwaVv7vloQ+6xZK+cPaxOE
	pQN21+xK94Vw9DiJJsA0rXZ9/An1Hy6KNpClW3H0el0SQ5NzDnULNOqttbESydTRAxYdB0
	5YhDudGOqNJSuXSGhWOjRQxBcOR3Qz0CjwBdgfyyqS9zsC3IPF+Fsu9zHhUq3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:19 +0200
Subject: [PATCH v4 01/27] mtd: spi-nor: Drop duplicate Kconfig dependency
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-1-833dab5e7288@bootlin.com>
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
X-CRM114-CacheID: sfid-20260403_170948_110081_909C2FAD 
X-CRM114-Status: UNSURE (   8.53  )
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

I do not think the MTD dependency is needed twice. This is likely a
duplicate coming from a former rebase when the spi-nor core got cleaned
up a while ago. Remove the extra line.

Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 24cd25de2b8b..fd05a24d64a9 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig MTD_SPI_NOR
 	tristate "SPI NOR device support"
-	depends on MTD
 	depends on MTD && SPI_MASTER
 	select SPI_MEM
 	help

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
