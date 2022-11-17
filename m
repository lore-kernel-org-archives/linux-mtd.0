Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D330C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11GzR9srLnQTPIUdQAlbIpREJXOuz9esmU4bmTaw6Mg=; b=CpLL9ng5+wVahI
	dts+CZ5EEuy1a9Z+blvLi/pzGH261dN+cVIHH6lhLU/XVOJzCNV/RH0xyqD7qj7bDMmKsqtJXeLpk
	x2kgnl2bcqJltSvYPTyZaiHLiXXUJ1a7WLgIy702IoirE9XkKg4sZIartBk5Jwlxirf72GGOm1Tix
	FILKv2bGW+Qrq9Sh8yIY7/ePMWsDM0MeLjI4TBwJ6GVJ3C7+dPJtZjk7ZuSzVHJrTzjGWW4W9QDOr
	7vvUhegYrPLzkEH/v6cVHfVC1J5xaJ9TLER4XJmFtmha9YRwFH49AbN/dkyr/X/M0XDwMZDiE0dKW
	fOcv2fUgpfubjW/H/00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFJ-00HZ52-Fw; Thu, 17 Nov 2022 21:16:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmF0-00HYlK-JI
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C9762C0002;
	Thu, 17 Nov 2022 21:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KzOL0egflZiwjfJaL2Ni+++jogbuy2iBQ5wpQrx7o78=;
	b=CnLULpy9G5+3fm1g0LqxgrUnQCzP7HanB1EzN1aopDXlygKQrRz/Qa8mVY11jYIFfiwjGF
	2zyENuCJdoDjRUVxP1E3b9qAkTf85w4D6URlj9KzlKXvjdQ0TWFporadim26b2QJB875ul
	LKD/GhfOMyStjXt5DQ+Uxl4PH2hvKkixULUcfYjZKB5YPsP6ktJEZQHCUFreaCAKainOCh
	gUJkbdbyrCwqjfOfTLH5irfQDkQINywwIBiLItXr+OMwG328K4EIme4k7LfeuP2ZVyRVNr
	bhfIz++xBdIDQUjNrA/+nMRE55vpZA+5RCjlc0GVezPy77xJTY/THAkCxICX/Q==
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
Subject: Re: [PATCH v3 05/17] dt-bindings: mtd: nand: Standardize the child node name
Date: Thu, 17 Nov 2022 22:16:07 +0100
Message-Id: <20221117211607.1273550-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-6-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'488f19adf040329cbc0f9d3bea4829ccd0ebb57b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131610_802907_EC0695DE 
X-CRM114-Status: UNSURE (   9.26  )
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

On Mon, 2022-11-14 at 09:03:03 UTC, Miquel Raynal wrote:
> In almost all the schema mentioning a NAND chip child node, the name of
> the subnode contains a single index number.
> 
> In practice there are currently no controller supporting more than 8 cs
> so even the [a-f] numbers are not needed. But let's be safe and limit
> the number of touched files by just allow a single number everywhere, so
> in practice up to 16 CS at most. This value can anyway be limited in
> each schema.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
