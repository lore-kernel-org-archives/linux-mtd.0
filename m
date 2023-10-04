Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487CAE7B5F3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 11:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rxu4tiIXjkxIwlc+Jc7aZlQX4/RgTJJtvsBRO6f+ko=; b=PgZcqvVw2UKn0m
	0JZt/4XqhQgBe9sKh3p1PgkNCbG2emD23NpWEMh0HJHiAYIaWbNykFAFwe7L+H4yErmtMpsdIy3nS
	8k9gyi4zckmN5we3hxf+1Ht6rRALyzJbC/Wt1WH7674MKj1BEGkiWV7ZZeLXXiFNXLlRUhERN/4OG
	ZcZG1mGrc4IfWNWHVHTNkRoIMfSAO5Cq6/9JPa/rh1v5SU9QfZwCSYJ8UuECUb09BoCrh5BvysHYp
	pePkTfMPzwlymNrxZlz11XJYeu9osfpWObvhAG4BPRYkTihwhPKkq91L1wgueTOI10l/OR/iYVFsI
	xb4BqXdDWIjEcYRrovfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo07J-00HUOm-0G;
	Wed, 04 Oct 2023 11:32:37 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo07F-00HUMk-39
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 11:32:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D535160004;
	Wed,  4 Oct 2023 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696419148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiGdNZliZJFxAotjLXsFjydngfAocFp3/JRLhQoNFiw=;
	b=Q2yyudk2DeopG4p/IJKJNvz/uUKI7L36/M+bfZvjO2okJ7jIuoKVMEUwQ6pbqN6uwNgGm3
	ew+0dgaPuzhqPTV/Z6kO1X/4Ll3VjaXd3wP/96HWhhfZYHXlIA8Cv0pm33+uzmJoK3vJ4j
	2/RCWmSDgs4fvpAl5v82tLPeg5ASmofwjH2wKpcoUUwVXaSc5Lu9NyS+mOFqKhSFUoTS7Z
	F1AxubzkvrfW0z+C4uKsZMNtLoDGrmNTO6i2lwKBCru+AyRMk6PtE0xfPTXMubReQ6sbte
	v48enjubU5DdXQYvSgeSb3GTiEV9k0fYmlUCZRskOCdk/n3bQJepsib/6BlcnQ==
Date: Wed, 4 Oct 2023 13:32:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
Message-ID: <20231004133225.4a770789@xps-13>
In-Reply-To: <BL3PR11MB6532AC02EA46C2D861438A29A2CBA@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20231004061214.17176-1-niravkumar.l.rabara@intel.com>
	<20231004094455.1a6a19e1@xps-13>
	<BL3PR11MB6532AC02EA46C2D861438A29A2CBA@BL3PR11MB6532.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_043234_464042_28BB0178 
X-CRM114-Status: GOOD (  16.13  )
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

SGVsbG8sCgo+ID4gPiAtQ2hpbGQgbm9kZXMgcmVwcmVzZW50IHRoZSBhdmFpbGFibGUgTkFORCBj
aGlwcy4gIAo+ID4gCj4gPiBUaGlzIGlzIG5vdCBmdWxseSBwaWN0dXJlZCBpbiB0aGUgY3VycmVu
dCBzY2hlbWEsIGJ5IHJlZmVyZW5jaW5nIG5hbmQtCj4gPiBjb250cm9sbGVyLnlhbWwgSSBiZWxp
ZXZlIHlvdSBhbGxvdyBhbGwga2luZCBvZiBkaXJlY3QgcGFydGl0aW9uaW5nICh3aGljaCBpcyBs
ZWdhY3ksCj4gPiBhbmQgbm90IHN1cHBvc2VkIHRvIGJlIHN1cHBvcnRlZCBoZXJlKS4KPiA+IENh
biB5b3UgdHJ5IHRvIGRlZmluZSBhIHBhcnRpdGlvbiBkaXJlY3RseSB3aXRoaW4gdGhlIGNvbnRy
b2xsZXIgbm9kZSBpbiB0aGUgZXhhbXBsZQo+ID4gYW5kIHNlZSB3aGV0aGVyIGl0IHN0aWxsIHBh
c3NlcyB0aGUgY2hlY2tzPwo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsICAKPiAKPiBIaSBN
aXF1ZWwsCj4gCj4gSSB0cmllZCBiZWxvdyBpbiB0aGUgY29udHJvbGxlciBub2RlIGluIGV4YW1w
bGUsCj4gCj4gICAgICAgIC4uLgo+ICAgICAgICAgY2xvY2tzID0gPCZuZl9jbGs+Owo+ICAgICAg
ICAgY2Rucyxib2FyZC1kZWxheS1wcyA9IDw0ODMwPjsKPiAKPiAgICAgICAgIHBhcnRpdGlvbkAw
IHsKPiAgICAgICAgICAgbGFiZWwgPSAiYm9vdCI7Cj4gICAgICAgICAgIHJlZyA9IDwwIDB4MDAy
MDAwMDA+Owo+ICAgICAgICAgIH07Cj4gCj4gICAgICAgICBuYW5kQDAgewo+ICAgICAgICAgICAg
IHJlZyA9IDwwPjsKPiAgICAgICAgIH07Cj4gCj4gSXQgc2hvd3MgICdwYXJ0aXRpb25AMCcgd2Fz
IHVuZXhwZWN0ZWQuCj4gCj4gRFRDX0NISyBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2NhZGVuY2UsbmFuZC5leGFtcGxlLmR0Ygo+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvY2FkZW5jZSxuYW5kLmV4YW1wbGUuZHRzOjM1LjIzLTM4LjE0OiBXYXJu
aW5nICh1bmlxdWVfdW5pdF9hZGRyZXNzX2lmX2VuYWJsZWQpOiAvZXhhbXBsZS0wL25hbmQtY29u
dHJvbGxlckAxMGI4MDAwMC9wYXJ0aXRpb25AMDogZHVwbGljYXRlIHVuaXQtYWRkcmVzcyAoYWxz
byB1c2VkIGluIG5vZGUgL2V4YW1wbGUtMC9uYW5kLWNvbnRyb2xsZXJAMTBiODAwMDAvbmFuZEAw
KQo+IC9tbnQvbmV3dm9sdW1lL3VzZXJzL25yYWJhcmEva2VybmVsLm9yZy8zb2N0MjMvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jYWRlbmNlLG5hbmQuZXhhbXBsZS5kdGI6
IG5hbmQtY29udHJvbGxlckAxMGI4MDAwMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90
IGFsbG93ZWQgKCdwYXJ0aXRpb25AMCcgd2FzIHVuZXhwZWN0ZWQpCj4gICAgICAgICBGcm9tIHNj
aGVtYTogL21udC9uZXd2b2x1bWUvdXNlcnMvbnJhYmFyYS9rZXJuZWwub3JnLzNvY3QyMy9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NhZGVuY2UsbmFuZC55YW1sCj4gCj4g
SG93ZXZlciB1c2luZyBwYXJ0aXRpb24gaW4gbmFuZCBub2RlIGlzIE9LLgo+ICAgICAgICAgbmFu
ZEAwIHsKPiAgICAgICAgICAgICByZWcgPSA8MD47Cj4gICAgICAgICAgICAgCj4gICAgICAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47
Cj4gCj4gICAgICAgICAgICAgcGFydGl0aW9uQDAgewo+ICAgICAgICAgICAgICAgbGFiZWwgPSAi
Ym9vdCI7Cj4gICAgICAgICAgICAgICByZWcgPSA8MCAweDAwMjAwMDAwPjsKPiAgICAgICAgICAg
ICB9Owo+IAo+ICAgICAgICAgICAgIHBhcnRpdGlvbkAyMDAwMDAgewo+ICAgICAgICAgICAgICAg
bGFiZWwgPSAiZW52IjsKPiAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMjAwMDAwIDB4MDA0MDAw
MDA+Owo+ICAgICAgICAgICAgIH07Cj4gICAgICAgICB9Owo+IAo+ICJtYWtlIGR0X2JpbmRpbmdf
Y2hlY2sgRFRfU0NIRU1BX0ZJTEVTPW10ZC9jYWRlbmNlLG5hbmQueWFtbCIgIGlzIE9LIHdpdGhv
dXQgYW55IHdhcm5pbmdzLiAKPiAKPiBEVEVYICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvY2FkZW5jZSxuYW5kLmV4YW1wbGUuZHRzCj4gRFRDX0NISyBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NhZGVuY2UsbmFuZC5leGFtcGxlLmR0Ygo+IAo+
IEFueSBhZGRpdGlvbmFsIGNoYW5nZXMgcmVxdWlyZWQgZm9yIHRoaXMgcGF0Y2g/CgpObywgc2hv
dWxkIGJlIGZpbmUgdGhlbi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
