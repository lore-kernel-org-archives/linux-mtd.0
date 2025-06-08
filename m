Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3D4C5B552
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Jun 2025 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Og8cU+luvZ5Hkuqh9sjAIkDUEygELllG/WEgrcb90nw=; b=2FZUXIxBcaPgqC
	iD9SmCLKXIXzOd1dtmJTv3iGj0n4G5eTaM3uQ3pLlBb6SccXm6vZOIhrqF/78sW8LTFjG8+4mK+rt
	fyJfnaENLi9pGdVDGC0oYzJK6qX+om7yn8a2pVVihD79o87ZqdOLYFCg3zI5g0njhNxIyI9/iiCh9
	kG+AmbT/A6sSh6OKPVfr8CHr0IfI8aZstQdVx1sAml1dlXcsbIodzBW4EzZth21IqfyK1xJG9BiJK
	n1lM9EAl0WX7sI98HsqeQx3v10jGM3+xk4oRdBsz5vXl04NnlkBRwlQWvFTtw0nxfvp6stRuGFxBR
	cPsJkSJFQmLlf6k4fWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOLqB-00000002uR2-0Qtb;
	Sun, 08 Jun 2025 19:37:59 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOLq7-00000002uPN-3nZd
	for linux-mtd@lists.infradead.org;
	Sun, 08 Jun 2025 19:37:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B2EF1F65B;
	Sun,  8 Jun 2025 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749411471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d0C38mLCm+B9BYKlJOfWEN5xHVublMuXuPu2d0ZlfFs=;
	b=apERh0s0k3od83+QhMpwchNQIJ68iMqfauWwLQajqeK0OLqfQe0qCTOhbHgY8Lg3lFAWb/
	PrGlv/fQ4yn+EoIK/s6JX+uB4aESNNFFPnmRaneuXp6XSXYPoYXNCxD0xwXtPRAgwV4dsX
	GmY0qNmjzrxY++3/tqNaSn3oX/KWB8/hE1pcsGkMND8dizfsAfPdeU+fzXW1wIhtqJmyP6
	2thPoIWeRrMYfaEf/lOLQs3QBtuqib6PCRHZ1yx4tRHe24naVN92oAumepTddhT/zpHx9U
	JtPDG0eC3sgouznOdM/85r7oPee2vOlzwkKrQq+76qoG09aeEbSdCbsH/Wbb5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  "Vivi, Rodrigo"
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
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
In-Reply-To: <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Sun, 8 Jun 2025 07:00:10 +0000")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
	<20250302140921.504304-2-alexander.usyskin@intel.com>
	<9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
	<CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sun, 08 Jun 2025 21:37:47 +0200
Message-ID: <87bjqyja7o.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdekvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutedtfeelvefgjeevuedukefhtefgiefftdekffffteduheduheelgedutdetueenucffohhmrghinhepughtshhirdhishenucfkphepledvrddukeegrdelkedrvddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrddvtdegpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrt
 ghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_123756_692970_7C814318 
X-CRM114-Status: GOOD (  16.48  )
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

SGkgR3VlbnRlciwKCk9uIDA4LzA2LzIwMjUgYXQgMDc6MDA6MTAgR01ULCAiVXN5c2tpbiwgQWxl
eGFuZGVyIiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPiB3cm90ZToKCj4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjYgMDEvMTFdIG10ZDogY29yZTogYWx3YXlzIGNyZWF0ZSBtYXN0ZXIgZGV2
aWNlCj4+IAo+PiBIaSwKPj4gCj4+IE9uIFN1biwgTWFyIDAyLCAyMDI1IGF0IDA0OjA5OjExUE0g
KzAyMDAsIEFsZXhhbmRlciBVc3lza2luIHdyb3RlOgo+PiA+IENyZWF0ZSBtYXN0ZXIgZGV2aWNl
IHdpdGhvdXQgcGFydGl0aW9uIHdoZW4KPj4gPiBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RF
UiBmbGFnIGlzIHVuc2V0Lgo+PiA+Cj4+ID4gVGhpcyBzdHJlYW1saW5lcyBkZXZpY2UgdHJlZSBh
bmQgYWxsb3dzIHRvIGFuY2hvcgo+PiA+IHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudCBvbiBtYXN0
ZXIgZGV2aWNlIGluIGFsbCBjYXNlcy4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+Cj4+IAo+PiBTZXZlcmFsIG9m
IG15IHFlbXUgYm9vdCB0ZXN0cyBmYWlsIHRvIGJvb3QgZnJvbSBtdGQgZGV2aWNlcyB3aXRoIHRo
aXMgcGF0Y2gKPj4gaW4gdGhlIG1haW5saW5lIGtlcm5lbC4gUmV2ZXJ0aW5nIGl0IGZpeGVzIHRo
ZSBwcm9ibGVtLiBBcyBmYXIgYXMgSSBjYW4KPj4gc2VlIHRoaXMgYWZmZWN0cyBjb25maWd1cmF0
aW9ucyB3aXRoIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSPXkKPj4gd2hlbgo+PiB0cnlp
bmcgdG8gYm9vdCBmcm9tIGFuIG10ZCBwYXJ0aXRpb24gb3RoZXIgdGhhbiBtdGRibG9jazAsIHdp
dGggdGhlCj4+IG10ZCBwYXJ0aXRpb24gZGF0YSBpbiBkZXZpY2V0cmVlICguLi4vYXNwZWVkL29w
ZW5ibWMtZmxhc2gtbGF5b3V0LmR0c2kpLgo+PiBJcyB0aGVyZSBhIGd1aWRhbmNlIGRlc2NyaWJp
bmcgdGhlIGNoYW5nZWQgYmVoYXZpb3IsIGJ5IGFueSBjaGFuY2UsCj4+IGFuZCBob3cgdGhlIGJv
b3QgY29tbWFuZCBsaW5lIG5vdyBuZWVkcyB0byBsb29rIGxpa2Ugd2hlbiB1c2luZyBvbmUgb2YK
Pj4gdGhlIGZsYXNoIHBhcnRpdGlvbnMgYXMgcm9vdCBmaWxlIHN5c3RlbSA/Cj4+IAo+PiBUaGFu
a3MsCj4+IEd1ZW50ZXIKPgo+IEkndmUgdHJpZWQgdG8gbWFrZSBpcyBhcyB0cmFuc3BhcmVudCBh
cyBwb3NzaWJsZSBmb3IgdGhlIGV4aXN0aW5nIHVzZXJzLgo+IE9ubHkgY2hhbmdlIGlzIHRoYXQg
bm93IGV2ZXJ5IHBhcnRpdGlvbiBoYXMgbWFzdGVyIHRoYXQgaXMgbm90IHBhcnRpdGlvbmVkLgo+
IElzIHRoZSBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj1uIGZpeGVkIHRoZSBwcm9ibGVt
IGZvciB5b3U/CgpObyBjaGFuZ2UgaXMgZXhwZWN0ZWQsIGNhbiB5b3UgcGxlYXNlIGRlc2NyaWJl
IHRoZSBkZXZpY2VzIHRoYXQgeW91Cm9ic2VydmUgd2l0aCBhbmQgd2l0aG91dCB0aGUgcGF0Y2g/
IE1heWJlIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZyBpbgp0aGUgY29yZSBsb2dpYy4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
