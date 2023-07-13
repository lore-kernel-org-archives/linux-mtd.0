Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0843BEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bgtigZwpSzEvE6qs2QKObOf1n0tP6ddGocMHJATBAQ=; b=LFagOsfe2Wn4Ip
	dui06anHarOqiVTGTFvnuz3ZkP4vCZrdsxEATYkmo/EYxDoPJ5c1XvbKwneSWaZoyyOqwLJdNjgQ3
	DL5SL00SeneuDtnqA54K73UYT2feM8HD88YXze8Bz78jKdai3H5cAJeo/S6EbDohMeGBTzXv6E2P6
	IMDxDDGLz2Zqd+IEof2uyB6bdhBQl7tS4itup9KHglKcHySKyNtcehgQ8feEOpTLtpZy48xtM4ZNn
	LH2ZV3O3XNMCRYjCj1I282sv3Rwpwv/UnHfkMabIS7lAEJIbamxTeWB++hWDuJFPy/t79wFzNBMnO
	vIH9m5jdITq7HDVGnVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDh-002Jyf-0H;
	Thu, 13 Jul 2023 07:58:37 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDV-002Jlk-1B;
	Thu, 13 Jul 2023 07:58:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEB32C0014;
	Thu, 13 Jul 2023 07:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOOKKOgHpze4FeXkYNNaRLp/XT+oG2qmHyAhGV4nrro=;
	b=SVLYoMMOcJX5aFQU3D7QXMSNQLy7T6vHOFefe+6TluM+6+98qopFN9rD7wt5yVuhKRbXpR
	hhuqzmyM/MVXnyubqTS18WhPTCklvG74QD2gfiZBkl18LYZHY4GXET/EN1RBX8b86m/PK4
	54P/jdjgIg+Y4uzV7CTbrILLuZAt95zH1Kz9+6qFo2EOSvCRKBucUTZnA/n978ZeOogEpI
	p3VSD/tw16b6W4QgZB7BJYaPPdVnKkAa2Mo0q3V/txqR/8lUIqVUZ/9r7SWabRIndqOg1/
	XHqh+6S3TA8kbw9ccgmlWy5S4zlzmFaYit0VSe8nmJlcEZ1JPfQ8gnZ86Sr1mA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/18] mtd: rawnand: lpc32xx_slc: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:58:22 +0200
Message-Id: <20230713075822.486365-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-2-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1c66c7523f2fd2d9c8f81a2b7116252c323847a0'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005825_560933_3AAB8F6A 
X-CRM114-Status: UNSURE (   5.36  )
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

On Fri, 2023-07-07 at 04:06:06 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
