Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF6FC77B7D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 May 2023 20:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfVdMTZKr8SIEj/qOYpjqDoWnSBYsQ7bGPeL471gT7E=; b=zG39IbZNbpnlF8
	X4tCXC+3QgdxLrz7H+OXd7jwC4yB4BN6KeVW52mdWf6ZhMYTQulQ4pBCuH8B+bZLg4FjTgKCVZfkk
	X5UUbrdSqsJj8vzMGfDldU9xPFIYZ1Ya8jm0o+bC0au2zI2hob1LaNypmZL5jWIkhQUB/qnhvJPkX
	aHgOM6kgNCFMeHFEgYMgcvdtKoBCYSegulxaE/BC9maCZhC1cFzmSGaMMau1cu+ftK/s++MGNICTO
	ucaimjsVywe9bW/drglCTgBT9V1Ev956S+O9QTAnSidfHk7nofkcdfR1lOyfTaeNcIwcvBA0OnLUj
	bXCR6LrsAueRjvF/93EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqpD-00708F-2B;
	Wed, 10 May 2023 20:54:15 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqp8-00706z-2B;
	Wed, 10 May 2023 20:54:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7CA491C0007;
	Wed, 10 May 2023 20:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683752042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmQCtxST+exa6SSBpml6OW3Btx1Cfsjd48HbCNm2+V4=;
	b=oMbduGZOJaO60CrrGnZd2qWJpEeKrdfvEJnYftup7CnEMeL0yJwnE9SCzQscq6zGq8JRlL
	8FpjeM3BjB8kXtuind6T6pXq3BYAntOsCfVabbjyYi1PF1+RjQ6Xzn+RxQhjWz5PJK8mnu
	6Ed9Rgn8hFr5Of1C55jkXbUMXTCdSkSwLhr9exNDr6A/VTXaa3qMU2wl6GoY000zQIARyq
	vjRPInrJphwZFaqXGt6ebiiXaZqccH9eNRI60QUdSSMfGcEafuaKo1ZYBqyO3ZO7N5/ORF
	+7ImQWA/1vPBvXsZei+BVlHCeLfJzdWI7nCR5T8Vv0r/XaznMJs0kLyqSCDPmQ==
Date: Wed, 10 May 2023 22:53:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Liang Yang
 <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
Message-ID: <20230510225359.061c2df6@xps-13>
In-Reply-To: <CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
	<20230510110835.26115-7-AVKrasnov@sberdevices.ru>
	<CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_135411_163855_86EB0308 
X-CRM114-Status: GOOD (  24.48  )
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

SGkgTWFydGluICYgQXJzZW5peSwKCm1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20g
d3JvdGUgb24gV2VkLCAxMCBNYXkgMjAyMyAyMjo0MDozNworMDIwMDoKCj4gSGVsbG8gQXJzZW5p
eSwKPiAKPiBPbiBXZWQsIE1heSAxMCwgMjAyMyBhdCAxOjEz4oCvUE0gQXJzZW5peSBLcmFzbm92
Cj4gPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyByZW5hbWVz
IG5vZGUgd2l0aCB2YWx1ZXMgZm9yIGNoaXAgc2VsZWN0IGZyb20gInJlZyIgdG8gImNzIi4gSXQg
aXMKPiA+IG5lZWRlZCBiZWNhdXNlIHdoZW4gT1RQIGFjY2VzcyBpcyBlbmFibGVkIG9uIHRoZSBh
dHRhY2hlZCBzdG9yYWdlLCBNVEQKPiA+IHN1YnN5c3RlbSByZWdpc3RlcnMgdGhpcyBzdG9yYWdl
IGluIHRoZSBOVk1FTSBzdWJzeXN0ZW0uIE5WTUVNIGluIHR1cm4KPiA+IHRyaWVzIHRvIHVzZSAi
cmVnIiBub2RlIGluIGl0cyBvd24gbWFubmVyLCBzdXBwb3NlcyB0aGF0IGl0IGhhcyBhbm90aGVy
Cj4gPiBsYXlvdXQuIEFsbCBvZiB0aGlzIGxlYWRzIHRvIGRldmljZSBpbml0aWFsaXphdGlvbiBm
YWlsdXJlLiAgCj4gSW4gZ2VuZXJhbDogaWYgd2UgY2hhbmdlIHRoZSBkZXZpY2UtdHJlZSBpbnRl
cmZhY2UgKGluIHRoaXMgY2FzZToKPiByZXBsYWNpbmcgYSAicmVnIiB3aXRoIGEgImNzIiBwcm9w
ZXJ0eSkgdGhlIGR0LWJpbmRpbmdzIGhhdmUgdG8gYmUKPiB1cGRhdGVkIGFzIHdlbGwuCgpUcnVl
LCBhbmQgSSB3b3VsZCBhZGQsIGJpbmRpbmdzIHNob3VsZCBub3QgYmUgYnJva2VuLgoKPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sIGFu
ZAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1u
YW5kLnlhbWwgc2hvdwo+IHRoYXQgdGhlIGNoaXAgc2VsZWN0IG9mIGEgTkFORCBjaGlwIGlzIHNw
ZWNpZmllZCB3aXRoIGEgInJlZyIKPiBwcm9wZXJ0eS4KCkFsbCBOQU5EIGNvbnRyb2xsZXIgYmlu
ZGluZyBleHBlY3QgdGhlIGNoaXAtc2VsZWN0IHRvIGJlIGluIHRoZQoncmVnJyBwcm9wZXJ0eSwg
dmVyeSBtdWNoIGxpa2UgYSBzcGkgZGV2aWNlIHdvdWxkIHVzZSByZWcgdG8gc3RvcmUgdGhlCmNz
IGFzIHdlbGw6IHRoZSByZWcgcHJvcGVydHkgdGVsbHMgeW91IGhvdyB5b3UgYWRkcmVzcyB0aGUg
ZGV2aWNlLgoKSSBhbHNvIGZ1bGx5IGFncmVlIHdpdGggTWFydGluJ3MgY29tbWVudHMgYmVsb3cu
IENoYW5naW5nIHJlZyBpcyBsaWtlbHkKYSB3cm9uZyBhcHByb2FjaCA6KQoKPiBBbHNvIHRoZSBj
b2RlIGhhcyB0byBiZSBiYWNrd2FyZHMgY29tcGF0aWJsZSB3aXRoIG9sZCAuZHRicy4KPiAKPiA+
IEV4YW1wbGU6Cj4gPgo+ID4gWy4uLl0gbnZtZW0gbXRkMC11c2VyLW90cDogbnZtZW06IGludmFs
aWQgcmVnIG9uIC9zb2MvYnVzQGZmZTAwMDAwLy4uLgo+ID4gWy4uLl0gbXRkIG10ZDA6IEZhaWxl
ZCB0byByZWdpc3RlciBPVFAgTlZNRU0gZGV2aWNlCj4gPiBbLi4uXSBtZXNvbi1uYW5kIGZmZTA3
ODAwLm5mYzogZmFpbGVkIHRvIHJlZ2lzdGVyIE1URCBkZXZpY2U6IC0yMgo+ID4gWy4uLl0gbWVz
b24tbmFuZCBmZmUwNzgwMC5uZmM6IGZhaWxlZCB0byBpbml0IE5BTkQgY2hpcHMKPiA+IFsuLi5d
IG1lc29uLW5hbmQ6IHByb2JlIG9mIGZmZTA3ODAwLm5mYyBmYWlsZWQgd2l0aCBlcnJvciAtMjIg
IAo+IFRoaXMgaXMgb2RkIC0gY2FuIHlvdSBwbGVhc2Ugc2hhcmUgeW91ciBkZWZpbml0aW9uIG9m
IHRoZSAmbmZjIG5vZGU/Cj4gCj4gJm5mYyB7Cj4gICAgICAgbmFuZF9jaGlwMDogbmFuZEAwIHsK
PiAgICAgICAgIHJlZyA9IDwwPjsKPiAgICAgICB9Owo+IH07Cj4gCj4gVGhpcyBzaG91bGQgcmVz
dWx0IGluIG5hbmRfc2V0X2ZsYXNoX25vZGUoKSBiZWluZyBjYWxsZWQgd2l0aAo+ICZuYW5kX2No
aXAwIChpZiBpdCdzIGNhbGxlZCB3aXRoICZuZmMgdGhlbiBzb21ldGhpbmcgaXMgYnVnZ3kgaW4g
b3VyCj4gZHJpdmVyKS4KPiBJZiB0aGVyZSdzIG5vIGNoaWxkIG5vZGVzIHdpdGhpbiAmbmFuZF9j
aGlwMCB0aGVuIHdoeSB3b3VsZCB0aGUKPiBNVEQtdG8tTlZNRU0gY29kZSB0aGluayB0aGF0IGl0
IGhhcyB0byBwYXJzZSBzb21ldGhpbmc/Cj4gSWYgeW91IGRvIGhhdmUgY2hpbGQgbm9kZXMgYW5k
IHRob3NlIGFyZSBwYXJ0aXRpb25zLCB0aGVuIG1ha2Ugc3VyZQo+IHRoYXQgdGhlIHN0cnVjdHVy
ZSBpcyBjb3JyZWN0IChzZWUgdGhlIGV4dHJhICJwYXJ0aXRpb25zIiBub2RlIGluc2lkZQo+IHdo
aWNoIGFsbCBwYXJ0aXRpb25zIGFyZSBuZXN0ZWQpOgo+ICZuYW5kX2NoaXAwIHsKPiAgICAgcGFy
dGl0aW9ucyB7Cj4gICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsK
PiAKPiAgICAgICAgIHBhcnRpdGlvbkAwIHsKPiAgICAgICAgICAgICBsYWJlbCA9ICJ1LWJvb3Qi
Owo+ICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAgMHg0MDAwPjsKPiAgICAgICAgICAgICBy
ZWFkLW9ubHk7Cj4gICAgICAgICB9Owo+ICAgICB9Owo+IH07Cj4gCj4gCj4gQmVzdCByZWdhcmRz
LCwKPiBNYXJ0aW4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
