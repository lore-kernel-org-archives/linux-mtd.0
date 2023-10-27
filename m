Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EB3C25B48
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmFYjjovW2v+mb4IgngWwEPn6x/fw2oyAVQDCXudwKw=; b=m/RYHCRXvB9BC4
	Ojlrwjp58ltw59hAwtSisnc0G1vSDpghj2o5qZ93eY9Zu1Oz1STeyCy8Nws6UzPD3xSLvuBs0hVxr
	tLdiRldXV/cnW4unEo0Jigk0jhd8CJAQbcNGE1DyutC3GmB95QKEtPC6CsDJ/3xpIipIz6qsjLiLE
	xRQ3DbSzthOim06lgTLucA2KOQipYtRb6DhLcEd2Cw6io+Piz5+N28WXm+913CdEckC01XZ7rSzo4
	itWUKNzeHoB+DtunTos6Y3iDD+wxzS2ihIBsaObruGnqcYdcgkpnQ2iWQZxFGp5POw2T9hXYUEePH
	fPPWhww6gLYZJFH/hpag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvk-00Gr4S-0b;
	Fri, 27 Oct 2023 17:47:32 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvg-00Gr1d-1F
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 17:47:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5233060002;
	Fri, 27 Oct 2023 17:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698428844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rew8nUrg+Y3I6B78QJRTyIL0Jm0DzVRXhKLA77enCDA=;
	b=ofw1zK3o64qa8wGqVd4OeSBIL9E7wkNDedjhG6A5dhMscuiSNURP2XNTmlez+qG8LO4NnM
	M3B80Cl5l7NusGU4B/dvAb1KgqMo29yPffrf6AwUAW49kzWWjWoLQAQwI03DxYzI2Y363e
	DVRlKnY1bf0mQETQrfaY210eShXse43H+TDTOqAqTo2tJKCxFVHo2TCiO0nQ19TucqOFRb
	cVJkdDrrbCw/acFii21rrvNqBL4FXOkZRP5GIEagXPBspUbntqAo/lOk2DKsSbfqoY8G1w
	PWuB0sYTVUPpmz20kzLhcrrlU33MaMHtjF27+l3WYP64BmPcP11C0XXMGP+kmQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yi Yang <yiyang13@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	martin.blumenstingl@googlemail.com,
	u.kleine-koenig@pengutronix.de,
	philmd@linaro.org,
	paul@crapouillou.net,
	vadivel.muruganx.ramuthevar@linux.intel.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: rawnand: intel: check return value of devm_kasprintf()
Date: Fri, 27 Oct 2023 19:47:21 +0200
Message-Id: <20231027174721.370030-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019065537.318391-1-yiyang13@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'74ac5b5e2375f1e8ef797ac7770887e9969f2516'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_104728_561994_DBB914D5 
X-CRM114-Status: UNSURE (   6.48  )
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

On Thu, 2023-10-19 at 06:55:37 UTC, Yi Yang wrote:
> devm_kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful by
> checking the pointer validity.
> 
> Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
