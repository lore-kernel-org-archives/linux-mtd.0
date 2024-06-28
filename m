Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79DFC30658
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoPdxm9BCyIJdbTB5yuVI8KtMa3bIYE7/uxg1OjbS5A=; b=yEzU2hQ4oiv/h5
	ZfgfbsQ3y4fH373IXhdP+JDXi0mN47vNJVxYztvzz5w1C4Oi/rm6n7vIm9QyMpZR278Qdh5dx1B29
	1sFPKZ1y5r7eQ7rxNrnxfhyRTnrvVfRp0jCNgKLdPcNg9le87yWPAY2xfkkZy/XFtSBlvcZBDH4g3
	2jNKfQ6VGWS1m13PjqCKNEOQZ37CZ4QdQyOgZDYkMHX5n8URGV4f43gQFDiJNLvErycR6XxdZaAr3
	jhcuFFT9D0X/wJBWN255AbGya/89Q0YDyCtgoC/Py6rD/WETNJQdA9lAURMBAw/vm1SkGUDAgr4dy
	4PuySVEw6jVNNSzUfrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNEod-0000000EPLV-3uiA;
	Fri, 28 Jun 2024 16:51:15 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNEoZ-0000000EPL1-2WQV
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 16:51:13 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1B01D144A;
	Fri, 28 Jun 2024 18:51:09 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 28 Jun 2024 18:51:08 +0200
Message-Id: <D2BT0DT9UQ66.2L497FSY7GMAL@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: mtd: macronix,mx25l12833f: add SPI-NOR
 chip
Cc: "Conor Dooley" <conor@kernel.org>, "Erez Geva" <erezgeva@nwtime.org>,
 <linux-mtd@lists.infradead.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 <linux-kernel@vger.kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Erez" <erezgeva2@gmail.com>
X-Mailer: aerc 0.16.0
References: <20240628140328.279792-1-erezgeva@nwtime.org>
 <20240628140328.279792-4-erezgeva@nwtime.org>
 <20240628-refuse-actress-b76985aa020c@spud>
 <D2BS0YMA48BG.1PEPFC3KMFV8N@kernel.org>
 <CANeKEMMrXK=mw=n=9DuTnprkTs3ct446oaC2QTJyst8Nd+D6rw@mail.gmail.com>
In-Reply-To: <CANeKEMMrXK=mw=n=9DuTnprkTs3ct446oaC2QTJyst8Nd+D6rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_095111_801756_F2ECA4D8 
X-CRM114-Status: UNSURE (   5.55  )
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

On Fri Jun 28, 2024 at 6:30 PM CEST, Erez wrote:
> I do not know why they decided to use the same JEDEC ID for two chips.
> Your guess is as good as mine.

That's a common pattern and we try hard to figure that out during
probe time instead of hardcoding it. E.g. by looking at the SFDP
data. Have a look at various fixups in drivers/mtd/spi-nor/.

compatibles are really the last resort to distinguish flash devices.

Next time, please mention such information in the commit message,
please.

Also please have a look at
https://docs.kernel.org/driver-api/mtd/spi-nor.html

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
