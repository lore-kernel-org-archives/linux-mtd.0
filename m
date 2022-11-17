Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CCAC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pg0ghPTFJu5ihruO16yVKgQZUw5U55X5ixePBEoe0XE=; b=lTYHUCW3ZdWguA
	TRUNnCLLtmeXCUCohcs4OF5151RuFI/NOzqV9/n0GDe7ljuu+t9ADrQqPupPg+1/Pd9I3tH4OOx0q
	Eg2SnM6iVqAvBTSxr52X4Ph1vVD9f1l3ilxzesCuLil2IjC0KDVQGgpI2EKGyJM66yrXLEFpFxD2L
	EejuxHUfgqSLqn0OzteaSSycH/nF6Lz18drjYC09lEddUZBePf+61/SN3BDPsb4FlNDV8jA0thI3E
	6GJy75Z6yreCYz+qFHNvTee+KmHdmlxt1XnljPiDzQOY1oXFNOCjSDfGl15p1qbeLu4pvQdUnUT0K
	7PIrZsme122CWJoGweLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFi-00HZPI-6t; Thu, 17 Nov 2022 21:16:54 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFA-00HYuA-6D
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2337E20003;
	Thu, 17 Nov 2022 21:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWqdtOEXL63pT4qiPQVd/YVAbY61skTEnUxpVxVZDOo=;
	b=gBBbIds7swz7cVlBRHLzK8bzfHvf2TrlLOcT3SzyhCsvd+mKC+CoV8xhV+k6vCN45IoCKe
	oGtmu00eOMD6BeB2VMbWrD34vVKXJn3rANlnFlmkvmNBrbgiyKioYyQtVGWfE3uvKLbWYl
	1rVOcu5MMz4obKOaPFkwza7kWRgdG8CL2oCPl6WW1Q/lnxeg7GGGVxRNLyDlirDoLfnbkB
	YVVjA6wV/ROuVKOv4ZyDIBSMaNX172IdfnfPSBckHsGtmzHfVZCwFKBMY+0OqWnBVJW7gl
	tcZTvF8ZYlMEchgCeWkvq3ifaZFOdX/fw6o65PykI5bkYZSoWqubPFleLC1k+g==
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
Subject: Re: [PATCH v3 03/17] dt-bindings: mtd: nand-chip: Reference mtd.yaml
Date: Thu, 17 Nov 2022 22:16:16 +0100
Message-Id: <20221117211616.1273606-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'71a2026a66511d3296cd657bd3066dbf2f5ab11e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131620_436077_54BB81A5 
X-CRM114-Status: UNSURE (   6.24  )
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

On Mon, 2022-11-14 at 09:03:01 UTC, Miquel Raynal wrote:
> A NAND chip is an MTD device. mtd.yaml already defines many useful and
> relevant properties, let's reference this file here to get access to
> these additional property definitions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
