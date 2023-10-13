Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB2FCDB47E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Oct 2023 08:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3AVsnmnpng6lBoLuPCTNI9jiCUB4dmAope8VAk2iRw=; b=FkQ5Jm+h7/mx1K
	M1ugw5HSuJgzUvn0R3PowNqv/8hCWq3viGnElAqz++NMgJjZO+7HTERRlX2XzhkPREPBp/57znpQ7
	d1H5CyeCqA6DIr9Gw4eap5uNAKJF5aOMhU95H3gDE8QK6Qrk2sCBgOfdQ6UDVA9Awm+o6ikiToOZE
	v/rAyfqpdJ7Dp5DVg3tAWDRmjP2LBgDLKJ1I3iXQzMrhzGaqkQVhe5SVsoHyaceOu8SzwekibpMAT
	ufsTypVV+UMiDgpm1LP6tzbGo3En/NaTgbAVZMQ1SW1k6oY4p5BnO47rG1XuZuKE9DbPUioVl2c5F
	YmhKMDczWWDGwBRVkf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrDqK-002rcd-2r;
	Fri, 13 Oct 2023 08:48:24 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrDqF-002rZA-2Q
	for linux-mtd@lists.infradead.org;
	Fri, 13 Oct 2023 08:48:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1A4160005;
	Fri, 13 Oct 2023 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697186894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvjTFtri6PgtKRCep/sqrGHOlkyA5KLY/eJnDh1etpo=;
	b=MKJUXBCaGS8H5+dJopPeaW9Ze2Q6SPsMi1ZsJm5aPQFEebhrZ5FVYu4HWtOG+zPFAzl2SA
	b/nqtAZxb0gfOhGgnNaGxQ58SyfSLBbYcSLngdUbTBg7PXln1QTHh1iiCS/wsnDpmQvJiu
	PjvWeyVTNsf2EsWSWOmQFESxxPNGMSePjL7BDQXx8UHnLXycmua67+ctFm2L/HgYoKQD4j
	c19FaLmZGsg79OvuxT/kan2Fw+O5Qlzf/rTITwnl/nwYxoTWOdJjcjBRoEm9AkOQ7wkEK7
	N5uo7SAjrEwv+CwfM59KYPcBfZjJ/GXmDx/Uued9L/HmDbm72dyj/XmQ2uOgKg==
Date: Fri, 13 Oct 2023 10:48:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@mail.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add destructive operation
Message-ID: <20231013104809.15821b9f@xps-13>
In-Reply-To: <trinity-902f8ae6-26e3-484b-ba2d-00946a63333a-1697132171458@3c-app-mailcom-lxa13>
References: <trinity-d4b16b4a-e223-4daf-8a3e-4aaa7fc6c9cb-1697071235519@3c-app-mailcom-lxa05>
	<20231012090638.1e093fe6@xps-13>
	<trinity-902f8ae6-26e3-484b-ba2d-00946a63333a-1697132171458@3c-app-mailcom-lxa13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_014820_105301_E823BE11 
X-CRM114-Status: GOOD (  23.06  )
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

SGVsbG8sCgpkcmVnYW5AbWFpbC5jb20gd3JvdGUgb24gVGh1LCAxMiBPY3QgMjAyMyAxOTozNjox
MSArMDIwMDoKCj4gSGkgTWlxdWVsLAo+IAo+ID4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTIs
IDIwMjMgYXQgMTI6MDYgQU0KPiA+IEZyb206ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KPiA+IFRvOiBkcmVnYW5AbWFpbC5jb20KPiA+IENjOiBiY20ta2VybmVs
LWZlZWRiYWNrLWxpc3RAYnJvYWRjb20uY29tLCBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9y
ZywgZi5mYWluZWxsaUBnbWFpbC5jb20sIHJhZmFsQG1pbGVja2kucGwsIGpvZWwucGVzaGtpbkBi
cm9hZGNvbS5jb20sIGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbSwgZGFuLmJleWdlbG1hbkBi
cm9hZGNvbS5jb20sIHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tLCBmcmllZGVyLnNjaHJlbXBm
QGtvbnRyb24uZGUsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIHZpZ25lc2hyQHRpLmNv
bSwgcmljaGFyZEBub2QuYXQsIGJicmV6aWxsb25Aa2VybmVsLm9yZywga2Rhc3Uua2RldkBnbWFp
bC5jb20sICJKYWltZUxpYW8iIDxqYWltZWxpYW8udHdAZ21haWwuY29tPiwgIkFyc2VuaXkgS3Jh
c25vdiIgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4sICJBZGFtIEJvcm93c2tpIiA8a2lsb2J5
dGVAYW5nYmFuZC5wbD4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS80XSBtdGQ6IHJhd25h
bmQ6IEFkZCBkZXN0cnVjdGl2ZSBvcGVyYXRpb24KPiA+Cj4gPiBIZWxsbywKPiA+IAo+ID4gZHJl
Z2FuQG1haWwuY29tIHdyb3RlIG9uIFRodSwgMTIgT2N0IDIwMjMgMDI6NDA6MzUgKzAyMDA6Cj4g
PiAKPiA+IFRoZSBhdXRob3Igc2hvdWxkIGJlIEJvcmlzIGFzIHdlbGwgKGdpdCBjb21taXQgLS1h
bWVuZCAtLWF1dGhvcj0uLi4pICAKPiAKPiBJIHdpbGwgYXR0ZW1wdCB0byBjaGFuZ2UgdGhlIGF1
dGhvciBidXQgZ2l0IHNlZW1zIHRvIGJlCj4gc29tZXdoYXQgbGltaXRlZCBpbiB3aGF0IEkgY2Fu
IGFjY29tcGxpc2ggd2hlbiBpdCBjb21lcyB0bwo+IGNoYW5naW5nIGVtYWlscywgc2VuZGluZyBp
biB0aGUgbmFtZSBvZiBzb21lb25lIGVsc2UgZXRjLgo+IAo+ID4gICAKPiA+ID4gRXJhc2UgYW5k
IHByb2dyYW0gb3BlcmF0aW9ucyBuZWVkIHRoZSB3cml0ZSBwcm90ZWN0ICh3cCkgcGluIHRvIGJl
Cj4gPiA+IGRlLWFzc2VydGVkIHRvIHRha2UgZWZmZWN0LiBBZGQgdGhlIGNvbmNlcHQgb2YgZGVz
dHJ1Y3RpdmUKPiA+ID4gb3BlcmF0aW9uIGFuZCBwYXNzIHRoZSBpbmZvcm1hdGlvbiB0byBleGVj
X29wKCkgc28gY29udHJvbGxlcnMga25vdwo+ID4gPiB3aGVuIHRoZXkgc2hvdWxkIGRlLWFzc2Vy
dCB0aGlzIHBpbiB3aXRob3V0IGhhdmluZyB0byBkZWNvZGUKPiA+ID4gdGhlIGNvbW1hbmQgb3Bj
b2RlLgo+ID4gPiAKPiA+ID4gQ3JlYXRlZCBieSBCb3JpcyBCcmV6aWxsb24uICAKPiA+IAo+ID4g
VGhpcyBjYW4gZ28gYXdheS4gIAo+IAo+IFdpbGwgcmVtb3ZlLgo+IAo+ID4gICAKPiA+ID4gCj4g
PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9iYnJlemlsbG9uL2xpbnV4L2NvbW1pdC9lNjEyZTFmMmM2
OWEzM2FjNWYyYzkxZDEzNjY5ZjBmMTcyZDU4NzE3ICAKPiA+IAo+ID4gVGhpcyBhcyB3ZWxsLiAg
Cj4gCj4gV2lsbCBhbHNvIHJlbW92ZS4KPiAKPiA+ICAgCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ICAKPiA+IAo+ID4g
UGxlYXNlIHVzZSBCb3Jpcycga2VybmVsLm9yZyBlLW1haWwgZm9yIHRoZSBhdXRob3JzaGlwIGFu
ZCBTb0IgIAo+IAo+IEkgZG9uJ3Qga25vdyB3aGF0IEJvcmlzJyBrZXJuZWwub3JnIGVtYWlsIGFk
ZHJlc3M/Cj4gSXMgaXQgQGJvb3RsaW4/IENvbGxhYm9yYSBzdGlsbCBzaG93cyB1cCBhcyBlbWFp
bCB3aGVuCj4gSSBkbyB0aGUgbGlzdCBvZiBtYWludGFpbmVycy4gSSBkaWQgc29tZSBzZWFyY2hp
bmcKPiBidXQgY291bGRuJ3QgcmVhbGx5IGZpbmQgYW55dGhpbmcgY29uY2x1c2l2ZS4KCkl0J3Mg
aW4gLm1haWxtYXA6IGJicmV6aWxsb25Aa2VybmVsLm9yZwoKPiA+ID4gU2lnbmVkLW9mZi1ieTog
RGF2aWQgUmVnYW4gPGRyZWdhbkBtYWlsLmNvbT4gIAo+IAo+IERvIEkgc3RpbGwga2VlcCB0aGlz
IFNPQiBvciBzaG91bGQgSSBjaGFuZ2UgaXQgdG8gc29tZXRoaW5nIGVsc2U/CgpZb3UgbmVlZCBi
b3RoIFNvQjogaGlzIHRoZW4geW91cnMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
