Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73567C5B552
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 21:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GCiyV0qCTHrIQsDfm1Z4x9+4rvDKPuwQQDoOSML2NKI=; b=ZzA9kSNFCiRwxb45u1mWkaM1AU
	6+ja667OxcHGIb4nDh7pvunzwa3XFNoUDarqAbVZLVfCz7SNk0vBbMHHQVb5M81MH9WOfXEN8ujrY
	Psw0RFb5ByxA1nEdajaQuG8S8/1QvD8gNFiuHRnd/NMl+rhWZBNCUPUWJ9ics9h4AICM5sMzwGC8O
	mWSiK8zAJ4YLkKKms6UQbv8WHlI0sMNHgvGvpBZUF93GP8I4zyYpi7t7ImQJRemu6GG7Q2iemXA82
	gaTFNPVQVjREXryhI3RcSGYgTDNPIJfEDau+ugNXLGNSN3zJlOMQ+6jk8QmWMOcnF+sCF8RjpYQel
	NPDOzs+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkCV-00000005HW4-3nmV;
	Mon, 09 Jun 2025 21:38:39 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOk1b-00000005GPM-0Yp7
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 21:27:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9BB70298562;
	Mon,  9 Jun 2025 23:27:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ET2xpdSYUI12; Mon,  9 Jun 2025 23:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 32565298566;
	Mon,  9 Jun 2025 23:27:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VSRsIT4TuOoV; Mon,  9 Jun 2025 23:27:10 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E3468298562;
	Mon,  9 Jun 2025 23:27:09 +0200 (CEST)
Date: Mon, 9 Jun 2025 23:27:09 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Guenter Roeck <linux@roeck-us.net>, 
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, 
	Karthik Poosa <karthik.poosa@intel.com>, 
	Reuven Abliyev <reuven.abliyev@intel.com>, 
	Oren Weil <oren.jer.weil@intel.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
In-Reply-To: <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
References: <20250302140921.504304-1-alexander.usyskin@intel.com> <87bjqyja7o.fsf@bootlin.com> <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net> <87ikl5xnbc.fsf@bootlin.com> <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com> <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net> <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com> <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: THmojBJHtC1GOaAOJStu5UV1FSAWmA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_142723_470587_779C1166 
X-CRM114-Status: GOOD (  11.46  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkd1ZW50ZXIgUm9lY2siIDxs
aW51eEByb2Vjay11cy5uZXQ+Cj4+PiBJIGFtIHRyeWluZyB0byBib290IGZyb20gInBub3IiLiBJ
dCBsb29rcyBsaWtlIHRoZSBwYXJ0aXRpb24gZGF0YSAoZnJvbQo+Pj4gZGV2aWNldHJlZSkKPj4+
IGlzIG5vdyBpZ25vcmVkLiBtdGRibG9jazYgdXNlZCB0byBiZSB0aGUgc2Vjb25kIGZsYXNoLgo+
Pj4KPj4+IEd1ZW50ZXIKPj4gCj4+IElzIHRoaXMgd2l0aCBDT05GSUdfTVREX1BBUlRJVElPTkVE
X01BU1RFUj8KPj4gCj4gCj4gWWVzCj4gCj4+IEkgdGhpbmsgdGhhdCBtdGRfaXNfcGFydGl0aW9u
IGlzIGFtYmlndW91cyBub3cuCj4+IFdlIGFsd2F5cyBoYXZlIG1hc3RlciBwYXJ0aXRpb24gd2hl
biBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUgo+PiBpcyBlbmFibGVkIGFuZCBwYXJlbnQg
Y2hlY2sgaXMgdXNlbGVzcy4KPj4gV2UgbXVzdCBjaGVjayBncmFuZHBhcmVudCBpbiB0aGlzIGNh
c2UuCj4+IE1pcXVlbCwgYW0gSSByaWdodD8KPj4gCj4+IFdlIGNhbiByZXR1cm4gdG8gb2xkZXIg
cGF0Y2ggdmVyc2lvbiB0aGF0IGhhdmUgY3JlYXRlZCBwYXJ0aXRpb24KPj4gaW5zdGVhZCBvZiB0
aGUgbWFzdGVyIGRldmljZS4KPj4gT3IgdHJ5IHRvIGZpeCBtdGRfaXNfcGFydGl0aW9uLCBsaWtl
IGJlbG93Lgo+PiBHdWVudGVyLCBpcyBiZWxvdyBwYXRjaCBoZWxwcz8KPj4gCj4gTm8sIGl0IGRv
ZXMgbm90IG1ha2UgYSBkaWZmZXJlbmNlLiBQYXJ0aXRpb25zIGFyZSBzdGlsbCBub3QgY3JlYXRl
ZC4KCkxvb2tzIGxpa2UgYWxsIHBhcnRpdGlvbiBwYXJzaW5nIGlzIGJyb2tlbiB3aGVuIENPTkZJ
R19NVERfUEFSVElUSU9ORURfTUFTVEVSPXkgaXMgc2V0LgpBbGV4YW5kZXIsIEkgd2FzIGFibGUg
dG8gcmVwcm9kdWNlIHdpdGggTVREUkFNIGFuZCB0aGUgbXRkcGFydHM9IGtlcm5lbCBwYXJhbWV0
ZXIuCkJ1aWxkIHdpdGggQ09ORklHX01URF9NVERSQU09eSBhbmQgQ09ORklHX01URF9QQVJUSVRJ
T05FRF9NQVNURVI9eSwKcGFzcyBtdGRwYXJ0cz1cIm10ZHJhbSB0ZXN0IGRldmljZToyNTZrKGZv
bylybywtKGJhcilcIiB0byB0aGUga2VybmVsIGNvbW1hbmQgbGluZS4KCkJlZm9yZSB5b3VyIGNo
YW5nZToKJCBjYXQgL3Byb2MvbXRkIApkZXY6ICAgIHNpemUgICBlcmFzZXNpemUgIG5hbWUKbXRk
MDogMDA0MDAwMDAgMDAwMjAwMDAgIm10ZHJhbSB0ZXN0IGRldmljZSIKbXRkMTogMDAwNDAwMDAg
MDAwMjAwMDAgImZvbyIKbXRkMjogMDAzYzAwMDAgMDAwMjAwMDAgImJhciIKCkFmdGVyOgokIGNh
dCAvcHJvYy9tdGQKZGV2OiAgICBzaXplICAgZXJhc2VzaXplICBuYW1lCm10ZDA6IDAwNDAwMDAw
IDAwMDIwMDAwICJtdGRyYW0gdGVzdCBkZXZpY2UiCgpIb3BlIHRoaXMgaGVscHMhCgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
