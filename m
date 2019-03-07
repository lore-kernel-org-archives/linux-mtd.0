Return-Path: <SRS0=IIRZ=RK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AE5C43381
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 17:50:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8739E20854
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 17:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sf9QhuIu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8739E20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZ7z7zMhXbbKrF+KE2+60dr5aAmmrYkzMlS1QOYp4Yw=; b=sf9QhuIutuR2JG
	gRAf0/dkLr1NYuHakGCiDkJVo5P6KPZQAeaZZ2g8tvzxTasX3fTEXhMJGkwyZ/SknfG1i7wshZJDO
	idrOjUHAyKNb4FjCYOQ573qG8t07Um8AfKQCZ0oKVLjaqiSUDUmUhVjZyEs43Mc5BJF5aBiHrJ6K0
	KWXcqDYeGHXDgEQMwqb/0USta6g1+oFgavg+vmS+hVlkt7rLhZij04kgOwacDZIpoce1+aysNHaUL
	Ju92nV/KumGqZ72uMv2Ou2vgxL8kydOvYZzqvp1lYv8PE+aGd+Yjk//jG4P2gJzLqDGGmr3Mmi0lB
	+xV6tGvzveN2ALqTN5nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1xA8-0007pU-Bo; Thu, 07 Mar 2019 17:50:32 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1xA2-0007lz-Jq
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2019 17:50:29 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 5.5.0) with ESMTP id SG003737506.MSG 
 for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2019 18:50:20 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Thu, 7
 Mar 2019 18:50:19 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1261.035; Thu, 7 Mar 2019 18:50:19 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>,
 "Marek Vasut" <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 "Mark Brown" <broonie@kernel.org>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/1] mtd: devices: add ACPI support for non-jedec m25p80
Thread-Topic: [PATCH v1 1/1] mtd: devices: add ACPI support for non-jedec
 m25p80
Thread-Index: AQHUzcDE1VYBnO3WjEyxl+TYsxmME6YAbWEAgAAScRA=
Date: Thu, 7 Mar 2019 17:50:19 +0000
Message-ID: <f03c76b1d0cb49848371915f53f9784d@asem.it>
References: <1551178088-6615-1-git-send-email-f.suligoi@asem.it>
 <1551178088-6615-2-git-send-email-f.suligoi@asem.it>
 <a655aeea9c499623a458f79fba396ed8d088f2e1.camel@infradead.org>
In-Reply-To: <a655aeea9c499623a458f79fba396ed8d088f2e1.camel@infradead.org>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.161]
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B020E.5C8159DB.0064, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_095027_892442_CADEE607 
X-CRM114-Status: GOOD (  19.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZpZCBXb29kaG91c2UgPGR3
bXcyQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IGdpb3ZlZMOsIDcgbWFyem8gMjAxOSAxODo0MA0K
PiBUbzogRmxhdmlvIFN1bGlnb2kgPGYuc3VsaWdvaUBhc2VtLml0PjsgQnJpYW4gTm9ycmlzDQo+
IDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+OyBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxs
b25Aa2VybmVsLm9yZz47DQo+IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5jb20+OyBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PjsNCj4gTWFyayBCcm93biA8YnJvb25p
ZUBrZXJuZWwub3JnPjsgRnJpZWRlciBTY2hyZW1wZg0KPiA8ZnJpZWRlci5zY2hyZW1wZkBleGNl
ZXQuZGU+OyBZb2dlc2ggR2F1ciA8eW9nZXNobmFyYXlhbi5nYXVyQG54cC5jb20+Ow0KPiBsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDEvMV0gbXRkOiBkZXZpY2VzOiBhZGQgQUNQSSBzdXBw
b3J0IGZvciBub24tamVkZWMNCj4gbTI1cDgwDQo+IA0KPiBPbiBUdWUsIDIwMTktMDItMjYgYXQg
MTE6NDggKzAxMDAsIEZsYXZpbyBTdWxpZ29pIHdyb3RlOg0KPiA+IEZvciB0aGUgeDg2IG1hY2hp
bmVzIGEgbTI1cDgwLWNvbXBhdGlibGUgZGV2aWNlIGhhdmUgdG8gYmUgZGVjbGFyZWQNCj4gdXNp
bmcNCj4gPiBhbiBBQ1BJIHRhYmxlICh3aGljaCBjYW4gYmUgZGlyZWN0bHkgYSBwYXJ0IG9mIHRo
ZSBCSU9TIEFDUEkgdGFibGVzKS4NCj4gPg0KPiA+IEluIHRoaXMgY2FzZSBpdCBpcyBuZWNlc3Nh
cnkgdG8gYWRkIHRoZSBkZXZpY2UgaW4gdGhlICJvZl9kZXZpY2VfaWQiDQo+IHN0cnVjdHVyZQ0K
PiA+IGxpc3QsIHRvIHBlcm1pdCB0aGUgZGV2aWNlIG5hbWUgbWF0Y2hpbmcgYnkgdGhlIEFDUEkg
a2VybmVsIGZ1bmN0aW9ucy4NCj4gPg0KPiA+IFRoaXMgaXMgYW4gZXhhbXBsZSBvZiBhIFNTRFQg
dGFibGUgZm9yIHRoZSBFdmVyc3BpbiBtcjI1aDQwOg0KPiA+DQo+ID4gRGVmaW5pdGlvbkJsb2Nr
ICgibXIyNWg0MC5hbWwiLCAiU1NEVCIsIDUsICJBU0VNc3AiLCAiTVIyNUg0MCIsIDEpDQo+ID4g
ew0KPiA+IAlFeHRlcm5hbCAoX1NCLlNQSTEsIERldmljZU9iaikNCj4gPg0KPiA+IAlTY29wZSAo
XF9TQi5TUEkxKQ0KPiA+IAl7DQo+ID4gCQlEZXZpY2UgKE5WUjApDQo+ID4gCQl7DQo+ID4gCQkJ
TmFtZSAoX0hJRCwgIlBSUDAwMDEiKQ0KPiA+IAkJCU5hbWUgKF9ERE4sICJFdmVyc3BpbiBNUjI1
SDQwIE1SQU0iKQ0KPiA+IAkJCU5hbWUgKF9DUlMsIFJlc291cmNlVGVtcGxhdGUgKCkgew0KPiA+
IAkJCQlTcGlTZXJpYWxCdXMgKA0KPiA+IAkJCQkxLCAgICAgICAgICAgICAgICAgICAgICAvLyBD
aGlwIHNlbGVjdA0KPiA+IAkJCQlQb2xhcml0eUxvdywgICAgICAgICAgICAvLyBDaGlwIHNlbGVj
dCBpcyBhY3RpdmUNCj4gbG93DQo+ID4gCQkJCUZvdXJXaXJlTW9kZSwgICAgICAgICAgIC8vIEZ1
bGwgZHVwbGV4DQo+ID4gCQkJCTgsICAgICAgICAgICAgICAgICAgICAgIC8vIEJpdHMgcGVyIHdv
cmQgaXMgOA0KPiAoYnl0ZSkNCj4gPiAJCQkJQ29udHJvbGxlckluaXRpYXRlZCwgICAgLy8gRG9u
J3QgY2FyZQ0KPiA+IAkJCQkxMDAwMDAwMCwgICAgICAgICAgICAgICAvLyAxMCBNSHoNCj4gPiAJ
CQkJQ2xvY2tQb2xhcml0eUxvdywgICAgICAgLy8gU1BJIG1vZGUgMA0KPiBDbG9ja1BvbGFyaXR5
TG93DQo+ID4gCQkJCUNsb2NrUGhhc2VGaXJzdCwgICAgICAgIC8vIFNQSSBtb2RlIDANCj4gQ2xv
Y2tQaGFzZUZpcnN0DQo+ID4gCQkJCSJcXF9TQi5TUEkxIiwgICAgICAJLy8gU1BJIGhvc3QgY29u
dHJvbGxlcg0KPiA+IAkJCQkwLAkJCS8vIE11c3QgYmUgMA0KPiA+IAkJCQlSZXNvdXJjZUNvbnN1
bWVyLA0KPiA+IAkJCQksDQo+ID4gCQkJCSkNCj4gPiAJCQl9KQ0KPiA+DQo+ID4gCQkJTmFtZSAo
X0RTRCwgUGFja2FnZSAoKSB7DQo+ID4gCQkJCVRvVVVJRCgiZGFmZmQ4MTQtNmViYS00ZDhjLThh
OTEtYmM5YmJmNGFhMzAxIiksDQo+ID4gCQkJCVBhY2thZ2UgKCkgew0KPiA+IAkJCQkJUGFja2Fn
ZSAoKSB7ImNvbXBhdGlibGUiLCAibXIyNWg0MCJ9LA0KPiA+IAkJCQl9DQo+ID4gCQkJfSkNCj4g
PiAJCX0NCj4gPiAJfQ0KPiA+IH0NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZsYXZpbyBTdWxp
Z29pIDxmLnN1bGlnb2lAYXNlbS5pdD4NCj4gDQo+IFdoeSB1c2UgdGhlIHNwZWNpZmljIGNoaXAg
bmFtZSBpbiB0aGUgImNvbXBhdGlibGUiIHByb3BlcnR5PyBXaHkgaXNuJ3QNCj4gaXQgdXNpbmcg
ImplZGVjLHNwaS1ub3IiPw0KPiANCj4gRG9lcyB0aGlzIHN0aWxsIGFjdHVhbGx5IGdldCBwYXNz
ZWQgdGhyb3VnaCB0byBzcGlfbm9yX3NjYW4oKS4uLiBhbmQgaXMNCj4gaXQgKm5lY2Vzc2FyeSo/
IENhbid0IHRoZSBjaGlwcyBiZSBwcm9iZWQ/DQo+IA0KDQpIaSBEYXZpZCwNCg0KZXhhY3RseSwg
dGhlIG1yMjVoNDAgaXMgbm90IEplZGVjIGNvbXBhdGlibGUsIHNvIGl0IGNhbid0IGJlIHByb2Jl
ZCwgDQpzbyBpdCBpcyBuZWNlc3NhcnkgdG8gaWRlbnRpZnkgaXQgZXhwbGljaXRseS4NCg0KRmxh
dmlvDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
