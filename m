Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2EDC5B572
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwPQ0YtoRMBjEEZKKCN/24S4tHIIoQgtOXx9jxp4l7k=; b=3CmRK66mgeqRKC
	FWV2UmqEEjKgjCjss6w6kN4eCs9m8i2XRJFAqxrrx/AtDUH036smdm98a1KzGDeaw46u0Mx+T7od8
	AWFIZogD4WK25T7+r/ytfOeR+BwbRJN2H1WIgV1Qx/ySSDI0hjlgKfVWrrIdw15eKzC1Hsf7Hc6Yi
	6Dq16gYthmfQ/cRV40JV2g8n6s04Z6Cyf0pyQ+U4cN+PYE5pazrGAW8ibpyLWCxvr8OprofYoBIYc
	StO9k+lxNLGUDT2Z36fmu0q+5TyEjR1SsjbLx0C/yELUNlfkRBGOArUOxNz/OFCSuRE/V/Ijuapww
	2MLuZJH2Bh2XJ8o1LLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUqW-0000000Cdst-117q;
	Mon, 10 Aug 2026 18:35:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUqU-0000000CdsK-3bD9;
	Mon, 10 Aug 2026 18:35:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E355D600C8;
	Mon, 10 Aug 2026 18:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757FF1F000E9;
	Mon, 10 Aug 2026 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786386933;
	bh=tnho4rrrB5eB1gkI1817NuCvPB/07wS2vcTVe6IMdjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYmWygaBYAucXKZxr787sYh3qGARvpJY86Je5DMJbNxZnDYa7l4yTzD28oj2EN7My
	 o16ZB4rA22AlKYA1iX9FaZmrfdsNTTCRTV/WPlPJ+6NU/tSdl9trogupy27ac8akVw
	 W1jOqDlWA8sH77vJPHLrtw6E86dVQl2szMWzkz/N+Pn21+3nd0BYPRu0vrADgp1aZR
	 mXeB39csRtttxUctgTLpcq4/b+87TcJ/JiL/l+vE1aoILzVQeZ/fJMzc9+zpd+N2bC
	 1U/Rz+ddRw9ycDmW3gcRoKL/nZYv4fIDIb3qawaUhEkTHEwMD8kW9Lya/1AXaY6amD
	 XXQqwkfHzAXJw==
Date: Mon, 10 Aug 2026 13:35:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: conor+dt@kernel.org, mwalle@kernel.org, richardcochran@gmail.com,
	richard@nod.at, linux-mtd@lists.infradead.org, pratyush@kernel.org,
	nicolas.ferre@microchip.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linusw@kernel.org, vigneshr@ti.com, srini@kernel.org,
	linux-arm-kernel@lists.infradead.org, michael@walle.cc,
	krzk+dt@kernel.org, linux@armlinux.org.uk, arnd@arndb.de
Subject: Re: [PATCH v6 2/7] dt-bindings: nvmem: layouts: add Microchip/SST
 SFDP EUI layout
Message-ID: <178638693216.2623305.17648873474456731679.robh@kernel.org>
References: <20260729043026.1811147-1-manikandan.m@microchip.com>
 <20260729043026.1811147-3-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729043026.1811147-3-manikandan.m@microchip.com>
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


On Wed, 29 Jul 2026 10:00:21 +0530, Manikandan Muralidharan wrote:
> Add a binding for the NVMEM layout that exposes the factory-programmed
> EUI-48 identifier from the Microchip/SST vendor-specific SFDP parameter
> table (e.g. SST26VF064BEUI) as a "mac-address" NVMEM cell, and reference
> it from nvmem-layout.yaml.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../layouts/microchip,sst26vf-sfdp-eui.yaml   | 60 +++++++++++++++++++
>  .../bindings/nvmem/layouts/nvmem-layout.yaml  |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
