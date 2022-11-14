Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C667C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AfjDwmoDqUIn2k955g7W5JXg3aZaPaFm9BCkEImfqA=; b=ba6v1GkCVoKeKx
	utIENNdbRiUgebtoW0vXSWozcyMn3BHegzJPZouGhoOzY/48cOm+jIE+pAVXf6e6q4Yeas3nb/Msi
	6gwTonPp4womiTjoWKCT0LkjYwOgK9jxFImjojtEpEs3YkKfWncG3OdC/wBZRpj08iTP9BLsFHvDv
	Nktcao+aUGl8f74qO6/5gfYNT8rlT9z6EzTwviwj69ZzuISJLFSzniBvSqg/wMOOJ57ebrSpRMsg/
	P8TgZ4SUDazHapQXyaoS9wFPdW1f5qVGqCk3E21lkXAdAYukj8KQ1WyCInV4wq4kmw0Kb6e4vf81T
	kBRCUG6JTmYhfqm+kjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVY7-00H8wv-Nn; Mon, 14 Nov 2022 09:14:39 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVY3-00H8tQ-P2
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:14:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C223E0008;
	Mon, 14 Nov 2022 09:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668417271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oBxa36/e2s5Q5a4tS85ZI4cWnvsxpE1Fze65dFPuccA=;
	b=OBYem1eOTJHUmpN8jQbSq1S5Z4X0EyvDyjSYqCYfNbgLZn8z5FSrEf5LVNaqAhnyA6Hzzz
	AFnBi1Z9KTnI81wP45e8L4yuauqL1ek1puJzuqgs3Sjtmut8voOi4/KZbwn6SntpgGMqrK
	/DJ2ofaOyV/ZH5pwFJ35evlhh2tOtKCdeyn4Lhwraq8Ir5knm8JRfliYpH5wY6MeaX5Khw
	pZkfd+45vUG0obMEp1d1kw9gv3agM0k5n9/RwGXRbU96VgZMdMmKlJBI0SRQ6yHtYrAXSJ
	0kR7wYFj9vPEBA9RKcJVu9SKmzxmRV8TuTIWEDX2+Vd74dq1LgEhEuMLUtIimQ==
Date: Mon, 14 Nov 2022 10:14:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mikhail Zhilkin <csharper2005@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: fixed-partitions: Fix
 'sercomm,scpart-id' schema
Message-ID: <20221114101428.3932e265@xps-13>
In-Reply-To: <20221111212824.4103514-1-robh@kernel.org>
References: <20221111212824.4103514-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_011436_164262_221381FD 
X-CRM114-Status: GOOD (  21.31  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIEZyaSwgMTEgTm92IDIwMjIgMTU6Mjg6
MjQgLTA2MDA6Cgo+IFRoZSBzY2hlbWEgZm9yICdzZXJjb21tLHNjcGFydC1pZCcgaXMgYnJva2Vu
LiBUaGUgJ2lmJyBjb25kaXRpb24gaXMKPiBuZXZlciB0cnVlIGJlY2F1c2UgJ2NvbXBhdGlibGUn
IGlzIGluIHRoZSBwYXJlbnQgbm9kZSwgbm90IHRoZSBjaGlsZAo+IG5vZGUgdGhlIHN1Yi1zY2hl
bWEgYXBwbGllcyB0by4gVGhlIGV4YW1wbGUgcGFzc2VzIGFzIHRoZXJlIGFyZSBubwo+IGNvbnN0
cmFpbnRzIG9uIGFkZGl0aW9uYWwvdW5ldmFsdWF0ZWQgcHJvcGVydGllcy4gVGhhdCdzIGEgc2Vj
b25kYXJ5Cj4gaXNzdWUgd2hpY2ggaXMgY29tcGxpY2F0ZWQgZHVlIHRvIG5lc3RlZCBwYXJ0aXRp
b25zLgo+IAo+IERyb3AgdGhlIGlmL3RoZW4gc2NoZW1hIGFuZCB0aGUgdW5uZWNlc3NhcnkgJ2Fs
bE9mJyBzbyB0aGF0IHRoZQo+ICdzZXJjb21tLHNjcGFydC1pZCcgcHJvcGVydHkgaXMgYXQgbGVh
c3QgZGVmaW5lZC4KPiAKPiBDYzogTWlraGFpbCBaaGlsa2luIDxjc2hhcnBlcjIwMDVAZ21haWwu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpNbW1o
IHJpZ2h0LCBJJ3ZlIG1pc3NlZCB0aGF0IGluIG15IGxpdHRsZSByZXdvcmsuIEknbGwgYXBwbHkg
aXQgd2l0aAp0aGUgYmlnIHNlcmllcyAiW1BBVENIIHYzIDAwLzE3XSAgSW1wcm92ZSBNVEQgYmlu
ZGluZ3MiIGFzIHNvb24gYXMgdGhlCmxhc3QgcmVtYWluaW5nIHBhdGNoIGdldHMgcmV2aWV3ZWQu
Cgo+IC0tLQo+ICAuLi4vbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sICAgICAg
fCAyOSArKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCAxOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0
aXRpb25zLnlhbWwKPiBpbmRleCBhZDNjY2QyNTA4MDIuLjM5YjcxNWFhZDJkYyAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4
ZWQtcGFydGl0aW9ucy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbAo+IEBAIC0zMSwyNCArMzEs
MTcgQEAgcHJvcGVydGllczoKPiAgCj4gIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICJAWzAtOWEt
Zl0rJCI6Cj4gLSAgICBhbGxPZjoKPiAtICAgICAgLSAkcmVmOiAicGFydGl0aW9uLnlhbWwjIgo+
IC0gICAgICAtIGlmOgo+IC0gICAgICAgICAgcHJvcGVydGllczoKPiAtICAgICAgICAgICAgY29t
cGF0aWJsZToKPiAtICAgICAgICAgICAgICBjb250YWluczoKPiAtICAgICAgICAgICAgICAgIGNv
bnN0OiBzZXJjb21tLHNjLXBhcnRpdGlvbnMKPiAtICAgICAgICB0aGVuOgo+IC0gICAgICAgICAg
cHJvcGVydGllczoKPiAtICAgICAgICAgICAgc2VyY29tbSxzY3BhcnQtaWQ6Cj4gLSAgICAgICAg
ICAgICAgZGVzY3JpcHRpb246IFBhcnRpdGlvbiBpZCBpbiBTZXJjb21tIHBhcnRpdGlvbiBtYXAu
IE10ZAo+IC0gICAgICAgICAgICAgICAgcGFyc2VyIHVzZXMgdGhpcyBpZCB0byBmaW5kIGEgcmVj
b3JkIGluIHRoZSBwYXJ0aXRpb24gbWFwCj4gLSAgICAgICAgICAgICAgICBjb250YWluaW5nIG9m
ZnNldCBhbmQgc2l6ZSBvZiB0aGUgY3VycmVudCBwYXJ0aXRpb24uIFRoZQo+IC0gICAgICAgICAg
ICAgICAgdmFsdWVzIGZyb20gcGFydGl0aW9uIG1hcCBvdmVycmlkZXMgcGFydGl0aW9uIG9mZnNl
dCBhbmQKPiAtICAgICAgICAgICAgICAgIHNpemUgZGVmaW5lZCBpbiByZWcgcHJvcGVydHkgb2Yg
dGhlIGR0cy4gRnJlcXVlbnRseSB0aGVzZQo+IC0gICAgICAgICAgICAgICAgdmFsdWVzIGFyZSB0
aGUgc2FtZSwgYnV0IG1heSBkaWZmZXIgaWYgZGV2aWNlIGhhcyBiYWQKPiAtICAgICAgICAgICAg
ICAgIGVyYXNlYmxvY2tzIG9uIGEgZmxhc2guCj4gLSAgICAgICAgICAgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKyAgICAkcmVmOiBwYXJ0aXRpb24u
eWFtbCMKPiArCj4gKyAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICBzZXJjb21tLHNjcGFydC1pZDoK
PiArICAgICAgICBkZXNjcmlwdGlvbjogUGFydGl0aW9uIGlkIGluIFNlcmNvbW0gcGFydGl0aW9u
IG1hcC4gTXRkIHBhcnNlcgo+ICsgICAgICAgICAgdXNlcyB0aGlzIGlkIHRvIGZpbmQgYSByZWNv
cmQgaW4gdGhlIHBhcnRpdGlvbiBtYXAgY29udGFpbmluZwo+ICsgICAgICAgICAgb2Zmc2V0IGFu
ZCBzaXplIG9mIHRoZSBjdXJyZW50IHBhcnRpdGlvbi4gVGhlIHZhbHVlcyBmcm9tCj4gKyAgICAg
ICAgICBwYXJ0aXRpb24gbWFwIG92ZXJyaWRlcyBwYXJ0aXRpb24gb2Zmc2V0IGFuZCBzaXplIGRl
ZmluZWQgaW4KPiArICAgICAgICAgIHJlZyBwcm9wZXJ0eSBvZiB0aGUgZHRzLiBGcmVxdWVudGx5
IHRoZXNlIHZhbHVlcyBhcmUgdGhlIHNhbWUsCj4gKyAgICAgICAgICBidXQgbWF5IGRpZmZlciBp
ZiBkZXZpY2UgaGFzIGJhZCBlcmFzZWJsb2NrcyBvbiBhIGZsYXNoLgo+ICsgICAgICAgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ICAKPiAgcmVxdWlyZWQ6
Cj4gICAgLSAiI2FkZHJlc3MtY2VsbHMiCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
