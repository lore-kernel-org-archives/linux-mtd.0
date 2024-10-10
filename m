Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F65CF07DF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2024 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBMDo8dgihyexikCYbWaSkCCLWmIknOFmMOBtzKab2k=; b=IMsuOH4URZFXOL
	198zKYD60LUeIE5KZLIipl6L8wgEnWR6To7rQLZRaCt4WXHxhDJp1QJASo4Uv0rg2wa9ZkdwkgvnN
	RY6CdE05/LSmFEhNcQAJWfu282ORDlX/GFjCd9jviYPLfsL1of2nF1JOy4WvhM4JLNDgSP3AiNtz9
	PEV47eCHn6Id6EciY0FB+nPzxnnJOqhnGSMGAMkqVnfGw7a1qGJaDXWhqPzMnYaWp3fql4vtlk7i2
	VSwaoZYDd5VMksOTr7IG/GwMDjlvENvvYVKgS3/1MFENkeUdFgR7nKiy4fPojIapD8ZBVP2C9g/43
	KYVPlCqd7XAkqKTqB2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sypU6-0000000CEXz-22C1;
	Thu, 10 Oct 2024 09:29:26 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sypSg-0000000CEDg-00Va;
	Thu, 10 Oct 2024 09:28:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8E0C240009;
	Thu, 10 Oct 2024 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728552473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIpvFyTZgLUu94xOGDEGcr970RAQUxKWuf6ktquG0pA=;
	b=HYHexWZbzisi+7I32KvQ/3MgFxTE0vqgO/bvfPgFfvjFRZ5OL9sONbUEfexGaj3nIYFNBg
	rFZUaS9+M6En3zav/tnEjpEGrVtrUchLMaFKubrwz/WPA5PkH2uATnZ/FxbUUIIlOa9i79
	LftYlIOBb1T/NFh5hwpmp7x5qIojm8Qgq4Z8BE9AXAPsz6/N6EONB62+aL71r4rZPTGC05
	TbrVH8EBsOkG8a8EwJ/WP7/2wT5erFKgJoylTC6JKbG3f2l7lguUKdnT57IhBnrziOxfBW
	oyZsmZ5SKpI9QmYRMdUhHMS9zuORceU+OxkeXy4uL2O+2ozkIJp+R2VbWKooGA==
Date: Thu, 10 Oct 2024 11:27:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, "michael@walle.cc"
 <michael@walle.cc>, "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, "cornor+dt@kernel.org" <cornor+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "nicolas.ferre@microchip.com"
 <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "claudiu.beznea@tuxon.dev"
 <claudiu.beznea@tuxon.dev>, "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: Add stacked and parallel memories support in spi-nor
Message-ID: <20241010112751.01e5afa1@xps-13>
In-Reply-To: <IA0PR12MB769930E81D3D66B51CDC8213DC782@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
	<20240930110408.6ec43e97@xps-13>
	<IA0PR12MB769930E81D3D66B51CDC8213DC782@IA0PR12MB7699.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_022759_132395_0C2165D5 
X-CRM114-Status: GOOD (  22.44  )
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

SGkgQW1pdCwKCmFtaXQua3VtYXItbWFoYXBhdHJhQGFtZC5jb20gd3JvdGUgb24gVGh1LCAxMCBP
Y3QgMjAyNCAwOToxNzo1OCArMDAwMDoKCj4gSGVsbG8gTWlxdWVsLAo+IAo+ID4gPiAtIFRoZSBz
dGFja2VkLW1lbW9yaWVzIERUIGJpbmRpbmdzIHdpbGwgY29udGFpbiB0aGUgcGhhbmRsZXMgb2Yg
dGhlIGZsYXNoIG5vZGVzICAKPiA+IGNvbm5lY3RlZCBpbiBzdGFja2VkIG1vZGUuICAKPiA+ID4K
PiA+ID4gLSBUaGUgZmlyc3QgZmxhc2ggbm9kZSB3aWxsIGNvbnRhaW4gdGhlIG10ZCBwYXJ0aXRp
b24gdGhhdCB3b3VsZCBoYXZlCj4gPiA+IHRoZSBjcm9zcyBvdmVyIG1lbW9yeSBzdGFyaW5nIGF0
IGEgbWVtb3J5IGxvY2F0aW9uIGluIHRoZSBmaXJzdCBmbGFzaAo+ID4gPiBhbmQgZW5kaW5nIGF0
IHNvbWUgbWVtb3J5IGxvY2F0aW9uIG9mIHRoZSAybmQgZmxhc2ggIAo+ID4gCj4gPiBJIGRvbid0
IGxpa2UgdGhhdCBtdWNoLiBEZXNjcmliaW5nIHBhcnRpdGlvbnMgcGFzdCB0aGUgYWN0dWFsIGRl
dmljZSBzb3VuZHMgd3JvbmcuIElmCj4gPiB5b3UgbG9vayBpbnRvIFsxXSB0aGVyZSBpcyBhIHN1
Z2dlc3Rpb24gZnJvbSBSb2IgdG8gaGFuZGxlIHRoaXMgY2FzZSB1c2luZyBhIHByb3BlcnR5Cj4g
PiB0aGF0IHRlbGxzIHVzIHRoZXJlIGlzIGEgY29udGludWF0aW9uLCBzbyBmcm9tIGEgc29mdHdh
cmUgcGVyc3BlY3RpdmUgd2UgY2FuIGVhc2lseQo+ID4gbWFrZSB0aGUgbGluaywgYnV0IG9uIHRo
ZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiBzaWRlIHRoZSBpbmZvcm1hdGlvbiBhcmUgY29ycmVjdC4g
IAo+IAo+IEkgcmV2aWV3ZWQgUm9iJ3Mgc3VnZ2VzdGlvbnMgaW4gWzFdLCBhbmQgSSBuZWVkIHRv
IGV4YW1pbmUgdGhlIE1URCBsYXllciAKPiB0byBkZXRlcm1pbmUgaG93IHRoaXMgY2FuIGJlIGlt
cGxlbWVudGVkIGZyb20gYSBzb2Z0d2FyZSBwZXJzcGVjdGl2ZS4gCj4gRm9yIHJlZmVyZW5jZSwg
aGVyZSBpcyBSb2IncyBzdWdnZXN0aW9uOgo+IAo+IERlc2NyaWJlIGVhY2ggZGV2aWNlIGFuZCBw
YXJ0aXRpb24gc2VwYXJhdGVseSBhbmQgYWRkIGxpbmsocykgZnJvbSBvbmUgCj4gcGFydGl0aW9u
IHRvIHRoZSBuZXh0IAo+IAo+IGZsYXNoMCB7Cj4gICBwYXJ0aXRpb25zIHsKPiAgICAgY29tcGF0
aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiAgICAgY29uY2F0LXBhcnRpdGlvbiA9IDwmZmxh
c2gxX3BhcnRpdGlvbnM+Owo+ICAgICAuLi4KPiAgIH07Cj4gfTsKPiAKPiBmbGFzaDEgewo+ICAg
Zmxhc2gxX3BhcnRpdGlvbjogcGFydGl0aW9ucyB7Cj4gICAgIGNvbXBhdGlibGUgPSAiZml4ZWQt
cGFydGl0aW9ucyI7Cj4gICAgIC4uLgo+ICAgfTsKPiB9Owo+IAo+ID4gCj4gPiBJZiB0aGlzIGRl
c2NyaXB0aW9uIGlzIGFjY2VwdGVkLCB0aGVuIGZpbmUsIHlvdSBjYW4gZGVwcmVjYXRlIHRoZSAi
c3RhY2tlZC1tZW1vcmllcyIKPiA+IHByb3BlcnR5LiAgCj4gCj4gSSBiZWxpZXZlIHRoYXQgaW4g
YWRkaXRpb24gdG8gUm9iJ3MgZGVzY3JpcHRpb24sIHdlIHNob3VsZCBhbHNvIGluY2x1ZGUgCj4g
dGhlICdzdGFja2VkLW1lbW9yaWVzJyBwcm9wZXJ0eS4gVGhpcyBwcm9wZXJ0eSBoZWxwcyB1cyBp
ZGVudGlmeSB3aGljaCAKPiBmbGFzaGVzIGFyZSBzdGFja2VkLCB3aGlsZSBSb2IncyBzdWdnZXN0
aW9uIGV4cGxhaW5zIGhvdyB0aGUgcGFydGl0aW9ucyAKPiB3aXRoaW4gdGhlIHN0YWNrZWQgZmxh
c2hlcyBhcmUgY29ubmVjdGVkLgo+IAo+IEZvciBleGFtcGxlLCBpZiB3ZSBoYXZlIHRocmVlIGZs
YXNoZXMgY29ubmVjdGVkIHRvIGFuIFNQSSBob3N0LCB3aXRoIAo+IGZsYXNoQDAgYW5kIGZsYXNo
QDEgb3BlcmF0aW5nIGluIHN0YWNrZWQgbW9kZSBhbmQgZmxhc2hAMiBmdW5jdGlvbmluZyBhcyBh
IAo+IHN0YW5kYWxvbmUgZmxhc2gsIHRoZSBEZXZpY2UgVHJlZSBiaW5kaW5nIG1pZ2h0IGxvb2sg
c29tZXRoaW5nIGxpa2UgdGhpczogCj4gUGxlYXNlIHNoYXJlIHlvdXIgdGhvdWdodHMgb24gdGhp
cy4KPiAKPiBzcGlAMCB7Cj4gICAuLi4KPiAgIGZsYXNoQDAgewo+ICAgICBjb21wYXRpYmxlID0g
ImplZGVjLHNwaS1ub3IiCj4gICAgIHJlZyA9IDwweDAwPjsKPiAgICAgc3RhY2tlZC1tZW1vcmll
cyA9IDwmZmxhc2hAMCAmZmxhc2hAMT47Cj4gICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAw
MDAwPjsKPiAgICAgLi4uCj4gICAgICAgICBmbGFzaDBfcGFydGl0aW9uOiBwYXJ0aXRpb25zIHsK
PiAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+IAljb25jYXQt
cGFydGl0aW9uID0gPCZmbGFzaDFfcGFydGl0aW9ucz47CQo+ICAgICAgICAgCXBhcnRpdGlvbkAw
IHsKPiAgICAgICAgICAgCSAgICBsYWJlbCA9ICJTdGFja2VkLUZsYXNoLTEiOwo+ICAgICAgICAg
ICAgICAgICByZWcgPSA8MHgwIDB4ODAwMDAwPjsKPiAJfQo+ICAgICAgICAgfQo+ICAgICB9Cj4g
ICBmbGFzaEAxIHsKPiAgICAgY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIgo+ICAgICAgcmVn
ID0gPDB4MDE+Owo+ICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47Cj4gICAgIC4u
Lgo+ICAgICAgICAgZmxhc2gxX3BhcnRpdGlvbjogcGFydGl0aW9ucyB7Cj4gICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiAJY29uY2F0LXBhcnRpdGlvbiA9IDwm
Zmxhc2gwX3BhcnRpdGlvbnM+OwkKPiAgICAgICAgIAlwYXJ0aXRpb25AMCB7Cj4gICAgICAgICAg
IAkgICAgbGFiZWwgPSAiIFN0YWNrZWQtRmxhc2gtMiI7Cj4gICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAgMHg4MDAwMDA+Owo+IAl9Cj4gICAgICAgICB9Cj4gICB9Cj4gCj4gICBmbGFzaEAyIHsK
PiAgICAgY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIgo+ICAgICAgcmVnID0gPDB4MDE+Owo+
ICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47Cj4gICAgIC4uLgo+ICAgICAgICAg
cGFydGl0aW9ucyB7Cj4gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25z
IjsKPiAJY29uY2F0LXBhcnRpdGlvbiA9IDwmZmxhc2gwX3BhcnRpdGlvbnM+OwkKPiAgICAgICAg
IAlwYXJ0aXRpb25AMCB7Cj4gICAgICAgICAgIAkgICAgbGFiZWwgPSAiU2luZ2xlLUZsYXNoIjsK
PiAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDgwMDAwMD47Cj4gCX0KPiAgICAgICAgIH0K
PiAgIH0KCkknbSBzb3JyeSBidXQgdGhpcyBpcyBwcmV0dHkgbWVzc2VkIHVwLiBUaGUgYWxpZ25t
ZW50cyBhcmUgd3JvbmcsIEkKYmVsaWV2ZSB0aGUgbGFiZWxzIGFyZSB3cm9uZywgdGhlIHJlZyBw
cm9wZXJ0aWVzIGFzIHdlbGwuIENhbiB5b3UKcGxlYXNlIHdvcmsgb24gdGhpcyBleGFtcGxlIGFu
ZCBzZW5kIGFuIHVwZGF0ZWQgdmVyc2lvbj8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
