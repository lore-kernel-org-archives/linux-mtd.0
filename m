Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0055C761A6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryg13wB4FaNm/r8vUzo+TsYlDK5BXHVJqiiLLG1+NDI=; b=Kk5tu/Ovjgf4AS
	RrewiloDKDuMepExAhzyD1BSSfd1nJdVtrONGaqaIh48JBQQ/ruaEVvZWCDF+JInFZiIvUWs2h6Gm
	yFZq4GROJDT6ggigLWwLT/I3N+LF6Ruj63Qn/3VZrLRI1spea3y/zpgwecMY6GGyDehN8g+TITV8U
	jpYdiG36Q57Gz/yURTqNjmBY2XmrxWc7ecmSR4pho25qg85xDkNUQQfNrG9kA09p5zxhJiQ/FnaGt
	ivyKYzUGWiDBhhHjZyH1vAlMhsSrkdU7iI3EJ4yXKUAXYBOHPhN+ntCR7oglOO282onYvWx0P5Kz9
	9MDFoiTyjRKiXbC9dBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFhO-00EYln-1a;
	Mon, 03 Apr 2023 08:37:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFhG-00EYkf-2C;
	Mon, 03 Apr 2023 08:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680511070; x=1712047070;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AJfCiCniLhpK7Ym8VeoOQmdv0IstvSa7y8PK2Wiz3H8=;
  b=p84vhLtJbh2KaaETMiCNdF3url0PrE0hwTblfcCNDh3EhJydqmKrSVnx
   UMPnBK5Fxynwm20w3WkKOAdY0dxmK2r9+gGwNmXombSy3pIH+Lf/FmQCU
   h1EESDIseSW4QCOmVNVhI5KEaFUq2guTzyEmn7TOFNKinq5mFfDn+5Zm/
   M+TTFlWiRNzx4L2LbeY0uS7BaAKMljFv4S6FKsGWMTdWluKUFq5sLAsgr
   NXtEv2+31NF9oMf3Lrp1fJVHlMCDjfY+WDdJXc2O98Vk6ndJwnj+64LT7
   L+I6eWaHKqbqQ4UFNE/eM8npXE9WT2YcVIN1FzHKXRITlbsoN8ypZYe76
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,314,1673938800"; 
   d="scan'208";a="208533256"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Apr 2023 01:37:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 01:37:49 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Apr 2023 01:37:47 -0700
Message-ID: <c267ab55-bf9e-3196-3a33-1798af694fce@microchip.com>
Date: Mon, 3 Apr 2023 10:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/49] mtd: rawnand: atmel: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Balamanikandan Gunasundar
	<Balamanikandan.Gunasundar@microchip.com>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230401161938.2503204-8-u.kleine-koenig@pengutronix.de>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230401161938.2503204-8-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_013750_770241_F304B23B 
X-CRM114-Status: GOOD (  22.80  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDEvMDQvMjAyMyBhdCAxODoxOCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBm
b3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBtYW55IGRy
aXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJyb3IgaGFu
ZGxpbmcgYnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFsdWUgcmV0
dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRzIGlu
IHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQo+IHF1ZXN0IHRvIG1h
a2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2Yg
dGhpcwo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3
aGljaCBhbHJlYWR5IHJldHVybnMKPiB2b2lkLgo+IAo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMg
ZHJpdmVyIGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKPiBjYWxsYmFj
ayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKT2sgZm9yIG1l
OgpBY2tlZC1ieTogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgoK
VGhhbmtzIFV3ZSBmb3IgaGF2aW5nIHRha2VuIGNhcmUgb2YgdGhpcyBkcml2ZXIuIEJlc3QgcmVn
YXJkcywKICAgTmljb2xhcwoKPiAtLS0KPiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25h
bmQtY29udHJvbGxlci5jIHwgNiArKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwv
bmFuZC1jb250cm9sbGVyLmMKPiBpbmRleCA0MWM2YmQ2ZTJkNzIuLjgxZTNkNjgyYThjZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCj4gQEAg
LTI2MjYsMTMgKzI2MjYsMTEgQEAgc3RhdGljIGludCBhdG1lbF9uYW5kX2NvbnRyb2xsZXJfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgICByZXR1cm4gY2Fwcy0+
b3BzLT5wcm9iZShwZGV2LCBjYXBzKTsKPiAgIH0KPiAKPiAtc3RhdGljIGludCBhdG1lbF9uYW5k
X2NvbnRyb2xsZXJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3N0YXRp
YyB2b2lkIGF0bWVsX25hbmRfY29udHJvbGxlcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgIHsKPiAgICAgICAgICBzdHJ1Y3QgYXRtZWxfbmFuZF9jb250cm9sbGVyICpu
YyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+IAo+ICAgICAgICAgIFdBUk5fT04obmMt
PmNhcHMtPm9wcy0+cmVtb3ZlKG5jKSk7Cj4gLQo+IC0gICAgICAgcmV0dXJuIDA7Cj4gICB9Cj4g
Cj4gICBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IGF0bWVsX25hbmRfY29udHJvbGxlcl9yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQo+IEBAIC0yNjYzLDcgKzI2NjEsNyBAQCBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciBhdG1lbF9uYW5kX2NvbnRyb2xsZXJfZHJpdmVyID0gewo+ICAg
ICAgICAgICAgICAgICAgLnBtID0gJmF0bWVsX25hbmRfY29udHJvbGxlcl9wbV9vcHMsCj4gICAg
ICAgICAgfSwKPiAgICAgICAgICAucHJvYmUgPSBhdG1lbF9uYW5kX2NvbnRyb2xsZXJfcHJvYmUs
Cj4gLSAgICAgICAucmVtb3ZlID0gYXRtZWxfbmFuZF9jb250cm9sbGVyX3JlbW92ZSwKPiArICAg
ICAgIC5yZW1vdmVfbmV3ID0gYXRtZWxfbmFuZF9jb250cm9sbGVyX3JlbW92ZSwKPiAgIH07Cj4g
ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGF0bWVsX25hbmRfY29udHJvbGxlcl9kcml2ZXIpOwo+
IAo+IC0tCj4gMi4zOS4yCj4gCgotLSAKTmljb2xhcyBGZXJyZQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
