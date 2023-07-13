Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C07DC001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKPkNdPj5J0lXG+0ESYcmXAPuzhzg4Jsis2XhDy7rIA=; b=W7ije39ZnWp369
	KihNCh4PkfxvfZnnO8gD46cSSqZb3cxsJIwsG6FVV+1Ixv2rtWJQhHt9xRNhjwp7alcAC2K9O/8wt
	HPl7hp+k7bylUPN512mKuumiRayyKQuBEOVPgR+Wo3HPXJHmUTPBxzv2YtmjDZKctE5XNGL3lhpy1
	LDc1XBTBI25W+/WgGOMlMG4SGci1cwkluMrYL7EmLui8LaBSZN0KzA7xLIEd4SJFGyHoDSWJUj2wn
	k2wO7Jj3hzxPnT3Y8cL9E6enLIhiaQHh2SfphxrCuTF3zp/+9NdnYIMEK/teVwkcCdY/eoB/zTh+7
	pdzCOdsWg2EXrx0kQXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsBl-002WYi-0t;
	Thu, 13 Jul 2023 09:00:41 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDe-002Jub-19
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B1142000F;
	Thu, 13 Jul 2023 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgxUjxWYaES9J/u7KyH5WhMtdN6ljfnBaRxicp8S6UY=;
	b=lz+a+PkGSLThvtWT9tWmOR0dk/jDrDCdJO+LZfme7Ee+yf38vGGi3+Y55nxcLFgzStjCRA
	SAgU4ErCTN8XUEPG44r7QN4p7af0fmP38ErI4NqU42mj/ySFPWmQ0vC8BXrbMpBAaEeut9
	2V4iNfjtjKoaLyIbJX6kPk/pere5nmRkN33T0SgockNaVlauTLy96mSA2E1c8unhFlec1Q
	nJUiHrdoV62slBXN6lCqxKCKxvT3IxkXW2d4QrjNtHo9pZjMttopytAIFlniz7KdOPfU0g
	zN0qhg6Hq4t/uL2rp9C/1F/qQKEiT2sv5IfauOMw0uOOKF7gRZLnZ86u0teraA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v4 5/5] mtd: rawnand: brcmnand: Fix mtd oobsize
Date: Thu, 13 Jul 2023 09:58:30 +0200
Message-Id: <20230713075830.486450-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706182909.79151-6-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'60177390fa061c62d156f4a546e3efd90df3c183'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005834_563574_7FE3F657 
X-CRM114-Status: GOOD (  10.70  )
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

On Thu, 2023-07-06 at 18:29:09 UTC, William Zhang wrote:
> brcmnand controller can only access the flash spare area up to certain
> bytes based on the ECC level. It can be less than the actual flash spare
> area size. For example, for many NAND chip supporting ECC BCH-8, it has
> 226 bytes spare area. But controller can only uses 218 bytes. So brcmand
> driver overrides the mtd oobsize with the controller's accessible spare
> area size. When the nand base driver utilizes the nand_device object, it
> resets the oobsize back to the actual flash spare aprea size from
> nand_memory_organization structure and controller may not able to access
> all the oob area as mtd advises.
> 
> This change fixes the issue by overriding the oobsize in the
> nand_memory_organization structure to the controller's accessible spare
> area size.
> 
> Fixes: a7ab085d7c16 ("mtd: rawnand: Initialize the nand_device object")
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
