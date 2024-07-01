Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23B9C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMtIiA1YqeT/Mh7ElNQecQOQT1groQVh/QwggoMaIqg=; b=XrG20GKcNISUJ7
	6MpWxMgV3bKjdrQJ5lzyCp1ESJICx7gvOlJpfv/CsJ/EiBLMovanZ5j3HE5Do0GNJMDXZ6+jIoLKY
	K2/LCPmEA6FvensWMt2MICBmbQjZRsX9aSw2j1l9PhuzO5y6FrYoVd595ITtQ44f2VJDdKvbM0ESn
	mw+SzE3r5V6irk46MsuFOD2TDLQSxTzMo7Se1EA7uvD6Hp8xgEg4KQyXZWJYKhfbod1wOLIQL9Z6H
	9Km7qxf+F2POt92TWfPjayTQcCfCWuxF+RKBiAOJ7d+RI1U4zYU4CltarhAsui89YAciMDHzcrydR
	smMJZhD2EwmOydfTYdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG3I-000000039Lx-48me;
	Mon, 01 Jul 2024 12:22:36 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFhv-00000002zye-48Vv;
	Mon, 01 Jul 2024 12:00:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BDE91BF203;
	Mon,  1 Jul 2024 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHfqL50fDUx9zIlzHn0VY8tLg/2DFwYEENXwOfaE3OU=;
	b=i+eE3TotMR50bBfes4DsOLwnZGegNdfTcIvHQBmZ5Rq/F4dbq1iJM4I8N3+qZvav2ahVsH
	Ivkiy2JPqAepgZOJEOwoWvBMZa1jDTyKQPG4V5P7B6i23O09ZK+fbe9NSVnWi1+ikIlyI5
	oDDv9pqa/Db7BdZkQmTjpWudVhECQjy9LKF7FGvH67I8eeqv2rmM+ZKNn/2vr/kT+8don4
	qjXAo2Adz8qJLdOEhTcijmZM3pE3j5msYJFq5od6l7wCrCQIbhM+iCYnqXtb9qWBfuOAcm
	37q3q0E4zOctVZ1eWimxXHOzwfxcN4VknS52xMHooKk2wjYTtAUs5jR9k/q1sQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [Patch v5 10/12] mtd: rawnand: lpx32xx: Request DMA channels using DT entries
Date: Mon,  1 Jul 2024 14:00:16 +0200
Message-Id: <20240701120016.525443-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240627150046.258795-11-piotr.wojtaszczyk@timesys.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7326d3fb1ee39f02ef1f49d1e14ac3896caf85e2'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050032_472540_BB5FC38A 
X-CRM114-Status: UNSURE (   6.27  )
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

On Thu, 2024-06-27 at 15:00:28 UTC, Piotr Wojtaszczyk wrote:
> Move away from pl08x platform data towards device tree.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
