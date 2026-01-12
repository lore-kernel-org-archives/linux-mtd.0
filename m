Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68FAC9EC97
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jan 2026 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSF4NuArPqHE4WvQfxkReCtF5OwNf4gS0E83wXOFT0g=; b=3UUGkcNFOrwLj/
	eLr7Wj6bytc965uGdpKnHfMrr49xZyBFZF48/nKthWB/nZ9vf3OL22WM8WW0CsGx+T4oPyP0dbhvU
	z3aPrFNdN1UKQ3C9IF0uN41y0E8oj2GdwXoK0/5UoGnMO9MyLrbRQKBoohiBCGMq2ksz8i+VPJTBV
	csl26zVl4q/dpOWTMJGJE22KI8FcT1f0HGmyClyDSvaWTK0aGGt3LuQ6jKMK8wgvC5IXrI6dRcX1I
	F3+t+EE0bFFLb41KpDdI5Yfd3KzlHHMjpF3dhjHm+GVvGrhzwVLTipg/YmOyTfbGyCLgATH+pVUpb
	oSxV5HCSGXa77A3Y2nVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKBB-00000005fOU-18VU;
	Mon, 12 Jan 2026 15:50:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKB8-00000005fNu-3EZY
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jan 2026 15:50:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D26A660017;
	Mon, 12 Jan 2026 15:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BE3C16AAE;
	Mon, 12 Jan 2026 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768233001;
	bh=3y5BREYF/LYb3rDpeAJoU0WEgkB1oXbwP7algjJkQDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2g5FBlwTJ1Zs9ZBUVulpUZNEe0rSRbmb4mldfSTzAjgWNAyMUZemR6myIMqpyV3u
	 h/a71rRyiG0HZ1MG4FH0T22R5ZDCrPT55aBNmkzlItmqQgvkn3JWOF+BGcT4bHWP0l
	 XzbmR3aBXRtqEQjpyHqk0HvWX8Rkle0hl65S+ZUmqP+XzWTkKez7xW+1DzZ9xWe9G5
	 dNlF19AyZ3QKhZ7IeFVVeezaSt/fK7ERnmySP1lS8a5jJqD2EJVIeZxnDKWTgVWCgM
	 u8JTRPVDUK8g3RXb58pZ777uZtMT4g50pePWfmjqk1bHOF/gdtQNDZ3rvx2AnHr7GU
	 PJAXURnNwuTAg==
Date: Mon, 12 Jan 2026 09:50:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	William Zhang <william.zhang@broadcom.com>,
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH 05/10] dt-bindings: mtd: partitions: Define
 "#{address,size}-cells" in specific schemas
Message-ID: <20260112155000.GA285243-robh@kernel.org>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-5-124a53ce6279@kernel.org>
 <20260109-crouching-alligator-of-ampleness-aca683@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260109-crouching-alligator-of-ampleness-aca683@quoll>
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

On Fri, Jan 09, 2026 at 10:31:03AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Jan 08, 2026 at 11:53:14AM -0600, Rob Herring (Arm) wrote:
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
> > index e3978d2bc056..dc6421150c84 100644
> > --- a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
> > @@ -28,10 +28,6 @@ properties:
> >        device. On a flash memory with 32KB eraseblocks, 0 means the first
> >        eraseblock at 0x00000000, 1 means the second eraseblock at 0x00008000 and so on.
> >  
> > -  '#address-cells': false
> > -
> > -  '#size-cells': false
> 
> That's probably separate commit. These partitions never used child
> nodes.

It's all part of making the schemas consistent in the handling of these 
properties.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
