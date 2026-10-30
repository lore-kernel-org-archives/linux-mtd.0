Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445CE606A329
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sVWkWxwC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmYYLUYl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Td5pG1OxhlFOGDjMS1DcUGMWrhe82h8sHLwV7ylyYlM=; b=sVWkWxwCrZXHSt3zG1IqYE1Jiy
	1CeJe8n4s4hPTrRMHZD0hFvL89P2FALzvSZslBTrYydSdGV2GNf+vXBJaISCNCt1gHfU2PtDMf3DT
	MobSFvvzLfTBJRZuRh1fEAn7Xumn16xjaLQ6FA10994i5u83grlxouEqZlk1cJWxac+QaE6w/GiaD
	q/Ucn6nrhJVzHurTtTZQzxm/wFFE5XZofy3WUcN/J1bMnPtH+Up2LyRpxprHX76xLnOsBngvM78hi
	BFtH1JnYbs4Gh8r4bx68mYTskuyp0gTYmuVJ0+3TPECe+XBLpw5ocJJQFgkWVlKH6me1xtKuKYGp/
	Zic9OwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqr6-0000000CKsg-0slZ;
	Fri, 30 Oct 2026 17:57:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqr4-0000000CKsQ-2oqL
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:57:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21CD660233;
	Fri, 30 Oct 2026 17:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CAD1F000C1;
	Fri, 30 Oct 2026 17:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793383049;
	bh=RUCBaBbvj2FHqCo2yrqyCFCq7jSJno72jMzFG6LGqEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GmYYLUYlqAeoWi0OwnJ77deJuRyYNOFYI/8wyaqheJITOgIOFFmhCk8zrN+al6C0d
	 HacD68jE9XcIsjaHFl2TkIx/NjR82ve259jrxEju33Tne642fOMj9fNpiZvIc0iu7C
	 ExAqD8vfZ0RANKi9z3+LFkouC1e5rn++02iW1wnWOqeTvTQAzSav1evY9ellPAfJ/+
	 2AKkbFzNsT7lZsif9h2Csy+69BNw3VUdsOUYlGk/S+4EMVyp9iaMD7EQawNik3HICz
	 5+IkLWlyxrWfXJUQrBRkSEOi5o9VenmjnWSDrNixi52AnFWUfgPnJqBd4yRBJ7Stnh
	 5pwqApMZqPRhg==
Message-ID: <sashiko-outbox-191379@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/13] mtd: spinand: winbond: Add continuous read
 support for W25N04LW
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Daisuke Mizobuchi" <mizo@atmark-techno.com>, "Dominique
 Martinet" <dominique.martinet@atmark-techno.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin" <stlin2@winbond.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-13-91f67407dc8b@bootlin.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
 <20261030-winbond-master-w25nxxlvw-v1-13-91f67407dc8b@bootlin.com>
Date: Fri, 30 Oct 2026 17:57:29 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGluYW5k
OiB3aW5ib25kOiBXMjVOMDRMVyB1c2VzIHdyb25nIE9PQiBsYXlvdXQgdzI1bnh4a3Zfa3dfb29i
bGF5b3V0Ci0tCgpjb21taXQgODA2YWYyODViOTU1OTYzY2JlZmYxZmQ2MTllOWQ5YTcyYjU5ODdl
MwpBdXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgptdGQ6
IHNwaW5hbmQ6IHdpbmJvbmQ6IEFkZCBjb250aW51b3VzIHJlYWQgc3VwcG9ydCBmb3IgVzI1TjA0
TFcKClRoaXMgY29tbWl0IGVuYWJsZXMgY29udGludW91cyByZWFkIHN1cHBvcnQgZm9yIHRoZSBX
aW5ib25kIFcyNU4wNExXIFNQSS1OQU5ECmZsYXNoIGNoaXAgYnkgY29uZmlndXJpbmcgY29udF9y
ZWFkX2NhY2hlX3ZhcmlhbnRzIGFuZCB0aGUgdzI1bl9zZXRfY29udF9yZWFkCmhlbHBlciBpbiB3
aW5ib25kX3NwaW5hbmRfdGFibGUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Nw
aS93aW5ib25kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPiBpbmRleCAxNzE0
NzQ0NGY4Y2JjLi5jODk3ZDE2ODZkMjU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
c3BpL3dpbmJvbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwo+IEBA
IC04OTUsMTEgKzg5NSwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyB3aW5i
b25kX3NwaW5hbmRfdGFibGVbXSA9IHsKPiAgCQkgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFE
SURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHhiMiwgMHgyMyksCj4gIAkJICAgICBOQU5EX01FTU9S
RygxLCA0MDk2LCAyNTYsIDY0LCAyMDQ4LCA0MCwgMSwgMSwgMSksCj4gIAkJICAgICBOQU5EX0VD
Q1JFUSg4LCA1MTIpLAo+IC0JCSAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFkX2Nh
Y2hlX3ZhcmlhbnRzLAo+IC0JCQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cywKPiAtCQkJ
CQkgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKPiArCQkgICAgIFNQSU5BTkRfSU5GT19P
UF9WQVJJQU5UU19XSVRIX0NPTlQoJnJlYWRfY2FjaGVfdmFyaWFudHMsCj4gKwkJCQkJCQkmd3Jp
dGVfY2FjaGVfdmFyaWFudHMsCj4gKwkJCQkJCQkmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzLAo+ICsJ
CQkJCQkJJmNvbnRfcmVhZF9jYWNoZV92YXJpYW50cyksCj4gIAkJICAgICAwLAo+IC0JCSAgICAg
U1BJTkFORF9FQ0NJTkZPKCZ3MjVueHhrdl9rd19vb2JsYXlvdXQsIHcyNW54eGt2X2t3X2x2X2x3
X2VjY19nZXRfc3RhdHVzKSksCj4gKwkJICAgICBTUElOQU5EX0VDQ0lORk8oJncyNW54eGt2X2t3
X29vYmxheW91dCwgdzI1bnh4a3Zfa3dfbHZfbHdfZWNjX2dldF9zdGF0dXMpLAo+ICsJCSAgICAg
U1BJTkFORF9DT05UX1JFQUQodzI1bl9zZXRfY29udF9yZWFkKSksCgpbU2V2ZXJpdHk6IE1lZGl1
bV0KU2hvdWxkIHRoZSBXMjVOMDRMVyBlbnRyeSBpbiB3aW5ib25kX3NwaW5hbmRfdGFibGUgdXNl
ICZ3MjVueHhsdl9sd19vb2JsYXlvdXQKaW5zdGVhZCBvZiAmdzI1bnh4a3Zfa3dfb29ibGF5b3V0
IGhlcmU/CgpFYXJsaWVyIGluIHRoaXMgc2VyaWVzLCBjb21taXQgNGMzN2Y0Y2IzNzA0ICgibXRk
OiBzcGluYW5kOiB3aW5ib25kOiBGaXggYW4KT09CIGxheW91dCBpbmNvbnNpc3RlbmN5IHdpdGgg
VzI1Tnh4TFcgY2hpcHMiKSBjaGFuZ2VkIFcyNU4wNExXIGZyb20KJncyNW4wMmt2X29vYmxheW91
dCB0byAmdzI1bjA4bHdfb29ibGF5b3V0IHNvIHRoYXQgYWxsIFcyNU54eExWIGFuZCBXMjVOeHhM
VwpjaGlwcyBzaGFyZSB0aGUgc2FtZSBPT0IgbGF5b3V0LgoKSG93ZXZlciwgY29tbWl0IGM3YmMz
NjY2MmM3NSAoIm10ZDogc3BpbmFuZDogd2luYm9uZDogR2VuZXJhbGl6ZSB0aGUgS1YgT09CCmxh
eW91dCIpIGFwcGVhcnMgdG8gaGF2ZSBhY2NpZGVudGFsbHkgb3ZlcndyaXR0ZW4gJncyNW4wOGx3
X29vYmxheW91dCBvbgpXMjVOMDRMVyB3aXRoICZ3MjVueHhrdl9rd19vb2JsYXlvdXQsIHdoaWNo
IHRoZW4gY2F1c2VkIGNvbW1pdCA2NDc2MDkwNmRhN2YKKCJtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6
IEdlbmVyYWxpemUgdGhlIExXIE9PQiBsYXlvdXQiKSB0byBtaXNzIFcyNU4wNExXIHdoZW4KcmVu
YW1pbmcgdzI1bjA4bHdfb29ibGF5b3V0IHRvIHcyNW54eGx2X2x3X29vYmxheW91dC4KCldpdGgg
JncyNW54eGt2X2t3X29vYmxheW91dCByZWdpc3RlcmVkIGZvciBXMjVOMDRMVyBkdXJpbmcgc3Bp
bmFuZF9pbml0KCksCncyNW54eGt2X2t3X29vYmxheW91dF9mcmVlKCkgZXhwb3NlcyAxNCBmcmVl
IGJ5dGVzIHBlciAxNi1ieXRlIE9PQiBzZWN0aW9uCnN0YXJ0aW5nIGF0IG9mZnNldCAyIChpbmNs
dWRpbmcgdGhlIDIgVXNlciBEYXRhIElJIGJ5dGVzIG5vdCBwcm90ZWN0ZWQgYnkKb24tZGllIEVD
QykgaW5zdGVhZCBvZiBvbmx5IHRoZSAxMiBFQ0MtcHJvdGVjdGVkIFVzZXIgRGF0YSBJIGJ5dGVz
IGF0IG9mZnNldCA0CnJldHVybmVkIGJ5IHcyNW54eGx2X2x3X29vYmxheW91dF9mcmVlKCksIGFu
ZCB3MjVueHhrdl9rd19vb2JsYXlvdXRfZWNjKCkKcmVwb3J0cyBFQ0MgcGFyaXR5IHJlZ2lvbnMg
aW4gdGhlIHVwcGVyIGhhbGYgb2YgT09CIHJhdGhlciB0aGFuIHJldHVybmluZwotRVJBTkdFIGFz
IHcyNW54eGx2X2x3X29vYmxheW91dF9lY2MoKSBkb2VzIGZvciBXMjVOMDJMViwgVzI1TjAyTFcs
IFcyNU4wNExWLAphbmQgVzI1TjA4TFcuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDMwLXdpbmJvbmQtbWFzdGVyLXcyNW54eGx2
dy12MS0wLTkxZjY3NDA3ZGM4YkBib290bGluLmNvbT9wYXJ0PTEzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
