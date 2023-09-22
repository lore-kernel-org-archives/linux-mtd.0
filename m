Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01987CD4F35
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=orJcYn5qVDbBlytZv28L6kR+Oqq9Agw2N3hXj6MFllk=; b=qry0Gr32Z8p2RY
	evUMuY05+4jXOWL+QMjPaP2q7cZ8mjV7EAhiA6GxuQkEVBz+c67m6ArDamgScWPm3F3kAyUJ2G6jp
	mW+aaHxgntVnvv/Shc7IgZtSAgJxpvmwswlGVeqlTWqRUHgf9FKE3PQippgRXAY9bdiLq3zFsYfgH
	j0zN8khJ87hDQ6gaumVXO3QA1r23+8QddfZt4LGNQicvxKZIdaUufaamL83BEaYJLG6r8YHdMWeUO
	Rx9EUB1jyGouXhIfNWvffr8b3Mb6N80SSpc+wOmvh3mco0wS77pbgiu8cpDnrhcf6u3fehdlJeiMp
	u0agQVaNGM2rYguLJ7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcFL-008Wnm-3D;
	Fri, 22 Sep 2023 09:14:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcFI-008Wmb-1x
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 09:14:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87E2920008;
	Fri, 22 Sep 2023 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695374080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ovHQ3Vath6T1jZF/E2SbCgvV9DoJuznyAhPnCbq1wiU=;
	b=iCcEYUW8z/+zifPIYQiG4vV7bqhI7ipT47E4l9WZYaE4anqu/TsNl2gurgsDvILEoxWY+m
	iVa2szH3tU09AHSdqwymc0ygNYYWXJhT5kQovMFekV2b670Tn9cbnfUxVjq401mEIUlENs
	5pbEtn5DlClAspDAoym5I0GutHClKExKvoTG0sylhplqm8azGrot5XynPldf0blpkz09uc
	foREMoeda4Qn2GhF0KwjuhVNfRXWJavv+FafI77o5UvlEYAxA3/SCv3fjGBe1vCshOP7ZT
	DJ1uHZpH50B+nEiKL/X62qjEebPN0mJ8ZoRSmLPcDJDMz7nu+Ei5otDyK/l0rA==
Date: Fri, 22 Sep 2023 11:14:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/3] mtd: rawnand: arasan: Ensure program page
 operations are successful
Message-ID: <20230922111437.57804995@xps-13>
In-Reply-To: <ead8ac00-cc2d-4258-aac1-af5eed93de7b@amd.com>
References: <20230717194221.229778-1-miquel.raynal@bootlin.com>
	<20230717194221.229778-2-miquel.raynal@bootlin.com>
	<20230911175247.44c1d894@xps-13>
	<cf1a0b96-0f1e-4a6d-960b-93185faf27ba@amd.com>
	<20230912161752.581019bc@xps-13>
	<ead8ac00-cc2d-4258-aac1-af5eed93de7b@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_021445_074278_D872151F 
X-CRM114-Status: GOOD (  27.11  )
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

SGkgTWljaGFsLAoKbWljaGFsLnNpbWVrQGFtZC5jb20gd3JvdGUgb24gVGh1LCAyMSBTZXAgMjAy
MyAxMjoyNToxMCArMDIwMDoKCj4gT24gOS8xMi8yMyAxNjoxNywgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IEhpIE1pY2hhbCwKPiA+IAo+ID4gbWljaGFsLnNpbWVrQGFtZC5jb20gd3JvdGUgb24g
VHVlLCAxMiBTZXAgMjAyMyAxNTo1NToyMyArMDIwMDoKPiA+ICAgCj4gPj4gSGkgTWlxdWVsLAo+
ID4+Cj4gPj4gT24gOS8xMS8yMyAxNzo1MiwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4+PiBI
aSBNaWNoYWwsCj4gPj4+Cj4gPj4+IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24g
TW9uLCAxNyBKdWwgMjAyMyAyMTo0MjoyMCArMDIwMDogIAo+ID4+PiAgICA+Pj4+IFRoZSBOQU5E
IGNvcmUgY29tcGxpZXMgd2l0aCB0aGUgT05GSSBzcGVjaWZpY2F0aW9uLCB3aGljaCBpdHNlbGYg
IAo+ID4+Pj4gbWVudGlvbnMgdGhhdCBhZnRlciBhbnkgcHJvZ3JhbSBvciBlcmFzZSBvcGVyYXRp
b24sIGEgc3RhdHVzIGNoZWNrCj4gPj4+PiBzaG91bGQgYmUgcGVyZm9ybWVkIHRvIHNlZSB3aGV0
aGVyIHRoZSBvcGVyYXRpb24gd2FzIGZpbmlzaGVkICphbmQqCj4gPj4+PiBzdWNjZXNzZnVsLgo+
ID4+Pj4KPiA+Pj4+IFRoZSBOQU5EIGNvcmUgb2ZmZXJzIGhlbHBlcnMgdG8gZmluaXNoIGEgcGFn
ZSB3cml0ZSAoc2VuZGluZyB0aGUKPiA+Pj4+ICJQQUdFIFBST0ciIGNvbW1hbmQsIHdhaXRpbmcg
Zm9yIHRoZSBOQU5EIGNoaXAgdG8gYmUgcmVhZHkgYWdhaW4sIGFuZAo+ID4+Pj4gY2hlY2tpbmcg
dGhlIG9wZXJhdGlvbiBzdGF0dXMpLiBCdXQgaW4gc29tZSBjYXNlcywgYWR2YW5jZWQgY29udHJv
bGxlcgo+ID4+Pj4gZHJpdmVycyBtaWdodCB3YW50IHRvIG9wdGltaXplIHRoaXMgYW5kIGNyYWZ0
IHRoZWlyIG93biBwYWdlIHdyaXRlCj4gPj4+PiBoZWxwZXIgdG8gbGV2ZXJhZ2UgYWRkaXRpb25h
bCBoYXJkd2FyZSBjYXBhYmlsaXRpZXMsIHRodXMgbm90IGFsd2F5cwo+ID4+Pj4gdXNpbmcgdGhl
IGNvcmUgZmFjaWxpdGllcy4KPiA+Pj4+Cj4gPj4+PiBTb21lIGRyaXZlcnMsIGxpa2UgdGhpcyBv
bmUsIGRvIG5vdCB1c2UgdGhlIGNvcmUgaGVscGVyIHRvIGZpbmlzaCBhIHBhZ2UKPiA+Pj4+IHdy
aXRlIGJlY2F1c2UgdGhlIGZpbmFsIGN5Y2xlcyBhcmUgYXV0b21hdGljYWxseSBtYW5hZ2VkIGJ5
IHRoZQo+ID4+Pj4gaGFyZHdhcmUuIEluIHRoaXMgY2FzZSwgdGhlIGFkZGl0aW9uYWwgY2FyZSBt
dXN0IGJlIHRha2VuIHRvIG1hbnVhbGx5Cj4gPj4+PiBwZXJmb3JtIHRoZSBmaW5hbCBzdGF0dXMg
Y2hlY2suCj4gPj4+Pgo+ID4+Pj4gTGV0J3MgcmVhZCB0aGUgTkFORCBjaGlwIHN0YXR1cyBhdCB0
aGUgZW5kIG9mIHRoZSBwYWdlIHdyaXRlIGhlbHBlciBhbmQKPiA+Pj4+IHJldHVybiAtRUlPIHVw
b24gZXJyb3IuCj4gPj4+Pgo+ID4+Pj4gQ2M6IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQGFt
ZC5jb20+Cj4gPj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4+Pj4gRml4ZXM6IDg4
ZmZlZjFiNjVjZiAoIm10ZDogcmF3bmFuZDogYXJhc2FuOiBTdXBwb3J0IHRoZSBoYXJkd2FyZSBC
Q0ggRUNDIGVuZ2luZSIpCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4+Pj4KPiA+Pj4+IC0tLQo+ID4+Pj4KPiA+Pj4+IEhl
bGxvIE1pY2hhbCwKPiA+Pj4+Cj4gPj4+PiBJIGhhdmUgbm90IHRlc3RlZCB0aGlzLCBidXQgYmFz
ZWQgb24gYSByZXBvcnQgb24gYW5vdGhlciBkcml2ZXIsIEkKPiA+Pj4+IGJlbGlldmUgdGhlIHN0
YXR1cyBjaGVjayBpcyBhbHNvIG1pc3NpbmcgaGVyZSBhbmQgY291bGQgc29tZXRpbWVzCj4gPj4+
PiBsZWFkIHRvIHVubm90aWNlZCBwYXJ0aWFsIHdyaXRlcy4KPiA+Pj4+Cj4gPj4+PiBQbGVhc2Ug
dGVzdCBvbiB5b3VyIHNpZGUgdGhhdCBldmVyeXRoaW5nIHN0aWxsIHdvcmtzIGFuZCBsZXQgbWUK
PiA+Pj4+IGtub3cgaG93IGl0IGdvZXMuICAKPiA+Pj4KPiA+Pj4gQW55IG5ld3MgZnJvbSB0aGUg
dGVzdGluZyB0ZWFtIGFib3V0IHBhdGNoZXMgMi8zIGFuZCAzLzM/ICAKPiA+Pgo+ID4+IEkgYXNr
ZWQgQW1pdCB0byB0ZXN0IGFuZCBoZSBkaWRuJ3QgZ2V0IGJhY2sgdG8gbWUgZXZlbiBJIGFza2Vk
IGZvciBpdCBjb3VwbGUgb2YgdGltZXMuICAKPiA+IAo+ID4gT2suCj4gPiAgIAo+ID4+IENhbiB5
b3UgcGxlYXNlIHRlbGwgbWUgaG93IHRvIHRlc3QgaXQ/IEkgd2lsbCBzZXR1cCBIVyBteXNlbGYg
YW5kIHRlc3QgaXQgYW5kIGdldCBiYWNrIHRvIHlvdS4gIAo+ID4gCj4gPiBJIGJlbGlldmUgc2V0
dGluZyB1cCB0aGUgYm9hcmQgdG8gdXNlIHRoZSBoYXJkd2FyZSBCQ0ggZW5naW5lIGFuZAo+ID4g
cGVyZm9ybWluZyBiYXNpYyBlcmFzZS93cml0ZS9yZWFkIHRlc3Rpbmcgd2l0aCBhIGtub3duIGZp
bGUgYW5kIGNoZWNrCj4gPiBpdCBzdGlsbCBiZWhhdmVzIGNvcnJlY3RseSB3b3VsZCB3b3JrLiBZ
b3UgY2FuIGFsc28gcnVuCj4gPiAKPiA+IAluYW5kYml0ZXJycyAtaSAvZGV2L210ZHgKPiA+IAo+
ID4gYXMgYSBzZWNvbmQgc3RlcCBhbmQgdmVyaWZ5IHRoZXJlIGlzIG5vIGRpZmZlcmVuY2Ugd2l0
aCBhbmQgd2l0aG91dCB0aGUKPiA+IHBhdGNoIGFuZCBmaW5hbGx5IGNoZWNrIHRoZSBpbXBhY3Q6
Cj4gPiAKPiA+IAlmbGFzaF9zcGVlZCAtZCAtYyAxMCAvZGV2L210ZHgKPiA+IAkoYmUgY2FyZWZ1
bDogdGhpcyBpcyBhIGRlc3RydWN0aXZlIG9wZXJhdGlvbikgIAo+IAo+IFRlc3RpbmcgdGVhbSB3
b24ndCBzZWUgYW55IGlzc3VlIHRoYXQncyB3aHkgZmVlbCBmcmVlIHRvIGFkZCBteQo+IEFja2Vk
LWJ5OiBNaWNoYWwgU21layA8bWljaGFsLnNpbWVrQGFtZC5jb20+CgpJIHRoaW5rIHlvdSB0b2xk
IG1lIGluIHRoZSBsYXN0IGUtbWFpbCB5b3UgdGVzdGVkIHRoZSBwbDM1MyBwYXRjaCwgbm90CnRo
ZSBvbmUgZm9yIHRoZSBBcmFzYW4gY29udHJvbGxlci4gU2hhbGwgSSBhZGQgeW91ciBBY2tlZC1i
eSBoZXJlIGFuZAp5b3VyIFRlc3RlZC1ieSBpbiB0aGUgb3RoZXI/CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
