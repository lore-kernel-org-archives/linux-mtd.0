Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F34E77188
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2024 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igQ8xx30VnB7sDKfsEyEFmLjFUmdUpGgq7sxlvzuWi8=; b=Z+cGDI5CY6cTjk
	9swADX3xfav4HMfISOTxvG4TtcJANG3m1+4PWf+rEnfJfjMkQxIuIZuK4JDQdhRBSqk82tT5ONmrw
	6wcUi8CpPeCdW5POIQGrPRpRS2iv5UdOpbk822nADuQ36ClJZ3c8Ix1Sk+va1RXezn4wZA3ko8Ipr
	pvQra8uf3av2zh+rBbJ0+q1UIYMzkexii54aYiQlsFyebr8eyFt3G7eOfviRQCw4HO4vk/0ZF2UXq
	MnUXtg0IJW321UHZ6ELOSB7n1Rfu9mo6aNrjPyFHIW3ZTn2QHCi0T/JjZHoy1qrSAN5c2mZB50pJQ
	vtLD7+0Anim75csupzrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBJX-00000004pAI-0H5J;
	Mon, 30 Dec 2024 08:39:51 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBJT-00000004p9u-1vq9
	for linux-mtd@lists.infradead.org;
	Mon, 30 Dec 2024 08:39:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1BE21C0004;
	Mon, 30 Dec 2024 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735547981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ozww/CUAveKXzP/E7/4wcHm/md9vRCr7Us26rY2MA+A=;
	b=k1Ts7EsnOUVhslaqug9Y1mJ+W7/+vN59JkNrTBxHV1CKy8mxMBkt1sI6wlvfp1AZAdLScz
	aesBssTAog9UzzYSU7SFqbopra5dM390woQO/ea7S8BbrQ/POowbPm54eVUAOq+cvFDwXT
	UZpDV5swHnlC9peA3sTziBtPVQ/xRwcV1qeJM+AFWwrXzPcDt+3D3N1NVGSM0i6pqPoUpe
	fHoTbb5fEEFJ/eQlPNwgvRjns/SDJTIzU7O/ANCp5aIW8lQWOCLAVYjmOWXn55xauY6hQc
	Kf2+dx8HWl2iACIFauqyPpeK4bZfGL5I4gAxIT14eriM2SPjljykuYuI524fKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,  "Poosa, Karthik"
 <karthik.poosa@intel.com>,  "De Marchi, Lucas" <lucas.demarchi@intel.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  "Weil, Oren jer" <oren.jer.weil@intel.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
  "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
In-Reply-To: <CY5PR11MB63663D73FA8ED331F8229AA1ED082@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Sun, 29 Dec 2024 15:08:56 +0000")
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
	<20241119140112.790720-7-alexander.usyskin@intel.com>
	<Z2H_7Xry3R2fWpMZ@intel.com>
	<24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
	<CY5PR11MB63663382E44A258B0BAEF1BAED052@CY5PR11MB6366.namprd11.prod.outlook.com>
	<CY5PR11MB6366CBE2D1AA392AD3F745F7ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
	<87cyhiqk7a.fsf@bootlin.com>
	<CY5PR11MB63663D73FA8ED331F8229AA1ED082@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 30 Dec 2024 09:39:39 +0100
Message-ID: <87o70ta7jo.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_003947_762899_33A461D3 
X-CRM114-Status: GOOD (  13.14  )
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

T24gMjkvMTIvMjAyNCBhdCAxNTowODo1NiBHTVQsICJVc3lza2luLCBBbGV4YW5kZXIiIDxhbGV4
YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPj4gCj4+IEhlbGxvIEFsZXhhbmRlciwK
Pj4gCj4+ID4+IElmIHNvLCBJIGhhdmUgdG8gYWRkIHBhdGNoIGZvciBtdGQgc3Vic3lzdGVtIHRv
IGFsd2F5cyBoYXZlIGRldmljZSBmb3IKPj4gbWFzdGVyCj4+ID4+IGluaXRpYWxpemVkIHJlZ2Fy
ZGxlc3Mgb2Yga2VybmVsIGZsYWcuCj4+ID4+IE9ubHkgdG8gaW5pdGlhbGl6ZSBzdHJ1Y3QgZGV2
aWNlLCBub3QgdG8gY3JlYXRlIGZ1bGwgbXRkIG5vZGUuCj4+ID4+Cj4+ID4+IE1pcXVlbCAtIGFy
ZSB5b3UgYWdyZWUgdG8gdGhpcz8KPj4gCj4+IENvbmNlcHR1YWxseSB5ZXMsIGJ1dCBwbGVhc2Ug
bWluZCBvbmUgdGhpbmc6IHdlIGRvIG5vdCBicmVhawo+PiB1c2Vyc3BhY2UuIFNvIGlmIHlvdSB3
YW50IHRvIGtlZXAgdGhlIG1hc3RlciBtdGQgZGV2aWNlLCBmaW5lLCBidXQgeW91Cj4+IG5lZWQg
dG8gZG8gaXQgaW4gYSBjb25zaXN0ZW50IHdheSBzbyB0aGF0IHBlb3BsZSBub3QgZW5hYmxpbmcg
dGhlIGtlcm5lbAo+PiBmbGFnIHdvbid0IGdldCBhIG5ldyBkZXZpY2UgaW4gdGhlaXIgcm9vdGZz
LCBzaGlmdGluZyBhbGwgaW5kZXhlcwo+PiB1cHdhcmRzLgo+PiAKPj4gVGhhdCBiZWluZyBzYWlk
LCB5b3UgYXJlIHByb2JhYmx5IGdvaW5nIGluIHRoZSByaWdodCBkaXJlY3Rpb24gYnkgZG9pbmcK
Pj4gdGhhdC4KPj4gCj4+IFRoYW5rcywKPj4gTWlxdcOobAo+Cj4gSSd2ZSBsb29rZWQgaW50byB0
aGlzIGVuZGVhdm91ciBhbmQgc2VlbWVkIHRoYXQgdGhlcmUgYSBuZWVkIGZvciBzcGVjaWFsCj4g
ZGV2aWNlIGNsYXNzIGFuZCBjYXJlZnVsIGF0dGVudGlvbiBpbiByZWxlYXNlIGZsb3cgdG8gdXNl
IHJpZ2h0IGNsYXNzLgo+IEl0IHdpbGwgdGFrZSB0aW1lIHRvIGRvIHJpZ2h0Lgo+IE1pcXVlbCwg
Um9kcmlnbywgS2FydGhpaywgTHVjYXMgLSBtYXkgdGhlIERHIE5WTSBjb2RlIGJlIG1lcmdlZCBp
biB0aGUgY3VycmVudAo+IGZvcm0gYW5kIHRoaXMgZGV2aWNlIGJlIGFkZGVkIGxhdGVyPwoKSW4g
Z2VuZXJhbCwgeWVzLiBCdXQgbWF5YmUgeW91IHdhbnQgdG8gc2VsZWN0CkNPTkZJR19NVERfUEFS
VElUSU9ORURfTUFTVEVSIChJSVVDIHlvdXIgcHJvYmxlbSkuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
