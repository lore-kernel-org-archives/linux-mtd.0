Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F3FD4F16
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 18:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRtnaOnbSNyvOjkCz1wf1EkrpaQFYnbm33p/YJPPlto=; b=LYefxLsbw2kf8J
	IvqW7rAq1kOrUVBN4235z8fTg37F4mZxA0tox4/jWEgnwsoYKuAXoORVEo5UPW69s4Ft8mmCyj3E6
	6b4lqvMGBRAOgnMby+RbIISOq4X+E7gthCksYWNudwsA+ucPBCVddGBPQOkAHyPQzS1toT0nDKOhs
	IE+c7x2r7f7DhOJxQhWQdgQj3+Bf6R5qyOQKzodJuFYPmsirNycTlQpqjJI3Z1K72KaR8O4iGGsMp
	/bKw8THUlWkumLun5PGwoOyB6CORvulelDcaGhV+87IMrqNvSeKNnVJ3sloSUrstEbzsHuk5SlORY
	z2Lw+wd4OxrLZqMn6ZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01qU-0000000A4vY-3WYb;
	Tue, 10 Mar 2026 18:30:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01qS-0000000A4uj-2GNp
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 18:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4E3840DE6
	for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 18:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4773C2BCAF
	for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773167415;
	bh=aQlHMtCyk/aiLXV0M0P+Eap9vVmkJKZ3nEtOiif8yFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bVt351IEoFi5+UWDbxI9FAUSa97i/8zXIhdXcP6Zx3NkVE4wdkURVMwX9zlLpbmqX
	 ge9Q385hvvSRWdzlGY0Uv/7Xc7wM/Gc14UX9GO2X+DPyaTWatC0q9q+4OARxjZWPv2
	 7IBV/zoaJYXyWrBoxSIQm0woqo24tFSsLotD6u3JYn4fzjYrdSbojuwkx9md2ZGeJM
	 L2dXiNQTPqb4fJxTb0WnbAeQZLzs4EV5o7+AnDSrF2MiSF3SzcU723jzGtv1A//YeJ
	 kgb73p0JVpSlM9C0ef7EKxhUbeAUBfwvDlpKKcLL8vWD2vbIi4c8pmUAXLBu3yv13d
	 UJXN5v5ML/7xw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b941762394aso637917466b.1
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 11:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdYlDeyuBYsRMre7loyDipjYI6cSES4tvRXhWgsPIjoWMO9jyyyCIRhcS9euxZWl2ujyHJgYUj1u8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCih99NpiPee5IXaVKCDvkw9krTIUOcq0umqzATJ16dfcn8GxO
	0/gt+Cc8dvMtza5OThFveZFpYPbhR18AoBOSXVxAm3vkk0xxvDPLscqj//Se3cK+8Sp8k8TV2wP
	WQIhmveA8DKfoVP+588fazl7gUh32Cg==
X-Received: by 2002:a17:906:f588:b0:b94:29f9:34c2 with SMTP id
 a640c23a62f3a-b942dfb4792mr846273666b.34.1773167414119; Tue, 10 Mar 2026
 11:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
In-Reply-To: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Mar 2026 13:30:02 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+WE33tSSqywbPN3g8i92foVmqna6K2zaFO1RUreMvB-w@mail.gmail.com>
X-Gm-Features: AaiRm53GadTJk1y1FXTWSOHUjVdcwczpoucawTc3iDJf70yoFWL4SacHxaC7LH8
Message-ID: <CAL_Jsq+WE33tSSqywbPN3g8i92foVmqna6K2zaFO1RUreMvB-w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix spear600-smi YAML conversion
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Akhila YS <akhilayalmati@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113016_605922_373FB8A1 
X-CRM114-Status: GOOD (  10.55  )
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

T24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMTA6MjTigK9BTSBNaXF1ZWwgUmF5bmFsCjxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IFJlY2VudCBjb252ZXJzaW9uIGZyb20gdHh0
IHRvIHlhbWwgb2YgdGhlIFNwZWFyNjAwIFNNSSBiaW5kaW5nIGJ5IEFraGlsYQo+IGxlYWQgdG8g
d2FybmluZ3MuIFRoZXNlIGFyZSBteSAyY3RzIGluIGdldHRpbmcgdGhlIHlhbWwgY29udmVyc2lv
biBkb25lCj4gOi0pCj4KPiBDaGVlcnMsCj4gTWlxdcOobAo+Cj4gU2lnbmVkLW9mZi1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAtLS0KPiBNaXF1ZWwgUmF5
bmFsICgzKToKPiAgICAgICBkdC1iaW5kaW5nczogbXRkOiBzdCxzcGVhcjYwMC1zbWk6IEZpeCBk
ZXNjcmlwdGlvbgo+ICAgICAgIGR0LWJpbmRpbmdzOiBtdGQ6IHN0LHNwZWFyNjAwLXNtaTogI2Fk
ZHJlc3Mvc2l6ZS1jZWxscyBpcyBtYW5kYXRvcnkKPiAgICAgICBkdC1iaW5kaW5nczogbXRkOiBz
dCxzcGVhcjYwMC1zbWk6IEZpeCBleGFtcGxlCj4KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3N0LHNwZWFyNjAwLXNtaS55YW1sICAgfCAyNiArKysrKysrKysrKysrKysrLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKU3RpbGwg
d2FybmluZyBpbiBuZXh0IGFuZCB2Ny4wLXJjIHdpdGhvdXQgdGhlc2UgZml4ZXMuIFBsZWFzZSBh
cHBseSB0aGVtIHNvb24uCgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
