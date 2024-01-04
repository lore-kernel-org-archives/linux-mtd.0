Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15872C47073
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkmwqtmFZWweHnynSFDdDDkm02kT9M48eMTpyldFyOw=; b=cisNEPyR+xzO2y
	Itw00+MsjrnEMzHdnbrBR9stS2wUJKJsAX/sBMj4T5BEX1U+jpj+n6FsUc6kObktbTtoN1Fm4Whe7
	CWU36+gDfP4nFcdGy5vBv2b2Tkbd3ARqU0CpjtGTE7CEpFykiKMNnr675C72wqTrbeeV5mdmcryFU
	zExR8+IbYEUiCSqBx227AfMQqvcEDUb3FDWTINOcYAHnuojrxy3Whj9YUkU7J5n8S4ypiybbYifmu
	6LjivULwncp05CxnKNhcYsgWQ0vqQtieMVbRm6rBs2YBYGIB/kwqOvaOiJpnAWVsol/8dvegIRzEO
	5iMBr1MjP+bz+PmF2akw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLIcu-00D8pE-1G;
	Thu, 04 Jan 2024 07:58:52 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLIcp-00D8np-0K;
	Thu, 04 Jan 2024 07:58:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42225FF80A;
	Thu,  4 Jan 2024 07:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704355121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7tDgF8jmLlYnxlNyI3TgVBeZTXRFDyykxfhy3VnRuqc=;
	b=WjHkc//SMCn9WSqtxGYRZEWtGnibX5AGg6J5U2qcFSDINWfx1hGmp6q8+7nOrL9VqZQBlI
	3P9bKP4usCn5p/pu34lVn1nqKcPI0Vhr4ZYBUW3gHW55natIxMAjFgj+wE6WGGee3JVL0N
	fa6Qgh2pM6NeJjbsc8VaiLjWvJ4zf1+KzpO+gmYlH4t6pmwswo6QazEjHD4dTl3lzVGjbZ
	FLdKjgjv71ASWY2DG/E3KQVVI0m55hKHum7MdnLoiLIaIYyHQwF53iY2pXZ8/N38cih49e
	x/24R4u+6d0hapbAM2sGRhHZOY9zp3THYJMVOblYLJyba70l73XJj9RBGCdv0Q==
Date: Thu, 4 Jan 2024 08:58:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/6] dt-bindings: nvmem: layouts: add U-Boot
 environment variables layout
Message-ID: <20240104085839.5624c354@xps-13>
In-Reply-To: <20240104001129.GA2045237-robh@kernel.org>
References: <20231221173421.13737-1-zajec5@gmail.com>
	<20240104001129.GA2045237-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_235847_584083_88B55EB6 
X-CRM114-Status: GOOD (  20.86  )
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

SGVsbG8sCgpyb2JoQGtlcm5lbC5vcmcgd3JvdGUgb24gV2VkLCAzIEphbiAyMDI0IDE3OjExOjI5
IC0wNzAwOgoKPiBPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCAwNjozNDoxNlBNICswMTAwLCBSYWZh
xYIgTWnFgmVja2kgd3JvdGU6Cj4gPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+Cj4gPiAKPiA+IFUtQm9vdCBlbnYgZGF0YSBpcyBhIHdheSBvZiBzdG9yaW5nIGZpcm13
YXJlIHZhcmlhYmxlcy4gSXQncyBhIGZvcm1hdAo+ID4gdGhhdCBjYW4gYmUgdXNlZCBvZiB0b3Ag
b2YgdmFyaW91cyBzdG9yYWdlIGRldmljZXMuIEl0cyBiaW5kaW5nIHNob3VsZAo+ID4gYmUgYW4g
TlZNRU0gbGF5b3V0IGluc3RlYWQgb2YgYSBzdGFuZGFsb25lIGRldmljZS4KPiA+IAo+ID4gVGhp
cyBwYXRjaCBhZGRzIGxheW91dCBiaW5kaW5nIHdoaWNoIGFsbG93cyB1c2luZyBpdCBvbiB0b3Ag
b2YgTVREIE5WTUVNCj4gPiBkZXZpY2UgYXMgd2VsbCBhcyBhbnkgb3RoZXIuIEF0IHRoZSBzYW1l
IHRpbWUgaXQgZGVwcmVjYXRlcyB0aGUgb2xkCj4gPiBjb21iaW5lZCBiaW5kaW5nLgo+IAo+IEkg
ZG9uJ3QgdW5kZXJzdGFuZCB0aGUgaXNzdWUuIEZyb20gYSBEVCBwZXJzcGVjdGl2ZSwgdGhlcmUg
aXNuJ3QuIEEgCj4gcGFydGl0aW9uIGlzIG5vdCBhIGRldmljZSwgYnV0IGlzIGRlc2NyaWJpbmcg
dGhlIGxheW91dCBvZiBzdG9yYWdlIAo+IGFscmVhZHkuCgpBY3R1YWxseSBJIHRoaW5rIHdoYXQg
UmFmYcWCIHdhbnRzIHRvIGRvIGdvZXMgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiBidXQKSSBhbHNv
IHVuZGVyc3RhbmQgZnJvbSBhIGJpbmRpbmcgcGVyc3BlY3RpdmUgaXQgbWF5IGJlIGEgbGl0dGxl
CmNvbmZ1c2luZywgZXZlbiBtb3JlIGlmIHdlIGNvbnNpZGVyICJOVk1FTSIgYSBMaW51eCBzcGVj
aWZpYyBjb25jZXB0LgoKVGhlcmUgaXMgdG9kYXkgYSAidS1ib290IGVudiIgTlZNRU0gKmRldmlj
ZSogZGVzY3JpcHRpb24gd2hpY2gKYWxtb3N0IHNpdHMgYXQgdGhlIHNhbWUgbGV2ZWwgYXMgZWcu
IGFuIGVlcHJvbSBkZXZpY2UuIFdlIGNhbm5vdApjb21wYXJlICJhbiBlZXByb20gZGV2aWNlIiBh
bmQgImEgdS1ib290IGVudmlyb25tZW50IiBvZiBjb3Vyc2UuIEJ1dAp0aGF0J3MgdHJ1bHkgd2hh
dCBpcyBjdXJyZW50bHkgZGVzY3JpYmVkLgoKKiBDdXJyZW50IHNpdHVhdGlvbgoKCUZsYXNoIGRl
dmljZSAtPiBVLUJvb3QgZW52IGxheW91dCAtPiBOVk1FTSBjZWxscwoKKiBJbXByb3ZlZCBzaXR1
YXRpb24KCglBbnkgc3RvcmFnZSBkZXZpY2UgLT4gTlZNRU0gLT4gVS1Cb290IGVudiBsYXlvdXQg
LT4gTlZNRU0gY2VsbHMKClRoZSBsYXR0ZXIgaXMgb2YgY291cnNlIHRoZSBtb3N0IHJlbGV2YW50
IGRlc2NyaXB0aW9uIGFzIHdlIGV4cGVjdApzdG9yYWdlIGRldmljZXMgdG8gZXhwb3NlIGEgc3Rv
cmFnZS1hZ25vc3RpYyBpbnRlcmZhY2UgKE5WTUVNIGluCnRoaXMgY2FzZSkgd2hpY2ggY2FuIHRo
ZW4gYmUgcGFyc2VkIChieSBOVk1FTSBsYXlvdXRzKSBpbiBhIHN0b3JhZ2UKYWdub3N0aWMgd2F5
LgoKSW4gdGhlIGN1cnJlbnQgY2FzZSwgdGhlIGN1cnJlbnQgVS1Cb290IGVudiBiaW5kaW5nIHRl
bGxzIHBlb3BsZSB0bwpkZWNsYXJlIHRoZSBlbnYgbGF5b3V0IG9uIHRvcCBvZiBhIGZsYXNoIGRl
dmljZSAob25seSkuIFRoZSBjdXJyZW50CmRlc2NyaXB0aW9uIGFsc28gZXhwZWN0cyBhIHBhcnRp
dGlvbiBub2RlIHdoaWNoIGlzIHR5cGljYWwgdG8gZmxhc2gKZGV2aWNlcy4gV2hlcmVhcyB3aGF0
IHdlIHNob3VsZCBoYXZlIGRlc2NyaWJlZCBpbiB0aGUgZmlyc3QgcGxhY2UgaXMgYQpsYXlvdXQg
dGhhdCBhcHBsaWVzIG9uIGFueSBraW5kIG9mIE5WTUVNIGRldmljZS4KCkJvbnVzIHBvaW50OiBX
ZSd2ZSBiZWVuIHdvcmtpbmcgdGhlIGxhc3QgY291cGxlIHllYXJzIG9uIGNsYXJpZnlpbmcKYmlu
ZGluZ3MsIGVzcGVjaWFsbHkgd2l0aCBtdGQgcGFydGl0aW9ucyAod2l0aCB0aGUgcGFydGl0aW9u
c3t9CmNvbnRhaW5lcikgYW5kIE5WTUVNIGxheW91dHMgKHdpdGggdGhlIG52bWVtLWxheW91dHt9
IGNvbnRhaW5lcikuClRoZSBzd2l0Y2ggcHJvcG9zZWQgaW4gdGhpcyBwYXRjaCBtYWtlcyB1c2Ug
b2YgdGhlIGxhdHRlciwgb2YgY291cnNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
