Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD41C3DA4A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2024 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Or5GQIrflwFon1oANrYbybDLbb+lIEYxZhLsAfsGDos=; b=UWO1B7xi90sagt
	W25cXs+BxVW5tpYcD/HpODVAMGAZM2rTaMaa6EHFFNGtftfoNg2/D6J1NoAB6yt6fS5plcDGmqXcZ
	5ZcQOO/gJ0KiM8T7B/BOoF8W4QDG5j3mnwGFwtHUCI5May3GvqUQ62+jcaCtgTcTYOBgN4ImdaBbo
	0ZuDiiAyFpUFi8uCXQCgSPmumvX9TYyRK/HLt1AJRxX6jUB3uENRo7q6MvL1tf7mT1Vnkulf/eiQ5
	TmkVaxfmIc4jvuOgbuWVzo0L9vKa1LzwCrhJakN84BM3LJhnwHeMo9LxUrDC+bNPRbEDAUoJS6Yvs
	62KulSxTNi+lsJaNNDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFHd-00000007M6T-0TMa;
	Wed, 14 Aug 2024 14:47:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFGy-00000007M1f-0PqA;
	Wed, 14 Aug 2024 14:46:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 620DA240005;
	Wed, 14 Aug 2024 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723646805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xDfSsuNrPtx6YX5pobWJTyhNVK0h9n02y4gpLyd5QZ0=;
	b=a/65HTTM/Z2uuPVwZKhtoPVKYKAssPIOGi1yJ87QWyxc0Yy9B/HO9r53TlM7SKb4aDZ+/Q
	W6rJ9e2mF+xR+Jl744Ovws0z1I5cdIq31Vv1pwpD9wLK7HEBFJIpuIWK6Vaq7l0IYBIqV7
	4b3HVhC09ke19XLLWgBT/5VwLBJ8J7Oset9eu1j5nL89W/N3sK6iHbvqDSK38O0Ezl39Bi
	OFCgH/+vOzdJFjrKLhZCp7ZfV0xiV4MPwJkRjCHxESDQtvz8wbMP5qBNdtgqN719/o5xpQ
	eg3SAKUv5Kfqp+R+i9NkVYRsaGc0wZCqzTMUSS2knl3fnKuXGO3BFN+Hl++fEQ==
Date: Wed, 14 Aug 2024 16:46:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, "broonie@kernel.org"
 <broonie@kernel.org>, "pratyush@kernel.org" <pratyush@kernel.org>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>, "james.schulman@cirrus.com"
 <james.schulman@cirrus.com>, "david.rhodes@cirrus.com"
 <david.rhodes@cirrus.com>, "rf@opensource.cirrus.com"
 <rf@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>,
 "tiwai@suse.com" <tiwai@suse.com>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "michael@walle.cc" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>, "Simek, Michal"
 <michal.simek@amd.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Message-ID: <20240814164642.24705f18@xps-13>
In-Reply-To: <IA0PR12MB7699670B7EE37C60C672FC5EDC872@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
	<b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
	<BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
	<BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
	<BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
	<9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
	<BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com>
	<IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
	<20240812103812.72763f69@xps-13>
	<IA0PR12MB769997D5958C191215254983DC872@IA0PR12MB7699.namprd12.prod.outlook.com>
	<20240814104623.72eef495@xps-13>
	<IA0PR12MB7699670B7EE37C60C672FC5EDC872@IA0PR12MB7699.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_074648_422244_6BE182CA 
X-CRM114-Status: GOOD (  20.87  )
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

SGkgQW1pdCwKCj4gPiA+ID4gPiBGb3IgaW1wbGVtZW50aW5nIHRoaXMgdGhlIGN1cnJlbnQgRFQg
YmluZGluZyBuZWVkIHRvIGJlIHVwZGF0ZWQgYXMKPiA+ID4gPiA+IGZvbGxvd3MuICAKPiA+ID4g
Pgo+ID4gPiA+IFNvIHlvdSB3YW50IHRvIGdvIGJhY2sgdG8gc3RlcCAxIGFuZCByZWRlZmluZSBi
aW5kaW5ncz8gSXMgdGhhdCB3b3J0aD8gIAo+ID4gPgo+ID4gPiBUaGUgY3VycmVudCBiaW5kaW5n
cyBhcmUgZWZmZWN0aXZlIGlmIHdlIG9ubHkgc3VwcG9ydCBpZGVudGljYWwgZmxhc2gKPiA+ID4g
ZGV2aWNlcyBvciBmbGFzaGVzIG9mIHRoZSBzYW1lIG1ha2UgYnV0IHdpdGggZGlmZmVyZW50IHNp
emVzIGNvbm5lY3RlZAo+ID4gPiBpbiBzdGFja2VkIG1vZGUuIEhvd2V2ZXIsIGlmIHdlIHdhbnQg
dG8gZXh0ZW5kIHN0YWNrZWQgc3VwcG9ydCB0bwo+ID4gPiBpbmNsdWRlIGZsYXNoZXMgb2YgZGlm
ZmVyZW50IG1ha2VzIGluIHN0YWNrZWQgbW9kZSwgIAo+ID4gCj4gPiBUaGUgb25seSBhY3R1YWwg
ZmVhdHVyZSB0aGUgc3RhY2tlZCBtb2RlIGJyaW5ncyBpcyB0aGUgYWJpbGl0eSB0byBjb25zaWRl
ciB0d28KPiA+IGRldmljZXMgbGlrZSBvbmUuIFRoaXMgaXMgYWJzdHJhY3RlZCBieSBoYXJkd2Fy
ZSwgdGhpcyBpcyBhIGNvbnRyb2xsZXIgY2FwYWJpbGl0eS4gIAo+IAo+IFN0YWNrZWQgbW9kZSBp
cyBhIHNvZnR3YXJlIGFic3RyYWN0aW9uIHJhdGhlciB0aGFuIGEgY29udHJvbGxlciBmZWF0dXJl
IG9yIAo+IGNhcGFiaWxpdHkuIEF0IGFueSBnaXZlbiB0aW1lLCB0aGUgY29udHJvbGxlciBjb21t
dW5pY2F0ZXMgd2l0aCBvbmUgb2YgdGhlIAo+IHR3byBjb25uZWN0ZWQgZmxhc2ggZGV2aWNlcywg
YXMgZGV0ZXJtaW5lZCBieSB0aGUgcmVxdWVzdGVkIGFkZHJlc3MgYW5kIGRhdGEgCj4gbGVuZ3Ro
LiBJZiBhbiBvcGVyYXRpb24gc3RhcnRzIG9uIG9uZSBmbGFzaCBhbmQgZW5kcyBvbiB0aGUgb3Ro
ZXIsIHRoZSBjb3JlIAo+IG5lZWRzIHRvIHNwbGl0IGl0IGludG8gdHdvIHNlcGFyYXRlIG9wZXJh
dGlvbnMgYW5kIGFkanVzdCB0aGUgZGF0YSBsZW5ndGggCj4gYWNjb3JkaW5nbHkuCgpJJ20gc29y
cnksIHRoYXQgd2FzIG5vdCBteSB1bmRlcnN0YW5kaW5nLCBjZiB0aGUgaW5pdGlhbCBSRkM6CgoJ
U3ViamVjdDogW1JGQyBQQVRDSCAwLzNdIER1YWwgc3RhY2tlZC9wYXJhbGxlbCBtZW1vcmllcyBi
aW5kaW5ncwoJRGF0ZTogRnJpLCAxMiBOb3YgMjAyMSAxNjoyNDowOCArMDEwMAoKCSJbLi4uXSBz
dXBwb3J0aW5nIHNwZWNpZmljIFNQSSBjb250cm9sbGVyIG1vZGVzIGxpa2UgWGlsaW54J3MKCXdo
ZXJlIHRoZSBjb250cm9sbGVyIGNhbiBoaWdobHkgYWJzdHJhY3QgdGhlIGhhcmR3YXJlIGFuZAoJ
cHJvdmlkZSBhY2Nlc3MgdG8gYSBzaW5nbGUgYmlnZ2VyIGRldmljZSBpbnN0ZWFkIFsuLi5dIgoK
RnVydGhlcm1vcmUsIEkgcmFwaWRseSBjaGVja2VkIHRoZSBaeW5xNzAwMCBUUk0sIGl0IHN1Z2dl
c3RzIHRoYXQgdGhlCmNvbnRyb2xsZXIgaXMgY2FwYWJsZSBvZiBhZGRyZXNzaW5nIHRoZSByaWdo
dCBtZW1vcnkgaXRzZWxmIGJhc2VkIG9uCnRoZSBhZGRyZXNzLCBlc3BlY2lhbGx5IGluIGxpbmVh
ciBtb2RlPyAKCglodHRwczovL2RvY3MuYW1kLmNvbS9yL2VuLVVTL3VnNTg1LXp5bnEtNzAwMC1T
b0MtVFJNL0R1YWwtU1MtNC1iaXQtU3RhY2tlZC1JL08KCgkiVGhlIGxvd2VyIFNQSSBmbGFzaCBt
ZW1vcnkgc2hvdWxkIGFsd2F5cyBiZSBjb25uZWN0ZWQgaWYgdGhlCglsaW5lYXIgUXVhZC1TUEkg
bWVtb3J5IHN1YnN5c3RlbSBpcyB1c2VkLCBhbmQgdGhlIHVwcGVyIGZsYXNoCgltZW1vcnkgaXMg
b3B0aW9uYWwuIFRvdGFsIGFkZHJlc3Mgc3BhY2UgaXMgMzIgTUIgd2l0aCBhIDI1LWJpdAoJYWRk
cmVzcy4gSW4gSU8gbW9kZSwgdGhlIE1TQiBvZiB0aGUgYWRkcmVzcyBpcyBkZWZpbmVkIGJ5CglV
X1BBR0Ugd2hpY2ggaXMgbG9jYXRlZCBhdCBiaXQgMjggb2YgcmVnaXN0ZXIgMHhBMCAuIEluIExp
bmVhcgoJYWRkcmVzcyBtb2RlLCBBWEkgYWRkcmVzcyBiaXQgMjQgZGV0ZXJtaW5lcyB0aGUgdXBw
ZXIgb3IgbG93ZXIKCW1lbW9yeSBwYWdlLiBBbGwgb2YgdGhlIGNvbW1hbmRzIHdpbGwgYmUgZXhl
Y3V0ZWQgYnkgdGhlIGRldmljZQoJc2VsZWN0ZWQgYnkgVV9QQUdFIGluIEkvTyBtb2RlIGFuZCBh
ZGRyZXNzIGJpdCAyNCBpbiBsaW5lYXIKCW1vZGUuIgoKQW55d2F5LCB5b3UgbWF5IGRlY2lkZSB0
byBnbyBkb3duIHRoZSAicHVyZSBzb2Z0d2FyZSIgcm91dGUsIHdoaWNoIGlzCnByb2JhYmx5IGVh
c2llciBmcm9tIGFuIGltcGxlbWVudGF0aW9uIHBlcnNwZWN0aXZlLCBidXQgbWVhbnMgeW91J3Jl
Cmdvbm5hIGhhdmUgdG8gYXJndWUgLWFnYWluLSBpbiBmYXZvciBvZiB0aGUgcmVwcmVzZW50YXRp
b24gb2YgYSBwdXJlbHkKdmlydHVhbCBkZXZpY2UgdGhhdCBpcyBub3QgaGFyZHdhcmUuCgpDaGVl
cnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
