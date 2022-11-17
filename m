Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF992C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jq/j/CXLBhGIFeEZU4ImCP9c/jlBZS63qQYMIlXpN98=; b=W3qAfd2sn7zjed
	Uz2a7Wk/uv44oRd9eI46jE/08y3c0urghPyLUXRX7hPCVGbJPnB4GHkkOYzw93Wb95W8U9NQt9PzI
	PTt7rGVBlS8CV0YodoWxQ1geKmB1tXFx5Nj5toPw4jInUbNNS1GBJ9nVGRJxiu3hUhkrsFn2fWToN
	ri1YtVTwsbk0gDyL5UHSPyJ4k1aMZLHcoscZ13JECvlGnGE+FD1jLKlvqTaVNJFV2GcTbHKlUruZV
	b5UTkINGBEFY/yvAgP1VmDaiAAhz7K2FcPrR0+HqVwGoS9uoACYWwMyszBGPNEEBB8oa0i7ajykn8
	2W6lEfNp0DrnoIkdQRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEl-00HYYH-Et; Thu, 17 Nov 2022 21:15:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEf-00HYSI-GF
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 80EB760008;
	Thu, 17 Nov 2022 21:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/e3JQKNJWHzX7z3b8NbCC3L33QHhdsa7QAgvCkJ+88=;
	b=BdT8BPaV9hRMnDPu3CpF3oH0ezN+o+m+tLbnN6ABrcP8FhQQMs4ywJr73+QM2gBgqJ4DBk
	k7zF0xuFHw+/DvB5dD8COXbc3L5btzdLzdjrGswAOpRn41TCvehwIqsSAF7dEmHpAqjwJV
	P/RC9DEzcDVQF1sbacuPvykOWt2ELpaUW2XqNdBNRTbrbzLxYI7qLRy6WZDwU7VgJj8Tkn
	byWuvugL6q12eQ2xJpK/Oha1Cbr1Q+6TLgNM3UBbe40IYPX1rhRarzBLegZOpLLQ1JryV4
	n9eMvLelxRcxOrO1cpAO+VC3EQty7c24lfHzBlWAVbQOt2IJbh4mYpwSHLz8EA==
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
Subject: Re: [PATCH v3 09/17] dt-bindings: mtd: spi-nor: Drop common properties
Date: Thu, 17 Nov 2022 22:15:45 +0100
Message-Id: <20221117211546.1273433-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-10-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e9a399caf0314a69593b653ddf0efadbb11ffb9a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131549_703625_2BF191BF 
X-CRM114-Status: UNSURE (   6.55  )
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

On Mon, 2022-11-14 at 09:03:07 UTC, Miquel Raynal wrote:
> When redefining common properties does not bring any additional
> information, just drop them from the SPI-NOR bindings because these
> properties already are definied in mtd.yaml.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
