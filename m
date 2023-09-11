Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E689EEB58C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2IVyYk2Ae7dzDQ/M1gD7gDHFEigGrblMblH7Aka/ck=; b=iFWVnWApvaz8WF
	8RD8v51qP1BNROE8V87MDSdN6dIbuaV7g792Sfw+TfxvSv3lOBjLITbNBddL3KdIGay97dM0ry2aJ
	LdqOCvtZVO/DUnG5Tj3vi7+YamZ7v6ys7gssNSS5PKnYItViFQEM6XCRAD8HYMXOh2OdK2bZeKSWf
	z3aDo1S/fN9VRj0KwQpBUZFOEatyildoXfEiUrmJgUZjxPHzHmNT1bW2ELrVlbUSpg5RNLrtPWs3Q
	CPtvEE6XjF5rMsYOXsd5f3BViKmcLTiBarP3FDDnLHG25hna220LpthP3cwRgE/96+i6Ru5hF44AL
	7xXHbtTrQjyOB7q1j2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbZI-00HR5n-1d;
	Mon, 11 Sep 2023 07:42:48 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbZE-00HR5H-2S
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 07:42:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36C64FF804;
	Mon, 11 Sep 2023 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694418158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xIpV2c0DDqubgpsw65ctLWF4dneEjKQtJ62BTRMBd/M=;
	b=nKHM6xpBmr0Fv13Fl3ZLqkkTx+umlwJZFnFUjJxEMpyBV3jH2DGh2cUg/5GeXPzB9d7tVf
	PaDvgOo/lqtv6lJ2CcsKmTxnK491pvne/OzcTZoT2r5ZBiBB8oDslzGMjGs8R+Pu30KP/W
	ajFlNhe1iKdSabEhxvCQ2oWxx/tzUGqTfLmNjdWILUVSBtRlP/wV/3cXOU9AyzIflR/pzX
	5MYK2K0tZCbbthK+wRJNDwyfigxLrIyH0Rkrv9ibxzcp6hsNwwpmwl4APpmgjv2O0bSS5f
	7LEVo7yqrGat4q5IFArQDxFt0rqg/VAN6tm5jmf7RrpeVbjdpL2oRWrceU20Sw==
Date: Mon, 11 Sep 2023 09:42:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Vitaly Lubart <vitaly.lubart@intel.com>,
 linux-mtd@lists.infradead.org, intel-gfx@lists.freedesktop.org, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH 00/10] drm/i915/spi: spi access for discrete graphics
Message-ID: <20230911094233.326fd936@xps-13>
In-Reply-To: <20230910123949.1251964-1-alexander.usyskin@intel.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_004245_256940_57E61DFB 
X-CRM114-Status: GOOD (  20.07  )
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

SGkgQWxleGFuZGVyLAoKKyBNYXJrIEJyb3duICsgc3BpIGxpc3QKKyBzcGktbm9yIG1haW50YWlu
ZXJzCgphbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20gd3JvdGUgb24gU3VuLCAxMCBTZXAgMjAy
MyAxNTozOTozOSArMDMwMDoKCj4gQWRkIGRyaXZlciBmb3IgYWNjZXNzIHRvIHRoZSBkaXNjcmV0
ZSBncmFwaGljcyBjYXJkCj4gaW50ZXJuYWwgU1BJIGRldmljZS4KPiBFeHBvc2UgZGV2aWNlIG9u
IGF1eGlsaWFyeSBidXMgYW5kIHByb3ZpZGUgZHJpdmVyIHRvIHJlZ2lzdGVyCj4gdGhpcyBkZXZp
Y2Ugd2l0aCBNVEQgZnJhbWV3b3JrLgoKTWF5YmUgeW91IGNhbiBleHBsYWluIHdoeSB5b3UgdGhp
bmsgYXV4aWxpYXJ5IGJ1cyBpcyByZWxldmFudCBoZXJlPyBUaGUKY292ZXIgbGV0dGVyIG1pZ2h0
IG1heWJlIGJlIGEgYml0IG1vcmUgdmVyYm9zZSB0byBnaXZlIHVzIG1vcmUgY29udGV4dD8KCkkn
dmUgbG9va2VkIGF0IHRoZSBzZXJpZXMsIGl0IGxvb2tzIGxpa2UgeW91IHRyeSB0byBleHBvc2Ug
YSBzcGkKbWVtb3J5IGNvbm5lY3RlZCB0byBhIHNwaSBjb250cm9sbGVyIG9uIHlvdXIgaGFyZHdh
cmUuIFdlIHVzdWFsbHkKZXhwZWN0IHRoZSBzcGkgY29udHJvbGxlciBkcml2ZXIgdG8gcmVnaXN0
ZXIgaW4gdGhlIHNwaSBjb3JlIGFuZApwcm92aWRlIHNwaS1tZW0gb3BlcmF0aW9ucyBmb3IgdGhh
dC4KCkkgZG9uJ3Qga25vdyBpZiB0aGlzIG1lbW9yeSBpcyBzdXBwb3NlZCB0byBiZSB1c2VkIGFz
IGdlbmVyYWwgcHVycG9zZSwKYnV0IGlmIGl0J3Mgbm90IEkgd291bGQgYWR2aXNlIHRvIHVzZSBz
b21lIGtpbmQgb2YgZmlybXdhcmUgbWVjaGFuaXNtCmluc3RlYWQuIEFsc28sIHdoYXQgaXMgdGhl
IHB1cnBvc2Ugb2YgZXhwb3NpbmcgdGhpcyBjb250ZW50IGluIHRoaXMKY2FzZT8KCldlbGwsIEkn
bSBwYXJ0aWFsbHkgY29udmluY2VkIGhlcmUsIEkgd291bGQgbGlrZSB0byBoZWFyIGZyb20gdGhl
IG90aGVyCm1haW50YWluZXJzLCBtYXliZSB5b3VyIGNob2ljZXMgYXJlIGxlZ2l0aW1hdGUgYW5k
IEknbSBvZmYgdG9waWMuCgpUaGFua3MsCk1pcXXDqGwKCj4gVGhpcyBzZXJpZXMgaXMgaW50ZW5k
ZWQgdG8gYmUgdXBzdHJlYW1lZCB0aHJvdWdoIGRybSB0cmVlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4KPiAKPiAKPiBB
bGV4YW5kZXIgVXN5c2tpbiAoMyk6Cj4gICBkcm0vaTkxNS9zcGk6IGFsaWduIDY0Yml0IHJlYWQg
YW5kIHdyaXRlCj4gICBkcm0vaTkxNS9zcGk6IHdha2UgY2FyZCBvbiBvcGVyYXRpb25zCj4gICBk
cm0vaTkxNS9zcGk6IGFkZCBzdXBwb3J0IGZvciBhY2Nlc3MgbW9kZQo+IAo+IEphbmkgTmlrdWxh
ICgxKToKPiAgIGRybS9pOTE1L3NwaTogYWRkIHNwaSBkZXZpY2UgZm9yIGRpc2NyZXRlIGdyYXBo
aWNzCj4gCj4gVG9tYXMgV2lua2xlciAoNik6Cj4gICBkcm0vaTkxNS9zcGk6IGFkZCBpbnRlbF9z
cGlfcmVnaW9uIG1hcAo+ICAgZHJtL2k5MTUvc3BpOiBhZGQgZHJpdmVyIGZvciBvbi1kaWUgc3Bp
IGRldmljZQo+ICAgZHJtL2k5MTUvc3BpOiBpbXBsZW1lbnQgcmVnaW9uIGVudW1lcmF0aW9uCj4g
ICBkcm0vaTkxNS9zcGk6IGltcGxlbWVudCBzcGkgYWNjZXNzIGZ1bmN0aW9ucwo+ICAgZHJtL2k5
MTUvc3BpOiBzcGkgcmVnaXN0ZXIgd2l0aCBtdGQKPiAgIGRybS9pOTE1L3NwaTogbXRkOiBpbXBs
ZW1lbnQgYWNjZXNzIGhhbmRsZXJzCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcg
ICAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZSAgICAg
ICAgICAgIHwgICA2ICsKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcml2ZXIuYyAgICAg
ICB8ICAgNyArCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggICAgICAgICAgfCAg
IDQgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAgICAgIHwgICAxICsK
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvc3BpL2ludGVsX3NwaS5jICAgICB8IDEwMSArKysKPiAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvc3BpL2ludGVsX3NwaS5oICAgICB8ICAzMyArCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L3NwaS9pbnRlbF9zcGlfZHJ2LmMgfCA4NjUgKysrKysrKysrKysrKysr
KysrKysrKysKPiAgOCBmaWxlcyBjaGFuZ2VkLCAxMDE4IGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L3NwaS9pbnRlbF9zcGkuYwo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvc3BpL2ludGVsX3NwaS5oCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9zcGkvaW50ZWxfc3BpX2Rydi5j
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
