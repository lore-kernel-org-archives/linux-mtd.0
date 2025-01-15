Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B97C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 22:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6ZdLRQqFl8IqDfTgafdsPxZiYMHeMqXewXAsIzYz9cw=; b=06GstlWgsb2XV2QVDJnfBabQQg
	lJlSWSsl/aTA7dNKsXSsW0FOVoGKf2R0aeBQeXq2EHyZNxl8n6IcjU3i6CY2wFAzB4KcvzBAY+5lo
	wwQI+e0u51FIVgGjEdHIt8rOS4kkDJCAROsuK5RGoh05uQwQXaKLZjEQKFVS39gnGGS1A803zHXL4
	nkw7Nqk4AJ/MD0m/9C6z6nSJvcB76V/QLKDQ4zHK4AqtEiDvKfFYL2MIuAkk9PIoU7d7LsM7lskey
	EeoH8/h09/mjzHu2G6lM+8zx4tFgpq9Di4LmvYN5N4jNHB6JxazXfj0sOokowYCGIRST9jtjsw37l
	4Kh0SXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYBuR-0000000DFY8-058n;
	Wed, 15 Jan 2025 22:30:47 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYBuO-0000000DFWH-1Zqh
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 22:30:46 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 366172A7F6C;
	Wed, 15 Jan 2025 23:30:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xJ8tDHd-QsCG; Wed, 15 Jan 2025 23:30:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A192C2A7F73;
	Wed, 15 Jan 2025 23:30:38 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VX5lZQl7DxbL; Wed, 15 Jan 2025 23:30:38 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6BDAE2A7F6C;
	Wed, 15 Jan 2025 23:30:38 +0100 (CET)
Date: Wed, 15 Jan 2025 23:30:38 +0100 (CET)
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
Message-ID: <78709125.231818577.1736980238251.JavaMail.zimbra@nod.at>
In-Reply-To: <20250101153925.865703-2-alexander.usyskin@intel.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com> <20250101153925.865703-2-alexander.usyskin@intel.com>
Subject: Re: [PATCH v4 01/11] mtd: core: always create master device
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: C6s+HB4y1QOCkRTVyeRkXaeBPdTLsQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_143044_698465_33B43709 
X-CRM114-Status: UNSURE (   7.59  )
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

QWxleGFuZGVyLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkFsZXhh
bmRlciBVc3lza2luIiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPgo+IENyZWF0ZSBtYXN0
ZXIgZGV2aWNlIHdpdGhvdXQgcGFydGl0aW9uIHdoZW4KPiBDT05GSUdfTVREX1BBUlRJVElPTkVE
X01BU1RFUiBmbGFnIGlzIHVuc2V0Lgo+IAo+IFRoaXMgc3RyZWFtbGluZXMgZGV2aWNlIHRyZWUg
YW5kIGFsbG93cyB0byBhbmNob3IKPiBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQgb24gbWFzdGVy
IGRldmljZSBpbiBhbGwgY2FzZXMuCgpQbGVhc2UgZXhwbGFpbiBpbiBtb3JlIGRldGFpbCB3aHkg
dGhpcyBpcyBuZWVkZWQuCklmIHRoaXMgY2hhbmdlIG1ha2VzIHRoZSBvdmVyYWxsIHNpdHVhdGlv
biBiZXR0ZXIgYW5kIGJyZWFrcwpubyB1c2Vyc3BhY2UsIEknbSBoYXBweS4gOi0pCgpGcm9tIHNr
aW1taW5nIG92ZXIgdGhlIHBhdGNoIEkgdGhpbmsgdGhlIG10ZF9tYXN0ZXIgZGV2aWNlIGNvbXBs
ZXRlbHkKdXNlbGVzcyBmb3IgdXNlcnNwYWNlLCByaWdodD8KCj4gaW50IGFkZF9tdGRfZGV2aWNl
KHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+IHsKPiAJc3RydWN0IGRldmljZV9ub2RlICpucCA9IG10
ZF9nZXRfb2Zfbm9kZShtdGQpOwo+IAlzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9nZXRf
bWFzdGVyKG10ZCk7Cj4gCXN0cnVjdCBtdGRfbm90aWZpZXIgKm5vdDsKPiArCWJvb2wgcGFydGl0
aW9uZWQgPSB0cnVlOwo+IAlpbnQgaSwgZXJyb3IsIG9maWR4Owo+IAo+IAkvKgo+IEBAIC02NTUs
NiArNjc4LDExIEBAIGludCBhZGRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAJ
aWYgKFdBUk5fT05DRShtdGQtPmRldi50eXBlLCAiTVREIGFscmVhZHkgcmVnaXN0ZXJlZFxuIikp
Cj4gCQlyZXR1cm4gLUVFWElTVDsKPiAKPiArCWlmICgobWFzdGVyID09IG10ZCkgJiYgIUlTX0VO
QUJMRUQoQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIpKSB7Cj4gKwkJcGFydGl0aW9uZWQg
PSBmYWxzZTsKPiArCQlwcl9kZWJ1ZygibXRkOiB1bnBhcnRpdGlvbmVkIG1hc3RlciAlc1xuIiwg
bXRkLT5uYW1lKTsKPiArCX0KClNvLCB3aGVuIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVS
IGlzIG5vdCBzZXQgYW5kIGEgZHJpdmVyIGxpa2UgTVREUkFNCmRvZXMgbXRkX2RldmljZV9yZWdp
c3RlcihtdGQsIE5VTEwsIDApIHdlIGVuZCB1cCBoZXJlIHdpdGggcGFydGl0aW9uZWQgPSBmYWxz
ZSwKYW5kIGFsbG9jYXRlIGp1c3QgYSBtYXN0ZXIgZGV2aWNlIGJ1dCBubyByZWFsIG10ZCBiZWNh
dXNlIHdpdGggemVybwpwYXJ0cyB0aGUgbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcigpIGZ1bmN0
aW9uIHdpbGwgbm90IGNhbGwgYWRkX210ZF9kZXZpY2UoKS4gOi0oCgpUaGFua3MsCi8vcmljaGFy
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
