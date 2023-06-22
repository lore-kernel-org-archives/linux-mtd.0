Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA6EC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+TBgZBBOpSGEuSwFTsKYAHC8iOYhTKhQoXaYmUKDtY=; b=gBfXjCiYlCKfUS
	t6+px6Nq5o58LTgZSBT8EzzOfw/ErxHVTBBU81MnW9ljyqjVaERR8/f7MxffL9MAkOMd7bsbWBpef
	AUsyR7gl14mIjI7hXatPwh0jTuVRgmiykaXnvPwn2Vd9DmRzjyQJZ0VloHm6c7kC9G/srzc26Zg8c
	wxyFfNYHsBXIjyHg4bQ3q7HGhsoP8jqZWxbA2760teqtzDqdH4s4k+mDk3LJJ9e3Af5N7l1X8077x
	n7jqyJ14ENj8u5k6yWtx1FxHfUKKCHy1SALQo82J4tv79dRZMtHaSzEm++2YWemsQlblb7TPwoJjV
	RZi7huq8xuApAGBy6gAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRed-001owi-2Q;
	Thu, 22 Jun 2023 21:15:47 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCReY-001osZ-2d
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:15:45 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBwpb6O8gOJO9lxqmqmkmvdblU9YRJxWJ6zueaHRnTY=;
	b=C1P0NHB6cLpXmU/dApzPdkHDgPhcMZFb2v2Z7rdkGar/4Zi3exoBNOqc4d6EgwvQLy21Tb
	G5/Fe1bRbtl5QQqY5ZVL3ukiwZnyXDP2KcA9O1gHMwGKs+Eh7Biduhgp4hiO0F2nMBSzzS
	RG3VXT1UK19CP3kYMqYVau/F//RcOqDuYA6/ryyHmcgko1bN/k5EHOK/voSqkXhdmkRIPz
	ESIGYxP3F4YuQ/QaBmOvLA28F9y2ClumcGxEy4sOebpibaBcCawJLJoaNHxQYJTYk5F40W
	kPlCpMKuCSbJHsitIcUxZiC5uA0m19KBkOOfanRnAaWgnejrPXEBHh1nsPT8zA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id C961240004;
	Thu, 22 Jun 2023 21:15:39 +0000 (UTC)
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
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 11/17] dt-bindings: mtd: denali: Prevent NAND chip unevaluated properties
Date: Thu, 22 Jun 2023 23:15:38 +0200
Message-Id: <20230622211538.3581778-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-12-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'129a70a17cfc4140fd4f1dd6e1f5e767248c8c74'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141542_987669_C3C9B08C 
X-CRM114-Status: UNSURE (   7.85  )
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

On Mon, 2023-06-19 at 09:29:10 UTC, Miquel Raynal wrote:
> Ensure all raw NAND chip properties are valid by referencing the
> relevant schema and set unevaluatedProperties to false in the NAND chip
> section to avoid spurious additions of random properties.
> 
> Doing this in one location also saves us from dupplicating the
> description of the NAND chip object.
> 
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
