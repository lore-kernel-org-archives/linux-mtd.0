Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6090C71136
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZW2rxXFgraD2UT2YwyZo/TA7X6XAu10rA0UALPN9BZ0=; b=DTwnFMu8yQuwAV
	F0rUKRYvEXJdO5V8upd8YKFg/dtNLyMjKXuQ36eLUzKAHQOBPG5Bwl4VQvK2i3/G8bYv8JaNUzOwj
	KAAUo/55/wK/aAiu8YNZLS6LJqWiQ6WB9oafQQVDIlzH5KWhiuIBD34RvtaPu0P9EM73twn4JD6HY
	WnjQGYQZN3lUs7OS0gNRqR+rr53qne1jC1H0zWtFus4S6nd63NvK5toE8ZM65PsVwNIiGd3oQs413
	Wy6GVWMPTDkss7xo2lhN4yRF+IKDOw3JcMxlKYsnmMdQvnZaDvP3XX1+0OX/VwPuAHprKIvKWKou1
	AX/A4Ew+fAc0lTaDuipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRVw-0000000B0cE-2RYT;
	Wed, 11 Jun 2025 19:53:36 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpV-0000000AHMe-3wdh
	for linux-mtd@lists.infradead.org;
	Wed, 11 Jun 2025 14:53:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07743431EB;
	Wed, 11 Jun 2025 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749653607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJu5NSgqNOml+9Lox7VvY57DB9A7wKSyNIB2QDnPsGk=;
	b=OBVtex+PPJ9C5YrO63rD52e2cVGsu/uqOLAY/L5dVGBbk36SdtmKeU5z7a8gjyDMv+3FaT
	TX/XWmjIZZOc04r1YF58J0UZmzld+Dkri6ScFCWleeIP6lbmHq868ldlq00T+fx8gJgkyI
	k8hI2/zz6hZhcjDqGHWI3Vyphrs88/33hARFhOWkdMAty3Q8ddiC4Q71ZFC+WQw/ZvU7oL
	ClgB+Dqt0esvCGIidbCkKPeUDdP7/pboiTDjIH1fcRy78yYoCwHyJMVFxSjAsdluxEF9cD
	sKyqBcqTttiLXgUfWXVTiRLrRFVDpN5Ap4ZpdRVu8OAa/540HM9YNp4iXMGjYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Guenter Roeck
 <linux@roeck-us.net>,  Vignesh Raghavendra <vigneshr@ti.com>,  "De Marchi,
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
  linux-mtd <linux-mtd@lists.infradead.org>,  "DRI mailing list"
 <dri-devel@lists.freedesktop.org>,  intel-gfx
 <intel-gfx@lists.freedesktop.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
In-Reply-To: <CY5PR11MB636692EFD9BB99B6F2D959BFED75A@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Wed, 11 Jun 2025 10:52:36 +0000")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
	<CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
	<1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
	<CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
	<c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
	<877c1ivcym.fsf@bootlin.com>
	<1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at>
	<CY5PR11MB636692EFD9BB99B6F2D959BFED75A@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 11 Jun 2025 16:53:24 +0200
Message-ID: <87y0tytjmj.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteehkeelvddvheehtdefkedtjeeutedthfegudekgeefleetkeettdekiefftdeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheprghlvgigrghnuggvrhdruhhshihskhhinhesihhnthgvlhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehin
 hhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhhvghllhhsthhrohhmsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_075330_485223_6D779A50 
X-CRM114-Status: GOOD (  28.42  )
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

SGVsbG8sCgpPbiAxMS8wNi8yMDI1IGF0IDEwOjUyOjM2IEdNVCwgIlVzeXNraW4sIEFsZXhhbmRl
ciIgPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4gd3JvdGU6Cgo+PiBTdWJqZWN0OiBSZTog
W1BBVENIIHY2IDAxLzExXSBtdGQ6IGNvcmU6IGFsd2F5cyBjcmVhdGUgbWFzdGVyIGRldmljZQo+
PiAKPj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiA+IFZvbjogIk1pcXVlbCBS
YXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiA+PiBPbiA2LzEwLzI1IDA1OjU0
LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+ID4+PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBN
YWlsIC0tLS0tCj4+ID4+Pj4gVm9uOiAiQWxleGFuZGVyIFVzeXNraW4iIDxhbGV4YW5kZXIudXN5
c2tpbkBpbnRlbC5jb20+Cj4+ID4+Pj4gUmljaGFyZCwgSSd2ZSByZXByb2R1Y2VkIHlvdXIgc2V0
dXAgKG1vZHVsbyB0aGF0IEkgbXVzdCBsb2FkIG10ZHJhbQo+PiBtYW51YWxseSkKPj4gPj4+PiBh
bmQgcGF0Y2ggcHJvdmlkZWQgaW4gdGhpcyB0aHJlYWQgaGVscHMgdG8gZml4IHRoZSBpc3N1ZS4K
Pj4gPj4+PiBDYW4geW91IGFwcGx5IGFuZCBjb25maXJtPwo+PiA+Pj4gWWVzLCBpdCBmaXhlcyB0
aGUgaXNzdWUgaGVyZSEgOi0pCj4+ID4+Pgo+PiA+Pgo+PiA+PiBJdCBkb2Vzbid0IHNlZW0gdG8g
Zml4IHRoZSBpc3N1ZSBpZiB0aGUgcGFydGl0aW9uIGRhdGEgaXMgaW4KPj4gPj4gZGV2aWNldHJl
ZS4KPj4gPgo+PiA+IEkgaGFkIGEgbG9vayBhdCB0aGUgcGF0Y2ggYWdhaW4uIFRoZSB3aG9sZSBt
dGQgY29yZSBtYWtlcyBhc3N1bXB0aW9ucyBvbgo+PiA+IHBhcmVudGluZywgd2hpY2ggaXMgdG90
YWxseSBjaGFuZ2VkIHdpdGggdGhpcyBwYXRjaC4gVGhlcmUgYXJlIHNvIG1hbnkKPj4gPiBjcmVh
dGl2ZSB3YXlzIHRoaXMgY2FuIGJyZWFrLCBJIGRvbid0IGJlbGlldmUgd2UgYXJlIGdvaW5nIHRv
IGNvbnRpbnVlCj4+ID4gdGhpcyByb3V0ZS4gSSBwcm9wb3NlIHRvIHJldmVydCB0aGUgcGF0Y2gg
ZW50aXJlbHkgZm9yIG5vdy4gV2UgbmVlZCB0bwo+PiA+IGZpbmQgYW5vdGhlciBhcHByb2FjaCwg
SSdtIHNvcnJ5Lgo+PiAKPj4gSSB0aGluayByZXZlcnRpbmcgaXMgYSB2YWxpZCBvcHRpb24gdG8g
Y29uc2lkZXIgaWYgdGhlIGlzc3VlIHR1cm5zIG91dCB0byBiZQo+PiBhICJiYWNrIHRvIHRoZSBk
cmF3aW5nIGJvYXJkIiBwcm9ibGVtLgo+PiAKPj4gPiBBbGV4YW5kZXIsIGNhbiB5b3UgcGxlYXNl
IHJlbWluZCBtZSB3aGF0IHdhcyB5b3VyIGluaXRpYWwgcHJvYmxlbT8gSQo+PiA+IGJlbGlldmUg
eW91IG5lZWRlZCB0byBhbmNob3IgcnVudGltZSBQTSBvbiB0aGUgbWFzdGVyIGRldmljZS4gQ2Fu
IHlvdQo+PiA+IHBsZWFzZSBlbGFib3JhdGUgYWdhaW4/IFdoeSB0YWtpbmcgdGhlIGNvbnRyb2xs
ZXIgYXMgc291cmNlICh0aGUKPj4gPiBkZWZhdWx0LCBiZWZvcmUgeW91ciBjaGFuZ2UpIGRpZCBu
b3Qgd29yaz8gQWxzbyB3aHkgd2FzIHNlbGVjdGluZwo+PiA+IE1URF9QQVJUSVRJT05FRF9NQVNU
RVIgbm90IGFuIG9wdGlvbiBmb3IgeW91PyBJJ20gdHJ5aW5nIHRvIGdldCB0byB0aGUKPj4gPiBy
b290IG9mIHRoaXMgY2hhbmdlIGFnYWluLCBzbyB3ZSBjYW4gZmluZCBhIHNvbHV0aW9uIGZpeGlu
ZyAidGhlIHdvcmxkIgo+PiA+IChmYXN0KSBhbmQgaW4gYSBzZWNvbmQgdGltZSBhIHdheSB0byBh
ZGRyZXNzIHlvdXIgcHJvYmxlbS4KPj4gCj4+IElJUkMgdGhlIHByb2JsZW0gaXMgdGhhdCBkZXBl
bmRpbmcgb24gQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIKPj4gd29uJ3QgZmx5IGFzIFBN
IG5lZWRzIHRvIHdvcmsgd2l0aCBhbnkgY29uZmlndXJhdGlvbi4KPj4gQW5kIGVuZm9yY2luZyBD
T05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiB3aWxsIGJyZWFrIGV4aXN0aW5nCj4+IHNldHVw
cyBiZWNhdXNlIG10ZCBpZCdzIHdpbGwgY2hhbmdlLgo+PiAKPj4gT24gdGhlIG90aGVyIGhhbmQs
IGhvdyBhYm91dCBwbGFjaW5nIHRoZSBtYXN0ZXIgZGV2aWNlIGF0IHRoZSBlbmQKPj4gb2YgdGhl
IGF2YWlsYWJsZSBtdGQgaWQgc3BhY2UgaWYgQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVI9
bj8KPj4gQSBiaXQgaGFja3kgYnV0IElNSE8gd29ydGggYSB0aG91Z2h0Lgo+PiAKPj4gVGhhbmtz
LAo+PiAvL1JpY2hhcmQKPgo+IFRoZSBvcmlnaW5hbCBwcm9ibGVtIHdhcyB0aGF0IGdlbmVyYWwg
cHVycG9zZSBPUyBuZXZlciBzZXQKPiBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiBhbmQg
d2UgbmVlZCB2YWxpZCBkZXZpY2UgdHJlZQo+IHRvIHBvd2VyIG1hbmFnZW1lbnQgdG8gd29yay4K
Pgo+IFdlIGNhbiByZXR1cm4gdG8gVjcgb2YgdGhpcyBwYXRjaCB0aGF0IG9ubHkgY3JlYXRlcyBk
dW1teSBtYXN0ZXIgaWYKPiBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiBpcyBvZmYuCj4g
SW4gdGhpcyBjYXNlIHRoZSBoaWVyYXJjaHkgcmVtYWlucyB0aGUgc2FtZS4KPgo+IE1pcXVlbCwg
Y2FuIHlvdSByZS1yZXZpZXcgdjcgYW5kIHNheSBpZiBpdCB3b3J0aCB0byByZXZlcnQgY3VycmVu
dCB2ZXJzaW9uIGFuZAo+IHB1dCB2NyBpbnN0ZWFkPwoKQWZ0ZXIgdGFraW5nIGluc3BpcmF0aW9u
IGZyb20gUmljaGFyZCdzIHdpc2RvbSBvbiBJUkMsIHdlIGhhdmUgYW5vdGhlcgpwcm9wb3NhbC4g
TGV0J3MgZHJvcCB0aGUgbXRkX21hc3RlciBjbGFzcy4gV2UgbmVlZCBhbiBtdGQgZGV2aWNlIHRv
IGJlCnRoZSBtYXN0ZXIgZGV2aWNlLCB3ZSBhbHJlYWR5IGhhdmUgb25lIGJ1dCB3ZSBjYW5ub3Qg
a2VlcCAqYXQgdGhlCmJlZ2lubmluZyogb2YgdGhlIElEIHNwYWNlIHVuZGVyIHRoZSBDT05GSUdf
TVREX1BBUlRJVElPTkVEX01BU1RFUj1uCmNvbmZpZ3VyYXRpb24gdG8gYXZvaWQgYnJlYWtpbmcg
dXNlcnNwYWNlLiBTbyBsZXQncyBrZWVwIHRoZSBtYXN0ZXIKYW55d2F5LCB3aXRoIHRoZSBmb2xs
b3dpbmcgc3BlY2lmaWNpdGllcyBpbiB0aGUgcHJvYmxlbWF0aWMgY2FzZToKLSBpZCBpcyBhbGxv
Y2F0ZWQgZnJvbSB0aGUgbWF4IHZhbHVlIGRvd253YXJkcyAoYXZvaWRzIG1lc3Npbmcgd2l0aAog
IG51bWJlcmluZykKLSBtdGQgZGV2aWNlIGlzIHNpbXBseSBoaWRkZW4gKHNhbWUgdXNlciBleHBl
cmllbmNlIGFzIGJlZm9yZSkKCkFwcGFyZW50bHkgdGhpcyBzZWNvbmQgcG9pbnQsIHdoaWxlIG5v
dCBuYXRpdmVseSBzdXBwb3J0ZWQsIGlzIHNvbWV0aGluZwp0aGUgYmxvY2sgd29ybGQgYWxyZWFk
eSBkb2VzOgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNS4xL3NvdXJjZS9p
bmNsdWRlL2xpbnV4L2Jsa2Rldi5oI0w4OAoKV2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
