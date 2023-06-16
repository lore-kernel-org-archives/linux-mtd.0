Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6682DEB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+bJoYWLtyVx26Ucir4+3yABr3ujqmC086UiFzc+UJU=; b=lLa/P3FfV0ltN1
	Tss3utdbbqYsg4GMsZcIxTJpjV7yXJSdnpEULqRnSZJYWVKC4M+n5LtwcWp+ohYOZN0phn/5HHGmN
	HGojI9nrWoKe1wj9J4e4CiKfPZ+gJixAzZP/Tq96F2nAsEoX2lRnX3imqorRbWXZ7e37B1BNJ1+Ng
	6rpo6VS/CHxU4/SKgGXkOKp6TkKEa7DlFvtGhcD31Dq7k8E5CQ3XKjs6kdHRUI70470fuArF1JaUb
	dsbrsJQ0Q1nWDKxjhsYN9y1lVFrrNQVEpn8HVRiViED/+uwaibtE7KBLWhZMc0tGpVAGeX+Y4bjiE
	WbZ1IyTPFpVeS/rlPVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4kt-00HGK3-3C;
	Fri, 16 Jun 2023 08:24:27 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4kp-00HGIO-2U;
	Fri, 16 Jun 2023 08:24:25 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686903857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6aerGn4H3P3eMP8YIL2/40nqn0c221OfKnuzH6sZ5I=;
	b=AI1+Jxssbgi1lNlikHwHuTVkWIvDNTTTOnmK1Cx0gAo9lZ53N3vz0BDBcqMPoF4wXqYsLv
	ib16iY72MEfN05opc8QJ4TDswItD5JR3yGDNaLwCnJjriMevlPwvqYZPM0a4LjW6dyAl60
	3k5u4v07elNXSrS0RvnlSh/xrD9twtqz913jx5dtaQkgck2TNXcic91zvlXTFnWL199DMz
	45IsNlwrMlFt/lKWXpPLZVICFHGCboW4hm3GkRHDULMRT/6yVFDx+hEaLHfm9Cpifs5Rmi
	79tdL5t5LRALcKKNvSJm5nN/pxrSCLsiM+VaV5U33zSPgZbrVMgWQYInPkDq6w==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 639161C0003;
	Fri, 16 Jun 2023 08:24:15 +0000 (UTC)
Date: Fri, 16 Jun 2023 10:24:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Vadym Kochan
 <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v9 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20230616102414.222dde21@xps-13>
In-Reply-To: <781c1db2-ecca-901a-4e11-7f7c68cf744d@linaro.org>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
	<20230615040447.3484564-4-chris.packham@alliedtelesis.co.nz>
	<f16e742f-e6f2-9761-e70d-e0e7cadcba4a@linaro.org>
	<1863cd53-9846-def2-ee5f-f4a51160ed8d@alliedtelesis.co.nz>
	<781c1db2-ecca-901a-4e11-7f7c68cf744d@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_012424_099266_1C45D147 
X-CRM114-Status: GOOD (  19.99  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIEZy
aSwgMTYgSnVuIDIwMjMgMTA6MTU6MzEgKzAyMDA6Cgo+IE9uIDE1LzA2LzIwMjMgMjM6MDYsIENo
cmlzIFBhY2toYW0gd3JvdGU6Cj4gPj4gIAo+ID4+PiArCj4gPj4+ICtwcm9wZXJ0aWVzOgo+ID4+
PiArICBjb21wYXRpYmxlOgo+ID4+PiArICAgIG9uZU9mOgo+ID4+PiArICAgICAgLSBpdGVtczoK
PiA+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBtYXJ2ZWxsLGFybWFkYS04ay1uYW5kLWNvbnRyb2xs
ZXIKPiA+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBtYXJ2ZWxsLGFybWFkYTM3MC1uYW5kLWNvbnRy
b2xsZXIKPiA+Pj4gKyAgICAgIC0gZW51bToKPiA+Pj4gKyAgICAgICAgICAtIG1hcnZlbGwsYXJt
YWRhLThrLW5hbmQtY29udHJvbGxlciAgCj4gPj4gVGhpcyBpcyB3cm9uZy4gOGsgY2Fubm90IGJl
IGJvdGg6IGNvbXBhdGlibGUgYW5kIG5vdCBjb21wYXRpYmxlIHdpdGgKPiA+PiAzNzAuIEl0J3Mg
bm90IHNvbWVvbmUncyBjYXQgdG8gYmUgaW4gYm90aCBzdGF0ZXMgYXQgdGhlIHNhbWUgdGltZS4u
LiAgCj4gPiAKPiA+IFRoZSBjb3JyZWN0IHN0YXRlIChJTUhPLCBNaXF1ZWwgY29ycmVjdCBtZSBp
ZiBJJ20gd3JvbmcpIGlzIGBjb21wYXRpYmxlIAo+ID4gPSAibWFydmVsbCxhcm1hZGEtOGstbmFu
ZC1jb250cm9sbGVyIjtgwqAgYXMgdGhlcmUgYXJlIHNvbWUgOEsgc3BlY2lmaWMgCj4gPiByZXF1
aXJlbWVudHMgdGhhdCBhcmVuJ3QgcHJlc2VudCBvbiB0aGUgMzcwIChzcGVjaWZpY2FsbHkgdGhl
IAo+ID4gc3lzdGVtLWNvbnRyb2xsZXIgYW5kIHRoZSAybmQgY2xvY2spLiAgIAo+IAo+IFByZXNl
bmNlIG9mIHNwZWNpZmljIHJlcXVpcmVtZW50cyBkb2VzIG5vdCBpbnZhbGlkYXRlIGNvbXBhdGli
aWxpdHkuIFR3bwo+IGRldmljZXMgYXJlIGNvbXBhdGlibGUgaWYgdGhlIDhrIGNhbiBiaW5kIGFu
ZCB3b3JrIHdpdGggMzcwIGNvbXBhdGlibGUKPiBzdHJpbmcsIGV2ZW4gaWYgdGhpcyBtZWFucyBz
b21lIGxvd2VyIHBlcmZvcm1hbmNlIG9yIGxlc3MgZmVhdHVyZXMgKGUuZy4KPiBzdWJzZXQgb2Yg
ZmVhdHVyZXMpLgoKUXVvdGluZyBteXNlbGYgZnJvbSAyMDE5IChjb21tZW50IGluIHRoZSBkcml2
ZXIpOgoiU29tZSBTb0NzIGxpa2UgQTdrL0E4ayBuZWVkIHRvIGVuYWJsZSBtYW51YWxseSB0aGUg
TkFORCBjb250cm9sbGVyLApnYXRlZCBjbG9ja3MgYW5kIHJlc2V0IGJpdHMgdG8gYXZvaWQgYmVp
bmcgYm9vdGxvYWRlciBkZXBlbmRlbnQuIgoKU28gY2FuIHRoZSA4ayBjb250cm9sbGVyIHdvcmsg
dXNpbmcgYSAzNzAgY29tcGF0aWJsZSA6IHllcywgaWYgdGhlCmJvb2xvYWRlciBlbmFibGVkIHRo
ZSBOQU5EIGNvbnRyb2xsZXIgYWxyZWFkeSwgbm8gb3RoZXJ3aXNlLiBCdXQgaW4KcHJhY3RpY2Ug
aXQgaXMgdGhlIHNhbWUgY29udHJvbGxlci4KCkdpdmVuIHRoaXMgaW5mb3JtYXRpb24gSSBkb24n
dCBrbm93IHdoZXRoZXIgaXQgbWFrZXMgc2Vuc2UgdG8gcXVhbGlmeQp0aGUgOGsgY29udHJvbGxl
ciBjb21wYXRpYmxlIHdpdGggdGhlIDM3MCBjb21wYXRpYmxlIG9yIG5vdC4KCj4gTm93IHdoZXRo
ZXIgdGhleSBhcmUgcmVhbGx5IGNvbXBhdGlibGUgb3Igbm90IC0gSSBkb24ndCBrbm93LiBJIGV4
cGVjdAo+IHRoZSBhbnN3ZXIgZnJvbSB5b3UgKGFzIHBsdXJhbCB5b3UpLgoKOi0pCgo+ID4gVGhl
IG9ubHkgcmVhc29uIGBjb21wYXRpYmxlID0gCj4gPiAibWFydmVsbCxhcm1hZGEtOGstbmFuZC1j
b250cm9sbGVyIiwgCj4gPiAibWFydmVsbCxhcm1hZGEzNzAtbmFuZC1jb250cm9sbGVyIjtgIGlz
IHN1cHBvcnRlZCBpcyBiZWNhdXNlIHRoYXQgaXMgCj4gPiB3aGF0IGlzIGluIHVzZSBpbiB0aGUg
ZXhpc3RpbmcgZHRzZXMuICAKPiAKPiBGaXggdGhlIERUUywgdXNlIGhlcmUgdGhlIGNvcnJlY3Qg
Y29tYmluYXRpb24gYW5kLCBpZiBpdCBpcyBhIGRldmlhdGlvbgo+IGZyb20gb2xkIGJpbmRpbmcs
IG1lbnRpb24gdGhpcyBpbiBjb21taXQgbXNnLgoKRmluZSBieSBtZS4KIAo+IEJlc3QgcmVnYXJk
cywKPiBLcnp5c3p0b2YKPiAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
