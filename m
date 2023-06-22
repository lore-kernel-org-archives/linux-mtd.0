Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7895DEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2X35XIKnvdwGhE4pZk+hb+4QaVLDUItAMHNgCP8YExE=; b=3dO1U2m0xeWDPu
	E6ir+AaPJMLqzglqEoV2gh9La+TWjlu/Uefrt4xa3xV4ywWAf1BcPv2z5RoI8wVXTwtjWwSzv3ZxJ
	4loRUX20mbyv9hikJzgAXkH22rYTsnf7alrEHesTBaXKXZCyPFIV48bVTvBZT1T6ws+g9yhHG+s0l
	tfNkI8Do3VO0qCdt7lqri5scu2mfVNqZkUuO0Sl0tunlCMjFUAy3kURIkNgJd4PuX1mn5VHuLABol
	lvOSwHwTcuhH2m0Xj+vWONiCBO2tGP3b3rNPmGoyay+s3hTI/lezXry51/6LCs2sdHdKM7xA/c26a
	2mKJFkr+2rr5wIl9GLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRf6-001pHZ-0f;
	Thu, 22 Jun 2023 21:16:16 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRf3-001pEZ-1V
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:16:14 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSCGI+/R6Jxpd2ik2FPUl1FjqJyfLD/1TTOVeRLJvPc=;
	b=d2+p8IIzqxDiGce+kD0elozIWgdqmPzaNiuWgyqElO0/VRfPzTWyJ4N+cwRVbM4m0HhSIy
	4qki3EnSAjxOIK/RMJrAL6iqoYrhD3DNjOXfINqbz0dtSaer5QKad0ScrN/Hy5aq2KnYsa
	1Pk1ZAPr6Te7fnqge+ZxkQbny8XxX+gy8ZXr9bNr+PIt0tI60TAnoMCJb7+PnZQtgTyG83
	1+5bKsLgguWqqgXnO1vKjyAAE9GIuysvzE5WsZ5jL39okxiALEPrYwegcc76qQ0IU3vPD1
	bokvAxJdQFspLT8rZ/iM0o5byx8LCQuzQcni4lt0YeHh8SHyaCqQTE9FAp8jAQ==
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
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6303C0002;
	Thu, 22 Jun 2023 21:16:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 04/17] dt-bindings: mtd: Describe nand-ecc-mode
Date: Thu, 22 Jun 2023 23:16:09 +0200
Message-Id: <20230622211609.3582307-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-5-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'efdd296323cdf6303a034ec85086c4b0b2234a71'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141613_645798_BDF9F0BE 
X-CRM114-Status: UNSURE (   6.98  )
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

On Mon, 2023-06-19 at 09:29:03 UTC, Miquel Raynal wrote:
> This property has been extensively used for almost two decades already,
> a lot of device trees use it, this is not the preferred way to configure
> the ECC engines but we cannot just ignore it. Describe the property,
> list the exact strings which have once been supported and mark it
> deprecated.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
