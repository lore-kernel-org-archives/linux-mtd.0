Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CFECD4853
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2024 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soi+oBncXZbHuiZ30+EW7IjFpqqoaq/IqmNf+J5kFyY=; b=viqmuza1YLtbdQ
	B/DB33phBUbDqgM41FsPw1/6jRUb8EAmkYkD/VOKXV5sOknzXo63XYTsZpCq+8GyRAijs/lklybfa
	Ne2C6ttTnKiCr5QBHIMNgWLtwBnlR00Nk4+mPouOcH+3JOH6oM74x3ExulgS/KQuss7rH/G5X8uv5
	zB5hlOxkY60fRtGjy6fSfOSynQTcPLKKCFVsvjxwEdcvsVWzFKUB3aEVi0aaOCOzNqCVgNmHOmYbq
	9gWQIOMxNTG57RvSCVCBBrHwfnishf4AnNgqEF8I0C0vvuidtel8AhHRm8DF6wboIOpM6WXWz4b2N
	C62i4vjbwcWPuR3Ay4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrUG-00000004uHy-1j9Q;
	Wed, 04 Sep 2024 15:00:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrSm-00000004tlL-3vKB;
	Wed, 04 Sep 2024 14:58:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1AA8A444A0;
	Wed,  4 Sep 2024 14:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F71C4CEC2;
	Wed,  4 Sep 2024 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725461907;
	bh=UQnaAY6AWhM20C0iIDyykUuqjm6xEAysthXGZe2Wos4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgcM3t41c0e2L97gdbL3uR6WCSplPsdOCaVX2IOGW0VTzUTMQmcogvAfF0xnP9t/j
	 qGRPURbXva4htrayPRZU5b9gms2oVZctYwCSJRB0PMOPIBrpnmiOSrq22tC4/z78C3
	 JqpJkSkR4rQZv8yOGv98P2DvB/xAeprr7/agV8DDjr9ggQQVJ9qWSe/bjPSCrYtZwV
	 Jl0l1kOLkkHTw/OaHnfi2YHrLSTwWDD/FUlOy/VZ3eCzJZqaWpHL6kOqEJLjbK9Igp
	 Z+K2GVtUyQpzVhMC5lnEQuD1HEbbQY/Y1RfZmS5jWMpkNuoq1bnhGQf3i1EONhqo7w
	 WzRLxvCui0gcw==
Date: Wed, 4 Sep 2024 09:58:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: linux-mtd@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
	Enric Balletbo i Serra <eballetbo@gmail.com>, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mtd: ti, gpmc-nand: support partitions
 node
Message-ID: <172546190582.2558699.15930679272303980998.robh@kernel.org>
References: <20240903-gpmc-dtb-v2-1-8046c1915b96@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903-gpmc-dtb-v2-1-8046c1915b96@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_075829_053959_88590F01 
X-CRM114-Status: GOOD (  10.62  )
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


On Tue, 03 Sep 2024 19:29:57 +0300, Roger Quadros wrote:
> Allow fixed-partitions to be specified through a partitions
> node.
> 
> Fixes the below dtbs_check warning:
> 
> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
> Changes in v2:
> - reference mtd.yaml for standard mtd properties like partition as
>   suggested by Rob Herring.
> - Link to v1: https://lore.kernel.org/r/20240830-gpmc-dtb-v1-1-792cac1ef3cc@kernel.org
> ---
>  Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
