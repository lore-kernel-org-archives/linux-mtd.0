Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10523C25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeUZoBbZWKtvPgfVQzLO4XieoDsVt+UDcwomMehdBpI=; b=Hiaja+PLbkkTDU
	EHeqc++VzjgxiepaH44i79Q0O/Ffd6YRBe+nuGWaf2uZBEvvSOtNbxaM4XLWcpC481spGHv9xyP0Z
	SZo77FOMpK9Q+FjPFzoq99cl4nouhnrhzOzmKJih+nmYZQIYE+P0kEw/WAAN6lvcVIucqrdlToWte
	wQeM+pYDzMDkqjRz2lHRgraofOPaRqrUEfnuAn1zT6U+fI0ksizlSUIrkiqe96tJ4HQCJoBXEu1tf
	RByl4Pn4fpSQ1EcNnfXIVeQTWHRr5Yu2nMg6E2JP/zUrTJ0TFoyC+hApPgQffaOVQlG/q69Ip7fO+
	spncmvf3Cp62NMj66jzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbzI-0000000FWtK-2IiA;
	Mon, 27 May 2024 15:10:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbzF-0000000FWrs-1i1W
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 15:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1A97614D9;
	Mon, 27 May 2024 15:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DF7C2BBFC;
	Mon, 27 May 2024 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716822608;
	bh=sdNsUq7qXOGLNdRoGeJa7Z8iN50W37caPaVat1Wq8dY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T5Chba/DsKtB27gbJecQgoGceITl1i79HMLtL/S7owPcxnHrVxM2JrHxV8VvlnayY
	 oaHF6lYpduPTAhDOCcQWKzAuc7r6/sz+H0usUi9Osv0FVAZjbMB2+ezcFZ0UFZtO3I
	 lgsj1mACQ+h3OtGjpQjxxwC5hAAKlS96ogzFD02IRyhI7QW7nrV0Xg4AdFf005p0V9
	 kODuzGU0rCdsk1+FvFsAfYUknyVlcnREEa8TKmpIJJKKEUZXO2HSUIMr1PaaPU8Yts
	 +C1ebZMPfXb+EBpAd7+enup0xtlIO1+kAMHka+qlqQwE919b5oZARMASSIK7Vss9z6
	 W+rX9MgkzxOwg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Ricardo Ribalda <ribalda@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/6] mtd: spi-nor: spring cleaning
In-Reply-To: <20240419141249.609534-1-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 19 Apr 2024 16:12:43 +0200")
References: <20240419141249.609534-1-mwalle@kernel.org>
Date: Mon, 27 May 2024 17:10:06 +0200
Message-ID: <mafs0plt71eb5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_081009_544534_5BEECA23 
X-CRM114-Status: GOOD (  11.03  )
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

Hi Michael,

On Fri, Apr 19 2024, Michael Walle wrote:

[...]

Applied the below 4 patches with minor fixups mentioned below. Since
v6.10-rc1 just came out yesterday, this should let the S3AN flash
removal get plenty of time to cook in linux-next, and give people chance
to notice any breakages.

>   mtd: spi-nor: Remove support for Xilinx S3AN flashes
>   mtd: spi-nor: get rid of non-power-of-2 page size handling

Touched up commit message a bit.

>   mtd: spi-nor: remove .setup() callback
>   mtd: spi-nor: get rid of SPI_NOR_NO_FR

s/evervision/everspin/g both in code and commit message.

These 2 patches need rework:

>   mtd: spi-nor: simplify spi_nor_get_flash_info()

This one has some comments from Tudor. I don't think those are big
blockers, but at the same time I don't think this patch needs too much
time to cook in linux-next anyway. So I will wait for a respin.

>   mtd: spi-nor: introduce support for displaying deprecation message

Same for this one. I will wait for a respin with some actual
deprecations.

Thanks for working on this!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
