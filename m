Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD46C71137
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f0v/kgEnAYQqDwygvxmERvG6ONQ+37yn9tXQLZX44Vs=; b=K36qoN1F26rv4viDvrUj3hjaj4
	JrsyPfjT4R3AugSJUjul2rQOtGCKhllZMRGatVaCjfv9eVYwo6SuFOUnMe9S+wTHxm1R/rm8tpBV2
	n+57YEt0ENBVnuphdQ0bl8hJkb2Pup/8GmBg5fY90AtYy2Z4DbLZDNxmELGFdzYohZViOvQMdanEz
	zeas5rWAYA4Al1gT8ueS2q5WdRYxCjs2HJJO5kFyXHiqX2MTcmz3TqN1TnU4Jxgrh/pxL99+zfOck
	zwriHZSLRKEns1zHSnG2guYf53Zoh0PIMrNRPOhPbiWsmxiJyaCa6hjXjfrsJjnYnEk1jCs7k8pHZ
	e/V6JeIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmE-0000000ATEs-3sJ0;
	Wed, 11 Jun 2025 15:54:10 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIfN-00000009c5k-2ASa
	for linux-mtd@lists.infradead.org;
	Wed, 11 Jun 2025 10:26:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0BADA298569;
	Wed, 11 Jun 2025 12:26:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 5-8g9srQQ1ss; Wed, 11 Jun 2025 12:26:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4754329856B;
	Wed, 11 Jun 2025 12:26:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Er3YZUgwoz17; Wed, 11 Jun 2025 12:26:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1062B298569;
	Wed, 11 Jun 2025 12:26:33 +0200 (CEST)
Date: Wed, 11 Jun 2025 12:26:32 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
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
Message-ID: <1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at>
In-Reply-To: <877c1ivcym.fsf@bootlin.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com> <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com> <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net> <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at> <CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com> <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at> <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net> <877c1ivcym.fsf@bootlin.com>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: 1HQqhqcLtEdhoRxzAvXExqJX+VZLOg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_032645_868971_07DE14C5 
X-CRM114-Status: GOOD (  15.79  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBPbiA2LzEwLzI1IDA1OjU0LCBSaWNoYXJkIFdl
aW5iZXJnZXIgd3JvdGU6Cj4+PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+Pj4g
Vm9uOiAiQWxleGFuZGVyIFVzeXNraW4iIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+Cj4+
Pj4gUmljaGFyZCwgSSd2ZSByZXByb2R1Y2VkIHlvdXIgc2V0dXAgKG1vZHVsbyB0aGF0IEkgbXVz
dCBsb2FkIG10ZHJhbSBtYW51YWxseSkKPj4+PiBhbmQgcGF0Y2ggcHJvdmlkZWQgaW4gdGhpcyB0
aHJlYWQgaGVscHMgdG8gZml4IHRoZSBpc3N1ZS4KPj4+PiBDYW4geW91IGFwcGx5IGFuZCBjb25m
aXJtPwo+Pj4gWWVzLCBpdCBmaXhlcyB0aGUgaXNzdWUgaGVyZSEgOi0pCj4+PiAKPj4KPj4gSXQg
ZG9lc24ndCBzZWVtIHRvIGZpeCB0aGUgaXNzdWUgaWYgdGhlIHBhcnRpdGlvbiBkYXRhIGlzIGlu
Cj4+IGRldmljZXRyZWUuCj4gCj4gSSBoYWQgYSBsb29rIGF0IHRoZSBwYXRjaCBhZ2Fpbi4gVGhl
IHdob2xlIG10ZCBjb3JlIG1ha2VzIGFzc3VtcHRpb25zIG9uCj4gcGFyZW50aW5nLCB3aGljaCBp
cyB0b3RhbGx5IGNoYW5nZWQgd2l0aCB0aGlzIHBhdGNoLiBUaGVyZSBhcmUgc28gbWFueQo+IGNy
ZWF0aXZlIHdheXMgdGhpcyBjYW4gYnJlYWssIEkgZG9uJ3QgYmVsaWV2ZSB3ZSBhcmUgZ29pbmcg
dG8gY29udGludWUKPiB0aGlzIHJvdXRlLiBJIHByb3Bvc2UgdG8gcmV2ZXJ0IHRoZSBwYXRjaCBl
bnRpcmVseSBmb3Igbm93LiBXZSBuZWVkIHRvCj4gZmluZCBhbm90aGVyIGFwcHJvYWNoLCBJJ20g
c29ycnkuCgpJIHRoaW5rIHJldmVydGluZyBpcyBhIHZhbGlkIG9wdGlvbiB0byBjb25zaWRlciBp
ZiB0aGUgaXNzdWUgdHVybnMgb3V0IHRvIGJlCmEgImJhY2sgdG8gdGhlIGRyYXdpbmcgYm9hcmQi
IHByb2JsZW0uCiAKPiBBbGV4YW5kZXIsIGNhbiB5b3UgcGxlYXNlIHJlbWluZCBtZSB3aGF0IHdh
cyB5b3VyIGluaXRpYWwgcHJvYmxlbT8gSQo+IGJlbGlldmUgeW91IG5lZWRlZCB0byBhbmNob3Ig
cnVudGltZSBQTSBvbiB0aGUgbWFzdGVyIGRldmljZS4gQ2FuIHlvdQo+IHBsZWFzZSBlbGFib3Jh
dGUgYWdhaW4/IFdoeSB0YWtpbmcgdGhlIGNvbnRyb2xsZXIgYXMgc291cmNlICh0aGUKPiBkZWZh
dWx0LCBiZWZvcmUgeW91ciBjaGFuZ2UpIGRpZCBub3Qgd29yaz8gQWxzbyB3aHkgd2FzIHNlbGVj
dGluZwo+IE1URF9QQVJUSVRJT05FRF9NQVNURVIgbm90IGFuIG9wdGlvbiBmb3IgeW91PyBJJ20g
dHJ5aW5nIHRvIGdldCB0byB0aGUKPiByb290IG9mIHRoaXMgY2hhbmdlIGFnYWluLCBzbyB3ZSBj
YW4gZmluZCBhIHNvbHV0aW9uIGZpeGluZyAidGhlIHdvcmxkIgo+IChmYXN0KSBhbmQgaW4gYSBz
ZWNvbmQgdGltZSBhIHdheSB0byBhZGRyZXNzIHlvdXIgcHJvYmxlbS4KCklJUkMgdGhlIHByb2Js
ZW0gaXMgdGhhdCBkZXBlbmRpbmcgb24gQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIKd29u
J3QgZmx5IGFzIFBNIG5lZWRzIHRvIHdvcmsgd2l0aCBhbnkgY29uZmlndXJhdGlvbi4KQW5kIGVu
Zm9yY2luZyBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiB3aWxsIGJyZWFrIGV4aXN0aW5n
CnNldHVwcyBiZWNhdXNlIG10ZCBpZCdzIHdpbGwgY2hhbmdlLgoKT24gdGhlIG90aGVyIGhhbmQs
IGhvdyBhYm91dCBwbGFjaW5nIHRoZSBtYXN0ZXIgZGV2aWNlIGF0IHRoZSBlbmQKb2YgdGhlIGF2
YWlsYWJsZSBtdGQgaWQgc3BhY2UgaWYgQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVI9bj8K
QSBiaXQgaGFja3kgYnV0IElNSE8gd29ydGggYSB0aG91Z2h0LgoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
