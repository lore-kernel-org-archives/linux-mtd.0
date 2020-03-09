Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C754AC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 15:08:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B74E20873
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 15:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b5ejipQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B74E20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KzzA4IuFOa+zQXby+eniY91OxmF+2JplfDpb+tnJKQ8=; b=b5ejipQQAcOPYJ2bHRzqqEUtl
	XNxAXTBQNKj8vgZB8C13BpavdxdOEj7dJcFDfNqFNv0CKUjSot2/TySurUIQl+Mvk2P7Z5m3JHGr4
	/qXwGQvrNPt+seLPIWwrbx9xLLZZTrFjYXi+YYj9QK4v09cNMaaPsTpryMolzqyIu0IBxrnhMwlos
	3uo/yQ+fbotbJxQJ6i9vMrthLeBK5wC57/FXl3jm85TQZUN6Psi1GwG7VKjMsuDHIE7IQWl83V3qC
	hjHeYKWxDGaJWO4y9nZ436LDJoY9GSAli4bCBUxN1P3RXtvDdy7kCDV1dlSeUxUXy8tC5GNQxJXyA
	8Qq93JeMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBK19-0006QG-FV; Mon, 09 Mar 2020 15:08:31 +0000
Received: from 19.mo7.mail-out.ovh.net ([178.33.251.118])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBK15-0006Pn-Jk
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 15:08:29 +0000
Received: from player774.ha.ovh.net (unknown [10.110.103.23])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id B0022157E0C
 for <linux-mtd@lists.infradead.org>; Mon,  9 Mar 2020 16:08:21 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl
 [194.187.74.233]) (Authenticated sender: rafal@milecki.pl)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id 8AFF81049FB43;
 Mon,  9 Mar 2020 15:08:13 +0000 (UTC)
Subject: Re: [PATCH] mtd: fix calculating partition end address
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13> <6125d86fee0c83653cc281b3069e1587@milecki.pl>
 <20200309152221.28dc38ab@xps13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <e2873d10-2513-8d09-6601-cb542453e10f@milecki.pl>
Date: Mon, 9 Mar 2020 16:08:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309152221.28dc38ab@xps13>
Content-Language: en-US
X-Ovh-Tracer-Id: 6621698827589357235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddukedgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_080827_805261_701E23A5 
X-CRM114-Status: GOOD (  18.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDkuMDMuMjAyMCAxNToyMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+IHdyb3RlIG9uIE1vbiwgMDkgTWFyIDIwMjAgMTU6MTk6MTAK
PiArMDEwMDoKPiAKPj4gT24gMjAyMC0wMy0wOSAxNTowNCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
Pj4+IFJhZmHFgiBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAgOSBN
YXIgMjAyMCAwODo0NDo0NQo+Pj4gKzAxMDA6Cj4+PiAgICAKPj4+PiBGcm9tOiBSYWZhxYIgTWnF
gmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Pj4+PiBUaGlzIGZpeGVzIGNoZWNrIGZvciBwYXJ0
aXRpb25zIHRoYXQgZG9uJ3Qgc3RhcnQgYXQgYmVnaW5uaW5nIG9mIHRoZWlyCj4+Pj4gcGFyZW50
cy4gTWlzc2luZyBwYXJ0aXRpb24ncyBvZmZzZXQgaW4gZm9ybXVsYSBjb3VsZCByZXN1bHQgaW4g
Zm9yY2luZwo+Pj4+IHJlYWQtb25seSBpbmNvcnJlY3RseS4KPj4+Pj4+IEZpeGVzOiA2NzUwZjYx
YTEzYTAgKCJtdGQ6IGltcHJvdmUgY2FsY3VsYXRpbmcgcGFydGl0aW9uIGJvdW5kYXJpZXMgPj4g
d2hlbiBjaGVja2luZyBmb3IgYWxpZ25tZW50IikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIg
TWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Pj4gLS0tCj4+Pj4gICBkcml2ZXJzL210ZC9t
dGRwYXJ0LmMgfCAyICstCj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgYi9k
cml2ZXJzL210ZC9tdGRwYXJ0LmMKPj4+PiBpbmRleCA3MzI4YzA2NmM1YmEuLmM2ODNiNDMyY2M1
ZSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPj4+PiArKysgYi9kcml2
ZXJzL210ZC9tdGRwYXJ0LmMKPj4+PiBAQCAtNTI0LDcgKzUyNCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
bXRkX3BhcnQgKmFsbG9jYXRlX3BhcnRpdGlvbihzdHJ1Y3QgPj4gbXRkX2luZm8gKnBhcmVudCwK
Pj4+PiAgIAkJCXBhcnQtPm5hbWUpOwo+Pj4+ICAgCX0KPj4+Pj4+IC0JdG1wID0gcGFydF9hYnNv
bHV0ZV9vZmZzZXQocGFyZW50KSArIHNsYXZlLT5tdGQuc2l6ZTsKPj4+PiArCXRtcCA9IHBhcnRf
YWJzb2x1dGVfb2Zmc2V0KHBhcmVudCkgKyBzbGF2ZS0+b2Zmc2V0ICsgPj4gc2xhdmUtPm10ZC5z
aXplOwo+Pj4KPj4+IEkgdGhpbmsgeW91IGFyZSBkb2luZyB0aGUgY2hhbmdlIGF0IHRoZSB3cm9u
ZyBwbGFjZSwgaWYgeW91IHdhbnQgdG8KPj4+IGNoZWNrIHdoZXJlIHRoZSBwYXJ0aXRpb24gKnN0
YXJ0cyogeW91IHNob3VsZCBkbyBpdCBhIGZldyBsaW5lcyBhYm92ZS4KPj4+IEJ1dCBJIHRoaW5r
IHRoZSBjaGVjayBzaG91bGQgYmUgaGVyZSBhcyB3ZWxsLCBwcm9iYWJseS4KPj4KPj4gVGhlIGNo
ZWNrIHdoZXJlIHRoZSBwYXJ0aXRpb24gKnN0YXJ0cyogaXMgT0sgYW5kIEkgZG9uJ3QgbWVhbiB0
byBjaGFuZ2UKPj4gaXQuIFRoZSBidWcgaXMgYWJvdXQgY2FsY3VsYXRpbmcgYWJzb2x1dGUgKmVu
ZCogYWRkcmVzcyBvZiBwYXJ0aXRpb24uCj4gCj4gQ2FuIHlvdSBkZXRhaWwgYSBsaXR0bGUgYml0
IHRoZW4/IEJlY2F1c2UgSSBkb24ndCBzZWUgdGhlIGlzc3VlIGFueW1vcmUKPiBldmVuIHRob3Vn
aCBJIGFtIGNvbnZpbmNlZCBzb21ldGhpbmcgaXMgd3JvbmcgaGVyZSA6KQoKUGxlYXNlIGNvbnNp
ZGVyIGZvbGxvd2luZyBwYXJ0aXRpb25zIGxheW91dDoKKiBiY200N3h4c2ZsYXNoCuKUnOKUgCBi
b290CQkweDAwMDAwMDAwMDAwMC0weDAwMDAwMDA0MDAwMArilJTilKwgZmlybXdhcmUJMHgwMDAw
MDAwNDAwMDAtMHgwMDAwMDEwMDAwMDAKICDilJzilIAgbGludXgJMHgwMDAwMDAwMDAwMWMtMHgw
MDAwMDAxOGY4MDAKICDilJTilKwgY29udGFpbmVyCTB4MDAwMDAwMThmODAwLTB4MDAwMDAwZmMw
MDAwCiAgIOKUnOKUgCBmb28JMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDA2MzA4MDAKICAg4pSU4pSA
IGJhcgkweDAwMDAwMDYzMDgwMC0weDAwMDAwMGUzMDgwMCAoc2l6ZTogMHg4MDAwMDApCgoKRXhp
c3RpbmcgKGNvcnJlY3QpICpzdGFydCogY2FsY3VsYXRpb246CmJhciBzdGFydDogMCArIDB4MDQw
MDAwICsgMHgxOGY4MDAgKyAweDYzMDgwMCA9IDB4ODAwMDAwCgpFeGlzdGluZyAod3JvbmcpIGVu
ZCBjYWxjdWxhdGlvbjoKYmFyIGVuZDogMCArIDB4MDQwMDAwICsgMHgxOGY4MDAgKyAweDgwMDAw
MCA9IDB4OWNmODAwCgpGaXhlZCAoY29ycmVjdCkgZW5kIGNhbGN1bGF0aW9uOgpiYXIgZW5kOiAw
ICsgMHgwNDAwMDAgKyAweDE4ZjgwMCArIDB4NjMwODAwICsgMHg4MDAwMDAgPSAweDEwMDAwMDAK
CgpCZWNhdXNlIG9mIHRoYXQgZXhpc3Rpbmcgd3JvbmcgZW5kIGNhbGN1bGF0aW9uIEkgd2FzIGdl
dHRpbmc6Cm10ZDogcGFydGl0aW9uICJiYXIiIGRvZXNuJ3QgZW5kIG9uIGFuIGVyYXNlL3dyaXRl
IGJsb2NrIC0tIGZvcmNlIHJlYWQtb25seQoKU2VlOgoyIGJjbTQ3eHhwYXJ0IHBhcnRpdGlvbnMg
Zm91bmQgb24gTVREIGRldmljZSBiY200N3h4c2ZsYXNoCkNyZWF0aW5nIDIgTVREIHBhcnRpdGlv
bnMgb24gImJjbTQ3eHhzZmxhc2giOgoweDAwMDAwMDAwMDAwMC0weDAwMDAwMDA0MDAwMCA6ICJi
b290IgoweDAwMDAwMDA0MDAwMC0weDAwMDAwMTAwMDAwMCA6ICJmaXJtd2FyZSIKMiB0cnggcGFy
dGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIGZpcm13YXJlCkNyZWF0aW5nIDIgTVREIHBhcnRp
dGlvbnMgb24gImZpcm13YXJlIjoKMHgwMDAwMDAwMDAwMWMtMHgwMDAwMDAxOGY4MDAgOiAibGlu
dXgiCm10ZDogcGFydGl0aW9uICJsaW51eCIgZG9lc24ndCBzdGFydCBvbiBhbiBlcmFzZS93cml0
ZSBibG9jayBib3VuZGFyeSAtLSBmb3JjZSByZWFkLW9ubHkKMHgwMDAwMDAxOGY4MDAtMHgwMDAw
MDBmYzAwMDAgOiAiY29udGFpbmVyIgptdGQ6IHBhcnRpdGlvbiAiY29udGFpbmVyIiBkb2Vzbid0
IHN0YXJ0IG9uIGFuIGVyYXNlL3dyaXRlIGJsb2NrIGJvdW5kYXJ5IC0tIGZvcmNlIHJlYWQtb25s
eQoyIGNvbnRhaW5lciBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2UgY29udGFpbmVyCkNy
ZWF0aW5nIDIgTVREIHBhcnRpdGlvbnMgb24gImNvbnRhaW5lciI6CjB4MDAwMDAwMDAwMDAwLTB4
MDAwMDAwNjMwODAwIDogImZvbyIKbXRkOiBwYXJ0aXRpb24gImZvbyIgZG9lc24ndCBzdGFydCBv
biBhbiBlcmFzZS93cml0ZSBibG9jayBib3VuZGFyeSAtLSBmb3JjZSByZWFkLW9ubHkKMHgwMDAw
MDA2MzA4MDAtMHgwMDAwMDBlMzA4MDAgOiAiYmFyIgptdGQ6IHBhcnRpdGlvbiAiYmFyIiBkb2Vz
bid0IGVuZCBvbiBhbiBlcmFzZS93cml0ZSBibG9jayAtLSBmb3JjZSByZWFkLW9ubHkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
