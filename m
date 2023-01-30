Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE69C54EED
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOLyhwku7IF+/2QTIsrH/e5CYjnqs2YvIIHYULfbzx0=; b=xFCQX8YHgZyYmQ
	YaMSSTRW2feZOrQ2pobga4UWSxasbAIv4oy/gRFYsootPgBRWJU7U/AKqInDKW3D1K5BQAfpSQhxf
	2w1ZpZrspqhoL6F6TvwLI7U+wT4k/3nKY0NqOVsGdAlS+X3sZTIfN27rhZF7VWPF8jU5vxZpIT08J
	b7sAeJuanlYuJnHuOxYcXVpGiK+Bqj62Qc4l+OnEB7jVIE+1sbZG9ath8Q+tB18sxF31xsXm/RxQB
	r73citdgnxaO1hGzNeTgxZmp0LdVPQ4n/JM41WvjZiKA+U/t3We0emoLmEsk0GUwVr80QZ1Nz12DI
	vhn00jOTsa1RpRqQcGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWn9-004BMR-Jb; Mon, 30 Jan 2023 16:13:59 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWlA-004B3x-FG; Mon, 30 Jan 2023 16:11:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C7C31E0006;
	Mon, 30 Jan 2023 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675095112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcGSRz6yN0YvpPxM18cpcT5yuDciHrp+by6J8Z2HzPE=;
	b=fIHDEFlerl/8KMHwFWRVo5CKdbzBAOQCYrA3KdnXDHCfNYGJuNFd99PVt4nzl7eFv+eBa3
	IKyJnI6OQxAgrGls7DOs1ulfBQijUOU9YIATKPmq4pxufMyY3fnPi6tKLczdWg46ltBL6V
	7q1vGEghO57UcHuXti6woJd1zHgy5TMAqmd4I/x6ByVb13ulTwDgdVWg4yrRcJmLhBFs4l
	2xFvQE4KH0/3Iy2eiUEmPGtZFgxKgnQtcniNCnqkH8pQ51AA9zoB0yw5YMSHz8UNWOwUXA
	HzZH+rJ7sNEmjcEWvHMY+m4D1TttwKjzWhWdMNC/wufQ+dQRdHQ8bd3zJF2BZw==
Date: Mon, 30 Jan 2023 17:11:45 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo
 <gch981213@gmail.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <benliang.zhao@mediatek.com>,
 <bin.zhang@mediatek.com>
Subject: Re: [RESEND PATCH v5 00/10] Add MediaTek MT7986 SPI NAND and ECC
 support
Message-ID: <20230130171145.2c844d34@xps-13>
In-Reply-To: <20230130030656.12127-1-xiangsheng.hou@mediatek.com>
References: <20230130030656.12127-1-xiangsheng.hou@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_081156_791327_987D5496 
X-CRM114-Status: GOOD (  15.61  )
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

SGkgWGlhbmdzaGVuZywKCnhpYW5nc2hlbmcuaG91QG1lZGlhdGVrLmNvbSB3cm90ZSBvbiBNb24s
IDMwIEphbiAyMDIzIDExOjA2OjQ2ICswODAwOgoKPiBUaGlzIHBhdGNoIHNlcmllcyBhZGQgTWVk
aWFUZWsgTVQ3OTg2IFNQSSBOQU5EIGFuZCBFQ0MgY29udHJvbGxlcgo+IHN1cHBvcnQsIHNwbGl0
IEVDQyBlbmdpbmUgd2l0aCByYXduYW5kIGNvbnRyb2xsZXIgaW4gYmluZGluZ3MgYW5kCj4gY2hh
bmdlIHRvIFlBTUwgc2NoZW1hLgoKSSB3b3VsZCBsaWtlIHRvIHBpY2stdXAgcGF0Y2hlcyAzLCA3
IGFuZCAxMCBhbmQgYXBwbHkgdGhlbSBpbiB0aGUgbXRkCnRyZWUgYXMgdGhleSBsb29rIGNvbXBs
ZXRlbHkgb3J0aG9nb25hbCB3aXRoIGFsbCB0aGUgb3RoZXIgKHNwaS9EVCkKY2hhbmdlcywgYW0g
SSByaWdodD8KCk1hcmssIGlzIGl0IG9rYXkgZm9yIHlvdT8KClRoYW5rcywKTWlxdcOobAoKPiAK
PiBDaGFuZ2VzIHNpbmNlIFY0Ogo+ICAtIFNwbGl0IGFybSBhbmQgYXJtNjQgZHRzIHBhdGNoIGZv
ciBmaXggZXhpc3RpbmcgTkFORCBjb250cm9sbGVyIG5vZGUgbmFtZS4KPiAKPiBDaGFuZ2VzIHNp
bmNlIFYzOgo+ICAtIENvcnJlY3QgbWVkaWF0ZWssbXRrLW5mYy55YW1sIGR0LWJpbmRpbmdzLgo+
IAo+IENoYW5nZXMgc2luY2UgVjI6Cj4gIC0gQ2hhbmdlIEVDQyBlcnJfbWFzayB2YWx1ZSB3aXRo
IEdFTk1BU0sgbWFjcm8uCj4gIC0gQ2hhbmdlIHNuZmkgbWVkaWF0ZWsscngtbGF0Y2gtbGF0ZW5j
eSB0byBtZWRpYXRlayxyeC1sYXRjaC1sYXRlbmN5LW5zLgo+ICAtIEFkZCBhIHNlcGFyYXRlIHBh
dGNoIGZvciBEVFMgY2hhbmdlLgo+ICAtIE1vdmUgY29tbW9uIGRlc2NyaXB0aW9uIHRvIHRvcC1s
ZXZlbCBwYXR0ZXJuIHByb3BlcnRpZXMuCj4gIC0gRHJvcCByZWR1bmRhbnQgcGFydHMgaW4gZHQt
YmluZGluZ3MuCj4gCj4gQ2hhbmdlcyBzaW5jZSBWMToKPiAgLSBVc2UgZXhpc3Rpbmcgc2FtcGxl
IGRlbGF5IHByb3BlcnR5Lgo+ICAtIEFkZCByZXN0cmljdGluZyBmb3Igb3B0aW9uYWwgbmZpX2hj
bGsuCj4gIC0gSW1wcm92ZSBhbmQgcGVyZmVjdCBkdC1iaW5kaW5ncyBkb2N1bWVudGF0aW9uLgo+
ICAtIENoYW5nZSBleGlzdGluZyBub2RlIG5hbWUgdG8gbWF0Y2ggTkFORCBjb250cm9sbGVyIERU
IGJpbmdpbmdzLgo+ICAtIEZpeCBpc3N1ZXMgcmVwb3J0ZWQgYnkgZHRfYmluZGluZ19jaGVjay4K
PiAgLSBGaXggaXNzdWVzIHJlcG9ydGVkIGJ5IGR0YnNfY2hlY2suCj4gCj4gWGlhbmdzaGVuZyBI
b3UgKDEwKToKPiAgIHNwaTogbXRrLXNuZmk6IENoYW5nZSBkZWZhdWx0IHBhZ2UgZm9ybWF0IHRv
IHNldHVwIGRlZmF1bHQgc2V0dGluZwo+ICAgc3BpOiBtdGstc25maTogQWRkIG9wdGlvbmFsIG5m
aV9oY2xrIHdoaWNoIGlzIG5lZWRlZCBmb3IgTVQ3OTg2Cj4gICBtdGQ6IG5hbmQ6IGVjYy1tdGs6
IEFkZCBFQ0Mgc3VwcG9ydCBmb3QgTVQ3OTg2IElDCj4gICBkdC1iaW5kaW5nczogc3BpOiBtdGst
c25maTogQWRkIGNvbXBhdGlibGUgZm9yIE1UNzk4Ngo+ICAgc3BpOiBtdGstc25maTogQWRkIHNu
Zmkgc2FtcGxlIGRlbGF5IGFuZCByZWFkIGxhdGVuY3kgYWRqdXN0bWVudAo+ICAgZHQtYmluZGlu
Z3M6IHNwaTogbXRrLXNuZmk6IEFkZCByZWFkIGxhdGNoIGxhdGVuY3kgcHJvcGVydHkKPiAgIGR0
LWJpbmRpbmdzOiBtdGQ6IFNwbGl0IEVDQyBlbmdpbmUgd2l0aCByYXduYW5kIGNvbnRyb2xsZXIK
PiAgIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBGaXggZXhpc3RpbmcgTkFORCBjb250cm9sbGVyIG5v
ZGUgbmFtZQo+ICAgYXJtOiBkdHM6IG1lZGlhdGVrOiBGaXggZXhpc3RpbmcgTkFORCBjb250cm9s
bGVyIG5vZGUgbmFtZQo+ICAgZHQtYmluZGluZ3M6IG10ZDogbWVkaWF0ZWssbmFuZC1lY2MtZW5n
aW5lOiBBZGQgY29tcGF0aWJsZSBmb3IgTVQ3OTg2Cj4gCj4gIC4uLi9iaW5kaW5ncy9tdGQvbWVk
aWF0ZWssbXRrLW5mYy55YW1sICAgICAgICB8IDE1NSArKysrKysrKysrKysrKysKPiAgLi4uL210
ZC9tZWRpYXRlayxuYW5kLWVjYy1lbmdpbmUueWFtbCAgICAgICAgIHwgIDYzICsrKysrKysKPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ay1uYW5kLnR4dCAgICAgIHwgMTc2IC0tLS0t
LS0tLS0tLS0tLS0tLQo+ICAuLi4vYmluZGluZ3Mvc3BpL21lZGlhdGVrLHNwaS1tdGstc25maS55
YW1sICAgfCAgNTQgKysrKystCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpICAgICAg
ICAgICAgICAgICB8ICAgMiArLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Mjcx
MmUuZHRzaSAgICAgfCAgIDIgKy0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2
MjIuZHRzaSAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvbXRkL25hbmQvZWNjLW10ay5jICAgICAg
ICAgICAgICAgICAgICB8ICAyOCArKy0KPiAgZHJpdmVycy9zcGkvc3BpLW10ay1zbmZpLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDQxICsrKy0KPiAgOSBmaWxlcyBjaGFuZ2VkLCAzMzAgaW5zZXJ0
aW9ucygrKSwgMTkzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tZWRpYXRlayxtdGstbmZjLnlhbWwKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbWVk
aWF0ZWssbmFuZC1lY2MtZW5naW5lLnlhbWwKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRrLW5hbmQudHh0Cj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
