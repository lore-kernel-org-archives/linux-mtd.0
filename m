Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A460E8FDD1
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8tpVAUiIqyZKU3B+c2wKrrw0WDBfAWcLpEmx6RRLnU=; b=RrabP2waSOZkob
	IUIWuT7SdaGpGibqDLqlmgtEnjkuc1t+iKAUE80PlYTicZPpGg25398Ux6lTkFndbHVxWuu8YXdJL
	p4bGCKKLSjN1hX//mI3F6XVPQKvI+ggZvTgwa/h2GlBJRgL6ynpbHX0jEymsctEoGp4H6FSoIl8jY
	qaeYj7yxE33h4qLOn+5foHOByMbIAiMUVmVqAkKfoPcfPeVVCkNSjIv+NXDiwcGrH/pZV4O2S6WMz
	V7EhJquDYUD4wK7Xt5nhKa77VHtEXFBzuEOZfRPs6LfK27r5YXytEn4/cf3nchvtfDDknWtUnxtvm
	YETtUOKNbG2P0Vu0w71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwQp-00GcuJ-19;
	Wed, 04 Oct 2023 07:36:31 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwQm-00GcsG-05
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 07:36:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A69D04000A;
	Wed,  4 Oct 2023 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696404983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ngPaH82ebBnbrryfOJbDz3IQaDzQY6NcyZOlki0nDMU=;
	b=YdfN+yrxrO7j0TdmpeLWPl73yPq08XtmwZvNnFasDHk2kWC72GMksBZafFVGZ26euBCc+o
	oCDZyIvqYV1VsrHif4X3IdWPJbsQUZt4vGqXzvaFne1Ga/DM8et3GlgOHbWMaNpSnQFEgv
	zXW2ZF0Z9m0iaf456rpC/tXLMT57+7kRN45S0KFwvc4NoJ2AKWkmA5qh3QTbx6DqX7gIl0
	lkZRjDbgqqPDi3tc+PUMejqbdIrn0haO1vLOAblySPti7AaGfajr6IcKEcRjN0uYtHoPQA
	s2zl+FVICo1l9qG6bi3eljZag5jIueQuCo/U1QFGIqBE4PkpIsPBtWKfDM7xJA==
Date: Wed, 4 Oct 2023 09:36:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Tom Rini
 <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-mtd@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav
 <ptyadav@amazon.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman
 compatible
Message-ID: <20231004093620.2b1d6917@xps-13>
In-Reply-To: <20231002174948.1015223-1-sjg@chromium.org>
References: <20231002174948.1015223-1-sjg@chromium.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_003628_206738_5E80EBE9 
X-CRM114-Status: GOOD (  16.49  )
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

SGkgU2ltb24sCgpzamdAY2hyb21pdW0ub3JnIHdyb3RlIG9uIE1vbiwgIDIgT2N0IDIwMjMgMTE6
NDk6NDAgLTA2MDA6Cgo+IEFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciBiaW5tYW4sIHNvIHdl
IGNhbiBleHRlbmQgZml4ZWQtcGFydGl0aW9ucwo+IGluIHZhcmlvdXMgd2F5cy4KCkkndmUgYmVl
biB0aGlua2luZyBhdCB0aGUgcHJvcGVyIHdheSB0byBkZXNjcmliZSB0aGUgYmlubWFuIHBhcnRp
dGlvbnMuCkkgYW0gd29uZGVyaW5nIGlmIHdlIHNob3VsZCByZWFsbHkgZXh0ZW5kIHRoZSBmaXhl
ZC1wYXJ0aXRpb25zCnNjaGVtYS4gVGhpcyBkZXNjcmlwdGlvbiBpcyByZWFsbHkgYmFzaWMgYW5k
IGtpbmQgb2Ygc3VwcG9zZWQgdG8gcmVtYWluCmxpa2UgdGhhdC4gSW5zdGVhZCwgSSB3b25kZXIg
aWYgd2Ugc2hvdWxkIG5vdCBqdXN0IGtlZXAgdGhlIGJpbm1hbgpjb21wYXRpYmxlIGFsb25lLCBs
aWtlIG1hbnkgb3RoZXJzIGFscmVhZHkuIFRoaXMgd2F5IGl0IHdvdWxkIGJlIHZlcnkgY2xlYXIK
d2hhdCBpcyBleHBlY3RlZCBhbmQgYWxsb3dlZCBpbiBib3RoIGNhc2VzLiBJIGFtIHRoaW5raW5n
IGFib3V0CnNvbWV0aGluZyBsaWtlIHRoYXQ6CgoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sYmNtNDkwOC1wYXJ0aXRpb25zLnlhbWwgCgp0aGlz
IGZpbGUgaXMgYWxzbyByZWZlcmVuY2VkIHRoZXJlIChidXQgdGhpcyBwYXRjaCBkb2VzIHRoZSBz
YW1lLCB3aGljaAppcyB3aGF0IEknZCBleHBlY3QpOgoKCURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb25zLnlhbWwKCkknbGwgbGV0IHRoZSBi
aW5kaW5nIG1haW50YWluZXJzIGp1ZGdlIHdoZXRoZXIgdGhleSB0aGluayBpdCdzCnJlbGV2YW50
LCBpdCdzIG5vdCBhIHN0cm9uZyBvcHBvc2l0aW9uLgoKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBH
bGFzcyA8c2pnQGNocm9taXVtLm9yZz4KPiAtLS0KClsuLi5dCgo+ICtwcm9wZXJ0aWVzOgo+ICsg
IGNvbXBhdGlibGU6Cj4gKyAgICBjb25zdDogYmlubWFuCgpSaWdodCBub3cgdGhpcyBkb2VzIG5v
dCBmaXQgKEkgYmVsaWV2ZSkgdGhlIGV4YW1wbGUuIEJ1dCBpZiB3ZSBubwpsb25nZXIgZXh0ZW5k
IGZpeGVkLXBhcnRpdGlvbnMgYnV0IGp1c3QgY3JlYXRlIGJpbm1hbi55YW1sLCB0aGlzIHdpbGwK
cHJvYmFibHkgYmUgZW5vdWdoLgoKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+
ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICBwYXJ0aXRpb25zIHsKPiArICAgICAgICBj
b21wYXRpYmxlID0gImJpbm1hbiIsICJmaXhlZC1wYXJ0aXRpb25zIjsKPiArICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiArCj4gKyAg
ICAgICAgcGFydGl0aW9uQDEwMDAwMCB7Cj4gKyAgICAgICAgICAgIGxhYmVsID0gInUtYm9vdCI7
Cj4gKyAgICAgICAgICAgIHJlZyA9IDwweDEwMDAwMCAweGYwMDAwMD47Cj4gKyAgICAgICAgfTsK
PiArICAgIH07CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
