Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060F8C3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIQ5GrAFUGy3qXKZeChQGDb13OtLJX3yXJv7AVgGsHw=; b=hRzYBRnIbcg5Wq
	TkLrWOrAzuGy7nNsz7slz4FPGq2A46kDX3yPNpCn2cIJ8qSAL+Zcp0J/BhKso/IOgI6cqPpkxE9iz
	o8AFddUHNMmYbthy9rqOSqb7L4JblBjdPbYu1b6o5kR2mBxrspxqsxgOIVrSqPSbXEUKxGq0qkkc8
	AnHkWuWc51n+kjUyWQRKsyedIeSFjXKaa2xJ8FgdpD3m6IoOG8NmxpWmExx++tpIaQu6QjRr060Lk
	ceqqcAYxbK1L3KWfjZoafOyntHth2MtrIgLdfsCOJQQnFl96Qcyubps/Acm5Kg5IRlMswtZE5RJmY
	pFMmIF17ZVDLDExn/37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIru-00AjfK-5u; Mon, 02 Jan 2023 11:20:38 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIp2-00AimU-8E
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2023 11:17:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3DED524000E;
	Mon,  2 Jan 2023 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qw89x4Kg3SjlkQR0d7Jy+ZdKD84uyDA8n9IHbMQerAk=;
	b=E7GU6OdwpnSph+DsCbh/iHthBFRhCzgPqySVXfLkFfxUw+A1jVk4IN9udkeTALUQc0p1Jj
	hEjgv1FUITOC3FIITRbJOA7gyi26pCtsE4pSMhejJ38Vluo5fID5FY+de3C664J/4kQ/8G
	rwgGZ2UjywqS2ItB5LrzuyivFsOms4xohHLUCLi8J8kQ33ql0xBCqk/BIYCktciMuJUtww
	03eZxIYOhKp/2Z7elIgXisd0QxfsnKu8wF40kxJrmIvC0teqCaPy9Pr48MQOrHEJfZ4ljf
	iV9qz/OExayXkFpPWOTq2JwbAxPr9MUYkU/bqZvIgJdwFTUG/xugJ57wqxnnLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Walle <michael@walle.cc>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Mauro Lima <mauro.lima@eclypsium.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Date: Mon,  2 Jan 2023 12:17:29 +0100
Message-Id: <20230102111729.85746-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221220141352.1486360-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd19ab1f785d0b6b9f709799f0938658903821ba1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_031740_461536_476B0E30 
X-CRM114-Status: GOOD (  11.13  )
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

On Tue, 2022-12-20 at 14:13:34 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
> fails to build, as it includes the shared CFI header:
> 
> include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
>    62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
> 
> linux/mtd/spi-nor.h does not actually need to include cfi.h, so
> remove the inclusion here to fix the warning. This uncovers a
> missing #include in spi-nor/core.c so add that there to
> prevent a different build issue.
> 
> Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Acked-by: Pratyush Yadav <pratyush@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
