Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE0BC531DD
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2024 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mgLPB5jaOl9sB15pRgRS3MKe+hl4i1cScmuTQXXmRI=; b=SZIks/MElgE0mL
	Dm6LEhnn9kGpijSkWYrN21g+9Y9HTRmu/1Cb1ee731alksGHJbWnQlwGMDCuE4lgPrVaDWXwKcbiG
	XI/Viafw5z/NLKVbszOarw1Y2+E8SL0V+jHj4ywhisBxDUT+FQK39Xr3ONkzTwHatw1imtoEno2ZM
	SlSDmA81XfFh/qafpRX1k5QviGlS+k49kSgmOfpY1se88jUDu2q/10NP7wnzb/NZdeLMLv+oskkqQ
	Xc+5YLs3oeDexzQhEfuhF0YnSKcPbJb9geZOU2csmfzb73j66IY+KnrsjGgdHyfCsg70In7cLsInK
	67T7+XcWVKQstSVHK5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAo6-00000006U30-31qh;
	Wed, 14 Aug 2024 10:00:42 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9eJ-00000006Gc2-1kcz;
	Wed, 14 Aug 2024 08:46:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A91E240002;
	Wed, 14 Aug 2024 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723625187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ucah7eJHaaeq3ephNaG8kgL8jqU515QWycrDeI4W32U=;
	b=FdsiK+vFzIxzAqPbfc+zcpWwxzSkeu0QWaWCCAjEbz0ECS+4Gop5b9iMy9KvidVfzrT8YS
	R3glCu3H/fqGqqli0J7bcQs1w03PBRnmCapSt56E9eryaNugOsi1PeVvaPMZvrGAhfIkSu
	/t4pALdm08hT/0XNHlcrmjKN0EZBCdXNgFQPpp1Z0aEC9SrkAFKSLnmVn9py1QCfRHIjnT
	2sHSq8VKWfcCkSJJEP/ynJ4bZVshyjwgQhXFQlj4veogBmCtfuNurSeoBV7fWvqLvn4VxT
	XCZP930UGMK7PVedVe/wN8EbyAnhDkfoixyA+y09If7Os0pmm1Gwux56yiPboQ==
Date: Wed, 14 Aug 2024 10:46:23 +0200
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
Message-ID: <20240814104623.72eef495@xps-13>
In-Reply-To: <IA0PR12MB769997D5958C191215254983DC872@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
	<c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
	<BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
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
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_014631_770799_09E0098D 
X-CRM114-Status: GOOD (  36.30  )
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

SGkgQW1pdCwKCmFtaXQua3VtYXItbWFoYXBhdHJhQGFtZC5jb20gd3JvdGUgb24gV2VkLCAxNCBB
dWcgMjAyNCAwNzoxMzozNSArMDAwMDoKCj4gSGVsbG8gTWlxdWVsLAo+IAo+ID4gPiBCYXNlZCBv
biB0aGUgaW5wdXRzL3N1Z2dlc3Rpb25zIGZyb20gVHVkb3IsIGkgYW0gcGxhbm5pbmcgdG8gYWRk
IGEgbmV3Cj4gPiA+IGxheWVyIGJldHdlZW4gdGhlIFNQSS1OT1IgYW5kIE1URCBsYXllcnMgdG8g
c3VwcG9ydCBzdGFja2VkIGFuZAo+ID4gPiBwYXJhbGxlbCBjb25maWd1cmF0aW9ucy4gVGhpcyBu
ZXcgbGF5ZXIgd2lsbCBiZSBwYXJ0IG9mIHRoZSBzcGktbm9yCj4gPiA+IGFuZCBsb2NhdGVkIGlu
IG10ZC9zcGktbm9yLyAgCj4gPiAKPiA+IEZvciBub3cgSSBkb24ndCB0aGluayB5b3UgbmVlZCBh
IHRvdGFsbHkgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbi4gQXMgbG9uZyBhcwo+ID4gdGhlcmUgaXMg
b25seSBvbmUgY29udHJvbGxlciBzdXBwb3J0aW5nIHRoZXNlIG1vZGVzLCBJJ2Qgc2F5IHRoaXMg
aXMgbm90IHN1cGVyCj4gPiByZWxldmFudC4gIAo+IAo+IElNSE8sIHRoZXJlIHNob3VsZCBiZSBh
IGdlbmVyYWwgc29sdXRpb24gc2luY2UgdGhpcyBpc24ndCBsaW1pdGVkIHRvIGp1c3QgCj4gb25l
IGNvbnRyb2xsZXIuIEFueSBjb250cm9sbGVyIGNhbiBzdXBwb3J0IHN0YWNrZWQgbW9kZSB3aXRo
IG11bHRpcGxlIAo+IG5hdGl2ZS1jcyBvciBtdWx0aXBsZSBncGlvLWNzLCBvciB3aXRoIGEgY29t
YmluYXRpb24gb2YgYSBuYXRpdmUtY3MgYW5kIGEgCj4gZ3Bpby1jcy4KClRoYXQncyBub3Qgd2hh
dCB3YXMgaW5pdGlhbGx5IGRpc2N1c3NlZC4gVGhlIFhpbGlueCB1c2UgY2FzZSB3YXM6CmEgY29u
dHJvbGxlciBpcyBtYW5hZ2luZyB0d28gZGV2aWNlcyAiYXQgdGhlIHNhbWUgdGltZSIgdHJhbnNw
YXJlbnRseQpmcm9tIHRoZSBob3N0LiBTbyB0aGUgdHdvIGZsYXNoZXMgYXBwZWFyIGxpa2UgYSBz
aW5nbGUgb25lIGFuZCB0aHVzLAphcmUgZGVzY3JpYmVkIGxpa2UgYSBzaW5nbGUgb25lLgoKWW91
IGRvbid0IG5lZWQgYW55dGhpbmcgaW4gdGhlIGJpbmRpbmdzIG5vciBpbiB0aGUgY29yZSB0byBt
YW5hZ2UgdHdvCmZsYXNoZXMgY29ubmVjdGVkIHRvIHRoZSBzYW1lIGNvbnRyb2xsZXIgb3RoZXJ3
aXNlLiBUaGUgb25seSB1c2UgY2FzZQp0aGUgWGlsaW54IG1vZGVsIHdhcyBicmluZ2luZywgd2Fz
IHRvIGNvbnNpZGVyIHRoZSBzdG9yYWdlIGJpZ2dlciBmcm9tCmEgaG9zdCBwZXJzcGVjdGl2ZSBh
bmQgdGh1cyBiZSBhYmxlIHRvIHN0b3JlIGZpbGVzIGFjcm9zcyB0aGUgZGV2aWNlCmJvdW5kYXJ5
IG5hdGl2ZWx5LgoKPiBGb3IgcGFyYWxsZWwgY29uZmlndXJhdGlvbnMsIHRoZXJlIGFyZSBvdGhl
ciBjb250cm9sbGVycyBmcm9tIAo+IE1pY3JvY2hpcCBhbmQgc29tZSBmbGFzaCBkZXZpY2VzIHRo
YXQgb3BlcmF0ZSBzaW1pbGFybHkgdG8gQU1EJ3MgcGFyYWxsZWwgCj4gbW9kZS4KClllcywgVHVk
b3IgcmVtaW5kZWQgbWUgYWJvdXQgdGhlc2UuCgo+ID4gPiBUaGlzIGxheWVyIHdvdWxkIHBlcmZv
cm0gdGhlIGZvbGxvd2luZyB0YXNrczoKPiA+ID4gIC0gRHVyaW5nIHByb2JpbmcsIHN0b3JlIGlu
Zm9ybWF0aW9uIGZyb20gYWxsIHRoZSBjb25uZWN0ZWQgZmxhc2hlcywKPiA+ID4gICAgd2hldGhl
ciBpbiBzdGFja2VkIG9yIHBhcmFsbGVsIG1vZGUsIGFuZCBwcmVzZW50IGl0IGFzIGEgc2luZ2xl
IGRldmljZQo+ID4gPiAgICB0byB0aGUgTVREIGxheWVyLgo+ID4gPiAgLSBSZWdpc3RlciBjYWxs
YmFja3MgdGhyb3VnaCB0aGlzIG5ldyBsYXllciBpbnN0ZWFkIG9mIHNwaS1ub3IvY29yZS5jIGFu
ZAo+ID4gPiAgICBoYW5kbGUgTVREIGRldmljZSByZWdpc3RyYXRpb24uCj4gPiA+ICAtIEluIHN0
YWNrZWQgbW9kZSwgc2VsZWN0IHRoZSBhcHByb3ByaWF0ZSBzcGktbm9yIGZsYXNoIGJhc2VkIG9u
IHRoZQo+ID4gPiAgICBhZGRyZXNzIHByb3ZpZGVkIGJ5IHRoZSBNVEQgbGF5ZXIgZHVyaW5nIGZs
YXNoIG9wZXJhdGlvbnMuCj4gPiA+ICAtIE1hbmFnZSBmbGFzaCBjcm9zc292ZXIgb3BlcmF0aW9u
cyBpbiBzdGFja2VkIG1vZGUuCj4gPiA+ICAtIEVuc3VyZSBib3RoIGNvbm5lY3RlZCBmbGFzaGVz
IGFyZSBpZGVudGljYWwgaW4gcGFyYWxsZWwgbW9kZS4KPiA+ID4gIC0gSGFuZGxlIG9kZCBieXRl
IGNvdW50IHJlcXVlc3RzIGZyb20gdGhlIE1URCBsYXllciBkdXJpbmcgZmxhc2gKPiA+ID4gICAg
b3BlcmF0aW9ucyBpbiBwYXJhbGxlbCBtb2RlLgo+ID4gPgo+ID4gPiBGb3IgaW1wbGVtZW50aW5n
IHRoaXMgdGhlIGN1cnJlbnQgRFQgYmluZGluZyBuZWVkIHRvIGJlIHVwZGF0ZWQgYXMKPiA+ID4g
Zm9sbG93cy4gIAo+ID4gCj4gPiBTbyB5b3Ugd2FudCB0byBnbyBiYWNrIHRvIHN0ZXAgMSBhbmQg
cmVkZWZpbmUgYmluZGluZ3M/IElzIHRoYXQgd29ydGg/ICAKPiAKPiBUaGUgY3VycmVudCBiaW5k
aW5ncyBhcmUgZWZmZWN0aXZlIGlmIHdlIG9ubHkgc3VwcG9ydCBpZGVudGljYWwgCj4gZmxhc2gg
ZGV2aWNlcyBvciBmbGFzaGVzIG9mIHRoZSBzYW1lIG1ha2UgYnV0IHdpdGggZGlmZmVyZW50IHNp
emVzIAo+IGNvbm5lY3RlZCBpbiBzdGFja2VkIG1vZGUuIEhvd2V2ZXIsIGlmIHdlIHdhbnQgdG8g
ZXh0ZW5kIHN0YWNrZWQgc3VwcG9ydCAKPiB0byBpbmNsdWRlIGZsYXNoZXMgb2YgZGlmZmVyZW50
IG1ha2VzIGluIHN0YWNrZWQgbW9kZSwKClRoZSBvbmx5IGFjdHVhbCBmZWF0dXJlIHRoZSBzdGFj
a2VkIG1vZGUgYnJpbmdzIGlzIHRoZSBhYmlsaXR5IHRvCmNvbnNpZGVyIHR3byBkZXZpY2VzIGxp
a2Ugb25lLiBUaGlzIGlzIGFic3RyYWN0ZWQgYnkgaGFyZHdhcmUsIHRoaXMgaXMKYSBjb250cm9s
bGVyIGNhcGFiaWxpdHkuIFRoZSBvbmx5IHdheSB0aGlzIGNhbiB3b3JrIGlzIGlmIHRoZSB0d28K
c3RvcmFnZSBkZXZpY2VzIGFyZSBvZiB0aGUgc2FtZSBraW5kIGFuZCBhY2NlcHQgdGhlIHNhbWUg
Y29tbWFuZHMvaW5pdApjeWNsZXMuCgpJZiB5b3UgY29uc2lkZXIgdHdvIGRpZmZlcmVudCBkZXZp
Y2VzLCB0aGVuIHRoZXJlIGlzIG5vIGhhcmR3YXJlCmFic3RyYWN0aW9uIGFueW1vcmUsIHRoZSBj
b250cm9sbGVyIGlzIG5vIGxvbmdlciAic21hcnQiIGVub3VnaCBhbmQgeW91CmFyZSBiYWNrIHRv
IHRoZSBzdGFuZGFyZCBzaXR1YXRpb24gd2l0aCB0d28gZGV2aWNlcyBjb25uZWN0ZWQgdXNpbmcK
dGhlaXIgb3duIGluZGVwZW5kZW50IENTLCBrbm93biBieSB0aGUgaG9zdC4gSW4gdGhpcyBjYXNl
IHRoZQoic3RhY2tlZC1tb2RlIiBiaW5kaW5ncyBubyBsb25nZXIgYXBwbHkuIFlvdSBuZWVkIHRv
IGRlc2NyaWJlIHRoZSB0d28KY2hpcHMgaW5kZXBlbmRlbnRseSBpbiB0aGUgRFQsIGFuZCB5b3Vy
IHN0YWNrZWQgZmVhdHVyZSBpbiB0aGUKY29udHJvbGxlciBjYW4gbm8gbG9uZ2VyIGJlIHVzZWQu
CgpZb3UgbmVlZCBvdGhlciBiaW5kaW5ncyB0byBzdXBwb3J0IHRoaXMgY2FzZSBiZWNhdXNlIGl0
IGlzIGEgZGlmZmVyZW50CnNpdHVhdGlvbi4gRm9yIHRoaXMgY2FzZSwgdGhlcmUgd2FzIGEgbXRk
LWNvbmNhdCBhcHByb2FjaCAod2hpY2ggd2FzCm5ldmVyIG1lcmdlZCkuIEJ1dCB0aGlzIGlzIHJl
YWxseSBzb21ldGhpbmcgZGlmZmVyZW50IHRoYW4gdGhlIHN0YWNrZWQKbW9kZSBpbiB5b3VyIGNv
bnRyb2xsZXIgYmVjYXVzZSB0aGVyZSBpcyBubyBzcGVjaWZpYyBoYXJkd2FyZSBmZWF0dXJlCmlu
dm9sdmVkLCBpdCdzIGp1c3QgcHVyZSBzb2Z0d2FyZS4KCj4gdGhlIGN1cnJlbnQgCj4gYmluZGlu
Z3MgbWF5IG5vdCBiZSBhZGVxdWF0ZS4gVGhhdCdzIHdoeSBJIHN1Z2dlc3RlZCB1cGRhdGluZyB0
aGUgYmluZGluZ3MgCj4gdG8gYWNjb21tb2RhdGUgYWxsIHBvc3NpYmxlIHNjZW5hcmlvLgo+IAo+
ID4gICAKPiA+ID4gc3RhY2tlZC1tZW1vcmllcyBEVCBjaGFuZ2VzOgo+ID4gPiAgLSBGbGFzaCBz
aXplIGluZm9ybWF0aW9uIGNhbiBiZSByZXRyaWV2ZWQgZGlyZWN0bHkgZnJvbSB0aGUgZmxhc2gs
IHNvIGl0Cj4gPiA+ICAgIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSB0aGUgRFQgYmluZGluZy4KPiA+
ID4gIC0gRWFjaCBzdGFja2VkIGZsYXNoIHdpbGwgaGF2ZSBpdHMgb3duIGZsYXNoIG5vZGUuIFRo
aXMgYXBwcm9hY2ggYWxsb3dzCj4gPiA+ICAgIGZsYXNoZXMgb2YgZGlmZmVyZW50IG1ha2VzIGFu
ZCBzaXplcyB0byBiZSBzdGFja2VkIHRvZ2V0aGVyLCBhcyBlYWNoCj4gPiA+ICAgIGZsYXNoIHdp
bGwgYmUgcHJvYmVkIGluZGl2aWR1YWxseS4gIAo+ID4gCj4gPiBBbmQgaG93IHdpbGwgeW91IGRl
ZmluZSBwYXJ0aXRpb25zIGNyb3NzaW5nIGRldmljZSBib3VuZGFyaWVzPyBJIGJlbGlldmUgdGhp
cwo+ID4gY29uc3RyYWludCBoYXMgYmVlbiB0b3RhbGx5IGZvcmdvdHRlbiBpbiB0aGlzIHByb3Bv
c2FsLiAgCj4gCj4gQWNjb3JkaW5nIHRvIHRoZSBuZXcgYmluZGluZyBwcm9wb3NhbCwgb25lIG9m
IHRoZSB0d28gZmxhc2ggbm9kZXMgd2lsbCAKPiBoYXZlIGEgcGFydGl0aW9uIHRoYXQgY3Jvc3Nl
cyB0aGUgZGV2aWNlIGJvdW5kYXJ5LgoKRnJvbSBhIGJpbmRpbmdzIHBlcnNwZWN0aXZlLCBpdCBm
ZWVscyB2ZXJ5IGF3a3dhcmQgYW5kIEkgZG91YnQgaXQgd2lsbApiZSBhY2NlcHRlZC4gRnJvbSBh
IGNvZGUgcGVyc3BlY3RpdmUsIHlvdSdyZSBnb25uYSBuZWVkIHRvIGJ1dGNoZXIgdGhlCmNvcmUu
Li4KCj4gPiBUaGUgd2hvbGUgaWRlYSBvZiBzdGFja2luZyB0d28gZGV2aWNlcyB0aGlzIHdheSB3
YXMgdG8gc2ltcGxpZnkgdGhlIHVzZXIncyBsaWZlCj4gPiB3aXRoIGEgc2luZ2xlIGRldmljZSBl
eHBvc2VkIGFuZCB0aGUgY29udHJvbGxlciBoYW5kbGluZyBpdHNlbGYgdGhlIENTIGNoYW5nZXMu
Cj4gPiBUaGF0IGlzIHByZWNpc2VseSB3aGF0IHRoZSBjdXJyZW50IGJpbmRpbmcgZG8uICAKPiAK
PiBUaGF0J3MgdHJ1ZSwgYnV0IGFzIEkgbWVudGlvbmVkIGVhcmxpZXIsIGlmIHdlJ3JlIG5vdCBp
bmNsaW5lZCB0byBzdXBwb3J0IAo+IHN0YWNrZWQgbW9kZSBmb3IgZmxhc2hlcyBvZiBkaWZmZXJl
bnQgbWFrZXMsIHRoZW4gdGhlIGN1cnJlbnQgYmluZGluZ3MgCj4gYXJlIHN1ZmZpY2llbnQuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
