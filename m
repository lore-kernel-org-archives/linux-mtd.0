Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E29AC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNzGJLS+RsTwGhsWe0rIpoDyv2EtCMO6OTNwXnwa+n0=; b=jRjvoEyPvUKI+y
	khbZuKvo7Al7c4Hzr8tsfRjokTj7SCi6xzA0SJvYe1J34e/MenDLi1TaWQ2Nl9h1UMCgoJHse19BA
	fJrK0gQZeJLJZPkfmg9NdDqrbFcYVtEtLsdaDgHUZ3gFHRwEiCaatEVomRpYGexIGRYSkNGIE53b6
	Xkmo+T7XUrJKW/xddRgOVpwNP2X7HlSd/cYRdMXjJGzVg+EVUmh6ProhPVJq6X6UHtFZsVY5vGJmk
	0VGzQqt+kElcFiZeKBXnw30cLy/y6EePofiHcDtJqKJsg7uJpNPqxVQKi9/cg4Qgow39ncLEq27id
	0j3vWCOeBHV+tRomgEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZgK-009tNc-0u; Mon, 31 Jan 2022 16:37:32 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZSC-009q2l-EA
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E086020005;
 Mon, 31 Jan 2022 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9R9w7nHUTG04n1FcF/qJAxoWCHpQZB01oA9Hg8vlO2w=;
 b=EEh/yrfMphmEaW/ffaiX53WkC4S0e75y8Hs0pVyywJMftHEYeFv+THvjXdnMhJC7xZPXe/
 MVtWAH/Qsn4+OnlQo+8FS6evZEKgRg/VAWZ3gLQ4nzSyVV+TE7I4O9MopTPsIf4r/lRE0c
 9xVYY3R2m2NXBkqXumaY33zEkh7cj1SNu7N+HECRuzgy8CO218ba8u9e9D4vCDMWGEXy2o
 E+IxljOQskSeh+450t8jNVHopHdTtbXYZsLa5Pgu1JaNnQkY0fGjXcOm3HuKe8YRGnVcUR
 ulNu/R+BUhZpbo0scJaEfMlh5grVUT39oTZv7SsADicxDJPvnDQtczwE4KQqHg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 01/13] spi: spi-mem: Introduce a capability structure
Date: Mon, 31 Jan 2022 17:22:50 +0100
Message-Id: <20220131162250.24365-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bb693170bc57dd2c33cec37a050323554eccf1ba'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082256_679796_57961EA0 
X-CRM114-Status: UNSURE (   9.24  )
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

On Thu, 2022-01-27 at 09:17:56 UTC, Miquel Raynal wrote:
> Create a spi_controller_mem_caps structure and put it within the
> spi_controller structure close to the spi_controller_mem_ops
> strucure. So far the only field in this structure is the support for dtr
> operations, but soon we will add another parameter.
> 
> Also create a helper to parse the capabilities and check if the
> requested capability has been set or not.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-2-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
