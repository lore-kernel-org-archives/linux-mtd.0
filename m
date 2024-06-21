Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D6DC2BA1A
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 08:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INMZ4Paqp2K1Kfbbq05nm9Z/vGXkiL85MhgbYGrKHMk=; b=Cu/SfsY956VPhe
	PoTk5yLy8xvYH7GumLdGNt4pOAcB2QWSnGZocy8CeNMwlFe7GDu9bosq/sxu6FH4DffDqQK6tyAWk
	swxOLy9iMXi2KJwXpnEscMr9NSdmZEqu97sPlxqtgp8azXJaDFMMTU2risJq2hCiHSnjokzApMTs/
	tyXUcXRX5127+8P/aO0yjvamWy+4GvUwHGmlLU/txVmcBPUe7g48XDh+CVGT5+p0ogX1gxxIjq3HP
	MYMik7Mfk097C2hkdL7q8+1b4G3mmSus+TMocDobEd8Q8engSIzYxq46Z2YTY2X67tWlobtPzCDAi
	oxNnE/ra0xDLT3e3zbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZfJ-00000008LgA-3GZP;
	Fri, 21 Jun 2024 08:30:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZfD-00000008Lcl-2Mrj;
	Fri, 21 Jun 2024 08:30:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A3F020003;
	Fri, 21 Jun 2024 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718958625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSTWYIkS8dZPp1gyV6GgsipcJv/f0Yiu+CBMvpyDKyU=;
	b=EljBfq25UCP0bJHtLSMj6/zCXY9oAvfd8m3m3+oKaAfE3R3qGzQiLP70Dtf5/E0BjVhlr2
	3kYdj9Zcv07uvUjSc4PGieGFVRuZUnscRqClY9e/dC3+32DNYqrg906mhGNAV5dsydSZgJ
	j7J764uUg9PaG/QdPDX592lZI7xKQ5B2ClV75xzBfXbuB3zLdIpVqHskurQKcAnpdiWewl
	tpt0EvOPrnXwY7VIkoAA1L3G8YNvuSl+O84XjndxPwFS4GJ7mxjNtxLKG6RvpNnEUyw/Ym
	ukwKPd7JhZmPkutWlro7UbvnVkRYcyRd+4x/8l1ml1W5kY1Tk29IDHTpcFDWyA==
Date: Fri, 21 Jun 2024 10:30:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "J.M.B.
 Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li
 <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>, Chancel Liu
 <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, Markus Elfring
 <Markus.Elfring@web.de>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
Message-ID: <20240621103019.783271f4@xps-13>
In-Reply-To: <20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
	<20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_013031_981414_DAADF3BD 
X-CRM114-Status: UNSURE (   9.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGlvdHIsCgpwaW90ci53b2p0YXN6Y3p5a0B0aW1lc3lzLmNvbSB3cm90ZSBvbiBUaHUsIDIw
IEp1biAyMDI0IDE5OjU2OjM5ICswMjAwOgoKPiBNb3ZlIGF3YXkgZnJvbSBwbDA4eCBwbGF0Zm9y
bSBkYXRhIHRvd2FyZHMgZGV2aWNlIHRyZWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGlvdHIgV29q
dGFzemN6eWsgPHBpb3RyLndvanRhc3pjenlrQHRpbWVzeXMuY29tPgoKSSBkb24ndCBzZWUgYW55
IGNoYW5nZSByZWdhcmRpbmcgdGhlIE5BTkQgY29udHJvbGxlciBub2RlIGluIHRoZSBkZXZpY2UK
dHJlZSwgaXMgdGhlcmUgYW55IGRlcGVuZGVuY3kgd2l0aCBvdGhlciBwYXRjaGVzIGZyb20gdGhl
IHNhbWUgcGF0Y2hzZXQKb3IgbWF5IEkgYXBwbHkgdGhpcyBkaXJlY3RseSB0byBuYW5kL25leHQ/
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
