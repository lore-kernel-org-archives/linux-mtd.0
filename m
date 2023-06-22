Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C24EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JK8OPOPquXmsbe/EqUN9TOcj2dsJNwvDekdtlZm266s=; b=II8v0E975QrZxO
	CidjHWMBRY2mBflt58lH8dZCo/kL8cRsvRyQhw4RNyRs03n6K2WfJKQ7K8xOQ5x2yzGaXPcpi7+09
	KfMhxKxpjEeHDCaksnCmmGgmaLreGhAPJWjjvNb3uLffXXYxPaTAcHsVSKw00sq1t+41EpI/JO5kY
	pRs7lCqYbHNlX2ZkUS1fMevN2VFE17+7W9Q1xmlAFl94HT/AjJvnfi5cE6LiPJBaW/YZ3coLsk/Mt
	NaXL7q6m4c3ckJQzMcS4vehKBc9GAERm3syti2o9hWl9xAS/NOXu9Qzq22yfaJh3w4dexAqWFp5Gy
	18aYMPCu6bmrZGph1C0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRdq-001oZf-0a;
	Thu, 22 Jun 2023 21:14:58 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRdn-001oYA-0F
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:14:56 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nXPKmx8WVT5bXuRLxBqyTO8Nel+8k42DRpIHfwB9bRk=;
	b=NfjsB+KE2lZ64ipFmTirXh8gQkzG+F2H+FfTxArjWzIUG2DPnztrKlPqqq20/wHlPHiRoZ
	/MFYo6mFfwCdTtg/TVYFmLZaE9zY1Iw2t3nr4vwr2NFI6wGUXJbkrnkyaSKzvjk22cbNRR
	geqRoB/A2ICk77rZgit17GrIZpKZZ6LRnilnZEdQ0YXAvUecsLxhPx5S+5nNANQEVOZRov
	zEidOx+/U7SDc5mhUQhOw1EUlWbBD0yvDb9gTSz463u+xAiC/JNzmR96QwNKF/z+KIlIAu
	ok+AElBlLMhJAOMFk9G+xguhg6k27PMuJbQ9a+N+tjRc70K+0OL1iOcn+Vc+5g==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4ED8240004;
	Thu, 22 Jun 2023 21:14:52 +0000 (UTC)
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
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 17/17] dt-bindings: mtd: ti,am654: Prevent unevaluated properties
Date: Thu, 22 Jun 2023 23:14:49 +0200
Message-Id: <20230622211450.3581531-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-18-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bae825ccfd4b49695466c81eed5bb51c00eebd54'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141455_240722_17F7BC9F 
X-CRM114-Status: UNSURE (   6.06  )
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

On Mon, 2023-06-19 at 09:29:16 UTC, Miquel Raynal wrote:
> Reference mtd-physmap.yaml which contains all the relevant properties
> for this device. Add "unevaluatedProperties: false" to avoid any
> spurious addition of random properties.
> 
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
