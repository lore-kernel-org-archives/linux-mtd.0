Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E37C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 16:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/w1dV5YvuN9Yz47WmJMo5dn9f7nf0+mg2kW/HGQdP0=; b=NYlMu8/94HXI8F
	fBTClYDK10sHrsUlW32Yc0y7XOwhy6Kq0m7JmSlwW7teEYPxnAZY1z4C5QOZ5sVx93WD3AZZTiVhb
	L3ZUN5q6tlJ7m82S3qo70m3s44PE9cUammVHhL3/p8A+kwHVdKUeQ2zDw7Wam1NsRjeOrtWvsDln6
	fy7DJJJle4JBKEXy2hqBZ4b7Ab0VWOVru7EVQ2iFmA4dJYdSWUeKYIdpBiCz/Atxsl0KuoSvXhFiG
	xukt3VS3XWE0Fx0el9BpVTR8mviLErYBupSnZZLXtoWlDJpXa5vQwMfKC/1aZUOuheaS2k4fo5IvN
	I1U262hxZzA5Coas2XFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Qt3-00D4D1-U0; Thu, 23 Dec 2021 16:24:14 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Qt0-00D4CC-0e
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 16:24:12 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BNGO2Zu123677;
 Thu, 23 Dec 2021 10:24:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640276642;
 bh=Iq/I994HXFx9f25hIiTM8IwYE6TUMFqEWlEnFgbfxdU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=DxA0BkpTSHY3HLo7IXx8OJwameSE98Z30CckN5jgHRY9dvwceap5XBRxpkvyr+5Le
 oPXf8cagYc21rEIuBLn0d2NH/nmxtPYweQvJx27EFpouRHYL7geyzkgjbyExDNxaWJ
 sbQq9YjLgDMmza7Xg931TqZV7d1wWo3pemAXIjJc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BNGO145102237
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 Dec 2021 10:24:01 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Dec 2021 10:24:01 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Dec 2021 10:24:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BNGO0FW028418;
 Thu, 23 Dec 2021 10:24:01 -0600
Date: Thu, 23 Dec 2021 21:54:00 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/3] dt-bindings: nvmem: add U-Boot environment variables
 binding
Message-ID: <20211223162358.wbfnibsma5lskxkw@ti.com>
References: <20211222192320.21974-1-zajec5@gmail.com>
 <20211222192320.21974-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211222192320.21974-2-zajec5@gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_082411_126179_71742CE0 
X-CRM114-Status: GOOD (  12.37  )
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

T24gMjIvMTIvMjEgMDg6MjNQTSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBUaGlzIGJpbmRpbmcgYWxsb3dzIGRl
c2NyaWJpbmcgYSAocGFydCBvZikgTVREIGRldmljZSAocGFydGl0aW9uKSB0aGF0Cj4gY29udGFp
bnMgYSBibG9jayB3aXRoIGVudmlyb25tZW50IHZhcmlhYmxlcy4gT3BlcmF0aW5nIHN5c3RlbSB1
c3VhbGx5Cj4gbmVlZHMgdG8gcGFyc2UgdGhhdCBibG9jayB0byByZWFkIHZhcmlhYmxlcyB2YWx1
ZXMgdGhhdCBtYXkgYWZmZWN0Cj4gYm9vdGluZyBwcm9jZXNzICYgZGV2aWNlIGNvbmZpZ3VyYXRp
b24uCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBs
Pgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwg
fCA1NiArKysrKysrKysrKysrKysrKysrCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA1ICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL3UtYm9vdCxlbnYueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wZjgwODg2OGZmZjMKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9v
dCxlbnYueWFtbAo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgZW51
bToKPiArICAgICAgLSB1LGJvb3QsZW52CgpUeXBvPyBJbiBwYXRjaCAzIHlvdSBtYXRjaCB1LWJv
b3QsZW52LgoKLS0gClJlZ2FyZHMsClByYXR5dXNoIFlhZGF2ClRleGFzIEluc3RydW1lbnRzIElu
Yy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
