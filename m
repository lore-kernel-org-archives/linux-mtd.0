Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1420EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45pjfsrc+bEngttaF0JwoRLn43jz9g8RZAKkFGlWE6k=; b=xKUFUKxjfSXGqU
	KGkifJRd4FUDERaWtlUtnpLawYAYkPr3kVvUEXdxVED1K9o92hvdc9/iSxY/BXUeWencDyL//773t
	AH0bI1y2W275iK/oubRNcci2Xd7nzn6TQfdNZ+7mh7eomizPNeifnRlJcz8qXnBqj0snxX3BlMgQv
	ouE1cOFSZzC3etPsfoPd10nA9GH46VJxihwigHLAvBLfKagX71F5gnMTVxfdJ1hOxXkJEySoA1rMh
	H1XSM1aNfKKJz2ss2Sw2/NbUWvmN3m8N5YhMeYwHkbnoOON5j9a7RtSPGVHF273zw7QkYdl1ATZhA
	p4dyp4M5Wh3CBbY5JJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myFe1-00B2jn-0m; Fri, 17 Dec 2021 15:59:41 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFYE-00B0hM-4y
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 15:53:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D767E20000C;
 Fri, 17 Dec 2021 15:53:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 10/28] dt-bindings: mtd: Describe Macronix NAND ECC
 engine
Date: Fri, 17 Dec 2021 16:53:37 +0100
Message-Id: <20211217155337.366442-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211216111654.238086-11-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'21a465c122b713bcef8b655f97b2a153d231b892'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_075342_355781_368622FC 
X-CRM114-Status: UNSURE (   6.48  )
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

On Thu, 2021-12-16 at 11:16:36 UTC, Miquel Raynal wrote:
> Describe Macronix NAND ECC engine. This engine may be used as an
> external engine or can be pipelined with either a raw NAND controller or
> a SPI controller. Both hardware designs with a SPI controller are shown
> in the examples.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
