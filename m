Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD13C77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 16:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWfidmUmzmVujwJQVrsYIpus/LspYc3fbdFsoOatIdc=; b=vDRvZArKqxgkCt
	Xy8oSWs7//FMVXXwL6uAmVDHOu/zvMkN1wBO5+s8YWMFUU+BEZuTx0d5h3+Cg7KzitEP92CloAIjV
	nZY68/00MqhmtEe6JBW+7sXxaGGkNBiUXnwHyCMx0aws2D2LtAjaKYrsa52+nUJMDHfpxb8Dwoaci
	1QBTk+Jq/MOjumme5JeVGWoHYUTV+xt5VggwVJQIkQVtpRcP/mDhiuSfcYDFkOb8noZLyCEahygX2
	nFkRkhVVljPM4xD1kZCbjEZcWdBuWejs+C5ZE12Nd9FkqBfHtVeozi0lmjBbJe3ZNYE3SGxKn9MLU
	A26NJMNKFjDtsC95GBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ZTB-002PlC-2e;
	Tue, 06 Jun 2023 16:23:41 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ZT8-002Phv-2D
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 16:23:40 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686068613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmZpdXlMp5uDwoWVTcrxVkLUK6iiazTIo6P0BWoSqI4=;
	b=orBUTnTXiEgUwoeeJi0ZPXGNg69S03p5BoFJQ7yvl0Dn3n5DiYt9CyeZAU0DYH8+XtVzhH
	SC+1XHiudL4icq2bLqAz+gB93QQpRkZi70u6CiG7xtl8WZOX15XrCObo81I4NOJ7SXQjvj
	XzxMfYdDBR55hkrhfKcU5v3jMw3fq5YX6s4QzB0KyU+J5WVeVrthdr3yP5IICaHHIUkHSn
	X+BlPtuqG1btFFbR0PnLPfq3pL8wXpD6nLXCU6QdIvX5szC4XFM8PIVOysVJVmmGZD+doC
	D8SQYN6e87MMoAVjtuXj5o/fiYjzda5aLqIE0oiggSDkNiOLminK75WHu4EE8Q==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB2A2C000A;
	Tue,  6 Jun 2023 16:23:29 +0000 (UTC)
Date: Tue, 6 Jun 2023 18:23:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>, Manivannan Sadhasivam
 <mani@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Christian
 Marangi <ansuelsmth@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/3] Fix a couple of missing unevaluated properties
Message-ID: <20230606182328.2ac7f0da@xps-13>
In-Reply-To: <20230606103057.137711-1-miquel.raynal@bootlin.com>
References: <20230606103057.137711-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_092339_046927_E0F91CE9 
X-CRM114-Status: GOOD (  15.97  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFR1ZSwgIDYgSnVuIDIw
MjMgMTI6MzA6NTQgKzAyMDA6Cgo+IEFzIGRpc2N1c3NlZCB3aXRoIEtyenlzenRvZiBhbmQgQ2hy
aXMsIGl0IHNlZW1zIGxpa2UgZWFjaCBOQU5ECj4gY29udHJvbGxlciBiaW5kaW5nIHNob3VsZCBh
Y3R1YWxseSBleHBsaWNpdGVseSBsaXN0IGFsbCB0aGUgYWxsb3dlZAo+IHByb3BlcnRpZXMgaW4g
YSBzY2hlbWEgYW5kIHVzZSAidW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSIgaW4gYm90aAo+
IHRoZSBOQU5EIGNvbnRyb2xsZXIgYW5kIHRoZSBOQU5EIGNoaXAgc2VjdGlvbnMuIFdoaWxlIHRo
aXMgcmVzdHJpY3Rpb24KPiBhbHdheXMgYXBwbGllZCBvbiB0aGUgY29udHJvbGxlciBzaWRlLCB0
aGlzIHdhcyBub3QgZW5mb3JjZWQgb24gdGhlCj4gY2hpcHMgc2lkZSBBRkFJUi4KPiAKPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYTIzZGQ0ODUtYTNkOS1lMzFmLWJlM2UtMGFi
MjkzZmNmYzRhQGxpbmFyby5vcmcvCgpUaGUgZGlzY3Vzc2lvbiBwb2ludGVkIGFib3ZlIGhhcyBs
ZWFkIHRvIGFub3RoZXIgb2JzZXJ2YXRpb24gd2hpY2ggYWxzbwpuZWVkcyB0byBiZSBmaXhlZCBp
biB0aGlzIHNlcmllcy4gQSB2MiBpcyBjb21pbmcgc29vbi4KCj4gV2hpbGUgY29udmVydGluZyBN
YXJ2ZWxsIGNvbnRyb2xsZXIgYmluZGluZ3MsIENocmlzIGV4cGxpY2l0ZWx5IHBvaW50ZWQKPiBz
aW1pbGFyIGJpbmRpbmdzIHdoaWNoIHdvdWxkIGFsc28gdHJpZ2dlciBlcnJvcnMgd2hlbiB1c2lu
Zwo+ICJ1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlIiBiZWNhdXNlIG9mIHRoZSByZWcvcGFy
dGl0aW9ucy9ldGMKPiBwcm9wZXJ0aWVzIG5vdCBiZWluZyBkZXNjcmliZWQuIEhlcmUgaXMgYW4g
YXR0ZW1wdCBhdCBtYWtpbmcgdGhlc2UgbW9yZQo+IHByZWNpc2UgYW5kIHJvYnVzdC4KPiAKPiBU
aGVzZSBjaGFuZ2UgbWFkZSBtZSByZWFsaXplIHRoZSBxY29tLGJvb3QtcGFydGl0aW9uIHByb3Bl
cnR5Cj4gZGVzY3JpcHRpb24gd2FzIGJyb2tlbiwgc28gaGVyZSBpcyBhIGZpeCBmb3IgaXQuCj4g
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKPiBNaXF1ZWwgUmF5bmFsICgzKToKPiAgIGR0LWJpbmRp
bmdzOiBtdGQ6IHFjb206IEZpeCBhIHByb3BlcnR5IHBvc2l0aW9uCj4gICBkdC1iaW5kaW5nczog
bXRkOiBxY29tOiBQcmV2ZW50IE5BTkQgY2hpcCB1bmV2YWx1YXRlZCBwcm9wZXJ0aWVzCj4gICBk
dC1iaW5kaW5nczogbXRkOiBpbmdlbmljOiBQcmV2ZW50IE5BTkQgY2hpcCB1bmV2YWx1YXRlZCBw
cm9wZXJ0aWVzCj4gCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdlbmljLG5hbmQu
eWFtbCB8IDExICsrKysrCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRj
LnlhbWwgICB8IDQ3ICsrKysrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MiBp
bnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
