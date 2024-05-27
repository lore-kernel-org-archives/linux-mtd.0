Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC65EC25B7C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E19vwiPQp5KFqT+lSYct4t9aPHcbyfMQPQj/pJzqLwU=; b=XV+MQGKWaEIEmr
	rhsD711ervmO5pnLP5ViewR5RazU8bZUnui45tgHV0WeOcOX3Zq1DLU+EyT5XCH1VHrGe8uRvIAPF
	Sij3l/N2gH1jdC1a95MGJJwE5CvqikWdvqBNq9UBqVB3aH265zCBlgU/zKkrlv7FRq2+IxXfzjz8l
	gTj8Y0OusrC6hOsQ7gkarodeuCJa+d/R1Fq9dtMOFpsBO0Q9un29UCNftVTGPVRF024OookZjIEDg
	CZWc4B+abcKwyemNBepyO/84CE6IDKz+rqlYq4678wuBcrU4nWU3/tUS4PXfS7hpHDdO7GW7R6Ox2
	e9OPp5ZpLee0efK45/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaQn-0000000F5yB-299O;
	Mon, 27 May 2024 13:30:29 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJZ-0000000Eq4N-1hxk
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 12:19:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2210A40009;
	Mon, 27 May 2024 12:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BFRarOeDypft+k8uWZknOSEqhErJiarm7OGg4vuEPo0=;
	b=dA5SRJHBFM/Ksac4FbUxWjmu9faiatMO/l0ptLDLhHhxxj7MYpix44zim+creA/NvGJU+r
	U4FELk65uKC4JwRY8k40HjlZ1UC955ExFPaFBS+AYxLNIHTf/wg/jZ5rVDnn1PSvMqatwU
	c/nyXJK/qeq7tgYO0tb9z7xwuVLVoevWo165j8z3ntie7QLHhVVM1QhT3relk0G5yhSmEz
	ZtRW8/I2mfKv54TaJtY2imu8wfJfhDL7f5fsG57sPLbOdkAZ/esm5z86VTvtFoUP35Q1Sb
	C0peTfBlt6Xw0JgRCU2itWMAgasokcj8bD9Bts0v59+yhIBVkz2mltib81Qglg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mtd: nand: mxc_nand: separate page read from ecc calc
Date: Mon, 27 May 2024 14:18:54 +0200
Message-Id: <20240527121854.178599-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240522-mtd-nand-mxc-nand-exec-op-v4-1-75b611e0ac44@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'022127a167c21dbd474d563c0d28d3c7278c177f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051857_739057_21C6635E 
X-CRM114-Status: UNSURE (   9.81  )
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

On Wed, 2024-05-22 at 05:39:51 UTC, Sascha Hauer wrote:
> Our read_page hook currently reads out a page and also counts and
> returns the number of bitflips. In upcoming exec_op conversion we'll
> need to read the page data in exec_op, but the bitflip information
> will be needed in mxc_nand_read_page(). To ease exec_op conversion
> separate the page read out from the bitflip evaluation.
> 
> For the v2/v3 controllers we can leave the bitflip information in the
> status register for later evaluation. For the v1 controller this is
> not possible, because the status register is overwritten with each
> subpage read. We therefore store the bitflip information in the private
> data.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
