Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4675EB64D8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 07:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bu57FY2m2LW9qDwNFbYScNxPI0wbCdy0tOwIWibtEfc=; b=zASUrefYJqYP/f
	7eOQYPWmf06EMcBizqC/OFrZU/u7jYxrZGOEpawBU2xFTG6G41WUNnyBuW8esPUGdziiQeHJ1CNdt
	2fA5NNMj0aUsRYYmwkXdjyi+WDRSrsaGwlZ05PmtQJQ7T4SinLgWgpFuNkAHOFYs+Y7v6fEb3Wvgw
	jzI5+/XmJKV3Z4qpzY1/zv/7h+imk9xn8quJV1W23Vr+huekTUcp6M5sm+tw4WWHQyacNOCarfwVx
	Zlgj7LeN7tjcDeSQ9iTao0gO/QshTd3ceV5z0I8xPZSKd9s2Ko+8Z9keHGSaIvh+t0q17usIUFKgv
	+wZiSGIVCypj1YD4eXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCF2a-00HIQz-1f;
	Thu, 22 Jun 2023 07:47:40 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCF2W-00HIPM-0Q
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 07:47:38 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687420045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89WP1q/8S6g2s5tTpGK/iOZXZ5QteoJHJMjMT1W427M=;
	b=C5SSSVQk7NMUCrYxoxCCtHop04npnYWlkIUxThInbZrqvNGHLr9zQGLT3M9Bei4Qp1HD7/
	ikSTpjyatD6tYhBcqkfccGPmZ/91N7F9gAedkeJ2BwGAY728ozlgn3FsmjtD6qQb3vn0Kp
	k1jMSr/gn8FBXSPr9I5bJ0IvBZrvU1tsP/gC+Sf2nAFQuK69qotxdV3qssbhs6UxkT25Ae
	kFkboaUsRi6gkDPu2jstaz3SZMJH3jr8kFowwXVYH/B0h1lFKEps7EHW6p+6NDiQHMvuK3
	l/weV/JA/jPcgp00VG0AaK7Pahms5b0ZgSvDrXUa6aM0oTklSqkt0uphCS/tcw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B706E24000C;
	Thu, 22 Jun 2023 07:47:24 +0000 (UTC)
Date: Thu, 22 Jun 2023 09:47:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Olivier Maignial <olivier.maignial@hotmail.fr>
Cc: olivier.maignial@somfy.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mikhail Kshevetskiy
 <mikhail.kshevetskiy@iopsys.eu>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: winbond|toshiba: Fix ecc_get_status
Message-ID: <20230622094723.37b70bd3@xps-13>
In-Reply-To: <DB4P250MB103296BD8C6C8CD514A46E83FE5CA@DB4P250MB1032.EURP250.PROD.OUTLOOK.COM>
References: <DB4P250MB103296BD8C6C8CD514A46E83FE5CA@DB4P250MB1032.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_004736_513609_0618BE9B 
X-CRM114-Status: GOOD (  17.11  )
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

SGkgT2xpdmllciwKCm9saXZpZXIubWFpZ25pYWxAaG90bWFpbC5mciB3cm90ZSBvbiBUdWUsIDIw
IEp1biAyMDIzIDIzOjE2OjE1ICswMjAwOgoKPiBSZWFkaW5nIEVDQyBzdGF0dXMgaXMgZmFpbGlu
ZyBpbiB0b3NoaWJhICYgd2luYm9uZCBzcGktbmFuZCBkcml2ZXJzLgo+IAo+IHR4NThjeGd4c3hy
YWl4X2VjY19nZXRfc3RhdHVzKCkgYW5kIHcyNW4wMmt2X2VjY19nZXRfc3RhdHVzKCkKPiBmdW5j
dGlvbnMgYXJlIHVzaW5nIG9uLXN0YWNrIGJ1ZmZlcnMgd2hpY2ggYXJlIG5vdCBzdWl0YWJsZQo+
IGZvciBETUEgbmVlZHMgb2Ygc3BpLW1lbS4KPiAKPiBGaXggdGhpcyBieSB1c2luZyB0aGUgc3Bp
LW1lbSBvcGVyYXRpb25zIGRlZGljYXRlZCBidWZmZXIKPiBzcGluYW5kLT5zY3JhdGNoYnVmCgpN
aXNzaW5nIHBlcmlvZCAgICAgICAuCgo+IAo+IFNlZQo+IHNwaW5hbmQtPnNjcmF0Y2hidWY6Cj4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oP2g9djYuMyNuNDE4Cj4g
c3BpX21lbV9jaGVja19vcCgpOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc3BpL3NwaS1tZW0u
Yz9oPXY2LjMjbjE5OQoKQ291bGQgeW91IGFkZCBhIENjOiBzdGFibGUgYW5kIGEgRml4ZXMgdGFn
PyBJdCBtaWdodCByZXF1aXJlIHRvIGFkZHJlc3MKYm90aCBkcml2ZXJzIGluZGVwZW5kZW50bHkg
KGluIHR3byBkaWZmZXJlbnQgY29tbWl0cyksIHRoaXMgaXMgbm90IGEKcHJvYmxlbS4KCk90aGVy
d2lzZSBMR1RNIQoKVGhhbmtzLApNaXF1w6hsCgo+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTWFp
Z25pYWwgPG9saXZpZXIubWFpZ25pYWxAaG90bWFpbC5mcj4KPiAtLS0KPiAgZHJpdmVycy9tdGQv
bmFuZC9zcGkvdG9zaGliYS5jIHwgNCArKy0tCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJv
bmQuYyB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9zaGliYS5j
IGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9zaGliYS5jCj4gaW5kZXggNzM4MGIxZWJhY2NkLi5h
ODA0MjdjMTMxMjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9zaGliYS5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9zaGliYS5jCj4gQEAgLTczLDcgKzczLDcg
QEAgc3RhdGljIGludCB0eDU4Y3hneHN4cmFpeF9lY2NfZ2V0X3N0YXR1cyhzdHJ1Y3Qgc3BpbmFu
ZF9kZXZpY2UgKnNwaW5hbmQsCj4gIHsKPiAgCXN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCA9IHNw
aW5hbmRfdG9fbmFuZChzcGluYW5kKTsKPiAgCXU4IG1iZiA9IDA7Cj4gLQlzdHJ1Y3Qgc3BpX21l
bV9vcCBvcCA9IFNQSU5BTkRfR0VUX0ZFQVRVUkVfT1AoMHgzMCwgJm1iZik7Cj4gKwlzdHJ1Y3Qg
c3BpX21lbV9vcCBvcCA9IFNQSU5BTkRfR0VUX0ZFQVRVUkVfT1AoMHgzMCwgc3BpbmFuZC0+c2Ny
YXRjaGJ1Zik7Cj4gIAo+ICAJc3dpdGNoIChzdGF0dXMgJiBTVEFUVVNfRUNDX01BU0spIHsKPiAg
CWNhc2UgU1RBVFVTX0VDQ19OT19CSVRGTElQUzoKPiBAQCAtOTIsNyArOTIsNyBAQCBzdGF0aWMg
aW50IHR4NThjeGd4c3hyYWl4X2VjY19nZXRfc3RhdHVzKHN0cnVjdCBzcGluYW5kX2RldmljZSAq
c3BpbmFuZCwKPiAgCQlpZiAoc3BpX21lbV9leGVjX29wKHNwaW5hbmQtPnNwaW1lbSwgJm9wKSkK
PiAgCQkJcmV0dXJuIG5hbmRkZXZfZ2V0X2VjY19jb25mKG5hbmQpLT5zdHJlbmd0aDsKPiAgCj4g
LQkJbWJmID4+PSA0Owo+ICsJCW1iZiA9ICooc3BpbmFuZC0+c2NyYXRjaGJ1ZikgPj4gNDsKPiAg
Cj4gIAkJaWYgKFdBUk5fT04obWJmID4gbmFuZGRldl9nZXRfZWNjX2NvbmYobmFuZCktPnN0cmVu
Z3RoIHx8ICFtYmYpKQo+ICAJCQlyZXR1cm4gbmFuZGRldl9nZXRfZWNjX2NvbmYobmFuZCktPnN0
cmVuZ3RoOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPiBpbmRleCAzYWQ1OGNkMjg0ZDguLmY1MDdl
Mzc1OTMwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPiBAQCAtMTA4LDcgKzEwOCw3IEBA
IHN0YXRpYyBpbnQgdzI1bjAya3ZfZWNjX2dldF9zdGF0dXMoc3RydWN0IHNwaW5hbmRfZGV2aWNl
ICpzcGluYW5kLAo+ICB7Cj4gIAlzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBzcGluYW5kX3Rv
X25hbmQoc3BpbmFuZCk7Cj4gIAl1OCBtYmYgPSAwOwo+IC0Jc3RydWN0IHNwaV9tZW1fb3Agb3Ag
PSBTUElOQU5EX0dFVF9GRUFUVVJFX09QKDB4MzAsICZtYmYpOwo+ICsJc3RydWN0IHNwaV9tZW1f
b3Agb3AgPSBTUElOQU5EX0dFVF9GRUFUVVJFX09QKDB4MzAsIHNwaW5hbmQtPnNjcmF0Y2hidWYp
Owo+ICAKPiAgCXN3aXRjaCAoc3RhdHVzICYgU1RBVFVTX0VDQ19NQVNLKSB7Cj4gIAljYXNlIFNU
QVRVU19FQ0NfTk9fQklURkxJUFM6Cj4gQEAgLTEyNiw3ICsxMjYsNyBAQCBzdGF0aWMgaW50IHcy
NW4wMmt2X2VjY19nZXRfc3RhdHVzKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiAg
CQlpZiAoc3BpX21lbV9leGVjX29wKHNwaW5hbmQtPnNwaW1lbSwgJm9wKSkKPiAgCQkJcmV0dXJu
IG5hbmRkZXZfZ2V0X2VjY19jb25mKG5hbmQpLT5zdHJlbmd0aDsKPiAgCj4gLQkJbWJmID4+PSA0
Owo+ICsJCW1iZiA9ICooc3BpbmFuZC0+c2NyYXRjaGJ1ZikgPj4gNDsKPiAgCj4gIAkJaWYgKFdB
Uk5fT04obWJmID4gbmFuZGRldl9nZXRfZWNjX2NvbmYobmFuZCktPnN0cmVuZ3RoIHx8ICFtYmYp
KQo+ICAJCQlyZXR1cm4gbmFuZGRldl9nZXRfZWNjX2NvbmYobmFuZCktPnN0cmVuZ3RoOwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
