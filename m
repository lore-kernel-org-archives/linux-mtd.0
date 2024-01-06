Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3DEC46CD2
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jan 2024 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=E2DpIQY3oRgFnk16kXmfq+dV3cnnsk1ilIFk0Zm1r1Q=; b=cchNrn9LnZ+jkgnIkwjRKZgE3Y
	I+P1QD/dst4eb/2riJWoygNChLwwZvqK+nGrUD9y4qN5cymEd9jqO6rIdDse340YvCocH8sS5TdfV
	Vlw+Vw7NS1KVHm4f8LUHCebJr9J7eJ3nBYEEiuZ44KdwWWK7CP0NGFQeRxl4No4u0PVQqQvtP8Blb
	et37tJQf5fDAd9CNSLD6meo0NMPvp4yf3so8WLP3g9simconm8mDx3RSuPehf+1SKwGNMOfq16q8R
	TgSpvB8JzxPSQP9T/3TPglC+nEW8WoJfJEWoCAr7EMouEqwVdVVavaaTj5GiIEdX0FNBtD7eGMiGe
	u1UXyb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rM8WP-001VOq-0Z;
	Sat, 06 Jan 2024 15:23:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rM8WL-001VNH-2j
	for linux-mtd@lists.infradead.org;
	Sat, 06 Jan 2024 15:23:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 80AB564103E8;
	Sat,  6 Jan 2024 16:23:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id kwVZ2It0Oepv; Sat,  6 Jan 2024 16:23:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B480464103F4;
	Sat,  6 Jan 2024 16:23:28 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id t3bXiTK7AYEG; Sat,  6 Jan 2024 16:23:28 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9470464103E8;
	Sat,  6 Jan 2024 16:23:28 +0100 (CET)
Date: Sat, 6 Jan 2024 16:23:28 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Mauri Sandberg <maukka@ext.kapsi.fi>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1464457733.203332.1704554608470.JavaMail.zimbra@nod.at>
In-Reply-To: <022816c4-7afd-4bd9-80a7-6bd5e9e0edd0@ext.kapsi.fi>
References: <20231229135653.4764-1-maukka@ext.kapsi.fi> <fbce5a93-c3b8-45f4-9698-c76838ac5fea@ext.kapsi.fi> <1214686551.202632.1704536161145.JavaMail.zimbra@nod.at> <022816c4-7afd-4bd9-80a7-6bd5e9e0edd0@ext.kapsi.fi>
Subject: Re: [PATCH] mkfs.ubifs: Add option to minimize the amount of LEBs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mkfs.ubifs: Add option to minimize the amount of LEBs
Thread-Index: rdOmphxGVj6QGDi7sGIv2icH+ZtIAQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240106_072334_228245_A0E7FD19 
X-CRM114-Status: GOOD (  11.25  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hdXJpIFNhbmRiZXJnIiA8
bWF1a2thQGV4dC5rYXBzaS5maT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBD
QzogIk1hdXJpIFNhbmRiZXJnIiA8bWF1a2thQGV4dC5rYXBzaS5maT4sICJkYXZpZCBvYmVyaG9s
bGVuemVyIiA8ZGF2aWQub2JlcmhvbGxlbnplckBzaWdtYS1zdGFyLmF0PiwgImxpbnV4LW10ZCIK
PiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gR2VzZW5kZXQ6IFNhbXN0YWcsIDYu
IEphbnVhciAyMDI0IDE1OjQ2OjExCj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gbWtmcy51Ymlmczog
QWRkIG9wdGlvbiB0byBtaW5pbWl6ZSB0aGUgYW1vdW50IG9mIExFQnMKCj4gVGhhbmtzIGZvciB5
b3VyIHByb3BtcHQgcmVzcG9uc2UsIFJpY2hhcmQuCj4gCj4gT24gNi4xLjIwMjQgMTIuMTYsIFJp
Y2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPj4gQnV0IHdoYXQgd2lsbCBoYXBwZW4gaWYgc29tZWJv
ZHkgdHJpZXMgdG8KPj4gdXNlIGEgbWluaW1pemVkIFVCSUZTIGluIHJ3LW1vZGU/Cj4+IEkgZmVh
ciB0aGVuIFVCSUZTIHdpbGwgZmFpbCBiZWNhdXNlIGl0IGhhcyBub3QgZW5vdWdoIGxvZyBMRUJz
IG9yIHN1Y2g/Cj4gCj4gRmlyc3Qgb2ZmIEkgd291bGQgYXNzdW1lIGl0IHdvdWxkIG1vdW50IHRo
ZSBmaWxlc3lzdGVtIHdyaXRhYmxlIHdpdGgKPiB2ZXJ5IGxpdHRsZSBmcmVlIHNwYWNlIGF2YWls
YWJsZS4gSGVyZSBJIGFtIGFzc3VtaW5nIHRoZSBtaW5pbnVtIExFQgo+IGNvdW50IG1rZnMudWJp
ZnMgY2FsY3VsYXRlcyBpcyBsZWdpdCBhbmQgdGhhdCB0aGUgc2FtZSBnb2VzIGZvciB0aGUKPiBq
b3VybmFsIGFuZCBsb2cgc2l6ZXMuCgpIbSwgSSBnYXZlIHlvdXIgcGF0Y2ggYSB0cnkuIEFzIHNv
b24gSSB1c2UgIi1NIiwgdGhlIHJlc3VsdGluZyBmaWxlIHN5c3RlbQpkb2VzIG5vdCBtb3VudC4g
Tm8gbWF0dGVyIGhvdyBsYXJnZSB0aGUgVUJJIHZvbHVtZSBpcy4KClsxODAzNC42ODczOTJdIFVC
SUZTICh1YmkwOjApOiBNb3VudGluZyBpbiB1bmF1dGhlbnRpY2F0ZWQgbW9kZQpbMTgwMzQuNjg4
MjQxXSBVQklGUyAodWJpMDowKTogYmFja2dyb3VuZCB0aHJlYWQgInViaWZzX2JndDBfMCIgc3Rh
cnRlZCwgUElEIDE0MjgKWzE4MDM0LjY4ODQ4NF0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTQy
Nyk6IGNoZWNrX2xwdF90eXBlLmNvbnN0cHJvcC4xOTogaW52YWxpZCB0eXBlICgwKSBpbiBMUFQg
bm9kZSB0eXBlIDEKWzE4MDM0LjY5MDEzOV0gQ1BVOiAyIFBJRDogMTQyNyBDb21tOiBtb3VudCBO
b3QgdGFpbnRlZCA2LjcuMC1yYzctMDAwMDQtZ2MwN2E0ZGFiMjQzYSAjMjQ2ClsxODAzNC42OTA4
NzFdIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYp
LCBCSU9TIHJlbC0xLjE2LjAtMC1nZDIzOTU1MmMtcmVidWlsdC5vcGVuc3VzZS5vcmcgMDQvMDEv
MjAxNApbMTgwMzQuNjkwODczXSBDYWxsIFRyYWNlOgpbMTgwMzQuNjkwODg2XSAgPFRBU0s+Clsx
ODAzNC42OTA4ODldICBkdW1wX3N0YWNrX2x2bCsweDMyLzB4NTAKWzE4MDM0LjY5MDg5OV0gIGNo
ZWNrX2xwdF90eXBlLmNvbnN0cHJvcC4xOSsweDM2LzB4NDAKWzE4MDM0LjY5MDkwNV0gIHViaWZz
X3VucGFja19ubm9kZSsweDRhLzB4MTIwClsxODAzNC42OTA5MTBdICB1Ymlmc19yZWFkX25ub2Rl
KzB4MWJmLzB4MjEwClsxODAzNC42OTA5MTNdICB1Ymlmc19scHRfbG9va3VwX2RpcnR5KzB4MTY1
LzB4MmUwClsxODAzNC42OTA5MTZdICA/IGxlYl93cml0ZV91bmxvY2srMHg3Mi8weGMwClsxODAz
NC42OTA5MjBdICB1Ymlmc19yZXBsYXlfam91cm5hbCsweDQ0LzB4MTFkMApbMTgwMzQuNjkwOTIy
XSAgPyBuZXh0X3NxbnVtKzB4MjcvMHg5MApbMTgwMzQuNjkwOTI2XSAgPyB1Ymlmc19sZWJfd3Jp
dGUrMHg1Zi8weDEwMApbMTgwMzQuNjk1Njc1XSAgPyB1Ymlmc193cml0ZV9ub2RlX2htYWMrMHhj
ZC8weDFkMApbMTgwMzQuNjk1Njc5XSAgdWJpZnNfbW91bnQrMHgxMzA1LzB4MTdkMApbMTgwMzQu
Njk1NjgyXSAgPyBfX3BmeF9idWRfd2J1Zl9jYWxsYmFjaysweDEwLzB4MTAKWzE4MDM0LjY5NTY4
NF0gID8gbGVnYWN5X2dldF90cmVlKzB4MjIvMHg0MApbMTgwMzQuNjk1Njg4XSAgPyBfX3BmeF91
Ymlmc19tb3VudCsweDEwLzB4MTAKWzE4MDM0LjY5NTY5MF0gIGxlZ2FjeV9nZXRfdHJlZSsweDIy
LzB4NDAKWzE4MDM0LjY5NTY5Ml0gIHZmc19nZXRfdHJlZSsweDIwLzB4ZDAKWzE4MDM0LjY5NTY5
NV0gIHBhdGhfbW91bnQrMHg1OWMvMHg5YTAKWzE4MDM0LjY5NTY5OF0gID8gdXNlcl9wYXRoX2F0
X2VtcHR5KzB4M2IvMHg1MApbMTgwMzQuNjk1NzAyXSAgZG9fbW91bnQrMHg3NC8weDkwClsxODAz
NC42OTU3MDRdICBfX3g2NF9zeXNfbW91bnQrMHg4MS8weGUwClsxODAzNC42OTU3MDZdICBkb19z
eXNjYWxsXzY0KzB4NDIvMHhmMApbMTgwMzQuNjk1NzExXSAgZW50cnlfU1lTQ0FMTF82NF9hZnRl
cl9od2ZyYW1lKzB4NmYvMHg3NwoKCj4gQWxzbywgbXkgY3VycmVudCB1bmRlcnN0YW5kaW5nIGlz
IHRoYXQgdGhlIExFQiBjYWxjdWxhdGlvbiBpcyBiYXNlZCBvbgo+IHVuY29tcHJlc3NlZCBzaXpl
LiBJZiB1YmkgdXNlcyBjb21wcmVzc2lvbiBydW50aW1lIHRoZW4gdGhlIGFtb3VudCBvZgo+IExF
QnMgYWN0dWFsbHkgdXNlZCBpcyBzbWFsbGVyLCBubz8KCkkgZG9uJ3QgdGhpbmsgdGhpcyBtYXR0
ZXJzIG11Y2ggaGVyZS4gVGhlIExFQiBjYWxjdWxhdGlvbiBpbiBta2ZzIGlzIHRvCm1ha2Ugc3Vy
ZSBVQklGUyBoYXMgZW5vdWdoIHNwYWNlIG9uIHRoZSByZXN1bHRpbmcgVUJJIHZvbHVtZSB0byB3
b3JrIGNvcnJlY3RseS4KRS5nLiBTcGFjZSBmb3IgdGhlIGxvZywgZXRjLi4KIAo+IEknbGwgaGF2
ZSB0byBkbyBzb21lIHRlc3RzIG9uIHRoZSB0b3BpYyBhbmQgc2VlIGhvdyBpdCBiZWhhdmVzLiBJ
J2xsIGdldAo+IGJhY2sgdG8geW91LgoKT2shCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
