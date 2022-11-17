Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCFEC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUBelUnV093SODIuwP8Wa9NTJjxr6q1Y5zT8d9wQGyo=; b=4sCUqQYAZtwkyz
	yTx2AluLvFesgsSMmKf45ErwojlqWiLLP3tvPIqmlbAmwemxma5NYrWS7o4NHAAgUQ773ZTu8YBMg
	gPzYOlSjGyYl12h9iMsjI7U8S6LbccbW4G/cBrkxr6xJnz/FGN+ZsViqSJoFxGmctU/yPOm+qUvgH
	0mHTbxkh1R7aaKMXpfZbyIsVOnKiwy0SQxmy8LGQfSAFwDCstkaQDEKxVe8P/uhe5FkjQGAe7wWh9
	We7b1BEJNkgVkQrRQtQz2k0bvewd8Ymqw96ohK/HCYFbJVAjb1UmBn2rbwUK8QN1UB+ZcDA78oIMQ
	2MnGTW6zJ91Tl+ed6Y0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEz-00HYlo-RZ; Thu, 17 Nov 2022 21:16:09 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEk-00HYWT-R8
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 88AB01BF203;
	Thu, 17 Nov 2022 21:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSDxH5qCTJmDVitQzqmYPDSghZo6DMeYruqh5RT9kn8=;
	b=h+rDnow5RtoECLPtqweV5vMt1Ss8CR9ca/XiyqfSAacpmhkyhUYZLoHKl3UwWf62WUA+Jd
	ItC9LHSiiO6kKFCOd/hLhSW5pH0J2LGfhatnUknl1wiqzqsG75JtOMVYBG0vxOyR9whdOj
	aWYmJyPWVGpNUg2q3NdGvFnyAYQTUCIzXYrvE/7s75UI4XHR/czrQuaBg/l7qDYff+txxO
	ojGLNOxPJUGT5gqanwB6mcE0e6GNGGJP7EH6xiskhDSs4eGFupJ1rRS6Ag1T034eJ2NfdW
	HBO2liDenYlFeinvBtu9yffg30SjPY26TvagiWc+7ifGXzQcKbeNkqX5K6Yn3A==
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
Subject: Re: [PATCH v3 08/17] dt-bindings: mtd: sunxi-nand: Add an example to validate the bindings
Date: Thu, 17 Nov 2022 22:15:50 +0100
Message-Id: <20221117211550.1273462-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-9-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c68fc5ed9529987d69d34b367cb390b2285c3ac9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131555_048432_CB0C2719 
X-CRM114-Status: UNSURE (   5.97  )
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

On Mon, 2022-11-14 at 09:03:06 UTC, Miquel Raynal wrote:
> Copy-paste an existing DT node to ensure the dt_binding_check target
> would catch any unforeseen difference.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
