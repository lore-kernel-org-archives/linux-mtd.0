Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EC2C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlYHO5nBwQnwlN5ply/XaozRKBH47itUIJ879Hx1WfQ=; b=de+AL34PEgYqbk
	k15fE0DZyzNqVhC1HpJTlcSK2YOSy3n+xi83Po+v6dxxSf8IzZGAbWbI2G0LW9/WlfCvdd358lHmq
	I1YLhL3MRu/EinN4/uULpM+aVwMPAEauRMSRLwEdbYgmhLptnS54pcatOfTZXejIF62S5tav74Tgc
	Q1+MOhzvYPyx3kNvYynroTB5wRfmP95wAMxbpOHDhTbAIwCuaQHg6b3eBALQn0ll3TrgdtV+lbck2
	fluAvOQf7580eUJjD8+8Zi3srtgJAB/yslMzcTD8mC8lA51jKaZERupIc0cSYI9uE89LKx/Wrvme8
	wNeIjkmgwmqsh7JTE5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmDz-00HXsX-Q1; Thu, 17 Nov 2022 21:15:07 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmDx-00HXqY-0o
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E396920005;
	Thu, 17 Nov 2022 21:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XumABK92c9U9q06F4y8mih7GgtpUYXslHIIFqiebmLc=;
	b=SDhPSwcjIA/9DssnIILhEkqW/Bsnylb26nGH31NjmZ5f3GicoItVWym9gk9h4p6UpISkCe
	pmoJpOcN3g+/RJOnG2ybGO/Jte3OKQb0fW3wCJMIbcnFXaO0a0kWybbqNGHQlcHnCa5WJs
	QpcB10GxeFECoqIKHdbzYfq3cKfMW1ztloOtFMR+qgssRln9u66rPvEX+7+Ag6UWKmOngz
	MIJiAezGB4MKHsxTcA9KnlGHJyBYJ2xrLBZ+ufvuK9wZ1vtF/syQwwko1AarvSE9/NQ4Z9
	9fKZG0jXaje/cQ9eRX6XH4+U3IalxSpsBtEn5ZYQvNHQI+bz8r/eJiMj2gtSdw==
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
Subject: Re: [PATCH v3 17/17] dt-bindings: mtd: Standardize the style in the examples
Date: Thu, 17 Nov 2022 22:15:00 +0100
Message-Id: <20221117211500.1273199-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-18-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'74f4d7974d2fc88fa39538c0748a2e44ae6c8b9d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131505_208686_7394991A 
X-CRM114-Status: UNSURE (   6.52  )
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

On Mon, 2022-11-14 at 09:03:15 UTC, Miquel Raynal wrote:
> As recently requested by the binding maintaines, let's use 4 spaces in
> the examples.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
