Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88390C3DA42
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2024 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5yMfSwq2A4xPxin6y6KOvBwtXbhzHZG+OtZZzYTKto=; b=W5Lig+GCu3IruS
	kUE6atTD9GaNzdMYSCIF4tT8yzi149YnnHutTVRWTo1fCVXpzTU7dC06gcrGCezEi3Fi3Pdok3HwM
	DgVpfyH7lyr/q5O+g/uFzKYcvpR0ArovfJwj7NYwCZcPAZ9Jkx5FTESru86Qf0pnMHWeVxhcuhZEl
	c//uWOhO15eROBNDe8wqsHTOpTIUTiHQ8oEwo6WABjJB/5z+FiE6t8UToq1VzybpxZD9FZmWqzcNN
	CuX425HxCraXY9tZNrpJojpEbFhW6d5W8qOKB81//y3ijR3jrlM5n5q3bInzYyT10WDmV2qZKcN31
	/RgUaqJR30fsXtgPTn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU0Bu-0000000DAZt-0yMH;
	Wed, 17 Jul 2024 08:39:14 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU0BX-0000000DATT-0tCC;
	Wed, 17 Jul 2024 08:38:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9194BFF805;
	Wed, 17 Jul 2024 08:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721205528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54iksZJpA1HrffCxEFlTmd/giXr/VmfDqOO/3tGET84=;
	b=MsqqaVw570YbZZU9+pYH05HWfQS7ZsoUuRsKejvXnoQxFPX/6Kbc5KVgBUMvhbn0vFMPRE
	UOgKo95P1yRn/RBOs6PXPZ3nBf55CmyEJDhmhFev6+WazXjK2HZD0xA7wiK4uw82WZ9SQ0
	kosH+5FCQlbGTHhWymZUf/ULSEAk/RPIzlcVPcfp9RUeIkk6WLuzZd4D6SFSiTOHzHofbf
	pFG1sdkGWLCjXUofsiu4QSGMcFF3c3mpZ8Fuq+o41qzIfpkEE0GbAtUo58is0LskhcseSv
	EWL+38XVkrgFc9vKQHYmX7+9tA1KrRzmsdDBRcTLZp5T8rtNmkSQtgWDqWzXjA==
Date: Wed, 17 Jul 2024 10:38:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>, Vinod Koul
 <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] dt-bindings: dma: fsl-mxs-dma: Add compatible
 string "fsl,imx8qxp-dma-apbh"
Message-ID: <20240717103846.306bf9fd@xps-13>
In-Reply-To: <20240712163503.69dad6b1@xps-13>
References: <20240520-gpmi_nand-v2-2-e3017e4c9da5@nxp.com>
	<20240527121836.178457-1-miquel.raynal@bootlin.com>
	<20240712163503.69dad6b1@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_013851_422834_CA1E4965 
X-CRM114-Status: GOOD (  14.60  )
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

SGksCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIEZyaSwgMTIgSnVsIDIwMjQg
MTY6MzU6MDMgKzAyMDA6Cgo+IEhpIFZpbm9kLAo+IAo+IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20gd3JvdGUgb24gTW9uLCAyNyBNYXkgMjAyNCAxNDoxODozNiArMDIwMDoKPiAKPiA+IE9uIE1v
biwgMjAyNC0wNS0yMCBhdCAxNjowOToxMyBVVEMsIEZyYW5rIExpIHdyb3RlOiAgCj4gPiA+IEFk
ZCBjb21wYXRpYmxlIHN0cmluZyAiZnNsLGlteDhxeHAtZG1hLWFwYmgiLiBJdCByZXF1aXJlcyBw
b3dlci1kb21haW5zCj4gPiA+IGNvbXBhcmVkIHdpdGggImZzbCxpbXgyOC1kbWEtYXBiaCIuCj4g
PiA+IAo+ID4gPiBBbGxvdyAncG93ZXItZG9tYWlucycgcHJvcGVydHkgYmVjYXVzZSBpLk1YOERY
TCBpLk1YOFFNIGFuZCBpLk1YOFFYUCBuZWVkCj4gPiA+IGl0Lgo+ID4gPiAKPiA+ID4gS2VlcCB0
aGUgc2FtZSByZXN0cmljdGlvbiBhYm91dCAncG93ZXItZG9tYWlucycgZm9yIG90aGVyIGNvbXBh
dGlibGUKPiA+ID4gc3RyaW5ncy4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExp
IDxGcmFuay5MaUBueHAuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkg
PHJvYmhAa2VybmVsLm9yZz4gICAgCj4gPiAKPiA+IEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQs
IHRoYW5rcy4gIAo+IAo+IEkganVzdCByZWFsaXplIG5vdyBJIHBpY2tlZCB0aGlzIHVwIHdoZXJl
YXMgaXQgd2FzIG5vdCBpbnRlbmRlZCB0byBiZQo+IG1lcmdlZCB0aHJvdWdoIG10ZC4gSSdtIGZp
bmUga2VlcGluZyB0aGlzIHBhdGNoIGZvciB0aGUgbmV4dCBtZXJnZQo+IHdpbmRvdyBpZiBJIGdl
dCB5b3VyIGV4cGxpY2l0IGFncmVlbWVudCBvdGhlcndpc2UgSSdsbCBkcm9wIGl0LgoKSSBuZWVk
IHRvIHNlbmQgdGhlIFBSIHRvIExpbnV4LCBJIHdpbGwgZHJvcCB0aGlzIHBhdGNoIHdoaWNoIGNh
biBhbnl3YXkKYmUgdGFrZW4gaW4gdGhlIG5leHQgY3ljbGUuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
