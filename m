Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B11EC001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie5drF5gFEgvcBMEeCsDi0VPIIrZ2RMqgq+t+5DJj+Q=; b=Zl8d5S5wW6swHfAGpl73Thq4pP
	2kXCaVJoPPF5ndOaSTMIA/DmjHfjbMqvzAonpYIGxlYnnVWyh7BZ3Wan9Y2/WEhy+be4CkQZehC3Z
	6yK4xgISYwH6UTJU0rU9jRnROPLr2XqEe529DNku8MZgmwwRBTiwaIzf5BPEgrXCsWkCzMOJ36cYC
	O3t8zGU/iQDSfh+uizMQfgb2ALDfcaASgchVldGpoDGEkek60BY0DxuC72MgjOEhQ+6CqXjPgGClo
	cYzP5cfRqNE8JE2gXpeCD+bXzWCLFo6VnGJNbEilGtpezhDRMhRJkzuxK6UaV/I4CdI6Hfl9g76LK
	y4nKCZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFm7-0049wl-1z;
	Wed, 16 Aug 2023 12:37:23 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFlw-0049tB-1O;
	Wed, 16 Aug 2023 12:37:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3514AA06;
	Wed, 16 Aug 2023 14:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1692189428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJfh6GC8aHch959POkYyqkTUnj4NnXdjMKw7FcRwKoc=;
	b=u8hsom4F23QN+Q0vmRp43G18VGyk4NagNu0MBrNjIj82pxXy7IdgNV1LyTKVVledQSz0Mr
	yWqNrOj03deQUT0jvO8ZmrKfCDriYz9ymRcOGi9FU2T5d0Wbs/p088U7l0anJN/JvEFOu0
	gEvQd+3d60Qg3aElZTBAvP9OJPTrCzb1vUnAhZJGSMps6CWM1kQ58UFp+laD9NR5/rcw1n
	C1tWsUsHbPCaeKpN9GnRRcpO5a6NkVK9RA7baa99xytvA59XKaUtFl0ZpgUs+d54oRVXFg
	NgpVc/pmdUwmfzBl1mXRHjIQvgjjrtSl+fT8m9Qo4GCuwQtGVtSDq9dtjW841A==
MIME-Version: 1.0
Date: Wed, 16 Aug 2023 14:37:07 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson
 <andersson@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, "Miquel Raynal
 )" <miquel.raynal@bootlin.com>, "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
In-Reply-To: <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
References: <20230816104245.2676965-1-hsinyi@chromium.org>
 <6702bac712daab13698b9bb9ad81d49e@walle.cc>
 <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org>
 <80ec748f37f40ae5c3c3c5d1602681b3@walle.cc>
 <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
Message-ID: <ecfe1bc6799755d1f2c6f94b8cb59b27@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_053712_664951_44DEABDF 
X-CRM114-Status: GOOD (  18.48  )
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

SGksCgo+Pj4+IGxpa2UgYSBmdW5kYW1lbnRhbCBwcm9ibGVtIGFuZCB0aGF0IGNvbW1pdCAzOWQx
ZTMzNDBjNzMgKCJtdGQ6IAo+Pj4+IHNwaS1ub3I6Cj4+Pj4gRml4IGNsZWFyaW5nIG9mIFFFIGJp
dCBvbiBsb2NrKCkvdW5sb2NrKCkiKSBpcyBicm9rZW4gaW4gdGhhdCAKPj4+PiByZWdhcmQuCj4+
PiAKPj4+IHdoYXQncyB3cm9uZyB3aXRoIHRoZSBtZW50aW9uZWQgY29tbWl0Pwo+PiAKPj4gwqDC
oMKgwqDCoMKgwqAgfSBlbHNlIGlmIChub3ItPnBhcmFtcy0+cXVhZF9lbmFibGUpIHsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogSWYgdGhlIFN0YXR1cyBSZWdpc3RlciAyIFJlYWQgY29tbWFuZCAoMzVoKSBp
cyBub3QKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBzdXBwb3J0ZWQsIHdl
IHNob3VsZCBhdCBsZWFzdCBiZSBzdXJlIHdlIGRvbid0Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogY2hhbmdlIHRoZSB2YWx1ZSBvZiB0aGUgU1IyIFF1YWQgRW5hYmxlIGJp
dC4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKgo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIFdlIGNhbiBzYWZlbHkgYXNzdW1lIHRoYXQgd2hlbiB0aGUg
UXVhZCBFbmFibGUgCj4+IG1ldGhvZCBpcwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIHNldCwgdGhlIHZhbHVlIG9mIHRoZSBRRSBiaXQgaXMgb25lLCBhcyBhIAo+PiBjb25z
ZXF1ZW5jZSBvZiB0aGUKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBub3It
PnBhcmFtcy0+cXVhZF9lbmFibGUoKSBjYWxsLgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogV2UgY2FuIHNh
ZmVseSBhc3N1bWUgdGhhdCB0aGUgUXVhZCBFbmFibGUgYml0IGlzIAo+PiBwcmVzZW50IGluCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdGhlIFN0YXR1cyBSZWdpc3RlciAy
IGF0IEJJVCgxKS4gQWNjb3JkaW5nIHRvIHRoZSAKPj4gSkVTRDIxNgo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIHJldkIgc3RhbmRhcmQsIEJGUFQgRFdPUkRTWzE1XSwgYml0
cyAyMjoyMCwgdGhlIAo+PiAxNi1iaXQKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBXcml0ZSBTdGF0dXMgKDAxaCkgY29tbWFuZCBpcyBhdmFpbGFibGUganVzdCBmb3IgCj4+
IHRoZSBjYXNlcwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGluIHdoaWNo
IHRoZSBRRSBiaXQgaXMgZGVzY3JpYmVkIGluIFNSMiBhdCBCSVQoMSkuCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzcl9jclsxXSA9IFNSMl9RVUFEX0VOX0JJVDE7Cj4+IMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcl9jclsxXSA9IDA7Cj4+IMKgwqDC
oMKgwqDCoMKgIH0KPj4gCj4+ICJXZSBjYW4gc2FmZWx5IGFzc3VtZSB0aGF0IHdoZW4gdGhlIFF1
YWQgRW5hYmxlIG1ldGhvZC4uIi4gV2UgY2Fubm90LCAKPj4gaWYgd2UKPj4gZG9uJ3QgaGF2ZSA0
IEkvTyBsaW5lcy4gVGhlIHF1YWRfZW5hYmxlIGlzIGp1c3QgdGhlIG9wIGhvdyB0byBkbyBpdCwg
Cj4+IGJ1dCBub3QKPj4gKmlmKiBjYW4gZG8gaXQuIEl0IHNlZW1zIHRvIGJlIG1pc3NpbmcgdGhl
IHNhbWUgY2hlY2sgYXMgdGhlCj4+IHNwaV9ub3JfcXVhZF9lbmFibGUoKS4gQnV0IEknbSBub3Qg
c3VyZSBpZiBpdCdzIHRoYXQgc2ltcGxlLgo+PiAKPiAKPiBJIHNlZS4gVGhlbiBleHRlbmRpbmcg
dGhlIGlmIGNvbmRpdGlvbiBzaG91bGQgZG8gdGhlIHRyaWNrLCBhcwo+IHNwaV9ub3Jfd3JpdGVf
MTZiaXRfc3JfYW5kX2NoZWNrKCkgaXMgY2FsbGVkIGFmdGVyIHNldHVwLiBTb21ldGhpbmcKPiBs
aWtlOgo+IAo+IGlmIChzcGlfbm9yX2dldF9wcm90b2NvbF93aWR0aChub3ItPnJlYWRfcHJvdG8p
ID09IDQgJiYKPiAgICAgc3BpX25vcl9nZXRfcHJvdG9jb2xfd2lkdGgobm9yLT53cml0ZV9wcm90
bykgPT0gNCAmJgo+ICAgICBub3ItPnBhcmFtcy0+cXVhZF9lbmFibGUpCj4gCj4gSXMgdGhpcyB3
aGF0IEhzaW4tWWkgaXMgaGl0dGluZz8KCkhvcGVmdWxseSA6KQoKLW1pY2hhZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
