Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5529C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUE24SpiLs10ZDtMQLkNv0F+LGqg7/Fd2xhCV1nsc3Y=; b=a/WPX5aOuLROd7
	jrq18i+j8z5Hxr4Tr2+hzqJBRpmsiC3qec7E4ZW7SguNyjQJePCApHEb6jKB4Vd+ePSOcXaDlSClu
	ibraoUdtv1gG14Nk3qISdBgS7tjfF4KOMr1/cEhWAoVqXfy0LLYPGsSElvadrAGQJCSaFBUEkeRqK
	qznUHVRxLzTV9YGKk/gA9CTIODKKgon4gjkAs1oQ4yayHTIaW1JnVHkcBU8k29vfAV2f3imo4deWD
	41V8gwg1AxzfXSGYoKy3RuoLihX3lh8JWrgOteFIlJ6i6BRFQudlN3NkTzSJxqcenPhaZseIad/mZ
	XeyzsZcH+H+8F7iQarsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFX-00HZI2-Sl; Thu, 17 Nov 2022 21:16:44 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmF5-00HYpt-Ft
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6231F10000A;
	Thu, 17 Nov 2022 21:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw+ifOlJtc4kQJj7dswRvNQCovTkxmadZAaIJDyO/sY=;
	b=ISodbx/LUIWnXMaG6fZ9XXN9mjvydlLpNVyO+Q2VVpfIBVlyiA1pfsO66T/3XjX1B5ep/M
	IDYYahpYgRvTB0FUXclcrte9BkwK+XPcQ1MGPFz+3aRohz5o2vanupgEDKGy7TeWUKvVtP
	fiQlUEunEpGlqgcJaLCeslTX2VsRH3vVJU+HBK1U6eBQGUjJVGnyQ8DJ5j1Bh/qiuI9n4y
	/L1S7BG1+QtTp1bkUhIQgRfM4dMbuHPJPm66Y+M2KbIzX9W4uIIuGH8VvZ3mzeSJrNPr4l
	7pSt6PXhLZIuSoeEKIrC5Q2SEUUszzPXNzBimeIfS6DO5N3J+jTYUsVe1OIXuA==
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
Subject: Re: [PATCH v3 04/17] dt-bindings: mtd: nand: Drop common properties already defined in generic files
Date: Thu, 17 Nov 2022 22:16:11 +0100
Message-Id: <20221117211611.1273578-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-5-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e598511b0bfe7d9fd5165d53f1afb94e1a9be62d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131615_788431_3ADDDF50 
X-CRM114-Status: UNSURE (   6.58  )
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

On Mon, 2022-11-14 at 09:03:02 UTC, Miquel Raynal wrote:
> generic files, so let's drop these properties from the individual NAND
> controller bindings when no additional information is provided rather
> than the possible presence of the property.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
