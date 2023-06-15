Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2D3EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 14:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fz1pX0yg/NvNGq8QSIdLhP2R30whSfmJqDiTrUJc8FI=; b=2FJUpRmQOTHEst
	JVtYZ9TnOBTa4dD4U33RL0TYdR4ec1XkyF2Qldo5KNvxsVHeYTGrNAmOJG+rEatbhOIeL7wLJzUum
	EecfQz/ZrFjvszAcreOJnhW8hyzIwSC7sdFLudjHoQoxq4apaxAZbq/JzwSDfEiqftVO0AMNkAqMq
	m+YiGnhX7IATQvPttsEhVR8ubXbohSRlQ4orvv6P6SSXaWFSVuqj0r/aR4hV8enAgvirq0z11ZiGy
	7CjX4YkrytcKKdcSjRhPWGjCVdGs+wnpGb+tpZYC2vNaN3g0Lh+xpi0ML/iwnPCYUxnLjzOSHGIId
	jZNKH1YHyAJiVSPSoQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9oBQ-00FBZ3-1l;
	Thu, 15 Jun 2023 14:42:44 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9oBL-00FBXo-30
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 14:42:41 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686840155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0K8cXZkK+l8uDUs0DhDuBAI7qdSdHAj71GuwPplKllw=;
	b=SIe55KkL2sWApd9Kwvy9AeiqaoHVMaaEZcll/41FnvbxxBxOdH6RVvgnVaHpXB/0VucUoH
	eNN08KX7sgqQCi608l9D5qgHPQyz2bhle2YHXuh/WCvxQ87+y6Qw7R0Cst0CgewxAi24Tc
	8UAHxby1F3LxzRqpc5/8KVBnUrfZQ7uy7rVOOe7QuV7RQvBQ0SPMwjt6Mm8ZPd66x80gAX
	a92VuGhX+AzXuGGlrch05zXXfkV7mm8Kc9bNm/FaTLLZPjpzuGgSf/gUjFzcqbzn1fIS/1
	yK8w0qYfhwrPigEaY1vUu+lILHto3MKTzzYM4x2CT+htBFzzcr99EKtwZD4ugQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B246C0009;
	Thu, 15 Jun 2023 14:42:34 +0000 (UTC)
Date: Thu, 15 Jun 2023 16:42:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: Document sst26vf0xxb
 flash series
Message-ID: <20230615164233.51a87cbd@xps-13>
In-Reply-To: <d816499e-baab-6200-0780-17a8205b252e@linaro.org>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
	<20230609144324.850617-2-miquel.raynal@bootlin.com>
	<d816499e-baab-6200-0780-17a8205b252e@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_074240_140666_3600270D 
X-CRM114-Status: GOOD (  17.35  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAxMiBKdW4g
MjAyMyAxMTowMDowMyArMDEwMDoKCj4gT24gNi85LzIzIDE1OjQzLCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+ID4gQWRkIGNvbXBhdGlibGVzIGZvciB0aGUgc3N0MjZ2ZjB7NDAsODAsMTYsMzIsNjR9
YiBmbGFzaCBkZXZpY2VzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwgfCAyICstCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3Iu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5v
ci55YW1sCj4gPiBpbmRleCA3MTQ5Nzg0YTM2YWMuLjVhNzg4YTQyOWIwZCAxMDA2NDQKPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55
YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVj
LHNwaS1ub3IueWFtbAo+ID4gQEAgLTI1LDcgKzI1LDcgQEAgcHJvcGVydGllczoKPiA+ICAgICAg
ICAgICAgICAgIChteGljeXxtYWNyb25peCksbXgyNWwoNDAwNWF8MTYwNmV8NjQwNWR8ODAwNXwx
MjgwNWR8MjU2MzVlKXxcCj4gPiAgICAgICAgICAgICAgICAobXhpY3l8bWFjcm9uaXgpLG14MjV1
KDQwMzN8NDAzNSl8XAo+ID4gICAgICAgICAgICAgICAgKHNwYW5zaW9uLCk/czI1ZmwoMTI4c3wy
NTZzMXw1MTJzfDAwOGt8MDY0a3wxNjRrKXxcCj4gPiAtICAgICAgICAgICAgICAoc3N0fG1pY3Jv
Y2hpcCksc3N0MjV2ZigwMTZifDAzMmJ8MDQwYil8XAo+ID4gKyAgICAgICAgICAgICAgKHNzdHxt
aWNyb2NoaXApLHNzdCgyNXwyNil2ZigwMDh8MDE2fDAzMnwwNDB8MDY0KWJ8XCAgCj4gCj4gV2Ug
ZG9uJ3QgYWRkIG5ldyBjb21wYXRpYmxlcyB0byB0aGlzIGxpc3QsIG9uZSBzaG91bGQgaW5zdGVh
ZCB1c2UgdGhlCj4gZ2VuZXJpYyBqZWRlYyxzcGktbm9yIGNvbXBhdGlibGUuIFBsZWFzZSBkcm9w
IHRoaXMgcGF0Y2guCgpTdXJlLiBJJ2xsIHByb3Bvc2UgYSBwYXRjaCB0byBjbGFyaWZ5IHRoaXMg
cG9pbnQgaW4gdGhlIGJpbmRpbmdzIHRvCmhlbHAgZnV0dXJlLW15c2VsZi4KCj4gCj4gPiAgICAg
ICAgICAgICAgICAoc3N0LCk/c3N0MjZ3ZjAxNmJ8XAo+ID4gICAgICAgICAgICAgICAgKHNzdCwp
P3NzdDI1d2YoMDQwYnwwODApfFwKPiA+ICAgICAgICAgICAgICAgIHdpbmJvbmQsdzI1eCg4MHwz
Mil8XCAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
