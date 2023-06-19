Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A5DEB64DB
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvR4+zkpsIAJym73koqBrYNbRkXvh+PXRxNCX90dkbw=; b=Vn+Yr+8mj4hWV4
	9FJk3gP1zgGfe7Ighx08Cn/uW6DAUJmJFFe08nKNCYYgIt2NkUOmU1rlviXhRG1//5e0WYR17flHn
	Zjl8C0zaztuQ5y/wH7KRHxbdTJLUibDK3UJHIxjTlUyqAtFiif99RwXr2NmHSSCQR5AId2mLU/UBw
	Djeg94ymAL+9/bYQzRCgNq/Dhap2Yk7+8kArKi2Z5XnBvgPEsa+vzVCPfZKO4b4s+aps19Hv4LiCE
	tHyOa1aPRg1D3fWJyUlOQ8ka1zYRgr8jFL/ihqvRahvq0bD5LsUpIOtdKsumA/N931ZvvwTaF3RYP
	4L62qtgBDqJ/kg3yeGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQT-007qyR-0D;
	Mon, 19 Jun 2023 08:39:53 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAQQ-007qx9-0m
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 08:39:51 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687163988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBpU7AIkXRCDEn5VIdJgj1KNTfxQfZBfQc11JlGsmGk=;
	b=hq9KsprMfBHZ32nc9FYq8mjIBs/pOX/FM44ns3HbKPfWcmykAKM3SOURVVmsj2MQmKSsnJ
	hN7pMjGrlj82CRW31mIT8IIHdCTMEx9exyobhjshjrez+F/ZLjSuEH2EGk3RGAt0ccCCLg
	Y92GMpDtHUvhgSmSSqCIJQGph0Pya+r/NXh93LsDaLTVxeUGDrt/UnmFTZLNjwlujnqOEP
	PZauLzsdWvln7F/Stf1MlK/9c0jbNZhBOTxUF/XI4UdOVzygQwaqmXYY4A5/xBMem5sDPZ
	e8y+dmDhsHEUxFGZX++hHX1TsLZlqJ6NFTr4YulspkKRyjKq2vZjcu7FXB8vUw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF563240014;
	Mon, 19 Jun 2023 08:39:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Mason Yang <masonccyang@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mtd: rawnand: macronix: OTP access for MX30LFxG18AC
Date: Mon, 19 Jun 2023 10:39:46 +0200
Message-Id: <20230619083946.2940494-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615094015.3780078-1-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e87161321a4081d36c4af95af7f0950137569dfe'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_013950_424244_7D764ABA 
X-CRM114-Status: UNSURE (   5.49  )
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

On Thu, 2023-06-15 at 09:40:06 UTC, Arseniy Krasnov wrote:
> Support for OTP area access on MX30LFxG18AC chip series.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
