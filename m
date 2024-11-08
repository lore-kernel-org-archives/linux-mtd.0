Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3D5D5E145
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2024 09:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhufC+iXYz3A6lXSZaCF61jVbPqQkwJwkKjY52a+IOw=; b=B7VCmggFGePmOo
	eLvp4EcwcVAELwlGTWqcwgSqRbblbbC0rHtDOZK2c+j+AivX9AFV1WyXP5XQkDiBOvhPOebotUMwG
	MwZbIsCSJrWuFq8e53Xsmne/4QyUAp/nrWafOe6aj0k3NI/wqh4rYZUMG9ZEBQ4SuVv2/oh0aHhHG
	bUGyzE9/+VO/zL4s20WX/bfqsMMbIGhD24IEqDxxylbY4PRd9xw6MirRgduWCiUZzqo7KTT0SVYws
	RdhIVVZo7RfUmdxtGB5TS4fVd0kqeoe3YW7a7Rc4aloKBTgIBgElVbwyfh/wH3OeCNqZ82qadPFcx
	K5gRviP7xEh4PXDv5qsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KyH-00000009uIa-2K5Q;
	Fri, 08 Nov 2024 09:08:01 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Krp-00000009sjH-1xbI
	for linux-mtd@lists.infradead.org;
	Fri, 08 Nov 2024 09:01:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB0E01BF206;
	Fri,  8 Nov 2024 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731056478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xm3UhMCd7zn0wf/NB/NpG8HDn8ZRdu/b34t338J+8xk=;
	b=QztMvHcL/LJyrVDUjANfvRSEswWgGPCBkv8uGEXEF5EpfVhacT90xYLK/fwUPj2/au1Tc3
	1kh4DFm1qrJD/IV8wBboJjVIHQleo2/noYXHVSj16eJsENavfZmk1SsWmfowSgsSLPfavk
	phoOMfYt1+uV5mwHNLWE7Uhf/KujTA3RdCjpBF9mXa7ugfbiBd0ygDjVIOMZTYf5yTZ12/
	/oYn9/UfoHVdXU+OSnEKkoxw3iYpgtwPRZmg+NDNQZEip+rkelvRp8lva1M2fJRofpKpS8
	3U6vTMUP93+AAK89JLssHwaAi7z29pUaKMK4z+2+4qbL5LsfSdJhj+LIGLD6Kg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,  "Gupta, Anshuman"
 <anshuman.gupta@intel.com>,  "Deak, Imre" <imre.deak@intel.com>,  "Richard
 Weinberger" <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  "Weil, Oren jer" <oren.jer.weil@intel.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
  "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/10] mtd: intel-dg: wake card on operations
In-Reply-To: <Zy1EAIPEaY8Wlh-h@intel.com> (Rodrigo Vivi's message of "Thu, 7
	Nov 2024 17:49:36 -0500")
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
	<20241022104119.3149051-7-alexander.usyskin@intel.com>
	<Zx-mPQSHXv5Teq_j@intel.com>
	<CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
	<CY5PR11MB6366EF9CA6552ADF6E01A557ED4B2@CY5PR11MB6366.namprd11.prod.outlook.com>
	<Zyk5kueKlusKlwqM@intel.com>
	<CY5PR11MB636622B23A3646D58A70A920ED522@CY5PR11MB6366.namprd11.prod.outlook.com>
	<Zy1EAIPEaY8Wlh-h@intel.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Fri, 08 Nov 2024 10:01:15 +0100
Message-ID: <87cyj6aylg.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_010121_820896_2E9CB513 
X-CRM114-Status: GOOD (  15.01  )
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

Cj4+ID4gVGhhdCdzIHRoZSBwYXJ0IHRoYXQgSSdtIG5vdCBzdXJlIGlmIEkgYWdyZWUuIGlmIEkg
cmVtZW1iZXIgZnJvbSBzb21lCj4+ID4gZXhwZXJpbWVudHMgaW4gdGhlIHBhc3QsCj4+ID4gd2hl
biB5b3UgY2FsbCB0byB3YWtlIHVwIHRoZSBjaGlsZCwgdGhlIHBhcmVudCB3aWxsIHdha2V1cCBm
aXJzdCBhbnl3YXkuCj4+ID4gCj4+IFRoZSBjaGlsZCAobXRkIGRldmljZSkgZG9lcyBub3QgZXhp
c3QgYXQgdGhpcyBwb2ludCBvZiB0aW1lLgo+PiBUbyBjcmVhdGUgTVREIGRldmljZSwgdGhlIHBh
cnRpdGlvbiB0YWJsZSBzaG91bGQgYmUgcHJvdmlkZWQKPj4gYW5kIGl0IHJlYWQgZGlyZWN0bHkg
ZnJvbSBmbGFzaCB0aGF0IHNob3VsZCBiZSBwb3dlcmVkIHRvIGRvIHJlYWQuCj4KPiBJIGRvbid0
IHVuZGVyc3RhbmQuLi4geW91IGhhdmUgdGhlIG10ZC0+ZGV2IGF0IHRoaXMgcG9pbnQuLi4gdGhp
cyBpcwo+IHRoZSBvbmUgeW91IHNob3VsZCBiZSB0b3VjaGluZywgbm90IHRoZSBtdGQtPmRldi5w
YXJlbnQuLi4gZXZlbiBhdCB0aGUKPiBwcm9iZSwgYnV0IG1vcmVvdmVyIG9uIGV2ZXJ5d2hlcmUg
ZWxzZSBhcyB3ZWxsLgo+Cj4+IAo+PiA+ID4gQ29uc2lkZXJpbmcgYWJvdmUsIGlzIHRoaXMgbW92
ZSBpcyBqdXN0aWZpZWQ/Cj4+ID4gPiBBbHNvLCBNVEQgZHJpdmVycyB0ZW5kIHRvIGVuYWJsZSBw
YXJlbnQgcnBtLCBub3QgaXRzIG93biBvbmUuCj4+ID4gCj4+ID4gV2hhdCBvdGhlciBkcml2ZXJz
IGFyZSB5b3UgbG9va2luZyBmb3IgcmVmZXJlbmNlPwo+PiAKPj4gZHJpdmVycy9tdGQvbmFuZC9y
YXcvdGVncmFfbmFuZC5jCj4+IGRyaXZlcnMvbXRkL25hbmQvcmF3L3JlbmVzYXMtbmFuZC1jb250
cm9sbGVyLmMKPj4gZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWNvcmUuYwo+Cj4gSSBzZWUgdGhl
eSBnZXR0aW5nIHBkZXYtPmRldi4uLiBub3QgdGhlIHBhcmVudC4uLgoKVGhhdCdzIHRocmVlIGRy
aXZlcnMgd2hlcmUgdGhlcmUgaXMgcHJvYmFibHkgcm9vbSBmb3IgaW1wcm92ZW1lbnQuCgpUaGVz
ZSBkaWZmZXJlbmNlcyBhcmUgc3VidGxlIGFuZCBsaWtlbHkgdW4tY2F0Y2ggZHVyaW5nIHJldmll
dy4gRmVlbApmcmVlIHRvIGNvcnJlY3QgdGhlIGRyaXZlcnMgaWYgeW91IHRoaW5rIHRoZXkgYXJl
IHdyb25nIGFuZCBtb3JlCmltcG9ydGFudGx5LCBkbyB0aGUgY29ycmVjdCB0aGluZyBpbiB5b3Vy
IG93bi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
