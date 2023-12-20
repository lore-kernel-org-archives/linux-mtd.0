Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7C8C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEzjfYnrxNq4ItWgvAX3egBCuxLOF9x9dGdrP77iX6k=; b=BtYnUccknFGkVG
	4W0l7b+wnxgAJ540SsxL7Kl9uqVA+L63MxUCiUJpOarmU3oTp8Tmy+0V0e55Yz7Io4iRPMqxd5Zfb
	WxsEu2MFzw/77X920gxOYitef0MsrbLWGZUdPrEo58lSlY4JRVHkBoXueXx2p/wZ+97lyYcj/X3mZ
	oJpOPMWL/fCmrUxQdfqpLioZG3maj6c34M7dcUNUOJ2JKEo+4v6u8qlnq3/i8R2dTsdecSu3wyF1v
	32WVE4PtrnRAdxU8gSfuDFhto1Kf+k/WN8sD1KGV3iUardiCmnnEz0ZCbxYBFVqM2EUfsK2b8ojwe
	zZ7EL0shkY3uwNdczLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsdR-00GhA6-0p;
	Wed, 20 Dec 2023 09:13:01 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsdK-00Gh5e-2G;
	Wed, 20 Dec 2023 09:12:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B88CE0002;
	Wed, 20 Dec 2023 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703063569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0LSf1jDXlMtYT+prq+GmYfXyuytNmV6xGmJKOfpfII=;
	b=Io8w0y1OJbpo94cHz3v3IlZepWhr3sNDZbjZwRffi9zpvY5EjSYmTGZttknqVciSIS/yDm
	9tlyX1vzHa65MMjAQY3HLuBacF65TZa9H3HEtLKxYm7nJlXcl986vwQ2oFrM40hzkLbGS4
	mdeyFyou2iQ7jv3VGAwe/fge0RhIaWyIb1xHDwlyFx3Fyq5sUvrNTpe1JBWUuOzI8ocqDI
	GRa2n/qR0eB6zeKbNQaiKIz6ZSih8fNbSajBPskcx+CHRepCIQV6OAt21JbPxQK9TsLhNP
	OfvQUuOF65PA2rBzijSItwlp/IY2Ufpt4ZgeEb9du7R3rHICFvsnQadEoCdyzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fix Excess struct member description kernel-doc warnings
Date: Wed, 20 Dec 2023 10:12:47 +0100
Message-Id: <20231220091247.655421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231216044146.18645-1-rdunlap@infradead.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'023e6aad7e5e7f2e086c399abd0675589c123728'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_011254_871853_3D412D60 
X-CRM114-Status: UNSURE (   6.86  )
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

On Sat, 2023-12-16 at 04:41:46 UTC, Randy Dunlap wrote:
> Delete 2 lines to prevent warnings from scripts/kernel-doc:
> 
> s3c2410.c:117: warning: Excess struct member 'mtd' description in 's3c2410_nand_mtd'
> s3c2410.c:168: warning: Excess struct member 'freq_transition' description in 's3c2410_nand_info'
> 
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312150611.EZBAQYqf-lkp@intel.com/
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
