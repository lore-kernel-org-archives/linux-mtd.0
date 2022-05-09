Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75372C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 14:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7gzIj4J43zPB5Y/DaSSYQcP92fYDyfSCdBQQdBWfAs=; b=xongwbJgd9wk4v
	e0qBFg67MdjA1xkCAuVyewAAl8BKGZqpALrRuKuUxrx471roq93qqAL7KR1nfh9bWyF1b5XLr+2GK
	hSvkmoROZnc8nkWxjQdnrurkDCbobaEGyqTvDomHql9TxPGugEUbY29NaTdXi1xVeaNt3/f6C2qH4
	Tgz464bZl42T2ZG+lNEOptiV9iCCQYSEd59pXAGS9T0SMMAMm408LqOGAFj/zuLWBUCfs+yKIbZtK
	ANw/Joc8I2zCCeuv+TEDwAuAxxDw0o2b4fU4KOvy1M3cFson7T5HKQgepsKhslT/dq6mqe8k7s83b
	/GlbbR5ulIHazE9m2cDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4CP-00ElcL-Ga; Mon, 09 May 2022 14:17:21 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no4CL-00ElYu-NU
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 14:17:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C49D510000D;
 Mon,  9 May 2022 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652105833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSOVWG/6UQoQq3L4xNF0gbdzpIveH52iOo5gKne0gyk=;
 b=dpPDFe4DxXofWjMIoVJ6wLrLkMqvw/6PHZpM7aESrSKfFcA8LCpHK4NpPwoAoPX57zv7F9
 eLCxmiBbojx1k218u11AQJszalmsTUuIDnpqnzLGSdlfDE5d0dccambdjFCONz7gqSgiB2
 Ojcahy4MagdqAMUHCssO2KDdmL8C/UUNqeXJEfc00nZC3zpRDMkRlnM7m9SfyhkrzpDe37
 0fs6s4CRdQw3FR9Qh/450sSEwVg2Y5TD4nFPYnk6UVK2DdGLMvtgjn6oOgUYA7jNPuXOwm
 BZ9FKFrY0Xf5riDQi4YBKGaWc6Da59Tac13q9Ho+tVmCS+duM47js/HqHrS9Xw==
Date: Mon, 9 May 2022 16:17:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] mtd: call of_platform_populate() for MTD partitions
Message-ID: <20220509161708.5817de9b@xps13>
In-Reply-To: <20220504194448.17427-1-zajec5@gmail.com>
References: <20220504194448.17427-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_071718_253357_3EA0C3D7 
X-CRM114-Status: GOOD (  23.21  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsICA0IE1heSAyMDIyIDIx
OjQ0OjQ4ICswMjAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gVW50aWwgdGhpcyBjaGFuZ2UgTVREIHN1YnN5c3RlbSBzdXBwb3J0ZWQgaGFuZGxpbmcg
cGFydGl0aW9ucyBvbmx5IHdpdGgKPiBNVEQgcGFydGl0aW9ucyBwYXJzZXJzLiBUaGF0J3MgYSBz
cGVjaWZpYyAvIGxpbWl0ZWQgQVBJIGRlc2lnbmVkIGFyb3VuZAo+IHBhcnRpdGlvbnMuCj4gCj4g
U29tZSBNVEQgcGFydGl0aW9ucyBtYXkgaG93ZXZlciByZXF1aXJlIGRpZmZlcmVudCBoYW5kbGlu
Zy4gVGhleSBtYXkKPiBjb250YWluIHNwZWNpZmljIGRhdGEgdGhhdCBuZWVkcyB0byBiZSBwYXJz
ZWQgYW5kIHNvbWVob3cgZXh0cmFjdGVkLiBGb3IKPiB0aGF0IHB1cnBvc2UgTVREIHN1YnN5c3Rl
bSBzaG91bGQgYWxsb3cgYmluZGluZyBvZiBzdGFuZGFyZCBwbGF0Zm9ybQo+IGRyaXZlcnMuCj4g
Cj4gQW4gZXhhbXBsZSBjYW4gYmUgVS1Cb290IChzdWIpcGFydGl0aW9uIHdpdGggZW52aXJvbm1l
bnQgdmFyaWFibGVzLgo+IFRoZXJlIGV4aXN0IGEgInUtYm9vdCxlbnYiIERUIGJpbmRpbmcgZm9y
IE1URCAoc3ViKXBhcnRpdGlvbiB0aGF0Cj4gcmVxdWlyZXMgYW4gTlZNRU0gZHJpdmVyLgo+IAo+
IFJlZjogNWRiMWMyZGJjMDRjICgiZHQtYmluZGluZ3M6IG52bWVtOiBhZGQgVS1Cb290IGVudmly
b25tZW50IHZhcmlhYmxlcyBiaW5kaW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gLS0tCj4gVjI6IEZpeCBjYXNlIGZvciAjIENPTkZJR19N
VERfUEFSVElUSU9ORURfTUFTVEVSIGlzIG5vdCBzZXQKPiAgICAgbWFzdGVyLT5kZXYgY2FuJ3Qg
YmUgdXNlZCBibGluZGx5IGFzIGl0IG1heSBwb2ludCB0byB1bnJlZ2lzdGVyZWQKPiAgICAgZGV2
aWNlIGFuZCBjYXVzZSBXQVJOSU5Hcwo+IC0tLQo+ICBkcml2ZXJzL210ZC9tdGRwYXJ0LmMgfCA5
ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+IGlu
ZGV4IDM1NzY2MWI2MmM5NC4uNDk3MWZhNjlkMDc2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L210ZHBhcnQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+IEBAIC0xNyw2ICsxNyw3
IEBACj4gICNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0aW9ucy5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2Zf
cGxhdGZvcm0uaD4KPiAgCj4gICNpbmNsdWRlICJtdGRjb3JlLmgiCj4gIAo+IEBAIC01NzcsMTAg
KzU3OCwxNiBAQCBzdGF0aWMgaW50IG10ZF9wYXJ0X29mX3BhcnNlKHN0cnVjdCBtdGRfaW5mbyAq
bWFzdGVyLAo+ICAJc3RydWN0IG10ZF9wYXJ0X3BhcnNlciAqcGFyc2VyOwo+ICAJc3RydWN0IGRl
dmljZV9ub2RlICpucDsKPiAgCXN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKPiArCXN0cnVjdCBkZXZp
Y2UgKmRldjsKPiAgCWNvbnN0IGNoYXIgKmNvbXBhdDsKPiAgCWNvbnN0IGNoYXIgKmZpeGVkID0g
ImZpeGVkLXBhcnRpdGlvbnMiOwo+ICAJaW50IHJldCwgZXJyID0gMDsKPiAgCj4gKwlpZiAobXRk
X2lzX3BhcnRpdGlvbihtYXN0ZXIpIHx8IElTX0VOQUJMRUQoQ09ORklHX01URF9QQVJUSVRJT05F
RF9NQVNURVIpKQoKQXJlIHlvdSBzdXJlIGFib3V0IHRoaXMgY29uZGl0aW9uPyBJc24ndCBhY2Nl
c3NpbmcgbWFzdGVyLT5kZXYucGFyZW50CmdvaW5nIHRvIGZhaWwgaWYgIUlTX0VOQUJMRUQoUEFS
VElUSU9ORURfTUFTVEVSKSA/CgpJJ20gbm90IDEwMCUgc3VyZSBteSByZW1hcmsgaXMgY29ycmVj
dCBidXQgSSBmYWlsIHRvIGdldCB0aGUgbG9naWMKaGVyZS4KCj4gKwkJZGV2ID0gJm1hc3Rlci0+
ZGV2Owo+ICsJZWxzZQo+ICsJCWRldiA9IG1hc3Rlci0+ZGV2LnBhcmVudDsKPiArCj4gIAlucCA9
IG10ZF9nZXRfb2Zfbm9kZShtYXN0ZXIpOwo+ICAJaWYgKG10ZF9pc19wYXJ0aXRpb24obWFzdGVy
KSkKPiAgCQlvZl9ub2RlX2dldChucCk7Cj4gQEAgLTU5Myw2ICs2MDAsNyBAQCBzdGF0aWMgaW50
IG10ZF9wYXJ0X29mX3BhcnNlKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLAo+ICAJCQljb250aW51
ZTsKPiAgCQlyZXQgPSBtdGRfcGFydF9kb19wYXJzZShwYXJzZXIsIG1hc3RlciwgcHBhcnRzLCBO
VUxMKTsKPiAgCQlpZiAocmV0ID4gMCkgewo+ICsJCQlvZl9wbGF0Zm9ybV9wb3B1bGF0ZShucCwg
TlVMTCwgTlVMTCwgZGV2KTsKPiAgCQkJb2Zfbm9kZV9wdXQobnApOwo+ICAJCQlyZXR1cm4gcmV0
Owo+ICAJCX0KPiBAQCAtNjAwLDYgKzYwOCw3IEBAIHN0YXRpYyBpbnQgbXRkX3BhcnRfb2ZfcGFy
c2Uoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCj4gIAkJaWYgKHJldCA8IDAgJiYgIWVycikKPiAg
CQkJZXJyID0gcmV0Owo+ICAJfQo+ICsJb2ZfcGxhdGZvcm1fcG9wdWxhdGUobnAsIE5VTEwsIE5V
TEwsIGRldik7Cj4gIAlvZl9ub2RlX3B1dChucCk7Cj4gIAo+ICAJLyoKCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
