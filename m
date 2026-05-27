Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1552CD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvWvoU5TCRwzwMdP9yxSCdS1PGl75xVdlW8xCNkWai0=; b=yekoBxsPHAKiO5
	SweTbV9vPC9J59485z2B8RGCvefTCShMuikXb2pfCzpDxtmRvblgTz9DLPBBjmtb90Xjd0ZIhR62k
	5WoErFbyGfF+yT+s+2CBiOmcxiaCqccMQJMYVNBvG41p/fJk1UdQn43G9WKVxXmgSbFLrBd3N7TJF
	4kuHJ2nbfxqza2rYl9RqVDjgMfpMGO/qYfpJs+7N/Vc149+zSCThj6RnyfHc8L45RFKqY7YRr7fK4
	itD7MAo+otYU01BsXXG5Su4yRbnpoOkC8G2fVuQRjDSWiV+IoRIi8t7SXqdmnpwY0fLEgPpLqKQyn
	vGumcOM7kS2DYCTsKGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS932-00000003UWT-36eQ;
	Wed, 27 May 2026 07:51:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS92x-00000003UVx-22WC
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 07:51:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E68E04E42D64;
	Wed, 27 May 2026 07:51:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9003601A1;
	Wed, 27 May 2026 07:51:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB1AF1088805F;
	Wed, 27 May 2026 09:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779868277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1hAPk0fCzqKDEWyYlZld8zHu9LYU5ItX3xTPPOXG93w=;
	b=C/ux/zihO8IHOB1g5WttQW5EU71hCn3ZPiATSjNDLmaPPcZruY/j64VUAG7U54lppvi6sK
	H3ObYWKG32jW8pp6pDLaR4DADasGoDpLg/8l+OsXAMWQ1Sn5UieTyjd8PR0dsK9kDRg5LT
	KzI7ISjePwtE2EZnbMP3ZXXhGlLXQLpInhNz7TddzyjsdDRvSVlxesVIkj3gdh0AfpBPPp
	j/xTkCzud86K/rENIJinYtHem/MX0IqljP/+2CisHdn2r1wsTiim7BcODKrNhf02xjLW/t
	c5H72244z7BXYuBkXS7Neow+vKpGI/Vkw96+FeNiQX5yzLToplg9OCb1Vjrbxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <2vxzcxyi42qh.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	26 May 2026 17:20:06 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
	<87o6i7o0tj.fsf@bootlin.com> <2vxz8q965ub7.fsf@kernel.org>
	<87v7cakz7u.fsf@bootlin.com> <2vxzcxyi42qh.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 09:51:14 +0200
Message-ID: <87mrxll28d.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_005123_665019_BE5304E1 
X-CRM114-Status: GOOD (  20.19  )
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

SGkgUHJhdHl1c2gsCgo+PiBJIGtub3cgd2hhdCB0aGUgbWFpbnRhaW5lciBsb2FkIGNhbiBiZSwg
c29tZXRpbWVzIGl0IGRvZXMgbm90IHBsYXkgd2VsbAo+PiB3aXRoIHRoZSByZXN0IG9mIHRoZSB5
b3VyIHBlcnNvbmFsIGFuZCBwcm9mZXNzaW9uYWwgZHV0aWVzLiBCdXQgdGhlCj4+IHNlcmllcyBo
YXMgYWxyZWFkeSBiZWVuIG9uIHRoZSBsaXN0IGZvciBhYm91dCA4IG1vbnRocywgaXQncyBiZWVu
IGxvb2tlZAo+PiBhdCBieSBvdGhlciBwZW9wbGUsIHRoZSBvbmVzIHdobyBoYWQgZW5vdWdoIHRp
bWUgdG8gZGVkaWNhdGUgdG8gaXQuIEZyb20KPj4gbXkgcGVyc3BlY3RpdmUsIGFza2luZyBzdWNo
IGNvbnRyaWJ1dGlvbnMgdG8gd2FpdCBpbmRlZmluaXRlbHkgYW5kIHRoZW4KPj4gc3VnZ2VzdGlu
ZyBwYXJ0aWFsIGFwcGxpY2F0aW9uIHdpdGhvdXQgYSB0ZWNobmljYWwgcmVhc29uIGlzIG5vdCBh
Cj4+IHN1c3RhaW5hYmxlIHdheSB0byBoYW5kbGUgY29udHJpYnV0aW9ucy4gVGhpcyBzZXJpZXMg
aGFzIG5vdCBtb3ZlZCBtdWNoLAo+PiBpdCBjb3VsZCBoYXZlIGJlZW4gYXBwbGllZCAqbXVjaCog
ZWFybGllci4gSSd2ZSBub3cgYWRkcmVzc2VkIG1vc3Qgb2YKPj4gdGhlIGNvbW1lbnRzIGZyb20g
U2FzaGlrbywgdjYgaXMgY29taW5nLCBmdXJ0aGVyIGltcHJvdmluZyB0aGUgcXVhbGl0eQo+PiBm
b3Igc3VyZSwgYXMgdGhlcmUgd2VyZSBidWdzIC0gdGhlcmUgYXJlIGFsd2F5cy4gSSBhbSBvZiBj
b3Vyc2UgaGFwcHkgdG8KPj4gYWRkcmVzcyBmdXJ0aGVyIHRlY2huaWNhbCBjb25jZXJucywgaWYg
dGhlcmUgYXJlIGFueSwgYnV0IEkgd291bGQKPj4gc3Ryb25nbHkgcHJlZmVyIG1lcmdpbmcgdGhl
IHNlcmllcyBhcyB0aGUgY29oZXJlbnQgc2V0IGl0IHdhcyBpbnRlbmRlZAo+PiB0byBiZSwgcmF0
aGVyIHRoYW4gb25seSB0YWtpbmcgdGhlIHByZXBhcmF0b3J5IHBhcnRzLgo+Cj4gVW5mb3J0dW5h
dGVseSBJIGFtIG9ubHkgYSBwYXRjaCBtb25rZXkgZm9yIFNQSSBOT1IgdGhlc2UgZGF5cyBhbmQg
ZG8gbm90Cj4gaGF2ZSBhbnkgdGltZSB0byBkbyByZXZpZXdzLCBlc3BlY2lhbGx5IGZvciBiaWcg
c2VyaWVzLiBJIG1haW5seSBjaGVjawo+IGZvciByZXZpZXdlZCBwYXRjaGVzIGFuZCB0cnkgdG8g
YXBwbHkgdGhlbS4gRXZlbiB0aGF0IGlzIGJlY29taW5nIGhhcmRlcgo+IHRoZXNlIGRheXMgc2lu
Y2UgSSBhbSBtb3JlIGJ1c3kgYXQgbmV3ICREQVlKT0IuCgpJIGZ1bGx5IHVuZGVyc3RhbmQgdGhh
dC4KCj4gSSB1bmRlcnN0YW5kIHlvdXIgZnJ1c3RyYXRpb24sIGFuZCBkbyB0YWtlIHRoZSBibGFt
ZSBmb3IgdGhpcywgYnV0Cj4gdW5mb3J0dW5hdGVseSBjYW4ndCBwcm9taXNlIGFueXRoaW5nIGJl
dHRlciBpbiB0aGUgZnV0dXJlLiBXZSBwcmV0dHkKPiBtdWNoIGRvbid0IGhhdmUgYW55IGFjdGl2
ZSByZXZpZXdlcnMgaW4gU1BJIE5PUi4gTWljaGFlbCBhbmQgVHVkb3IgYXJlCj4gYWxzbyBzaG9y
dCBvbiB0aW1lIHRoZXNlIGRheXMuIElmIHlvdXIgZW1wbG95ZXIgY2FyZXMgYWJvdXQgU1BJIE5P
UiwKPiBwZXJoYXBzIHlvdSBjYW4gZW5jb3VyYWdlIHRoZW0gdG8gc3VwcG9ydCBkZXZlbG9wZXJz
IGluIGhlbHBpbmcgb3V0IHdpdGgKPiByZXZpZXdzIGFuZCBtYWludGVuYW5jZS4KCldlbGwsIEkg
YmVsaWV2ZSBJIGFscmVhZHkgdGFrZSBhIGZhaXJlIHNoYXJlIGluIHJldmlld2luZyBhbmQKbWFp
bnRhaW5pbmcgdGhlIHN1YnN5c3RlbSA6LSkgSSBldmVuIHN0YXJ0ZWQgZ2V0dGluZyBhIGxvb2sg
aW50byBzcGktbm9yCnBhdGNoZXMgcmVjZW50bHkgc2luY2UgSSByYW1wZWQgdXAgb24gdGhlIHN1
YnN5c3RlbS4KCk1pY2hlbCBhbmQgVHVkb3IgcmVndWxhcmx5IG1ha2UgdXNlZnVsIGZlZWRiYWNr
LCBUYWthaGlybyBpcyByYW1waW5nIHVwLApJIHRyeSB0byBrZWVwIGVub3VnaCBhdmFpbGFiaWxp
dHkgZm9yIG1haW50YWluaW5nIE5BTkQsIFNQSSBOQU5EIGFuZAphbnl0aGluZyB0aGF0IGlzIE1U
RCBidXQgbm90IGluIG9uZSBvZiB0aGUgdGhyZWUgbWFpbiBzdWJzeXN0ZW1zLiBJCmRvbid0IHRo
aW5rIHdlIGFyZSBpbiBhIGJhZCBtYWludGFpbmVyc2hpcCBzaXR1YXRpb24uCgo+IEFwcGx5aW5n
IHRoZSByZXZpZXdlZCBwYXRjaGVzIHJlZHVjZXMgdGhlIHRvdGFsIHBhdGNoc2V0IHNpemUgYW5k
IGRvZXMKPiBtYWtlIHRoaW5ncyBlYXNpZXIgdG8gcmV2aWV3IGFuZCBsYW5kLiBTbyBJIGRvbid0
IGdldCB3aHkgeW91IGFyZSBzbwo+IG9wcG9zZWQgdG8gdGhlIGlkZWEuCgpBcHBseWluZyBzZXJp
ZXMgcGFydGlhbGx5IGlzIG9rYXk7IHNwZWNpZmljYWxseSBmb3IgdGhpcyBzZXJpZXMsCnBhdGNo
ZXMgMS04IGNvdWxkIGhhdmUgYmVlbiB0YWtlbiBhbG9uZSwgYnV0IGEgYml0IGVhcmxpZXIgSU1I
Ty4KCj4gQnV0IGFueXdheSwgSSdsbCBiaXRlIHRoZSBidWxsZXQgaGVyZSBhbmQgYXBwbHkgdGhl
IHNlcmllcy4gWW91Cj4gZ2VuZXJhbGx5IGhhdmUgaGlnaCBxdWFsaXR5IHBhdGNoZXMgc28gSSBh
bSBub3Qgc3VwZXIgd29ycmllZCBhYm91dCB0aGlzCj4gdG8gYmVnaW4gd2l0aC4gV2UgY2FuIGRl
YWwgd2l0aCB0aGUgYnVncyBvciBzaG9ydGNvbWluZ3MgbGF0ZXIgSQo+IHN1cHBvc2UuLi4KCkp1
c3QgdG8gYmUgY2xlYXIsIEkgYW0gbm90IGFza2luZyBmb3IgYSBmYXN0IHBhdGggaGVyZS4gV2Ug
bmVlZCB0bwpmb2xsb3cgdGhlIGNvbnRyaWJ1dGlvbiBhbmQgcmV2aWV3IG1vZGVsLCBiZWNhdXNl
IHRoYXQgaXMgdGhlIHNhbmllc3QKbW9kZWwgdGhhdCB3b3JrZWQgd2VsbCBmb3IgdXMgdW50aWwg
bm93LiBJIGFtIGhvd2V2ZXIgb3Bwb3NlZCB0byB0aGUKc3RhdHV0IHF1byBzaXR1YXRpb24gdGhh
dCB3YXMgcHJvZ3Jlc3NpdmVseSBzZXR0bGluZyBiZWNhdXNlIG9mIHRoZSBsYWNrCm9mIGF2YWls
YWJpbGl0eS4KCkFsc28sIEkgYW0gYWx3YXlzIGZvbGxvd2luZyBjbG9zZWx5IHdoZW4gcGF0Y2hl
cyBnZXQgYXBwbGllZCwgc28gSSBjYW4KcmVzcG9uZCBxdWlja2x5IGluIGNhc2Ugb2YgYnJlYWth
Z2UuCgpUaGFua3MgZm9yIHlvdXIgd29yayBQcmF0eXVzaCwgZG9uJ3QgZ2V0IG1lIHdyb25nLCB5
b3VyIHdvcmsgaXMgaGlnaGx5CmFwcHJlY2lhdGVkLCBhbmQgeW91ciBhdmFpbGFiaWxpdHkgaXMg
YSBwYXJhbWV0ZXIgd2Ugd2lsbCBjb21wbHkgd2l0aC4KCkNoZWVycyA7LSkKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
