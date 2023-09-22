Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002F1E6FE46
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9GX9FcJvo0Eo+9BvFUACBJlIsO3pM4DkbTfitm2J6o=; b=pElOl4gqcVMWBM
	041qMxwu8DK726pIpo9Ci/sXQIzuqxVKm3UUNY9e874iae3zHv+uVk1qGzelIndMAiUPaJuo3PUtK
	crnMiqZfj/95qW/X8VrqOiJ4hQkDk4MEdS2i9lmoBla7TTv3Ez1/wrBtg/JUGk41MewYMedeGgpf8
	xqrCWiRjizXf3VgvPQtac1Y0Cev/XKUAGTx/v+C0LroGVIt6NZ9Mx3+hKHQuAqy/rp9mjb1k5l+5c
	Xs/MIcfgymuXaYKnp2VMtjnoG2Eo+xK8LrCiQBjhvdQQhamQRGlllBymGPiahOPla3dab1SU2J0Ko
	voZuzvkapUVfzGF8qsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhV7-009FGC-2R;
	Fri, 22 Sep 2023 14:51:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhV2-009FF0-2S
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:51:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C78E4FF80C;
	Fri, 22 Sep 2023 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XdFA1MU2iB96iiBSQaJClbeQXcL5rEOl1Obs0685Gkw=;
	b=R0n4aHueLSJWCWFCIRcYg1FeAt0+36MUlzxpXgHCUYOYhiET21h5IL8KIGhvSM51kMNcZ5
	MrmeKpTd1NoJIxzplBMosV8xAQaHnAfLS7ikNeDtBvmOYEeF4F1K12YCRyQVttZxwy9uDJ
	fZ8+qIGtkXzBKyOBl/1JYkQL6FyPYZbHMWVW7V4mOcicvI3RtKSxMgXQKFP+5jnF9NupdX
	OGVy/t0XczBmUXrqsAWTwyC61iCESXc/2EIWSl/ZD6YxWgVasywzkeUUYAB2HuC6iXpGu5
	tE/eE/fkqZOcEu9jQCPolZi0SsdKov/QK7kFngaclc4GLFhviJAPt+PKaouYTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: arasan: Ensure program page operations are successful
Date: Fri, 22 Sep 2023 16:51:17 +0200
Message-Id: <20230922145117.578303-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717194221.229778-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3a4a893dbb19e229db3b753f0462520b561dee98'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075120_932401_BD11598D 
X-CRM114-Status: GOOD (  12.89  )
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

On Mon, 2023-07-17 at 19:42:20 UTC, Miquel Raynal wrote:
> The NAND core complies with the ONFI specification, which itself
> mentions that after any program or erase operation, a status check
> should be performed to see whether the operation was finished *and*
> successful.
> 
> The NAND core offers helpers to finish a page write (sending the
> "PAGE PROG" command, waiting for the NAND chip to be ready again, and
> checking the operation status). But in some cases, advanced controller
> drivers might want to optimize this and craft their own page write
> helper to leverage additional hardware capabilities, thus not always
> using the core facilities.
> 
> Some drivers, like this one, do not use the core helper to finish a page
> write because the final cycles are automatically managed by the
> hardware. In this case, the additional care must be taken to manually
> perform the final status check.
> 
> Let's read the NAND chip status at the end of the page write helper and
> return -EIO upon error.
> 
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: stable@vger.kernel.org
> Fixes: 88ffef1b65cf ("mtd: rawnand: arasan: Support the hardware BCH ECC engine")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Michal Smek <michal.simek@amd.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
