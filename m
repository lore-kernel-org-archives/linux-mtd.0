Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB28C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:From:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7dysPCKP+19Xaco5CgEU9w2Kl1KHAKyFyatSfrGqGc=; b=pwcXnYx3J6OQtH
	2XMtu4UJhmRaGwibiiWpwdlIbVJsAeoPoLUzNyqEiybRVSjUowpFATaD58shIsB/BiP5EeoTu7M5L
	TrobV17NzjFe5KU2i1r2sE+PBFW3fC2J0D0V8Kicgz1EpsoyKQNMHioNt7gmv5nrkkQszTmPVZccg
	IeMZGzPDDd5Rgp9Vlzd2K85GUiWd472RfBQozWGDK/R2N+9uQ8FWh9llIBE7hpbO7Wcyfa8mQTWeK
	CwClUnfBOux4GUbWHw7phH6emPS86KNzPZeIFsc6Q0mZAj0bIzk6s8PLaLqfpDak+PCBf237h7ste
	PYRdLs8sCrv3X5zKOtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNE5r-0000000EI6g-3tWj;
	Fri, 28 Jun 2024 16:04:59 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNE5o-0000000EI5y-25HS
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 16:04:57 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B85AE542F;
	Fri, 28 Jun 2024 18:04:53 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 28 Jun 2024 18:04:52 +0200
Message-Id: <D2BS0YMA48BG.1PEPFC3KMFV8N@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 <linux-kernel@vger.kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Erez Geva" <ErezGeva2@gmail.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Conor Dooley" <conor@kernel.org>, "Erez Geva" <erezgeva@nwtime.org>
Subject: Re: [PATCH 3/4] dt-bindings: mtd: macronix,mx25l12833f: add SPI-NOR
 chip
X-Mailer: aerc 0.16.0
References: <20240628140328.279792-1-erezgeva@nwtime.org>
 <20240628140328.279792-4-erezgeva@nwtime.org>
 <20240628-refuse-actress-b76985aa020c@spud>
In-Reply-To: <20240628-refuse-actress-b76985aa020c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_090456_695093_AF88B4D1 
X-CRM114-Status: UNSURE (   8.56  )
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

Hi,

On Fri Jun 28, 2024 at 5:57 PM CEST, Conor Dooley wrote:
> On Fri, Jun 28, 2024 at 04:03:27PM +0200, Erez Geva wrote:
> > From: Erez Geva <ErezGeva2@gmail.com>
> > 
> > Add Macronix SPI-NOR mx25l12833f.
> > 
> > Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
>
> Should the email in here and in the From: field be your nwtime one?
> Otherwise
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Actually, you're not supposed to add any compatibles to this list.

From the binding:
    description:
      SPI NOR flashes compatible with the JEDEC SFDP standard or which may be
      identified with the READ ID opcode (0x9F) do not deserve a specific
      compatible. They should instead only be matched against the generic
      "jedec,spi-nor" compatible.

I presume the Macronix flash does support the read id opcode.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
