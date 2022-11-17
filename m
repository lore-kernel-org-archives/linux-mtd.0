Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4F6C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEfKiNW83BH+Xq0Gy+fBoC06avN+agyoju0c+UPmq9I=; b=wZ0kOcQsjMn41M
	7TyNXF4syn/TmzEl2S/keq799ShAdzf7+3GbwN78nCv66MQAiQrsySeXnIkNBs6o9vILDTZhqGNeD
	bV5L8EoRKmwQ7szKOZRalbm53TuhKTIszvkyUtI9mmc1q6mncLEO10CMvAEH4knv95cnTbn9WA5kc
	auTnTRc/uXvQJjw9uA93pSKzxkFFZ3QeNQXJJb1wp/OTnzRMdrpl4SVkRwUBVsef2Gn+vOzuyn1Dj
	crWQjgUIK6Lat7DwsUpj+ZY2wwyBJNO4GXMk1G2/4KuxD8TycLxEw6ItHwb47KfBRjZBj/P5/1viS
	6sAJVMyUplMvvjCrtmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEh-00HYU2-13; Thu, 17 Nov 2022 21:15:51 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEa-00HYOU-It
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BD16A60002;
	Thu, 17 Nov 2022 21:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBW8P64uZ+Zle2ji1+nCtWJBZ/3uNumEr3WsRPfM5tI=;
	b=f1Y0OLS1JKCv9alo/8NgEa9uo480zXj9+AnN+RFXbqr8EEoBym2Ok0Y+CZnd+tufa3FpJp
	IEHdE2EVv++EiZ2Y8IZRHeOAXKrbZ2iLrwaYFZj4K5CDIMosj7MISlCyb6Qbmqoy9KldWm
	HR91TYRZktBtxyU3nCKZ3abyjISj+HWalom0p/YDESqy4xZPufypQw/aCIyzOQN2jlPfzL
	GKVycOMRsHuAeWXGh5ai3GfGUUQM7S7QmjcWWZR4wEdkhfFHPaXotXOHVTeMysrvENx//h
	pShZdLmIagMBmDYX0OY+z9DHfy+MCPmkKtBN4Hxhyoc1YdrmiVSqvBXtCpOPJw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 10/17] dt-bindings: mtd: physmap: Reuse the generic definitions
Date: Thu, 17 Nov 2022 22:15:41 +0100
Message-Id: <20221117211541.1273405-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-11-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7bdc671822e9099dd5328431867e4cf718b107f5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131544_792357_27FE6603 
X-CRM114-Status: UNSURE (   6.88  )
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

On Mon, 2022-11-14 at 09:03:08 UTC, Miquel Raynal wrote:
> The memory mapped MTD devices also share a lot with all the other MTD
> devices, so let's share the properties by referencing mtd.yaml. We can
> then drop mentioning the properties, to the cost of mentioning the
> possible "sram" node name prefix.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
