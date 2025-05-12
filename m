Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B57AC3ABBC
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MQB13ydvXtxuHpy+IX0UV9H58A9LHhbqDgTEUhwWtQ=; b=po9vyG3B0ZOeL4
	ywfbWil/xu/7X8C5cK35Xcr8vKNwLRHhGYaNhsXBJiGraoaIW6MA+T+i4xSQqJN0p0Fo1cwh8oOE1
	+3HtsTZw2tXYOEF9qcEwxHst2tBab0/IptcegbjQI24uxwnRk7AH2VXNlusiIN1+pR1K9LC1hc5uv
	poryuIDHpLOtX21WwZ4HYXhlP8VOKPpifuYbs7+mMYLg/3wq2LWh/HE5vi/xlu1RIsW3zRdSYnVjX
	gjBcwd4480J1HBj+v2BMczsdXJjaEY+STcCDo1ypdc5Q8NwmT+IUr4pY/exgBo6IP2HBrI8oGgTH4
	n4TnI3Ft4h+mEJmZ4X7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOWc-00000008kdx-36eH;
	Mon, 12 May 2025 08:28:38 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOTh-00000008k16-2FMS
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 08:25:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63EE541DF6;
	Mon, 12 May 2025 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747038333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2qcaezvUijlLrPepDLPt+ZkioXMpqZt1fzdlF4KZU4=;
	b=JSI/NrHBSE2uOOYf6wgoEo5MwwgbaBwxNA0sEXTud+uUjAxlnaN0jn/9BH9bPaKI++c2nu
	ltcKsBAnJErln2qSlEgCTFhm6l7v+HyVeK/JGP+0SUaHxpFAs6j17RQVdYEHIgz6EHZ/xa
	1sIkGhBhKiTTg7ihvxkxXQJgfkqmdqxZW7UKPMIyTh4EY6YgSTouQ36JmD4dIJnYO3gSro
	/fZAFXJg9yPo0ETiQCWEEUtpDxzQMKV3Ch7ntAwwt1b7ef0/ariqY9uQ78VYtHMXARJJnt
	zSFfK4seEkDsrSESg0q8u7YdmlvtkydqXriGcO9WLrn8KUPRkqM7d3BE9C4wfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "De Marchi, Lucas" <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  "Vivi,
 Rodrigo"
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  "Poosa, Karthik" <karthik.poosa@intel.com>,  "Abliyev, Reuven"
 <reuven.abliyev@intel.com>,  "Weil, Oren jer" <oren.jer.weil@intel.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
  "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 01/12] mtd: core: always create master device
In-Reply-To: <CY5PR11MB6366C40CC20B3519476DD8E2ED892@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Tue, 6 May 2025 11:07:21 +0000")
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
	<20250326152623.3897204-2-alexander.usyskin@intel.com>
	<87ldrjtj7n.fsf@bootlin.com>
	<CY5PR11MB6366C40CC20B3519476DD8E2ED892@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 10:25:31 +0200
Message-ID: <87h61qnslg.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrt
 ghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_012537_872941_86C1504B 
X-CRM114-Status: GOOD (  14.62  )
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

SGVsbG8gQWxleGFuZGVyLAoKT24gMDYvMDUvMjAyNSBhdCAxMTowNzoyMSBHTVQsICJVc3lza2lu
LCBBbGV4YW5kZXIiIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPj4gCj4+
IE9uIDI2LzAzLzIwMjUgYXQgMTc6MjY6MTIgKzAyLCBBbGV4YW5kZXIgVXN5c2tpbgo+PiA8YWxl
eGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPiB3cm90ZToKPj4gCj4+ID4gQ3JlYXRlIG1hc3RlciBk
ZXZpY2Ugd2l0aG91dCBwYXJ0aXRpb24gd2hlbgo+PiA+IENPTkZJR19NVERfUEFSVElUSU9ORURf
TUFTVEVSIGZsYWcgaXMgdW5zZXQuCj4+ID4KPj4gPiBUaGlzIHN0cmVhbWxpbmVzIGRldmljZSB0
cmVlIGFuZCBhbGxvd3MgdG8gYW5jaG9yCj4+ID4gcnVudGltZSBwb3dlciBtYW5hZ2VtZW50IG9u
IG1hc3RlciBkZXZpY2UgaW4gYWxsIGNhc2VzLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogQWxl
eGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4KPj4gCj4+IEFwcGxp
ZWQgdG8gbXRkL25leHQuIFRoYW5rcyEKPj4gCj4+IE1pcXXDqGwKPgo+IFRoYW5rcyBhIGxvdCEK
Pgo+IE1pcXVlbCwgd291bGQgeW91IHBpY2sgcGF0Y2hlcyBmcm9tIHRoaXMgc2VyaWVzIGZvciBm
aWxlcyB0aGF0IGFyZQo+IGluIHRoZSBtdGQgdHJlZT8KPiBJIGNhbiBzZW5kIHNlcGFyYXRlIHBh
dGNoIHNlcmllcyBmb3IgdGhpcy4KPiBJbiB0aGlzIGNhc2UgdGhlIGk5MTUvWGUgcGF0Y2hlcyBj
YW4gYmUgbWVyZ2VkIGluIHBhcmFsbGVsIHZpYSBYZQo+IHRyZWUuCgpJIHJlYWQgc2V2ZXJhbCB0
aW1lcyB0aGF0IHRoZXNlIHBhdGNoZXMgc2hvdWxkIGdvIHRocm91Z2ggZHJtIHNvbWVob3csCnNv
IEkgcHJvdmlkZWQgbXkgQWNrLiBJIGRvIG5vdCB0aGluayBidWlsZCB3b3VsZCBiZSBicm9rZW4g
aWYgcGF0Y2ggMQpnb2VzIHRocm91Z2ggbXRkIGFuZCB0aGUgb3RoZXJzIHRocm91Z2ggZHJtIGFu
eXdheSwgZXNwZWNpYWxseSBzaW5jZSBkcm0KaGFzIHNvbWUgc3RydWN0dXJhbCBzbG93bmVzcyB3
aGljaCBtZWFucyBvbmNlIGFwcGxpZWQgdG8gZHJtLW1pc2MoLW5leHQpCnRoZXkgbWF5IGJlIHBh
cnQgb2YgdGhlIG1haW4gdHJlZSBhIHJlbGVhc2UgbGF0ZXIgKGlpdWMpLgoKSG93ZXZlciwgSSBt
aWdodCBkcm9wIHRoaXMgcGF0Y2ggYW5kIHJlYXBwbHkgdGhlIG9uZSBmcm9tIHY5LCBiZWNhdXNl
IEkKYXBwYXJlbnRseSBtZXNzZWQgdXAgd2l0aCB0aGUgdmVyc2lvbiBjb3VudC4gVGhlcmUgaXMg
bm8gYWN0aW9uIHJlcXVpcmVkCm9uIHlvdXIgc2lkZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
