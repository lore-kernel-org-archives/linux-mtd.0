Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610D7D26D70
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3BFD5yxBGi9V8kVJohFk1d3D/sCiZWhRw6EwEtDORw=; b=Uc7bYn99Z1G5QK
	nvu+QBTy3xit5dZ7A+1MC0grKoTHK1frgwGkii3zMUn0jNCOfysa0Gf6YTwRZGJ0r4kH1XVWxsYdF
	XSi67VCi/Hp/16j67R4SFmTO5BWY0AUk4TX8DrxQqhTM2clfqC8HyU6Pdrk+P+ItG6NMl7RoOjxjD
	fyOtbSzgue/LRx3Z+LyRm+D2wlb/DHwcjFd6hqYtT8PH/CZg3OkvKsl0CuaJHJT1xsyxR8KlJ2wkv
	GpRTPUui1z0HHAJ9n3bz04yE04b+ycF46MosYvEnvt3UHfubjY0FJBaOYXA3dVpBrzagcT8UFwbE8
	z47jzMFFp8FZaxL313WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF6X-00000002Yp8-11p6;
	Fri, 09 Jan 2026 16:12:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF6U-00000002YoO-0KPh
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 16:12:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EAB951A274B;
	Fri,  9 Jan 2026 16:12:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF07E606C6;
	Fri,  9 Jan 2026 16:12:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 919E4103C8928;
	Fri,  9 Jan 2026 17:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767975161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IMKc9MHd9MKGMdEe0mbvetFcSECq5KlF8/ItyQ9UOfs=;
	b=y8sgO60vNrvAN5ao1UXWP6frwmiiF1cnmKVMcW7QO/HxbpUAJ9DUZYz8PYoxa7TnZrgNHn
	QND0OCqd76x2H0tjmg8+G4y+EtalIPSC+KQYf8rjCNA+B5vKbQ7u4oDcUStLUPz8K94/C9
	oyRk9NcfDbOqVoQ0naI+QN+HiG8sH2m5klgIFBZj/3DQSQTfjNIQKQn/ggmyMPfbWE34jX
	CVuL3G4rcCcj1gXHvVrTXR94pzDkpKEQ64TpUMAPIFBtvXhBobJARsAvcWYmEBKq08Aajg
	6m7OKpbbmdqmn48f1azdA0ffbcXKznXdVek37fyAE5LdhLHaDG1pH4odU3nhqQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: kernel test robot <lkp@intel.com>, Rob Herring <robh@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
In-Reply-To: <202601082105.TThX0916-lkp@intel.com>
References: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
 <202601082105.TThX0916-lkp@intel.com>
Date: Fri, 09 Jan 2026 17:12:35 +0100
Message-ID: <87qzryn4ss.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_081246_248912_736F49F6 
X-CRM114-Status: GOOD (  12.56  )
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

a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+IHdyaXRlczoKCj4gSGkgR3JlZ29yeSwK
Pgo+IGtlcm5lbCB0ZXN0IHJvYm90IG5vdGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5n
czoKPgo+IFthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3
Y2NlZDhkMGQwNDAyN2NiMWU4XQo+Cj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwt
bGFiLWxrcC9saW51eC9jb21taXRzL0dyZWdvcnktQ0xFTUVOVC9vZi1yZXNlcnZlZF9tZW0tRml4
LXBsYWNlbWVudC1vZi1fX2ZyZWUtYW5ub3RhdGlvbi8yMDI2MDEwNy0yMTE0NTUKPiBiYXNlOiAg
IDhmMGI0Y2NlNDQ4MWZiMjI2NTM2OTdjY2VkOGQwZDA0MDI3Y2IxZTgKPiBwYXRjaCBsaW5rOiAg
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMTA3LW10ZC1tZW1yZWdpb24tdjMtMi1m
OWZjOTEwN2I5OTIlNDBib290bGluLmNvbQo+IHBhdGNoIHN1YmplY3Q6IFtQQVRDSCB2MyAyLzRd
IG9mOiByZXNlcnZlZF9tZW06IFN1cHBvcnQgbXVsdGlwbGUgJ3JlZycgZW50cmllcyBmb3IgbWVt
b3J5LXJlZ2lvbgo+IGNvbmZpZzogeDg2XzY0LXJoZWwtOS40LWt1bml0IChodHRwczovL2Rvd25s
b2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNjAxMDgvMjAyNjAxMDgyMTA1LlRUaFgwOTE2
LWxrcEBpbnRlbC5jb20vY29uZmlnKQo+IGNvbXBpbGVyOiBnY2MtMTQgKERlYmlhbiAxNC4yLjAt
MTkpIDE0LjIuMAo+IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6IChodHRwczovL2Rv
d25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNjAxMDgvMjAyNjAxMDgyMTA1LlRUaFgw
OTE2LWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQo+Cj4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4g
YSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBvZgo+
IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MKPiB8IFJl
cG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiB8IENsb3Nlczog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDEwODIxMDUuVFRoWDA5
MTYtbGtwQGludGVsLmNvbS8KPgo+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4pOgo+Cj4+PiBXYXJuaW5nOiBkcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jOjc0NiBmdW5j
dGlvbiBwYXJhbWV0ZXIgJ3JtZW0nIG5vdCBkZXNjcmliZWQgaW4gJ29mX3Jlc2VydmVkX21lbV9h
cnJheV9sb29rdXAnCj4+PiBXYXJuaW5nOiBkcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jOjkw
MiBleHBlY3RpbmcgcHJvdG90eXBlIGZvciBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX2NvdW50KCku
IFByb3RvdHlwZSB3YXMgZm9yIG9mX3Jlc2VydmVkX21lbV9yZWdpb25fdG90YWxfY291bnQoKSBp
bnN0ZWFkCj4+PiBXYXJuaW5nOiBkcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jOjc0NiBmdW5j
dGlvbiBwYXJhbWV0ZXIgJ3JtZW0nCj5ub3QgZGVzY3JpYmVkIGluICdvZl9yZXNlcnZlZF9tZW1f
YXJyYXlfbG9va3VwJwoKSXQgd2FzIGEgc3R1cGlkIHR5cG8gaW4gdGhlIGRlc2NyaXB0aW9uIQoK
SSB3aWxsIGZpeCBpdC4KCkdyZWdvcnkKCj4KPiAtLSAKPiAwLURBWSBDSSBLZXJuZWwgVGVzdCBT
ZXJ2aWNlCj4gaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy93aWtpCgotLSAKR3LD
qWdvcnkgQ0xFTUVOVCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
