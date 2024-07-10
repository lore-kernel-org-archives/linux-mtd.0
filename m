Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C5CC3DA41
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 13:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyHShxDCZJRVijApmUY/MQrId4AFl4PKtJXjXupezRk=; b=F3AuSthfBvzJpb
	AEWehXxq37Q3DE8JXL/n8uW5NS4YsaP6v1zBZrh9hQvPzhRbMWAXZFzsDUI9jOB0zJx85nR44pyh+
	p7M18UNlzBOxdEVzw8NzBO1BvZ9P9HtGcpgnCnOuXlLZCYVpgpsQW7M0VBLL0rq9EWEPl96nRz8SC
	R0O41eQ1v/6qxVAkKU4TvTc2gOujrAEXueQnrvwYUCR+rFqWbFOxLJVSu4UNHWc4AujnKHv5HbBPr
	mEzsYhEVL3FZdEHaJJQVs7gg8418+xxKvcbHqmAP0MfVWBpjcMBEASD4x8yY23aESy1UrwAf4qqND
	pd0R+CCQ/Lv8VwyGKxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRX01-0000000Aa8F-437F;
	Wed, 10 Jul 2024 13:04:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWzx-0000000Aa6u-0isH
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 13:04:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 582ECCE12BA;
	Wed, 10 Jul 2024 13:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2B3C32781;
	Wed, 10 Jul 2024 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720616676;
	bh=onzmcxaR9WVaOaR53OrVwg2UDI/A4ORQ6Oxc7wv+1zw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cQNUs39L19kCh4XO/FzWZc1h22oxZNouZMR1RCYXBJkZk0u63HGcCrWbxNqoHq1Jo
	 XGVOicyiwQkh7Vo7bOKGOducpHEL3O12/LQ34XchU+HDdmMrtHpQAEo9zvK50nVM75
	 CXQ90vwrLqmx/92r7pEb7/I09cX2RfO2DIzLP4eA8skI99YxByD/dFycO9onzRVxEx
	 dHoCTAp4HKEbw3xaMZbyzVMN5XKWwF5u60JCNC6LvuzM6SkkyquFxVraYG39CCd70h
	 OcnPbliyXZgVfh/uBpy9TU278Q+1/jBxg1p4P7ZS1bI59RE0U5lx2X4K+l8upfnmQN
	 VeUj3YuO1s6zw==
From: Pratyush Yadav <pratyush@kernel.org>
To: =?utf-8?Q?Cs=C3=B3k=C3=A1s=2C_Bence?= <csokas.bence@prolan.hu>
Cc: <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Tudor Ambarus" <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: sst: Factor out common write operation to
 `sst_nor_write_data()`
In-Reply-To: <20240710091401.1282824-1-csokas.bence@prolan.hu>
 (=?utf-8?B?IkNzw7Nrw6FzLA==?=
	Bence"'s message of "Wed, 10 Jul 2024 11:14:01 +0200")
References: <20240710091401.1282824-1-csokas.bence@prolan.hu>
Date: Wed, 10 Jul 2024 15:04:34 +0200
Message-ID: <mafs07cdto0t9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_060442_389421_DCDE19EE 
X-CRM114-Status: GOOD (  26.04  )
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

SGksCgpPbiBXZWQsIEp1bCAxMCAyMDI0LCBDc8Oza8OhcywgQmVuY2Ugd3JvdGU6Cgo+IFdyaXRp
bmcgdG8gdGhlIEZsYXNoIGluIGBzc3Rfbm9yX3dyaXRlKClgIGlzIGEgMy1zdGVwIHByb2Nlc3M6
Cj4gZmlyc3QgYW4gb3B0aW9uYWwgb25lLWJ5dGUgd3JpdGUgdG8gZ2V0IDItYnl0ZS1hbGlnbmVk
LCB0aGVuIHRoZQo+IGJ1bGsgb2YgdGhlIGRhdGEgaXMgd3JpdHRlbiBvdXQgaW4gdmVuZG9yLXNw
ZWNpZmljIDItYnl0ZSB3cml0ZXMuCj4gRmluYWxseSwgaWYgdGhlcmUncyBhIGJ5dGUgbGVmdCBv
dmVyLCBhbm90aGVyIG9uZS1ieXRlIHdyaXRlLgo+IFRoaXMgd2FzIGltcGxlbWVudGVkIDMgdGlt
ZXMgaW4gdGhlIGJvZHkgb2YgYHNzdF9ub3Jfd3JpdGUoKWAuCj4gVG8gcmVkdWNlIGNvZGUgZHVw
bGljYXRpb24sIGZhY3RvciBvdXQgdGhlc2Ugc3ViLXN0ZXBzIHRvIHRoZWlyCj4gb3duIGZ1bmN0
aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ3PDs2vDoXMsIEJlbmNlIDxjc29rYXMuYmVuY2VAcHJv
bGFuLmh1Pgo+IC0tLQo+Cj4gTm90ZXM6Cj4gICAgIFJGQzogSSdtIHRoaW5raW5nIG9mIHJlbW92
aW5nIFNQSU5PUl9PUF9CUCBpbiBmYXZvciBvZgo+ICAgICBTUElOT1JfT1BfUFAgKHRoZXkgaGF2
ZSB0aGUgc2FtZSB2YWx1ZSkuIFNQSU5PUl9PUF9QUAo+ICAgICBpcyB0aGUgInN0YW5kYXJkIiBu
YW1lIGZvciB0aGUgZWxlbWVudGFyeSB1bml0LXNpemVkCj4gICAgICgxIGJ5dGUsIGluIHRoZSBj
YXNlIG9mIE5PUikgd3JpdGUgb3BlcmF0aW9uLiBJIGZpbmQgaXQKPiAgICAgY29uZnVzaW5nIHRv
IGhhdmUgdHdvIG5hbWVzIGZvciB0aGUgc2FtZSBvcGVyYXRpb24sCj4gICAgIHNvIGluIGEgZm9s
bG93dXAgSSBwbGFuIHRvIHJlbW92ZSB0aGUgdmVuZG9yLXNwZWNpZmljCj4gICAgIG5hbWUgaW4g
ZmF2b3Igb2YgdGhlIHN0YW5kYXJkIG9uZS4KCkV2ZW4gdGhvdWdoIHRoZSBvcGVyYXRpb25zIGhh
dmUgdGhlIHNhbWUgb3Bjb2RlLCBJIHNlZSB0aGVtIGFzIGRpZmZlcmVudApvcGVyYXRpb25zLiBP
bmUgaXMgYSBieXRlIHByb2dyYW06IGl0IGNhbiBvbmx5IHdyaXRlIG9uZSBieXRlIGF0IGEgdGlt
ZS4KVGhlIG90aGVyIGlzIGEgcGFnZSBwcm9ncmFtOiBpdCBjYW4gd3JpdGUgdXAgdG8gb25lIHBh
Z2UgKDI1NiBieXRlcwp1c3VhbGx5KSBhdCBhIHRpbWUuCgpTbyBJIHdvdWxkIGFjdHVhbGx5IGZp
bmQgaXQgbW9yZSBjb25mdXNpbmcgaWYgeW91IHVzZSBwYWdlIHByb2dyYW0gaW4gYQpzaXR1YXRp
b24gd2hlcmUgdGhlIG9wZXJhdGlvbiBpcyBhY3R1YWxseSBhIGJ5dGUgcHJvZ3JhbSwgYW5kIGF0
dGVtcHRpbmcKdG8gcHJvZ3JhbSB0aGUgd2hvbGUgcGFnZSB3aWxsIGZhaWwuCgo+Cj4gIGRyaXZl
cnMvbXRkL3NwaS1ub3Ivc3N0LmMgfCAzOSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL3NzdC5jCj4gaW5kZXggMTgwYjczOTA2OTBjLi5mZWM3MTY4OWU2NDQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3Ivc3N0LmMKPiBAQCAtMTY3LDYgKzE2NywyMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGZsYXNoX2luZm8gc3N0X25vcl9wYXJ0c1tdID0gewo+ICAJfQo+ICB9Owo+ICAKPiArc3RhdGlj
IGludCBzc3Rfbm9yX3dyaXRlX2RhdGEoc3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90IHRvLCBz
aXplX3QgbGVuLAo+ICsJCQljb25zdCB1X2NoYXIgKmJ1ZikKPiArewo+ICsJdTggb3AgPSAobGVu
ID09IDEpID8gU1BJTk9SX09QX0JQIDogU1BJTk9SX09QX0FBSV9XUDsKCkhtbSwgdGhpcyBsb29r
cyBhIGJpdCBoYWNreS4gQnV0IHRoZSB3aG9sZSBzc3Rfbm9yX3dyaXRhKCkgaXMga2luZGEKaGFj
a3kgYW55d2F5IHNvIGl0IGlzIGZpbmUgSSBndWVzcy4uLiBMR1RNIG90aGVyd2lzZS4KClJldmll
d2VkLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz4KCk5vdCBkaXJlY3Rs
eSByZWxhdGVkIHRvIHRoaXMgcGF0Y2gsIGJ1dCB3aGVuIHJldmlld2luZyB0aGlzIHBhdGNoIEkK
bm90aWNlZCBhbm90aGVyIHNtYWxsIGltcHJvdmVtZW50IHlvdSBjYW4gbWFrZS4gc2luY2UgeW91
IGFyZSBhbHJlYWR5Cmxvb2tpbmcgYXQgdGhpcyBjb2RlLiAodG8gYmUgY2xlYXIsIHRoaXMgaXMg
bm90IG5lZWRlZCBmb3IgdGhpcyBwYXRjaCB0bwpnZXQgbWVyZ2VkLCB0aGlzIGNhbiBiZSBhIGZv
bGxvdyB1cCBwYXRjaCkuCgpzc3Rfbm9yX3dyaXRlKCkgbG9va3MgbGlrZToKCgkvKiBXcml0ZSBv
dXQgbW9zdCBvZiB0aGUgZGF0YSBoZXJlLiAqLwoJZm9yICg7IGFjdHVhbCA8IGxlbiAtIDE7IGFj
dHVhbCArPSAyKSB7CiAgICAgICAgCVsuLi5dCgl9Cglub3ItPnNzdF93cml0ZV9zZWNvbmQgPSBm
YWxzZTsKCglyZXQgPSBzcGlfbm9yX3dyaXRlX2Rpc2FibGUobm9yKTsKCWlmIChyZXQpCgkJZ290
byBvdXQ7CgoJcmV0ID0gc3BpX25vcl93YWl0X3RpbGxfcmVhZHkobm9yKTsKCWlmIChyZXQpCgkJ
Z290byBvdXQ7CgoJLyogV3JpdGUgb3V0IHRyYWlsaW5nIGJ5dGUgaWYgaXQgZXhpc3RzLiAqLwoJ
aWYgKGFjdHVhbCAhPSBsZW4pIHsKCQlyZXQgPSBzcGlfbm9yX3dyaXRlX2VuYWJsZShub3IpOwog
ICAgICAgICAgICAgICAgWy4uLl0KCgkJcmV0ID0gc3BpX25vcl93cml0ZV9kYXRhKG5vciwgdG8s
IDEsIGJ1ZiArIGFjdHVhbCk7CiAgICAgICAgICAgICAgICBbLi4uXQoKCQlyZXQgPSBzcGlfbm9y
X3dhaXRfdGlsbF9yZWFkeShub3IpOwoJCWlmIChyZXQpCgkJCWdvdG8gb3V0OwoKCgkJcmV0ID0g
c3BpX25vcl93cml0ZV9kaXNhYmxlKG5vcik7Cgl9CgpIZXJlLCB3ZSBkbyBhIHdyaXRlIGRpc2Fi
bGUuIFRoZW4gaWYgYSBvbmUtYnl0ZSB3cml0ZSBpcyBuZWVkZWQsIGRvIGEKd3JpdGUgZW5hYmxl
IGFnYWluLCB3cml0ZSB0aGUgZGF0YSBhbmQgd3JpdGUgZGlzYWJsZS4KCkRvIHdlIHJlYWxseSBu
ZWVkIHRvIHRvZ2dsZSB3cml0ZSBlbmFibGUgYmV0d2VlbiB0aGVzZT8gSWYgbm90LCBpdCBjYW4K
YmUgc2ltcGxpZmllZCB0byBvbmx5IGRvIHRoZSB3cml0ZSBkaXNhYmxlIGFmdGVyIGFsbCBieXRl
cyBoYXZlIGJlZW4Kd3JpdHRlbi4KClsuLi5dCgotLSAKUmVnYXJkcywKUHJhdHl1c2ggWWFkYXYK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
