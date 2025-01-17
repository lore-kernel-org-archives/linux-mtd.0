Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB981C02183
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2025 22:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pjlO72Wr0GgHY8jZGtIFK3xe4pe15T8fr/Hbd7KBNT8=; b=3uY/7peIyVKFkmmbCdCFpwYKY3
	mSPOczL2tFYb0QolDwk7Fa/vpcmbFJ7SDGm+lbLCh3N1Y29gHBwvBVkItmNh6hH4LWHvQEOr0IZQf
	jCk4Md4GmYAEw39apW7dBgPd9djRGU5Hg/srhqK+nhlDCGZo6egJ3XsGj2wiWrfvyFOOs369BZKCS
	fa1y+MuXyM1PrmuiF/wnuqGvtETorGom12ow6iBlQmB6/ldD+jic7eKW3EuquTBPV7w14Am/3UaWO
	o7wueWPAH3ZSKi3ihxWJJD+qIkMF7wkM0NWC/oH1l5K9kl6qQzNLp5QjlyTZaGkhdQZHclKBD5SiH
	4iKXyEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYuoN-00000001TVR-01rS;
	Fri, 17 Jan 2025 22:27:31 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYuoK-00000001TUB-1bAy
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jan 2025 22:27:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0DFA02BA969;
	Fri, 17 Jan 2025 23:27:17 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id PKRyMU3k07_p; Fri, 17 Jan 2025 23:27:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9F2942BA97A;
	Fri, 17 Jan 2025 23:27:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id w4ahg7LEgjAo; Fri, 17 Jan 2025 23:27:16 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 67B8E2BA969;
	Fri, 17 Jan 2025 23:27:16 +0100 (CET)
Date: Fri, 17 Jan 2025 23:27:16 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Alexander Usyskin <alexander.usyskin@intel.com>
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
Message-ID: <677101004.241399779.1737152836282.JavaMail.zimbra@nod.at>
In-Reply-To: <CY5PR11MB63660C230457299E1201C38FED1A2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com> <20250101153925.865703-2-alexander.usyskin@intel.com> <78709125.231818577.1736980238251.JavaMail.zimbra@nod.at> <CY5PR11MB63660C230457299E1201C38FED1A2@CY5PR11MB6366.namprd11.prod.outlook.com>
Subject: Re: [PATCH v4 01/11] mtd: core: always create master device
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: AQHbXGTq3Ynz/rfH2UqisY27+I2b+LMYgWoAgACDNgDMz5OtTg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_142728_565888_3693E975 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiA+IFRoaXMgc3RyZWFtbGluZXMgZGV2
aWNlIHRyZWUgYW5kIGFsbG93cyB0byBhbmNob3IKPj4gPiBydW50aW1lIHBvd2VyIG1hbmFnZW1l
bnQgb24gbWFzdGVyIGRldmljZSBpbiBhbGwgY2FzZXMuCj4+IAo+PiBQbGVhc2UgZXhwbGFpbiBp
biBtb3JlIGRldGFpbCB3aHkgdGhpcyBpcyBuZWVkZWQuCj4+IElmIHRoaXMgY2hhbmdlIG1ha2Vz
IHRoZSBvdmVyYWxsIHNpdHVhdGlvbiBiZXR0ZXIgYW5kIGJyZWFrcwo+PiBubyB1c2Vyc3BhY2Us
IEknbSBoYXBweS4gOi0pCj4+IAo+IAo+IFRoZSByZXN0IG9mIHRoZSBzZXJpZXMgaXMgYSBkcml2
ZXIgdGhhdCBuZWVkIHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudC4KPiBBYnNlbmNlIG9mIHRoZSBt
YXN0ZXIgZGV2aWNlIGJyZWFrcyBwb3dlciBtYW5hZ2VtZW50IGxvZ2ljLAo+IGFzIGtlcm5lbCBh
dXRvbWF0aWNhbGx5IHByb3BhZ2F0ZXMgc3RhdGUgZnJvbSBjaGlsZHJlbiB0byBwYXJlbnQuCj4g
SSBpbml0aWFsbHkgaG9va2VkIHJ1bnRpbWVfcG0gb24gY2hpcCBhdXhpbGlhcnkgZGV2aWNlLCBi
dXQgdGhpcyBpcyBhIGhhY2ssCj4gbm90IGEgc29sdXRpb24uCgpTbywgdGhlIHByb2JsZW0gaXMg
dGhhdCBtdGQgcGFydGl0aW9ucyBkb24ndCBoYXZlIGEgY29tbW9uIHBhcmVudC9tYXN0ZXIgbGlr
ZQp3ZSBoYXZlIGZvciBnZW5lcmljIGRpc2tzPwpQbGVhc2UgZ2l2ZSBtb3JlIGRldGFpbHMuCldl
IGhhdmUgYWxyZWFkeSBhIG5vbi1vcHRpbWFsIHNpdHVhdGlvbiBpbiBtdGQgYW5kIEkgd2FudCB0
byBmdWxseSB1bmRlcnN0YW5kCnRoZSByZXF1aXJlbWVudHMgdG8gZ2V0IGl0IHRoaXMgdGltZSBy
aWdodC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
