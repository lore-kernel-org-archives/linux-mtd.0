Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B50C9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qi0xjPahcKBmPI32K0QHgXNY1noxm+mKhiu8b3qTbqY=; b=TCj1h0RsT77Y0y
	cslokTJw7HYaq3dlZHED1O5YyE+YusyK/5NDQh5ebX1u0Jfu8VQT15QlyWH4gzMbDyIHiTFKI3RD5
	v6l8gmL1txpv+fJRIHt9k5CiWplkiM7zeS5rfIiVep1Lf9gNq6mIKmdzrr1aLACRN3HXnJtgIr1yW
	vbYQTzfAM5IGwKusAHccmZnFlCSkx0tVFh1cHxmqlevFWu3Yf52KH3PwJrdA+pfMDTaphbuEMbJb3
	nkDaVWazvq4DDPM37X6jb6SnzFp/922IrQyryDQRnkbuEo1BNg+DhvKb5Buy5kOKfhaRD55f7EC3H
	+hCAZfOINQZxp8PY4woA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4uO-0000000DIxB-1UIk;
	Fri, 25 Sep 2026 12:20:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4uN-0000000DIx5-2J8O
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 12:20:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE0EA60136;
	Fri, 25 Sep 2026 12:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6C51F000FF;
	Fri, 25 Sep 2026 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790338806;
	bh=eiNOBUVap5JNySn2mRnx29Z02YDzK5v8loewzAEqjrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L9P4nIra4SEhZSKi1Pe9VRN4VYFNxd0M7T4OP8dUZED41cFZaU20z80xffMhAwVrp
	 QBf9G926/9p6VmtWXors/OXTSxfIotdt2OWcFwexgkfzMgP1OGWT3ViroYb+1SJx4j
	 uOu9Pq4923tQys14hP+OQxjD9GG5qcnlA9ZJxJYDgUbcyoCUMtVt6+7W7aPMW/Xxax
	 WAlKZyGHKx/JwqVRD5eBR66D1zNIhoKrnblUN+qsXKi04PmWp6Dr0ZSoyz3d64NiZh
	 aj8EmCTvgeDPSSVYBaTb47Tr1MN1tAYarsM6E3mkNyJuQEXboqmhdilCXF6wqO1Dwj
	 FuL3slbfe/Lnw==
Date: Fri, 25 Sep 2026 07:20:03 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: arasan: Add ZynqMP props
Message-ID: <20260925122003.GD677989-robh@kernel.org>
References: <20260922183138.290114-1-robh@kernel.org>
 <877bk9n122.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877bk9n122.fsf@bootlin.com>
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

On Fri, Sep 25, 2026 at 11:16:21AM +0200, Miquel Raynal wrote:
> Hi Rob,
> 
> > +  num-cs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 2
> 
> I am not sure I get what is the purpose of this property. It looks like
> a downstream property resurfacing. We expect one DT subnode per chip, so
> I don't see the need for num-cs, we just need to count the children
> nodes. For me, the correct fix is to drop num-cs from the upstream DT.
> The only real use for it would be if the hardware could be synthesized
> differently, with a single CS instead of 2, but I don't think it's the
> case here.

Indeed.

> > +
> > +  power-domains:
> > +    maxItems: 1
> 
> This one, even though we don't actively use it in Linux, it may serve a
> real purpose.

The driver core takes care of 'power-domains', so how is it not used?

Rob


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
