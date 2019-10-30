Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC18CA9EAF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 09:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79EE52083E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 09:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOK/+dMW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjUstP+Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79EE52083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4lWAfF7mEKeEyK0m+FIWUO7c0Zn0PPHyqSGFddR+YsY=; b=UOK/+dMWQYZ0hOCHD+w1Fv7pOI
	FYI2BVUCuztMqlttZLLHxLpKKseKfFR9KfD6u9spOYRBLsxz23gDo3UazXuiaJzWJY6slatDvUOrr
	Cfg7txu1MzATvG6xfpdm8jucXdH8MiRQkGKjFQUN+JHYCuGLXAZl/UtaNfPbuiDaOEBtmtcGji4n+
	nOpwo8Z8G4RY64IKuAlsTRsY0lpAwDGnT7wdmQDC/EfAlc/1xWTNbMxpenI+mcySFv0sWShLSux6i
	2zk7L4onCWCKhCmR9VtllLUYPr9di6HLfowHk+CcQ65H+z/0gGer0nC0PKtVCqpdzH5TVTw2szF5/
	/wGO9BnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPjsg-0004lE-C7; Wed, 30 Oct 2019 09:03:06 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPjs4-0004BR-OO
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 09:02:30 +0000
Received: by mail-pf1-x442.google.com with SMTP id c13so1127943pfp.5
 for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2019 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LAPsnGt1pYtfbduk+JeNTkq03C0NkkTkxfb05DzEQJ0=;
 b=OjUstP+ZDVdOGkJvM7Td/6qBjFXM/KJF6OJzUcEP7TyIJ4ZvUAn9T7yD8XjYxDNEJN
 KHjfvWijYiNtqenb9bwa4Sd1uGk/jU8FssM6dooJ4yDHUi45cn17lSpLQFbVew2amgW1
 FPa8iEp/VeagMZARlx0/Hkpd+Tt/g031BieCjXyxwn2gsco2zYNWb50cT4woJ+ovMB3Z
 fzA4VRtI6KPvbdbp/WHauQOggzc/Pzxm45n53SBGlLJ/X4cN+ny0thBTdo/0mLdX21nN
 udm+afipjTPSHKncaghH/3F0Zwzwekn1z/WYsofoSyAtuLp7QCy8b/4kPAXWhs5jUQrf
 Bfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LAPsnGt1pYtfbduk+JeNTkq03C0NkkTkxfb05DzEQJ0=;
 b=aT9r9MTW3pyZHG4kfRGjvTPXrtVbLifudPiwhoBl/AP6Y+GePwyFn1QQxcA7s74DUh
 LI7NZEEsATBc0KPgU3SEs2bzajQckVgYQsgfGom4X9pGJhVW3jHfOjrYQ+wMkrZfHKAD
 /v6h4KaeSQ2cErZA/7zsJEECmavtdAzt7dFRg3WDV4nwbFZCPcz9hMya/y0WTb2tRC/h
 3f/SKMyMU357k8JxECNCoQcEpJZwkesd+SMATpFxFoHjy357NSk0geN9HAgq4RKAPljx
 gbSGAGPVMOcjcfAJ0cz4jjXa8SeS6KIzmHu76j1ZQc/gIR7Xw9BMRVIqV/fda+hJE04t
 R7Lw==
X-Gm-Message-State: APjAAAUQobU4NxP12g/pwz7NhGyQr4/gMr9KciagxKO/dqq4RlUXgVKM
 63GbTTeYtCsfUWi+zKwguEGT
X-Google-Smtp-Source: APXvYqxsyssWpqE3cm5I9+vC1DFWm8h7Zo1nOKgSKfAdxUIWWIrp9fIwVWU5LGEWc9pZGi9gWdp/CA==
X-Received: by 2002:a63:6d02:: with SMTP id i2mr33658547pgc.64.1572426146740; 
 Wed, 30 Oct 2019 02:02:26 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:618e:77d9:c9fa:423a:3851:8df4])
 by smtp.gmail.com with ESMTPSA id g24sm2070351pfi.81.2019.10.30.02.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 02:02:26 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	robh+dt@kernel.org
Subject: [PATCH v2 4/4] mtd: spi-nor: Add support for w25q256jw
Date: Wed, 30 Oct 2019 14:31:24 +0530
Message-Id: <20191030090124.24900-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030090124.24900-1-manivannan.sadhasivam@linaro.org>
References: <20191030090124.24900-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_020228_840425_20CFD849 
X-CRM114-Status: GOOD (  14.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, darshak.patel@einfochips.com,
 linux-mtd@lists.infradead.org, linux-imx@nxp.com, kernel@pengutronix.de,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, prajose.john@einfochips.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add MTD support for w25q256jw SPI NOR chip from Winbond. This chip
supports dual/quad I/O mode with 512 blocks of memory organized in
64KB sectors. In addition to this, there is also small 4KB sectors
available for flexibility. The device has been validated using Thor96
board.

Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Darshak Patel <darshak.patel@einfochips.com>
[Mani: cleaned up for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1d8621d43160..2c25b371d9f0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2482,6 +2482,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
 			SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
