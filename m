Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB07C32771
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Sep 2022 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=As+S+pz+rhLQWcRnwao+oZu9h4CiakxEfLNRFvYKlb0=; b=nJ8UZMobZ2aWUO
	2seDCk1nvFT5njFXWtpW5c3H5pk3f6ZZqZ4dRMmKsVzjE+u2OcwYxhKoVlev2pdfATlUTq7Hz1VVj
	FvPNdMqEoO32mRT44d3wM9MjOQUakO1EjRv8l+NnI88J0jDummMC5Zj6zAyJ/z7vt7hkxvQ52XbcC
	blP+pet1tNW9BCjXSZ1e4bDQ4AtLWyNeXFeB58/BpXyJjNvLIB+dEwzsvQQv0pQr50zXo87i+yJh0
	BeiMX6pJs7ttmB48ohYblNsQzFfCWJ1U4gSWlBv+XPn/v+j1Mz8wpzz5v44ANe/9EjkNOImVm93GU
	GzLEDX/zbT0/vCGCmTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oax7J-00AtcQ-8l; Wed, 21 Sep 2022 10:38:09 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oax75-00AtXL-Rj; Wed, 21 Sep 2022 10:37:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D6A42240003;
	Wed, 21 Sep 2022 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663756671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRyV869MMgVK7tdzah/59H1NCr8I0pXUftnnb2Omlnw=;
	b=BfwpWdFGgsgb6hcA0xwT4keRDMomtfabg9ZMIfH4FnLef2kMtqWK7Daop0sNNTzBuhLL8N
	s23992Tiq5yUiGtoLj+i2TImgmcDkGg4sxoGmDZQxRA6N1FC4wIVpDveTeygb5Wju/9IHd
	iG0Q3/wfT0RCQWF/PgHPqSsx49n+ymxi5MBdZ9NPH16LnpHkFwsrtbTCu2uoCUj3WthKLY
	o5zszKzjLpYht9Nvp0bKhKvCFVZJ3T0lPxYC8EYToa0AZDn+fDLOuetKICQRKhgevkTWSx
	IqJntZ5h0APBBEHjpxkEOhHhzPLGTLDFPcAz86Wxaa0895v6mCtLUXJAs/FEvg==
Date: Wed, 21 Sep 2022 12:37:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC PATCH v2 19/20] nvmem: layouts: rewrite the u-boot-env
 driver as a NVMEM layout
Message-ID: <20220921123745.61299d6a@xps-13>
In-Reply-To: <20220901221857.2600340-20-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
	<20220901221857.2600340-20-michael@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_033756_067491_5B9EDD59 
X-CRM114-Status: GOOD (  15.26  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gRnJpLCAgMiBTZXAgMjAyMiAw
MDoxODo1NiArMDIwMDoKCj4gSW5zdGVhZCBvZiBoYXJkY29kaW5nIHRoZSB1bmRlcmx5aW5nIGFj
Y2VzcyBtZXRob2QgbXRkX3JlYWQoKSBhbmQKPiBkdXBsaWNhdGluZyBhbGwgdGhlIGVycm9yIGhh
bmRsaW5nLCByZXdyaXRlIHRoZSBkcml2ZXIgYXMgYSBudm1lbQo+IGxheW91dCB3aGljaCBqdXN0
IHVzZXMgbnZtZW1fZGV2aWNlX3JlYWQoKSBhbmQgdGh1cyB3b3JrcyB3aXRoIGFueQo+IE5WTUVN
IGRldmljZS4KPiAKPiBCdXQgYmVjYXVzZSB0aGlzIGlzIG5vdyBub3QgYSBkZXZpY2UgYW55bW9y
ZSwgdGhlIGNvbXBhdGlibGUgc3RyaW5nCj4gd2lsbCBoYXZlIHRvIGJlIGNoYW5nZWQgc28gdGhl
IGRldmljZSB3aWxsIHN0aWxsIGJlIHByb2JlZDoKPiAgIGNvbXBhdGlibGUgPSAidS1ib290LGVu
diI7Cj4gdG8KPiAgIGNvbXBhdGlibGUgPSAidS1ib290LGVudiIsICJudm1lbS1jZWxscyI7Cj4g
Cj4gIm52bWVtLWNlbGxzIiB3aWxsIHRlbGwgdGhlIG10ZCBsYXllciB0byByZWdpc3RlciBhIG52
bWVtX2RldmljZSgpLgo+ICJ1LWJvb3QsZW52IiB3aWxsIHRlbGwgdGhlIE5WTUVNIHRoYXQgaXQg
c2hvdWxkIGFwcGx5IHRoZSB1LWJvb3QKPiBlbnZpcm9ubWVudCBsYXlvdXQgdG8gdGhlIE5WTUVN
IGRldmljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxl
LmNjPgo+IC0tLQo+IGNoYW5nZXMgc2luY2UgdjE6Cj4gIC0gbm9uZQo+IAo+ICBkcml2ZXJzL252
bWVtL2xheW91dHMvS2NvbmZpZyAgICAgIHwgICA4ICsrCj4gIGRyaXZlcnMvbnZtZW0vbGF5b3V0
cy9NYWtlZmlsZSAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL252bWVtL2xheW91dHMvdS1ib290LWVu
di5jIHwgMTQ0ICsrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9udm1lbS91LWJvb3QtZW52
LmMgICAgICAgICB8IDIxOCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKTml0OiBJSVJD
IHRoZXJlIGlzIGEgTUFJTlRBSU5FUlMgZW50cnkgdG8gdXBkYXRlIGFzIHdlbGwuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
