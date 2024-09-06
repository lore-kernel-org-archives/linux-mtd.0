Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67D3E6FE20
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mec80+XHiB9TnMncEM649Phn4homGvoJRodnkSG+/2Y=; b=0dUtOlIq8Dq5wL
	jnuzkEqu6yBODTWn7DlksHpaMV55ZPtNNuevcBQr4Y06aVxbW+qQf5K72ylipsJD5/CVBQH99ukC3
	1D83wwuKvyEs3IE9oQ78v4gWfcbtlz6QbqnmuOaL6kyZTQKJ09WitsMKmfXALb/1nec3zm6AEyzdL
	965C4Py1ptZqaqUo7n3FN0zxBAV1xizDXAYB3z5pWg/9hopmLGEK0fIdmpsjtFB+KLaJiyHxukcwe
	DzxrJJ4rVFMi49oUbGWqFxpicD4LYKuMCNtnboeD9lNZLWmbOM0ETIZMcHoAQfhvIOcWv1Yx1PZqd
	P4mL9qW9nYI1eCTo0qCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaY4-0000000CgA5-1zf0;
	Fri, 06 Sep 2024 15:06:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaU9-0000000CefZ-3FQM
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:02:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B181C0006;
	Fri,  6 Sep 2024 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15Ek+A57vFAJka2kT9905GWUjwfw38r3Fz9oVPWwbWw=;
	b=HA7nSK0H8mdtk6z4YgZPr7XLDFx/uz9iMpznlE8/ZoM5YHjXnCv2axTyk+uAnUieebJEM0
	TmVaPmH28Zfu614furQJJ2PSP7HTJTagF9sT3K/hRyMG+RhQMkrlogIKqZ8JCPxEVfYYaD
	En3esyQck2yQhIrxTL70SDN7WRIj81yfzpC1y9DPLb6inBvCCxChEU1giB1faes4oc+5kA
	sKamOQkXFvRQPGGpND4fj5fpuK6luWqx6YCZOnkhlna2bR9gTq6B1hd8UatMUYXMNxLRPJ
	l1HZkNstIiSjLaImYEOwsjHA6DWieDutKPiM1k50sHMHvXoWxW6r0C9qymrKtQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 8/9] mtd: spi-nand: macronix: Add a possible bitflip status flag
Date: Fri,  6 Sep 2024 17:02:48 +0200
Message-ID: <20240906150248.734238-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-9-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e1f251e1aad8b1cfb322cbd6057300e4613534f0'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080254_059656_109BCFB1 
X-CRM114-Status: GOOD (  10.60  )
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

On Mon, 2024-08-26 at 10:14:11 UTC, Miquel Raynal wrote:
> Macronix SPI-NANDs encode the ECC status into two bits. There are three
> standard situations (no bitflip, bitflips, error), and an additional
> possible situation which is only triggered when configuring the 0x10
> configuration register, allowing to know, if there have been bitflips,
> whether the maximum amount of bitflips was above a configurable
> threshold or not. In all cases, for now, s this configuration register
> is unset, it means the same as "there are bitflips".
> 
> This value is maybe standard, maybe not. For now, let's define it in the
> Macronix driver, we can safely move it to a shared place later if that
> is relevant.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
