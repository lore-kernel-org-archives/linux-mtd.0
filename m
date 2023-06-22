Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E52EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzinZ3c/v9ahMtTWZ0xb7IBHfvrtNlb4WBYuN89/7Ss=; b=tfKCCNJgbYXSeC
	4MmwqXVl5W9W7epjgro3DmxoauXj/JDjooU5Xa12Nr4D9AIBnZtqhptnynDUhzRE5ExuoMbDTFjg0
	v9GGsUNq758spa0FzF6r5axVoNdtgq2uBgsr0WSY/vjC90zWFTPQZv0z8/ZqC/qzb8T+8T47zEopK
	N6qZgN6pUCygXsxHgr41tgkHkfGWiAEpYOS2yzly+eqlrLWURTbTRXQqTR48BF4fPJhhHcq7wFbXQ
	jV+kljBMgaC8SBlWNAAjs//62NgI4WPRWPIxInUHNqS9m89ifzp6NyiXtdwiiv9ADNg3DLsCxnkcX
	9LQz2NnyyYG8SbXA8Juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCReX-001osR-2j;
	Thu, 22 Jun 2023 21:15:41 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCReU-001opP-0v
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:15:39 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shq6eIf1Igmp6UuUM0YmQ0o6buoOqSPsVoSLfWuQDE4=;
	b=YXXM+ISE3PG+CiOGmSWza2HcFjkiq7troiVe7r0rJGyRRBLrkudRQ5jcEp4SBCyShkfGEA
	XLufXbEGmsErI/N7towq/l0uH0qw/J1zboo+HCHqcOzPbXAsamGqFLHDG4GqstDXAictms
	OHu3yL6TWHgNEUmxv8F+pIPNasmualQ8ujtQviFExOpOwJRwSrVa9/0na+ffM2GSErKD51
	vIlD5F8IcFqvWcnfAm3TeEkSvutFnoo6oRSwkgSqjtGp66AWEqKuLnchdgyQCsWU4q0KHg
	7wvE3rUQjFpLlKZJfpVQyOIIh2U+qfgQXrQRPwchQ2aHkzNp+/HyG67BfMckDw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF9C61BF208;
	Thu, 22 Jun 2023 21:15:34 +0000 (UTC)
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
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 12/17] dt-bindings: mtd: intel: Prevent NAND chip unevaluated properties
Date: Thu, 22 Jun 2023 23:15:32 +0200
Message-Id: <20230622211532.3581748-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-13-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1dcd314282957c3ed8e5faba1641b6382fe13b90'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141538_478031_D43DD2C5 
X-CRM114-Status: UNSURE (   8.95  )
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

On Mon, 2023-06-19 at 09:29:11 UTC, Miquel Raynal wrote:
> nand-ecc-mode is a generic property which may apply to any raw NAND
> chip, it does not need to be listed in each controller
> description. Instead, let's reference the raw NAND chip description file
> which contains the property. The description contained
> "additionalProperties: false" which is wrong as other properties such as
> partitions might very well be added in the final .dts, and anyway needs
> to be converted into "unexpectedProperties: false" to fit the property
> change new requirements.
> 
> Cc: Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
