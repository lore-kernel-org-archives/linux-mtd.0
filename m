Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CA6EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oNY+RJYpt55/F91IGc1zJpdFo9PJG0ngN5M4sw0tOE=; b=sN2UvyuqYVhczD
	ka1fvAeKVGS23zWph+ci1Of8ziRXzrJHCqszF9dHHdc0efX/Gq58Y/F86q5vV+IhIk2i0PmDixENK
	xaJKT3OuyB4EwsHfgLODT4tfWj8AeTmljlJ30c7Uoi1LwrtqkpysNt4n9LMHKp7Bglzfq/x/HOI7A
	HxYEhIvJS/Ak3x+s2jExLsjTmcnDIdT/3W1/ai2qY+PWRsH1xa2MW87Ab3kXfp8EKWHyR3db+rfhv
	yohWlkKjV2C6+iGb9xJ3VwuFVDBxJdIriTnFMmJtxojbuFuZCGMXsKjCs9El2hyr786hzp6Wify4n
	eKXrUIHI+04AF2M/svpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCReF-001oiW-0f;
	Thu, 22 Jun 2023 21:15:23 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCReC-001ogh-13
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:15:21 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYRJNiBdhYqgUY4eqs1PzAG7iGfjpDcV/3X/B4a4Eho=;
	b=dFYxTtnVX3Q9IsL+cGBtexItkGwjo7kOaZNMf+GrU8IUerKitWOL5Z3JRo0ChTz6kYHmbl
	OfAtnc0AzOh3562WPv1EcC/UQIxzPulH4YOsyqyOO61vzqL/rCPnwvBsaGxfamXLaqH06h
	YwslrAR/UPjNv+veMNee2rTx3T3NPNfOvmcf3j4D6XMDYnXgrD4Ofl+62u7VZcN+vpEdSV
	Wu8XpWrINQaV3o+sHIIGuxDe1eNmWAKrUE33YggiNVnSG4GS3MV/9znTh9ab47+SEIxJeH
	CatiuBiekqF3B3RLX1iA4brIEryYCwgQEGvqNRr63+aXWeUw/Bwnhv/aMIulXA==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BADCFF805;
	Thu, 22 Jun 2023 21:15:15 +0000 (UTC)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 15/17] dt-bindings: mtd: mediatek: Reference raw-nand-chip.yaml
Date: Thu, 22 Jun 2023 23:15:13 +0200
Message-Id: <20230622211513.3581625-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-16-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'18d07864e54654b38ba7612c96c0282982a71a41'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141520_521456_334E368F 
X-CRM114-Status: UNSURE (   7.15  )
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

On Mon, 2023-06-19 at 09:29:14 UTC, Miquel Raynal wrote:
> The mediatek NAND controller should reference the new raw-nand-chip.yaml
> binding instead of the original nand-chip.yaml which does not contain
> *all* the properties that may be used to fully describe the NAND
> devices, certain properties being actually described under
> nand-controller.yaml.
> 
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
