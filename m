Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692C4C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZN+87Qr5e8vxcn3cXWaZnoYKb82uVHdzck2Csb0gYo=; b=kTIkA4Ze6rD0Ln
	VEKxj6C2HOJWf4bN73PU1i3obqIBR419DYmLWQxMgYV3euEIiK6lJkk30QFzCact1CvwVCQCRE+3G
	zt3qvYnBUr9AAJwIbBYbbkjnC5QpVO0pKoxpq3KJOlFwYh7xI0HdhpKFDbwOMus1LlEwgYe0fMZXj
	xHcjszLFvpMBsuys4QouO0c7ZxRWS1kdQNjWEMKUmJwwUeSlH09Iwzjgu1DCtN+s3idiBOiVBq3lE
	eUf1IAkkcoKsFsngE9/5IMGI2hG5vuMlOspCyNLG8eBJXbLfE/n9LA/dmvChtGmY6jB0zrVwRQf2k
	CUhdgqHBgJElyjaJaQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqzb-00GQFI-0F;
	Wed, 20 Dec 2023 07:27:47 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqzX-00GQBb-2A;
	Wed, 20 Dec 2023 07:27:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D75A2FF803;
	Wed, 20 Dec 2023 07:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703057258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbbso/rgR9y8n9297RvIV+sw+BGrsloKuu4p5wYQO8U=;
	b=hB0lZsR61TYKM10x74jyfOy+y5SCHQcGukvQOGQPgiuahRFZGd1suchlA+vbYiQ+Q2FpDt
	VpSB961mr4K9f0Igroc2u1n5r46fVBNrUAhFHr0KgS1AV0noZwCdHBeFPTUA9pDlo3/LY4
	Via/zwOJ3hxigJjAVaaS239v9SwiXEvOzQgqLe/umC4kZSEQn89hNUS5YoInC6b70QP2LT
	wXwHjzXMfpi7BVMS+W/ur2yTzJHEc5ysWFWn2vpgVeL7fb31ByuVwTFE7Pal8RHMcAM0Tj
	ctMslWbq5RoUnjar0AHqsMIALmMgH7rducCnhhjh7veXU2i2oHM9ngqko8rMQg==
Date: Wed, 20 Dec 2023 08:27:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 5/5] nvmem: layouts: add U-Boot env layout
Message-ID: <20231220082736.246e947c@xps-13>
In-Reply-To: <20231219174025.15228-5-zajec5@gmail.com>
References: <20231219174025.15228-1-zajec5@gmail.com>
	<20231219174025.15228-5-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_232743_838793_68F03BCC 
X-CRM114-Status: GOOD (  12.08  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDE5IERlYyAyMDIzIDE4
OjQwOjI1ICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gVGhpcyBwYXRjaCBtb3ZlcyBhbGwgZ2VuZXJpYyAoTlZNRU0gZGV2aWNlcyBpbmRlcGVu
ZGVudCkgY29kZSBmcm9tIE5WTUVNCgpOaXQ6IEluIGdlbmVyYWwgd2UgYXZvaWQgc3RhcnRpbmcg
d2l0aCAiVGhpcyBwYXRjaCBkb2VzLi4uIiBhbmQgaW5zdGVhZAp1c2UgdGhlIGltcGVyYXRpdmUg
Zm9ybSwgbGlrZTogIk1vdmUgYWxsIGdlbmVyaWMgY29kZS4uLiIKCj4gZGV2aWNlIGRyaXZlciB0
byBOVk1FTSBsYXlvdXQgZHJpdmVyLiBUaGVuIGl0IGFkZHMgYSBzaW1wbGUgTlZNRU0gbGF5b3V0
CgoJCQkJCVRoZW4gYWRkLi4uCgo+IGNvZGUgb24gdG9wIG9mIGl0Lgo+IAo+IFRoYW5rcyB0byBw
cm9wZXIgbGF5b3V0IGl0J3MgcG9zc2libGUgdG8gc3VwcG9ydCBVLUJvb3QgZW52IGRhdGEgc3Rv
cmVkCj4gb24gYW55IGtpbmQgb2YgTlZNRU0gZGV2aWNlLgo+IAo+IEZvciBiYWNrd2FyZCBjb21w
YXRpYmlsaXR5IHdpdGggb2xkIERUIGJpbmRpbmdzIHdlIG5lZWQgdG8ga2VlcCBvbGQKPiBOVk1F
TSBkZXZpY2UgZHJpdmVyIGZ1bmN0aW9uYWwuIFRvIGF2b2lkIGNvZGUgZHVwbGljYXRpb24gYSBw
YXJzaW5nCj4gZnVuY3Rpb24gaXMgZXhwb3J0ZWQgYW5kIHJldXNlZCBpbiBpdC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gLS0tCj4gVjI6
IFN1cHBvcnQgbmV3IGNvbXBhdGlibGVzICYgdXNlIGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpIGhl
bHBlcgo+IAo+IElNUE9SVEFOVDoKPiBUaGlzIGlzIGJhc2VkIG9uIHRvcCBvZiB0aGU6Cj4gW1BB
VENIIHY2LjggMS8yXSBudm1lbTogbGF5b3V0czogcmVmYWN0b3IgLmFkZF9jZWxscygpIGNhbGxi
YWNrIGFyZ3VtZW50cwoKVGhhbmtzIGZvciB0aGUgbW92ZS4gTG9va3MgZ29vZCB0byBtZToKClJl
dmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
