Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93E4C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFWaf/Zj+kR0mxsnh3k2B9LdLOJW9dVyG/f3llg4nuY=; b=3QzUDdaMShbbps
	cNH52TDLtn1UI7c7utmfdWjyH8Z/BIBN7QVJc4VtCRozKARWV4Z7MJcod8ogO8XFwgYJH7elzO0W8
	CZpZzaVdiG/QYkJdNIUWGMQtkS8vvejUJNfXEPALuRBCq3c9aLYuKurnI1cyAM8u+kSkB+QEmmTHP
	AS3S9uoF2v/KP3P51wrxpr2FYrFHAGKuXn19eDBAKfHoXvlanPYvcqgQ2w5mwClunv6k2fpuGr45W
	tBPYbdejoGMMis9ger0NiYqAlRKShia6jJp36Ggiuuxd6h2ISW9hq1PIaC4E+nGZ+IyaD8HxE1s/Z
	dWv5x5KD3R4SKbiU2Z2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEA-00HY3c-Ua; Thu, 17 Nov 2022 21:15:19 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmE5-00HXuf-6i
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F31B840007;
	Thu, 17 Nov 2022 21:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8cq3DkVGaboUoIGESwnySAxmU9rfWYlAv1bVx+OaeY=;
	b=BcR231/g5unTO8iKs2TCURhiln8lh/8Sz8JVMzAv4BFMOBw1/JTCu4na5P9eYiIVo6+uAA
	ZU7bnR89jebjmEidskXD1H9VYGzp7+PgEYIlS5mmvJBfbBwm5jJU6bMGrYpBkEvUrLVI5j
	1CCTyPFPOgI/Dk1p6HqohWoObO0j8l+x7qLtNdTgiI972L4qmVviKCgvgLk+wP1izZls0+
	yeNxGPGyJJ+hdRxs8AFOUPlsFSYuR67E0u8SOuFwSTSnwXaffarIGpG7gLdXl0GEnLX9mb
	fVbpvMrcyOrR4kxXYkjtsTFmeBk+MO2Mb+fxuF/ehmNc9USLDbxhq66h1sZ6bQ==
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
Subject: Re: [PATCH v3 16/17] dt-bindings: mtd: Drop object types when referencing other files
Date: Thu, 17 Nov 2022 22:15:05 +0100
Message-Id: <20221117211506.1273231-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-17-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd963af0b23ca4a72d913b0ce56ce5e270dcfa00f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131513_440577_F1A5CC26 
X-CRM114-Status: UNSURE (   6.03  )
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

On Mon, 2022-11-14 at 09:03:14 UTC, Miquel Raynal wrote:
> Setting an object type is redundant when a reference is made, so drop
> these useless lines.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
