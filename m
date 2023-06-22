Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95C2EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBcPkIsAK0blWuAZ3K7FmIUURykoztSKKsF2W3mBfCU=; b=hz9CY/fd4qB2jz
	5uUGdRCfaCgiUdp8fJmcfEALF4GHjlUpPurfu8qMRyGAsmj+4azsyVrqzbQaFZfoDDV4Jj2cwHN9X
	OtX9TKou498z2ZK2RvUASH9LZO5a0HfUA463Y0qSbAv7yNzjFQ/cX1kHJaN3+96PrfOFqMUQGUY85
	QSj6L8aSd+1qHrX1loGVuCy1AUinoRKxKYAWONnUEwR7E65mu5wPRgMhIRMd7PU9hz+wzkq7SbpAp
	jvbsGxUwFjLTMOy7Br7DTtPplySdQLKdQwxLHx+66RdAkwfQMLMEtI+E87C8gFo2Chr6eyk6LYwpL
	m/akEeP87cN0EBH9ppEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRf3-001pFI-1z;
	Thu, 22 Jun 2023 21:16:13 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRez-001p3v-00
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:16:11 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nxkx3RLfwSFsxYZHKZQ5IcHLA9Jsx/NyTQPcZpK4bQE=;
	b=cbU1vV2FeidlupSpuvQLiZP9II5F0AIDC6SJicaFytZgVEq/fJRDax0iETa8vJXAUdbvmv
	b/7peagKqNqfN70s7rYIp7MAELebXr/N8j77jdvh7tLmhXofTATd1GWEXHXl9djZPC6GyN
	KUouGMP4loo/ZnAAMm+FyiQi849W7l6VHP6Knn16rIFGThMV0/DchpU214vNKu/M5OZ6SB
	0KVyfLh8SmcK1H51Mt+KNQ6hVY3E6kZ2OKgRB+ZFa0VfDdDJ54v2JDlJitUJbXb0OtItCg
	Km+2OH1/nCvz/bP0nxdgh5qdvU0/Lyae9bSiTdwj9t1OTbMQSUi9BqCRmav1tg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 601261C0003;
	Thu, 22 Jun 2023 21:15:54 +0000 (UTC)
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
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 07/17] dt-bindings: mtd: ingenic: Prevent NAND chip unevaluated properties
Date: Thu, 22 Jun 2023 23:15:52 +0200
Message-Id: <20230622211552.3581870-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-8-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'711be9c35a1a6c3d1303f9cbacb98580bcabbb71'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141609_215152_4DCCFEE3 
X-CRM114-Status: UNSURE (   6.67  )
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

On Mon, 2023-06-19 at 09:29:06 UTC, Miquel Raynal wrote:
> List all the possible properties in the NAND chip as per the example and
> set unevaluatedProperties to false in the NAND chip section.
> 
> Cc: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
