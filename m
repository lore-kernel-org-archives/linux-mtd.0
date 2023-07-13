Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CADEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEFwYKwe4vxjOme39fqaAVp0YXJvn10b/HzkurxFqYc=; b=RJNfeMySCfiZEp
	3mDNhjjLL00/Ta/Vpa84DoB4qxd44F6iFIp4gNyYXCcqnXwfAm+pR5oeIQuQ/vP0hhHlI7h55D6M/
	ZO4gm0CtCEITNLHInXvbBPgqy+zginWWSaWrw66DADadJBLCcchqbClkvJLTcWOIHts1H1bkOkB9V
	Is6muyo2B2y2ZyiztfzdcDm21xtsNvAhXsrkD7orNrztF4FTg7H1Ff9+qCXT89fENEWKTJnWLl1Wp
	sI4MdvPls1JUw7vKseao1hsWFGwzn/Uj6CnypLrr8PYk99dAYfzN3ER8M9+bzN5c0ZMXPL/nwcY9z
	4/lD9bx1QHw/NTDh+poA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqg8-002Dxy-2N;
	Thu, 13 Jul 2023 07:23:56 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqg6-002Dvo-0e
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:23:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 279B7240006;
	Thu, 13 Jul 2023 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689233025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JoDzNSI3ahCfLCs7dMH1IsP0mTjPdlEnGHMJAo/tqy4=;
	b=I9MrwSNG/NmLjdZj0n0800gG+CD7VJbNN9lGJ+a1KrmbzNPjMBpUx8rBQknXmliwUeBg1q
	Wd4TnvdwxmHNsVH6sATdJYlbXZHs1VznmvVMr6IoiBdoCb9v1iIPRzNujiQf8m1Rb0/Qt9
	HfaMfRALerKdaZp//lKn3ix/eF7tDaZ3MrjhGMoJwNIn0Dz/rNCvbyIpYsHZSA+mIm7Orp
	AaxcqoAepP2cxkA1GR4fm5b59xYaU0u5TwzPae0RwKZQ85/AgQMhWMGn56ZB8M/stI5dTZ
	6B8wl8U7lqWs9YnydMsH3N5/AZyTTugKLXIMQnZoum67Tj80C1MqRfrKDTD4Hg==
Date: Thu, 13 Jul 2023 09:23:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, gregory.clement@bootlin.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: Add AC5 specific binding
Message-ID: <20230713092342.6c25fb05@xps-13>
In-Reply-To: <20230712-headway-unlikable-436a4533d540@spud>
References: <20230703035044.2063303-1-chris.packham@alliedtelesis.co.nz>
	<20230703035044.2063303-2-chris.packham@alliedtelesis.co.nz>
	<20230712143220.06a3d6eb@xps-13>
	<20230712-headway-unlikable-436a4533d540@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_002354_542443_11983D86 
X-CRM114-Status: GOOD (  13.08  )
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

SGkgQ29ub3IsCgpjb25vckBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMTIgSnVsIDIwMjMgMTk6
MTM6MDIgKzAxMDA6Cgo+IE9uIFdlZCwgSnVsIDEyLCAyMDIzIGF0IDAyOjMyOjIwUE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBDaHJpcywKPiA+IAo+ID4gY2hyaXMucGFja2hh
bUBhbGxpZWR0ZWxlc2lzLmNvLm56IHdyb3RlIG9uIE1vbiwgIDMgSnVsIDIwMjMgMTU6NTA6NDIK
PiA+ICsxMjAwOgo+ID4gICAKPiA+ID4gQWRkIGJpbmRpbmcgZm9yIEFDNSBTb0MuIFRoaXMgU29D
IG9ubHkgc3VwcG9ydHMgTkFORCBTRFIgdGltaW5ncyB1cCB0bwo+ID4gPiBtb2RlIDMgc28gYSBz
cGVjaWZpYyBjb21wYXRpYmxlIHZhbHVlIGlzIG5lZWRlZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4K
PiA+ID4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
ICAKPiA+IAo+ID4gSSBuZWVkIERULWJpbmRpbmcgbWFpbnRhaW5lcidzIGFjayB0byB0YWtlIHRo
aXMgcGF0Y2gsIGJ1dCB0aGlzIGNvbW1pdAo+ID4gZGlkIG5vdCByZWNlaXZlIGZlZWRiYWNrIChw
b3NpdGl2ZSBvZiBuZWdhdGl2ZSkgZnJvbSB0aGVtIGFuZCBpcyBubwo+ID4gbG9uZ2VyIGluIHRo
ZWlyIHBhdGNod29yay4gQ2FuIHlvdSBwbGVhc2UgcmVzZW5kIHRoZSBzZXJpZXM/ICAKPiAKPiBZ
b3UgaGF2ZSBvbmUgOykKPiAKPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9wcm9jZXNzL21haW50
YWluZXJzLmh0bWw/aGlnaGxpZ2h0PWNvbm9yK2Rvb2xleSNvcGVuLWZpcm13YXJlLWFuZC1mbGF0
dGVuZWQtZGV2aWNlLXRyZWUtYmluZGluZ3MKClxvLwoKTG92ZSB0aGF0LCB0aGFua3MgZm9yIHN0
ZXBwaW5nLXVwIGFuZCBnb29kIGx1Y2shCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
