Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD187C3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 19:37:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C752071C
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 19:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xt0+ZQp3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88C752071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EiGpYuylOOd/MvqzjaHiep0gj3uagUi59mLtxgxx2CI=; b=Xt0+ZQp32KaTdHNRxUAeIGXbV
	9rI3AsWVC/cKfrGqVvmiU6jDEZw9nrPLGsv2KrOa+Me3Ayyh0NMgy1kelsx3pKwIS0Q9kwnpSuwWT
	MabNP6Co9dNtyhrbJKf2RybOBgB6BeqysgAOzMiSzEcFRRqDU45HgDseZ48tXwlvPtXLzEEE0n6RO
	+BYgBQUei8q/t+gD9T9N2lnvII+QVy9okJ0c5X8Imv0lQ0tWFGHTk0cc+9WcKn3+fMzAOT8K2dV3Z
	CIgCc7OvefIKEH0jSoqE4WezhbBuLeaRR12Oo0FGAmJaRKg9f3VVNMt7QccLFpddyiVzA5UHhPjZ5
	DuKYYAluA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUxwT-0000ho-DT; Sat, 02 May 2020 19:36:53 +0000
Received: from 5.mo7.mail-out.ovh.net ([178.32.120.239])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUxwP-0000eC-3Z
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 19:36:50 +0000
Received: from player159.ha.ovh.net (unknown [10.108.54.217])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id BB7F11600FB
 for <linux-mtd@lists.infradead.org>; Sat,  2 May 2020 21:36:33 +0200 (CEST)
Received: from RCM-web4.webmail.mail.ovh.net
 (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
 (Authenticated sender: rafal@milecki.pl)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 8672C11F190FD;
 Sat,  2 May 2020 19:36:24 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 02 May 2020 21:36:24 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: fix calculating partition end address
In-Reply-To: <20200502200401.7dfa5def@xps13>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13>
 <6125d86fee0c83653cc281b3069e1587@milecki.pl>
 <20200309152221.28dc38ab@xps13>
 <e2873d10-2513-8d09-6601-cb542453e10f@milecki.pl>
 <20200309162223.15582d12@xps13> <20200502200401.7dfa5def@xps13>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <129f9ab162b62408f0555f73793fc2f1@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 14680890362534268614
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrieelgddufeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhgpofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeffudffgfejgfdvieegudekffefveehjeeuieekheduieduhedvieefudetheeinecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_123649_292477_3C867F22 
X-CRM114-Status: GOOD (  22.24  )
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
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82eck?= =?UTF-8?Q?i?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0wNS0wMiAyMDowNCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBvbiBNb24sIDkgTWFyIDIwMjAKPiAx
NjoyMjoyMyArMDEwMDoKPiAKPj4gSGkgUmFmYcWCLAo+PiAKPj4gUmFmYcWCIE1pxYJlY2tpIDxy
YWZhbEBtaWxlY2tpLnBsPiB3cm90ZSBvbiBNb24sIDkgTWFyIDIwMjAgMTY6MDg6MTIKPj4gKzAx
MDA6Cj4+IAo+PiA+IE9uIDA5LjAzLjIwMjAgMTU6MjIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+
ID4gPiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+IHdyb3RlIG9uIE1vbiwgMDkg
TWFyIDIwMjAgMTU6MTk6MTAKPj4gPiA+ICswMTAwOgo+PiA+ID4KPj4gPiA+PiBPbiAyMDIwLTAz
LTA5IDE1OjA0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiA+ID4+PiBSYWZhxYIgTWnFgmVja2kg
PHphamVjNUBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgIDkgTWFyIDIwMjAgMDg6NDQ6NDUKPj4g
PiA+Pj4gKzAxMDA6Cj4+ID4gPj4+ICAgID4+Pj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZh
bEBtaWxlY2tpLnBsPgo+PiA+ID4+Pj4+PiBUaGlzIGZpeGVzIGNoZWNrIGZvciBwYXJ0aXRpb25z
IHRoYXQgZG9uJ3Qgc3RhcnQgYXQgYmVnaW5uaW5nIG9mIHRoZWlyCj4+ID4gPj4+PiBwYXJlbnRz
LiBNaXNzaW5nIHBhcnRpdGlvbidzIG9mZnNldCBpbiBmb3JtdWxhIGNvdWxkIHJlc3VsdCBpbiBm
b3JjaW5nCj4+ID4gPj4+PiByZWFkLW9ubHkgaW5jb3JyZWN0bHkuCj4+ID4gPj4+Pj4+IEZpeGVz
OiA2NzUwZjYxYTEzYTAgKCJtdGQ6IGltcHJvdmUgY2FsY3VsYXRpbmcgcGFydGl0aW9uIGJvdW5k
YXJpZXMgPj4gd2hlbiBjaGVja2luZyBmb3IgYWxpZ25tZW50IikKPj4gPiA+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gPiA+Pj4+IC0tLQo+
PiA+ID4+Pj4gICBkcml2ZXJzL210ZC9tdGRwYXJ0LmMgfCAyICstCj4+ID4gPj4+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+PiA+ID4+Pj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4+
ID4gPj4+PiBpbmRleCA3MzI4YzA2NmM1YmEuLmM2ODNiNDMyY2M1ZSAxMDA2NDQKPj4gPiA+Pj4+
IC0tLSBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+PiA+ID4+Pj4gKysrIGIvZHJpdmVycy9tdGQv
bXRkcGFydC5jCj4+ID4gPj4+PiBAQCAtNTI0LDcgKzUyNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXRk
X3BhcnQgKmFsbG9jYXRlX3BhcnRpdGlvbihzdHJ1Y3QgPj4gbXRkX2luZm8gKnBhcmVudCwKPj4g
PiA+Pj4+ICAgCQkJcGFydC0+bmFtZSk7Cj4+ID4gPj4+PiAgIAl9Cj4+ID4gPj4+Pj4+IC0JdG1w
ID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50KSArIHNsYXZlLT5tdGQuc2l6ZTsKPj4gPiA+
Pj4+ICsJdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50KSArIHNsYXZlLT5vZmZzZXQg
KyA+PiBzbGF2ZS0+bXRkLnNpemU7Cj4+ID4gPj4+Cj4+ID4gPj4+IEkgdGhpbmsgeW91IGFyZSBk
b2luZyB0aGUgY2hhbmdlIGF0IHRoZSB3cm9uZyBwbGFjZSwgaWYgeW91IHdhbnQgdG8KPj4gPiA+
Pj4gY2hlY2sgd2hlcmUgdGhlIHBhcnRpdGlvbiAqc3RhcnRzKiB5b3Ugc2hvdWxkIGRvIGl0IGEg
ZmV3IGxpbmVzIGFib3ZlLgo+PiA+ID4+PiBCdXQgSSB0aGluayB0aGUgY2hlY2sgc2hvdWxkIGJl
IGhlcmUgYXMgd2VsbCwgcHJvYmFibHkuCj4+ID4gPj4KPj4gPiA+PiBUaGUgY2hlY2sgd2hlcmUg
dGhlIHBhcnRpdGlvbiAqc3RhcnRzKiBpcyBPSyBhbmQgSSBkb24ndCBtZWFuIHRvIGNoYW5nZQo+
PiA+ID4+IGl0LiBUaGUgYnVnIGlzIGFib3V0IGNhbGN1bGF0aW5nIGFic29sdXRlICplbmQqIGFk
ZHJlc3Mgb2YgcGFydGl0aW9uLgo+PiA+ID4KPj4gPiA+IENhbiB5b3UgZGV0YWlsIGEgbGl0dGxl
IGJpdCB0aGVuPyBCZWNhdXNlIEkgZG9uJ3Qgc2VlIHRoZSBpc3N1ZSBhbnltb3JlCj4+ID4gPiBl
dmVuIHRob3VnaCBJIGFtIGNvbnZpbmNlZCBzb21ldGhpbmcgaXMgd3JvbmcgaGVyZSA6KQo+PiA+
Cj4+ID4gUGxlYXNlIGNvbnNpZGVyIGZvbGxvd2luZyBwYXJ0aXRpb25zIGxheW91dDoKPj4gPiAq
IGJjbTQ3eHhzZmxhc2gKPj4gPiDilJzilIAgYm9vdAkJMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDAw
NDAwMDAKPj4gPiDilJTilKwgZmlybXdhcmUJMHgwMDAwMDAwNDAwMDAtMHgwMDAwMDEwMDAwMDAK
Pj4gPiAgIOKUnOKUgCBsaW51eAkweDAwMDAwMDAwMDAxYy0weDAwMDAwMDE4ZjgwMAo+PiA+ICAg
4pSU4pSsIGNvbnRhaW5lcgkweDAwMDAwMDE4ZjgwMC0weDAwMDAwMGZjMDAwMAo+PiA+ICAgIOKU
nOKUgCBmb28JMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDA2MzA4MDAKPj4gPiAgICDilJTilIAgYmFy
CTB4MDAwMDAwNjMwODAwLTB4MDAwMDAwZTMwODAwIChzaXplOiAweDgwMDAwMCkKPj4gPgo+PiA+
Cj4+ID4gRXhpc3RpbmcgKGNvcnJlY3QpICpzdGFydCogY2FsY3VsYXRpb246Cj4+ID4gYmFyIHN0
YXJ0OiAwICsgMHgwNDAwMDAgKyAweDE4ZjgwMCArIDB4NjMwODAwID0gMHg4MDAwMDAKPj4gPgo+
PiA+IEV4aXN0aW5nICh3cm9uZykgZW5kIGNhbGN1bGF0aW9uOgo+PiA+IGJhciBlbmQ6IDAgKyAw
eDA0MDAwMCArIDB4MThmODAwICsgMHg4MDAwMDAgPSAweDljZjgwMAo+PiA+Cj4+ID4gRml4ZWQg
KGNvcnJlY3QpIGVuZCBjYWxjdWxhdGlvbjoKPj4gPiBiYXIgZW5kOiAwICsgMHgwNDAwMDAgKyAw
eDE4ZjgwMCArIDB4NjMwODAwICsgMHg4MDAwMDAgPSAweDEwMDAwMDAKPj4gCj4+IE9rIEkgZ2V0
IGl0ISBJIHRoaW5rIG1lbnRpb25pbmcgInBhcnRpdGlvbnMgdGhhdCBkb24ndCBzdGFydCBhdAo+
PiBiZWdpbm5pbmcgb2YgdGhlaXIgcGFyZW50cyIsIGRlc3BpdGUgYmVpbmcgdHJ1ZSwgd2FzIG1p
c2xlYWRpbmcgdG8gbWUKPj4gYXMgSSB1bmRlcnN0b29kICJsZWF2aW5nIGV4dHJhIHNwYWNlIHdp
dGggdGhlIHN0YXJ0IG9mIHRoZWlyIHBhcmVudCIuCj4+IAo+PiBJIHN1cHBvc2UgeW91IGFsc28g
aGF2ZSB0aGUgaXNzdWUgd2l0aCAiY29udGFpbmVyIiB0b28/Cj4+IAo+PiBBbnl3YXksIEkgdGhp
bmsgdGhlIGZpeCBpcyBmaW5lLiBBIGJldHRlciBmb3JtdWxhdGlvbiBmb3IgdGhlIGNvbW1pdAo+
PiBsb2cgd291bGQgYmUgd2VsY29tZSA6KSAobWF5YmUgYWRkaW5nIHRoaXMgZXhhbXBsZSBpcyBh
IGdvb2QgaWRlYSEpCj4gCj4gSSBkb24ndCByZW1lbWJlciBoYXZpbmcgYXBwbGllZCB0aGlzIGZp
eCB5ZXQsIHdvdWxkIHlvdSBtaW5kIHJlc2VuZGluZwo+IHRoaXMgcGF0Y2ggd2l0aCBhbiBlbmhh
bmNlZCBjb21taXQgbG9nICh5b3VyIGV4YW1wbGUgd2FzIGEgZ29vZCBvbmUgSQo+IHRoaW5rKS4K
Ckl0J3Mgbm90IG5lZWRlZCBhbnltb3JlLiBQbGVhc2UgY2hlY2sgZGlzY3Vzc2lvbiB3ZSBnb3Q6
CgotLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0tClN1YmplY3Q6IFJlOiBbUEFUQ0hd
IG10ZDogZml4IGNhbGN1bGF0aW5nIHBhcnRpdGlvbiBlbmQgYWRkcmVzcwpEYXRlOiAyMDIwLTAz
LTI0IDIzOjExCgo+ID4gSSB3b3VsZCBsaWtlIHRvIGFwcGx5IHlvdXIgZml4IHRoaXMgd2Vlaywg
ZG8geW91IHRoaW5rIHlvdSBjYW4gcmViYXNlCj4gPiBhbmQgcmVzZW5kIHNvb24/Cj4gCj4gSXQn
cyBub3QgbmVlZGVkIGFueW1vcmUgYXMgeW91IGZpeGVkIHRoaXMgYnVnIGluIHlvdXIgY29tbWl0
IHJld29ya2luZwo+IHBhcnRpdGlvbnMuCgpHcmVhdCEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
