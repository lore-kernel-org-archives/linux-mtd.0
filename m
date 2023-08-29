Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E27C83F14
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 06:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wirV+7YyFef/dsly7fsN+ZtriS472S6ronreZauweAE=; b=aQomnuIcTcwOd7p3IV2d04EFv0
	Nlu5vYrpzo8B/KlGLyLY9u69vMGtkQ7zjoCXgxyUPlAtwGAGJ79KgObfx58nsvFqXRsKtniToGO1n
	+XvPaucRl9eyzF9m4cMpzvZWwA4JKn7dUFn6n1Z/Mjp4uo6ECnUmuo7IeSSpzLw4HnP489ToEmJfn
	Wzj1A0GxtgaoeQsfgX4YjwOA6sYVyRWgcktBIwe29Qb+tkZnhSyfZ0Y14JKIXDQmjph+Qzv8jnMvR
	muS+GTGgm+IJF63/dIPXSsomilzItsitQ/3uAVVjE+78FhU9k11J2/zBiuz66Cz98tInCh4SSeVB1
	OATi7GRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qasX2-00AtH1-2x;
	Tue, 29 Aug 2023 06:48:56 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qasX0-00AtGC-0G
	for linux-mtd@lists.infradead.org;
	Tue, 29 Aug 2023 06:48:55 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id DCBB5A55;
	Tue, 29 Aug 2023 08:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1693291725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5F5WhjfdT+77U4L9JnSs2za5mERiqnZyuCnUDfQa/c=;
	b=Ey+yebf4iiJBEV7UdMIg7djW3boOUJ6/soVYL/XjSfrxD7HiG0c8yFQ/kVzx8FfoDD4tZZ
	gIm1FlGQiacwCkVBlR0UggTep0j3HIo7yjS54QeJ2KsDDyf1PYmWBKDKy4Da6jgXCEfj2I
	YdoyORELMS1YUMpIdQIeNnCd85/N3++h13VEFr4H4XxlwUJej4wvL/N/ho0iSFAGGKMDFa
	z4KLWFubxsyaGS3zuWScdbxGGRiSd2O2F8uDTOQie6Vpi4HVTwOVbmVrcPoG8YvS+A3fPf
	8kLfXXH8tkAj2i5jWWkjVJI56b2+1x1dFFvTczpZ7BtlP/n/K2OVxSe09+PE2Q==
MIME-Version: 1.0
Date: Tue, 29 Aug 2023 08:48:45 +0200
From: Michael Walle <michael@walle.cc>
To: SSunk <ssunkkan@gmail.com>
Cc: ssunkkan@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 pratyush@kernel.org, richard@nod.at, tudor.ambarus@linaro.org,
 vigneshr@ti.com
Subject: Re: [PATCH] Add support for more XMC series
In-Reply-To: <20230829045600.5254-1-ssunkkan@gmail.com>
References: <2F4A4D23-1C71-42B9-8B2C-06496F773BDA@gmail.com>
 <20230829045600.5254-1-ssunkkan@gmail.com>
Message-ID: <1c04bbe2a65f13b9815ce465cc8dcdd5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_234854_590483_798E05A7 
X-CRM114-Status: GOOD (  17.32  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMy0wOC0yOSAwNjo1Niwgc2NocmllYiBTU3VuazoKPj4gSGkgTWljaGFlbCwKPj4gU2lu
Y2UgdGhpcyBpcyB0aGUgZmlyc3QgdGltZSBJJ3ZlIHN1Ym1pdHRlZCBjb2RlIHRvIHRoZSBMaW51
eCAKPj4gY29tbXVuaXR5LCBwbGVhc2UgZm9yZ2l2ZSBtZSBmb3Igc29tZSBvZiB0aGUgbWlzc3Rl
cHMgdGhhdCBJJ3ZlIG1hZGUuCj4+IEkgdXBsb2FkZWQgdGhlIGluY29ycmVjdCBwYXRjaCBmaWxl
Lgo+PiBJbiBhIHByZXZpb3VzIGUtbWFpbCB5b3Ugc2FpZO+8mgo+PiBYTUMgcGFydHMgc2VlbSB0
byBoYXZlIFNGRFAgdGFibGVzIGFuZCB0aGV5IHNob3VsZCB3b3JrIG91dCBvZiB0aGUgYm94Cj4+
IHdpdGhvdXQgYW55IHBhdGNoZXMgd2l0aCB0aGUgZ2VuZXJpYyBzcGkgbm9yIGRyaXZlciBbMV0u
IFRoZXJlZm9yZSwKPj4geW91IGRvbid0IG5lZWQgYW55IGVudHJ5IGF0IGFsbC4KPj4gCj4+IEkg
dGhpbmsgaXQgaXMgcmVsYXRlZCB0byB0aGUgUEFSU0VfU0ZEUCBmbGFnLgo+PiBUaGUgWE1DIGZs
YXNoIHBhcnQgc3VwcG9ydHMgU0ZEUCwgc28gaSBkb27igJl0IG5lZWQgdG8gYWRkIAo+PiBOT19T
RkRQX0ZMQUdTKCkgbWFjcm8uCj4+IGRyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMgfCAxNyArKysr
KysrKysrKysrLS0tLQo+PiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3htYy5jIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci94bWMuYwo+PiBpbmRleCAwNTE0MTFlODYzMzkuLmU3OGJmMTE3
OTJkOSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci94bWMuYwo+PiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL3htYy5jCj4+IEBAIC0xMSwxMSArMTEsMjAgQEAKPj4gc3RhdGlj
IGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHhtY19ub3JfcGFydHNbXSA9IHsKPj4gCS8qIFhNQyAo
V3VoYW4gWGlueGluIFNlbWljb25kdWN0b3IgTWFudWZhY3R1cmluZyBDb3JwLikgKi8KPj4gCXsg
IlhNMjVRSDY0QSIsIElORk8oMHgyMDcwMTcsIDAsIDY0ICogMTAyNCwgMTI4KQo+PiAtCQlOT19T
RkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4+IC0JCQkgICAgICBTUElf
Tk9SX1FVQURfUkVBRCkgfSwKPj4gKwkJUEFSU0VfU0ZEUCB9LAo+PiAJeyAiWE0yNVFIMTI4QSIs
IElORk8oMHgyMDcwMTgsIDAsIDY0ICogMTAyNCwgMjU2KQo+PiAtCQlOT19TRkRQX0ZMQUdTKFNF
Q1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4+IC0JCQkgICAgICBTUElfTk9SX1FVQURfUkVB
RCkgfSwKPj4gKwkJUEFSU0VfU0ZEUCB9LAo+PiArCXsgIlhNMjVRSDEyOEMiLCBJTkZPKDB4MjA0
MDE4LCAwLCA2NCAqIDEwMjQsIDI1NikKPj4gKwkJUEFSU0VfU0ZEUCB9LAo+PiArCXsgIlhNMjVR
SDI1NkMiLCBJTkZPKDB4MjA0MDE5LCAwLCA2NCAqIDEwMjQsIDUxMikKPj4gKwkJUEFSU0VfU0ZE
UCB9LAo+PiArCXsgIlhNMjVRVTI1NkMiLCBJTkZPKDB4MjA0MTE5LCAwLCA2NCAqIDEwMjQsIDUx
MikKPj4gKwkJUEFSU0VfU0ZEUCB9LAo+PiArCXsgIlhNMjVRSDUxMkMiLCBJTkZPKDB4MjA0MDIw
LCAwLCA2NCAqIDEwMjQsIDEwMjQpCj4+ICsJCVBBUlNFX1NGRFAgfSwKPj4gKwl7ICJYTTI1UVU1
MTJDIiwgSU5GTygweDIwNDEyMCwgMCwgNjQgKiAxMDI0LCAxMDI0KQo+PiArCQlQQVJTRV9TRkRQ
IH0sCj4+ICsKPj4gfTsKPj4gCj4+IGNvbnN0IHN0cnVjdCBzcGlfbm9yX21hbnVmYWN0dXJlciBz
cGlfbm9yX3htYyA9IHsKPj4+IENvcnJlY3QuIElmIHRoZSBmbGFzaCBpcyB3b3JraW5nIHdpdGgg
UEFSU0VfU0ZEUCwgaXQgaGFzIFNGRFAgYW5kCj4+PiBhbGwgdGhlIGluZm9ybWF0aW9uIG9mIHRo
ZSBmbGFzaF9pbmZvIHRhYmxlIGlzIHB1bGxlZCBmcm9tIHRoZSBTRkRQCj4+PiB0YWJsZXMsIGV4
Y2VwdCBmb3IgdGhlIHBhcnQgbmFtZS4gVGhlcmVmb3JlLCB5b3UgZG9uJ3QgbmVlZCBhbnkgZW50
cnkKPj4+IGF0IGFsbC4gVGhlIGZsYXNoIHNob3VsZCBqdXN0IHdvcmsgb3V0IG9mIHRoZSBib3gu
IEFyZSB5b3UgdXNpbmcgdGhlCj4+PiBsYXRlc3Qga2VybmVsPwo+Pj4gCj4+PiAtbWljaGFlbAo+
IC0tCj4gSGkgTWljaGFlbCwKPiAKPiBBY2NvcmRpbmcgdG8geW91LCBkb2VzIHRoaXMgcGllY2Ug
b2YgbXkgY29kZSBzdGlsbCBuZWVkIHRvIGJlIG1vZGlmaWVkPwoKWW91IGRvbid0IG5lZWQgaXQg
YXQgYWxsLiBUaGUgZmxhc2ggd2lsbCB3b3JrIGFzIGlzIC0gdGhhdCBpcyB3aXRob3V0IAp0aGF0
CnBpZWNlIG9mIGNvZGUuCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
