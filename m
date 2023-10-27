Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4FFC25B67
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 12:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxdNO6B6pVnSYcwFfnkhHywYsDBof665VFmnkIanJCw=; b=Yz/XEtxKotwKUT
	9qyV2jivjOyWNN5ijw8C39U9mxjCuEkRIprsQCSZRC7drqjgAdEaEyq/NtfUJR1zrzftKdXaeXFjE
	C1QZnHPrz3ASL6Vq5UqEb9ut/lSlHO02Jge0LI4pXPzqaBN0lHRp8AmjUi6uvYtYBSM5E7d1pLIu5
	khewqW+PiDIiLlXRhlpMCLH9/W0WN2y0CKck5ie129uAVaefzYpYnqc1MDk7X6+G1MCSLVMXJF/zX
	aBgWvZZCBh0xt9ZsQSM6UjU0PRZYWmcwIAKKSNS8M7AgcS5R6dFm/6kf7y54FjNICTsecKHWcbW10
	RNieL5TufiTeQO6ydEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwLgd-00GMbL-1s;
	Fri, 27 Oct 2023 12:11:35 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwLgb-00GMad-0G
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 12:11:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10011E0005;
	Fri, 27 Oct 2023 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698408686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eg44jLmdOZ+FXq7ngD2IgZpYJKNtLh6V9L+riPizDlA=;
	b=PN9i3vmCEofP/kUbZFEwj9h89b57cX7ru1I5L4eIg4GAaTtIHh6IcIAoVqzWwnVIzE9ADT
	dYFz+Nea7RAUM5/Qs8OUoC0KSlQASC3re4Cg7MDeMzM20B7r44b4CHa2aAFvWuOGaxtUQQ
	eAVgCzKNvxK7ewJFT9uX7NkQ2FcIN4n4LB/3W8fO5Lz110JO9QOBN7S9EKrs8CsISGrfAs
	afXGDkLCeaL8OSZMdYinVUh6kRA/rT5bzvAUYE2UBK/KZcHKEsXZ4C843/QdNaCa9G5QY0
	dtAcPPKmMab2OyMt/00Ma19z1CKrSVfPX3o4HCpqniX2bVh3JNg8dAJtlBvs6Q==
Date: Fri, 27 Oct 2023 14:11:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Edward Chow <equu@openmail.cc>
Cc: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lech Perczak
 <lech.perczak@camlingroup.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: mtd: partitions: Export special
 values
Message-ID: <20231027141122.4a0882c1@xps-13>
In-Reply-To: <20231027094610.1022114-1-equu@openmail.cc>
References: <20231025052937.830813-1-equu@openmail.cc>
	<20231027094610.1022114-1-equu@openmail.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_051133_291657_8EAA48B3 
X-CRM114-Status: GOOD (  18.11  )
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

SGkgRWR3YXJkLAoKZXF1dUBvcGVubWFpbC5jYyB3cm90ZSBvbiBGcmksIDI3IE9jdCAyMDIzIDE3
OjQ2OjA4ICswODAwOgoKPiBUaGVyZSBhcmUgc3BlY2lhbCAib2Zmc2V0IiBhbmQgInNpemUiIHZh
bHVlcyBkZWZpbmVkIGFuZCBkb2N1bWVudGVkIGluCj4gbGludXgvbXRkL3BhcnRpdGlvbnMuaDoK
PiAKPiAvKiBjb25zdW1lIGFzIG11Y2ggYXMgcG9zc2libGUsIGxlYXZpbmcgc2l6ZSBhZnRlciB0
aGUgZW5kIG9mIHBhcnRpdGlvbi4gKi8KPiAgI2RlZmluZSBNVERQQVJUX09GU19SRVRBSU4gKHVp
bnQ2NF90KSgtMykKPiAKPiAvKiB0aGUgcGFydGl0aW9uIHdpbGwgc3RhcnQgYXQgdGhlIG5leHQg
ZXJhc2UgYmxvY2suICovCj4gICNkZWZpbmUgTVREUEFSVF9PRlNfTlhUQkxLICh1aW50NjRfdCko
LTIpCj4gCj4gLyogdGhlIHBhcnRpdGlvbiB3aWxsIHN0YXJ0IHdoZXJlIHRoZSBwcmV2aW91cyBv
bmUgZW5kZWQuICovCj4gICNkZWZpbmUgTVREUEFSVF9PRlNfQVBQRU5EICh1aW50NjRfdCkoLTEp
Cj4gCj4gKFRob3VnaCBub3QgZXhwbGljaXRseSwgdGhleSBhcmUgY29tcGFyZWQgYWdhaW5zdCB2
YXJpYWJsZXMgaW4gdWludDY0X3QKPiBpbiBkcml2ZXJzL210ZC9tdGRwYXJ0LmMsIHNvIHRoZXkg
aGFkIGJldHRlciBiZSBjb25zaWRlcmVkIGFzIHN1Y2guKQo+IAo+IC8qIHRoZSBwYXJ0aXRpb24g
d2lsbCBleHRlbmQgdG8gdGhlIGVuZCBvZiB0aGUgbWFzdGVyIE1URCBkZXZpY2UuICovCj4gICNk
ZWZpbmUgTVREUEFSVF9TSVpfRlVMTCAoMCkKPiAKPiBUaGVzZSBzcGVjaWFsIHZhbHVlcyBjb3Vs
ZCBiZSB1c2VkIHRvIGRlZmluZSBwYXJ0aXRpb25zIGF1dG9tYXRpY2FsbHkKPiBmaXR0aW5nIHRv
IHRoZSBzaXplIG9mIHRoZSBtYXN0ZXIgTVREIGRldmljZSBhdCBydW50aW1lLgo+IAo+IEhvd2V2
ZXIsIHRoZXNlIHZhbHVlcyB1c2VkIG5vdCB0byBiZSBleHBvcnRlZCB0byBkdC1iaW5kaW5ncywg
dGh1cwo+IHNlbGRvbSB1c2VkIGJlZm9yZSwgc2luY2UgdGhleSBtaWdodCBoYXZlIGJlZW4gb25s
eSB1c2VkIGluIG51bWVyaWMgZm9ybSwKPiBzdWNoIGFzICIoLTEpICgtMykiIGZvciBNVERQQVJU
X09GU19SRVRBSU4uCj4gCj4gTm93LCB0aGV5IGFyZSBleHBvcnRlZCBpbiBkdC1iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy5oIGFzIDMyLWJpdCBjZWxsCj4gdmFsdWVzLCBzbyAyLWNlbGwgYWRkcmVz
c2VkIHNob3VsZCBiZSBkZWZpbmVkIHRvIHVzZSBzcGVjaWFsIG9mZnNldCB2YWx1ZXMsCj4gc3Vj
aCBhcyAiTVREUEFSVF9PRlNfU1BFQ0lBTCBNVERQQVJUX09GU19SRVRBSU4iIGZvciBNVERQQVJU
X09GU19SRVRBSU4gaW4KPiBsaW51eC9tdGQvcGFydGl0aW9ucy5oLiBBbiBleGFtcGxlIGlzIGFk
ZGVkIHRvIGZpeGVkLXBhcnRpdGlvbnMueWFtbC4KPiAKPiBFZHdhcmQgQ2hvdyAoMik6Cj4gICBk
dC1iaW5kaW5nczogbXRkOiBwYXJ0aXRpb25zOiBFeHBvcnQgc3BlY2lhbCB2YWx1ZXMKPiAgIGR0
LWJpbmRpbmdzOiBtdGQ6IHBhcnRpdGlvbnM6IERvY3VtZW50IHNwZWNpYWwgdmFsdWVzCj4gCj4g
IC4uLi9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwgICAgICB8IDMwICsrKysr
KysrKysrKysrKysrKysKPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKysKPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy5oICAg
ICAgICAgIHwgMTUgKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMo
KykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvbXRkL3BhcnRpdGlv
bnMuaAo+IAo+IC0tCj4gMi40Mi4wCgpJJ3ZlIGV4cHJlc3NlZCBteSBmZWVsaW5ncyByZWdhcmRp
bmcgdGhpcyBzZXJpZXMgaW4geW91ciB2MSBidXQgaXQKZmVlbHMgbGlrZSB5b3UgYXJlIGNvbXBs
ZXRlbHkgaWdub3JpbmcgdGhlbS4gQXMgYSByZW1pbmRlciwgSSBhbQpvcHBvc2VkIHRvIGV4cG9y
dGluZyB0aGVzZSBmbGFncy4gVGhleSBhcmUgb3V0ZGF0ZWQsIGxlZ2FjeSwgaGF2ZQpuZXZlciBi
ZWVuIHVzZWQgaW4gRFQgYW5kIHdlcmUgbmV2ZXIgbWVhbnQgdG8gYmUuCgpUaGFua3MsIE1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
