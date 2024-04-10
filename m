Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35992CD1296
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dlmplxkO0FKVxO3Sb9wJpeGMrgwO883pmOkNAa0CE4=; b=VgK40GGCtGgM30
	pR0gTXxtikroEPviKty/fzdY5EB8U1HxK9xg7Elwxg+hfTZLeOiJwNyTXD25ednLg7lB00UeYT7EE
	0YNVjtFyoJawK+7OpzzczpKT/C1440oloOC/0U6Zif5zL7LP4sFo2IhbXUrvcMkLBQ/GlsBAUTJsi
	/J9CkWuXsWOYQEy6rO61K6gzgebB+Gc/Q6LfLWznycFbC2eaEnZRaXG8uWwgWMNEn3QjjSkqXQjaM
	eyehmX95as5pXlzPhRU+IEivV5l++BONSnqZ+hgx274wFJVKkARBu/TA4qgFTUdKUfy+B2fpU0oor
	GAr993aRSHgrpRfibCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruV7l-00000006Ms3-3pYL;
	Wed, 10 Apr 2024 10:24:13 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruV7e-00000006Moz-2BlO;
	Wed, 10 Apr 2024 10:24:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAACEFF802;
	Wed, 10 Apr 2024 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712744641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/SknAElnT6j5HCw0JAN47JCCpbMZWq8jCtLo3WbP8M=;
	b=GMoX2O1GLeEWdq3Ksgs4NQSytZdT94CWaTvbV8+vCpznmR3+YvQhX86Se1T5n+sa9UYRRu
	7sjR5RBaUY5F9OCxxf1NscWUs7f2wbWClLClCmeEK6Cvxkez43ejEhudPvS4NM4t7arQr7
	jKkUYBRl0tF1IxAILLgPRxiiF9SkKaT67sb3JFsmx4YtoQMVoh0FHDgEQVuvj3kSDBlyl5
	xmwSOspIEDT2CRKLnCHlo1FIKJrdZ3ORsr81S3sZdPMXraiktKbHQKuZ6nieI6lnDqUNJD
	NpkrMsVyGQnGmRiH1ICqf2VIohsqjE9P06sFV08Z0MMrun8zZ9JfMFBuKfeJ5w==
Date: Wed, 10 Apr 2024 12:23:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <20240410122356.30852b3c@xps-13>
In-Reply-To: <20240409181025.55504-2-avkrasnov@salutedevices.com>
References: <20240409181025.55504-1-avkrasnov@salutedevices.com>
	<20240409181025.55504-2-avkrasnov@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_032407_079356_A7F4F240 
X-CRM114-Status: GOOD (  16.50  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBUdWUsIDkg
QXByIDIwMjQgMjE6MTA6MjQgKzAzMDA6Cgo+IEJvb3QgUk9NIGNvZGUgb24gTWVzb24gcmVxdWly
ZXMgdGhhdCBzb21lIHBhZ2VzIG9uIE5BTkQgbXVzdCBiZSB3cml0dGVuCj4gaW4gc3BlY2lhbCBt
b2RlOiAic2hvcnQiIEVDQyBtb2RlIHdoZXJlIGVhY2ggYmxvY2sgaXMgMzg0IGJ5dGVzIGFuZAo+
IHNjcmFtYmxpbmcgbW9kZSBpcyBvbi4gU3VjaCBwYWdlcyBsb2NhdGVkIHdpdGggdGhlIHNwZWNp
ZmllZCBpbnRlcnZhbAo+IHdpdGhpbiBzcGVjaWZpZWQgb2Zmc2V0LiBCb3RoIGludGVydmFsIGFu
ZCBvZmZzZXQgYXJlIGxvY2F0ZWQgaW4gdGhlCj4gZGV2aWNlIHRyZWUgYW5kIHVzZWQgYnkgZHJp
dmVyIGlmICduYW5kLWlzLWJvb3QtbWVkaXVtJyBpcyBzZXQgZm9yCj4gTkFORCBjaGlwLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8YXZrcmFzbm92QHNhbHV0ZWRldmljZXMu
Y29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sICAg
ICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4gaW5kZXggNTdiNjk1N2M4NDE1
Li5iODZhMTk1MzA1NmIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwKPiBAQCAtNjQs
MTEgKzY0LDI1IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICAgICAgIGl0ZW1zOgo+ICAgICAg
ICAgICAgbWF4aW11bTogMAo+ICAKPiArICAgICAgYW1sb2dpYyxib290LXBhZ2UtbGFzdDoKPiAr
ICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiAr
ICAgICAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgICAgIFRoZSBORkMgZHJpdmVyIG5lZWRzIHRo
aXMgaW5mb3JtYXRpb24gdG8gc2VsZWN0IEVDQwo+ICsgICAgICAgICAgYWxnb3JpdGhtcyBzdXBw
b3J0ZWQgYnkgdGhlIGJvb3QgUk9NLgoKU2hhbGwgd2UgaGF2ZSBhIGxlbmd0aCByYXRoZXIgdGhh
biB0aGUgbGFzdCBwYWdlPwoKPiArCj4gKyAgICAgIGFtbG9naWMsYm9vdC1wYWdlLXN0ZXA6Cj4g
KyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4g
KyAgICAgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgICAgICBUaGUgTkZDIGRyaXZlciBuZWVkcyB0
aGlzIGluZm9ybWF0aW9uIHRvIHNlbGVjdCBFQ0MKPiArICAgICAgICAgIGFsZ29yaXRobXMgc3Vw
cG9ydGVkIGJ5IHRoZSBib290IFJPTSAoaW4gcGFnZXMpLgo+ICsKPiAgICAgIHVuZXZhbHVhdGVk
UHJvcGVydGllczogZmFsc2UKPiAgCj4gICAgICBkZXBlbmRlbmNpZXM6Cj4gICAgICAgIG5hbmQt
ZWNjLXN0cmVuZ3RoOiBbbmFuZC1lY2Mtc3RlcC1zaXplXQo+ICAgICAgICBuYW5kLWVjYy1zdGVw
LXNpemU6IFtuYW5kLWVjYy1zdHJlbmd0aF0KPiArICAgICAgYW1sb2dpYyxib290LXBhZ2UtbGFz
dDogW25hbmQtaXMtYm9vdC1tZWRpdW0sICJhbWxvZ2ljLGJvb3QtcGFnZS1zdGVwIl0KPiArICAg
ICAgYW1sb2dpYyxib290LXBhZ2Utc3RlcDogW25hbmQtaXMtYm9vdC1tZWRpdW0sICJhbWxvZ2lj
LGJvb3QtcGFnZS1sYXN0Il0KPiAgCj4gIAo+ICByZXF1aXJlZDoKCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
