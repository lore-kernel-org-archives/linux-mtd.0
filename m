Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16162C64E8A
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 08:33:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85DD52222C
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 08:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85DD52222C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2f+X8myGzcTh9Y7WJLPwPLd9JdyvWN9FFtV/cN1F+70=; b=QIpKPVOc2k/yuNHvcyL9kCavD
	BJvyoH7J56fmz7EoSOtCjB3Ows3bexKGet6yvjF8GTa/fRbYMSyQ/pWvJKHnfcDbRmZm5TFWKLQbV
	Cab9Hmm8M6yKLJSfy/LpQDbTTYIVgZn1+7djPpS0NBcxAhD1n+q4UsmUCCgOhcptAY0Qg5xWq/MEx
	l/kPWAERPWFxpt6qMhyyxUm+m9f3IkmurzGalCpivCpkt4xzXWNA7vuUXdMZkeYaPfeMWNx7wWEh7
	ILNbLL+UdBuTiCCl9O65B7tJNl1IZvjLkWWEForgZPvoaQo7qYtHmZ74780TcS/AUCA/0s8bRzikh
	RjvDdhzwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkNYT-0002aA-PY; Wed, 02 Dec 2020 08:32:05 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkNYQ-0002YO-7g
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 08:32:03 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 58DEF240002;
 Wed,  2 Dec 2020 08:31:58 +0000 (UTC)
Date: Wed, 2 Dec 2020 09:31:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: orion-nand: uncorrectable ECC error on v5.10-rc6
Message-ID: <20201202093157.4fa6998f@xps13>
In-Reply-To: <79a69fe8-551b-6cfb-0505-37178ee5a0ec@alliedtelesis.co.nz>
References: <d88ccac1-801c-f30a-097a-331d49956a9c@alliedtelesis.co.nz>
 <20201202085948.038efb3e@xps13>
 <79a69fe8-551b-6cfb-0505-37178ee5a0ec@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_033202_633915_235E9C48 
X-CRM114-Status: GOOD (  21.37  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vignesh R <vigneshr@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXMsCgpDaHJpcyBQYWNraGFtIDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28u
bno+IHdyb3RlIG9uIFdlZCwgMiBEZWMKMjAyMCAwODoyMzoxMyArMDAwMDoKCj4gSGkgTWlxdWVs
LAo+IAo+IE9uIDIvMTIvMjAgODo1OSBwbSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIENo
cmlzLAo+ID4KPiA+IENocmlzIFBhY2toYW0gPENocmlzLlBhY2toYW1AYWxsaWVkdGVsZXNpcy5j
by5uej4gd3JvdGUgb24gV2VkLCAyIERlYwo+ID4gMjAyMCAwNzo0NzozMiArMDAwMDoKPiA+ICAK
PiA+PiBIaSwKPiA+Pgo+ID4+IEkndmUganVzdCBib290ZWQgdjUuMTAtcmM2IG9uIGEga2lya3dv
b2QgYmFzZWQgYm9hcmQgKHdoaWNoIHVzZXMgdGhlCj4gPj4gb3Jpb24tbmFuZCBkcml2ZXIpIGFu
ZCBJIGdldCB0aGUgZm9sbG93aW5nIGVycm9ycyByZXBvcnRlZC4gSSBoYXZlbid0Cj4gPj4gc3Rh
cnRlZCBiaXNlY3RpbmcgeWV0IGJ1dCB2NS43LjE5IG1vdW50cyB0aGUgbmFuZCBmbGFzaCB3aXRo
b3V0IGFueSBpc3N1ZS4KPiA+Pgo+ID4+IHViaTA6IGF0dGFjaGluZyBtdGQwCj4gPj4gX19uYW5k
X2NvcnJlY3RfZGF0YTogdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IKPiA+PiB1YmkwIHdhcm5pbmc6
IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA2NCBieXRl
cwo+ID4+IGZyb20gUEVCIDA6MCwgcmVhZCBvbmx5IDY0IGJ5dGVzLCByZXRyeQo+ID4+IF9fbmFu
ZF9jb3JyZWN0X2RhdGE6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4gPj4gdWJpMCB3YXJuaW5n
OiB1YmlfaW9fcmVhZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjQgYnl0
ZXMKPiA+PiBmcm9tIFBFQiAwOjAsIHJlYWQgb25seSA2NCBieXRlcywgcmV0cnkKPiA+PiBfX25h
bmRfY29ycmVjdF9kYXRhOiB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvcgo+ID4+IHViaTAgd2Fybmlu
ZzogdWJpX2lvX3JlYWQ6IGVycm9yIC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDY0IGJ5
dGVzCj4gPj4gZnJvbSBQRUIgMDowLCByZWFkIG9ubHkgNjQgYnl0ZXMsIHJldHJ5Cj4gPj4gX19u
YW5kX2NvcnJlY3RfZGF0YTogdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IKPiA+PiB1YmkwIGVycm9y
OiB1YmlfaW9fcmVhZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjQgYnl0
ZXMKPiA+PiBmcm9tIFBFQiAwOjAsIHJlYWQgNjQgYnl0ZXMKPiA+PiBDUFU6IDAgUElEOiAxMDEg
Q29tbTogdWJpYXR0YWNoIE5vdCB0YWludGVkIDUuMTAuMC1yYzYrICMxCj4gPj4gSGFyZHdhcmUg
bmFtZTogTWFydmVsbCBLaXJrd29vZCAoRmxhdHRlbmVkIERldmljZSBUcmVlKQo+ID4+IFs8ODAx
MGNhNjQ+XSAodW53aW5kX2JhY2t0cmFjZSkgZnJvbSBbPDgwMTA5YmQwPl0gKHNob3dfc3RhY2sr
MHgxMC8weDE0KQo+ID4+IFs8ODAxMDliZDA+XSAoc2hvd19zdGFjaykgZnJvbSBbPDgwNDVmMTBj
Pl0gKHViaV9pb19yZWFkKzB4MTg0LzB4MzA0KQo+ID4+IFs8ODA0NWYxMGM+XSAodWJpX2lvX3Jl
YWQpIGZyb20gWzw4MDQ1ZjRhYz5dICh1YmlfaW9fcmVhZF9lY19oZHIrMHg0NC8weDI0MCkKPiA+
PiBbPDgwNDVmNGFjPl0gKHViaV9pb19yZWFkX2VjX2hkcikgZnJvbSBbPDgwNDY0ZGIwPl0KPiA+
PiAodWJpX2F0dGFjaCsweDE3OC8weDE1ZmMpCj4gPj4gWzw4MDQ2NGRiMD5dICh1YmlfYXR0YWNo
KSBmcm9tIFs8ODA0NThkOGM+XSAodWJpX2F0dGFjaF9tdGRfZGV2KzB4NTM4LzB4YjQ4KQo+ID4+
IFs8ODA0NThkOGM+XSAodWJpX2F0dGFjaF9tdGRfZGV2KSBmcm9tIFs8ODA0NWExMTQ+XQo+ID4+
IChjdHJsX2NkZXZfaW9jdGwrMHgxNzAvMHgxZTApCj4gPj4gWzw4MDQ1YTExND5dIChjdHJsX2Nk
ZXZfaW9jdGwpIGZyb20gWzw4MDIwMzA5ND5dIChzeXNfaW9jdGwrMHgxZjgvMHg5OTApCj4gPj4g
Wzw4MDIwMzA5ND5dIChzeXNfaW9jdGwpIGZyb20gWzw4MDEwMDA2MD5dIChyZXRfZmFzdF9zeXNj
YWxsKzB4MC8weDUwKQo+ID4+IEV4Y2VwdGlvbiBzdGFjaygweDg3NjMzZmE4IHRvIDB4ODc2MzNm
ZjApCj4gPj4gM2ZhMDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDAwMDAw
MDMgN2U5YjBjMzAgMDAwMDAwMDMgNDAxODZmNDAgN2U5YjBjMzAKPiA+PiAwMDAwMDAwMAo+ID4+
IDNmYzA6IDAwMDAwMDAzIDdlOWIwYzMwIDAwMDE0OGY4IDAwMDAwMDM2IDAwMDE0NzcwIDAwMDEz
ZjkwIDc2ZjNkZmE0Cj4gPj4gMDAwMDAwMDAKPiA+PiAzZmUwOiA3NmU5MzZmMCA3ZTliMGMxYyAw
MDAxMWY2OCA3NmU5MzZmYyAgCj4gPiBJIHJlY2VudGx5IGNvbnRyaWJ1dGVkIGEgcGlsZSBvZiBm
aXhlcyB0byBlbnN1cmUgRFQgcGFyc2luZyB3YXMgbm90Cj4gPiBicm9rZW4gYW5kIHRoaXMgYXBw
bGllcyB0byBPcmlvbi4gQ2FuIHlvdSBwbGVhc2UgY2hlY2sKPiA+Cj4gPiBtdGQ6IHJhd25hbmQ6
IG9yaW9uOiBNb3ZlIHRoZSBFQ0MgaW5pdGlhbGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpICAK
PiBUaGF0IGxvb2tzIHRvIGJlIGl0LiBJbiBMaW51cydzIHRyZWUgY29tbWl0IDc2ZGMyYmZjMmUx
YiAoIk1lcmdlIHRhZyAKPiAnbXRkL2ZpeGVzLWZvci01LjEwLXJjNicgb2YgCj4gZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eCIpIHNlZW1zIHRv
IGJlIAo+IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gd29ya2luZyBhbmQgbm90IHdvcmtpbmcuCj4g
PiBBbmQgdGVsbCBtZSBpZiB5b3Ugc2VlIHNvbWV0aGluZyB3cm9uZyB0aGVyZT8gSSBhc3N1bWVk
IHRoaXMgZHJpdmVyIHdhcwo+ID4gbm90IHN1cHBvcnRpbmcgb24gaG9zdCBFQ0MgZW5naW5lcyBh
bmQgb25seSBzb2Z0IEhhbW1pbmcgd2FzIHVzZWQsIGlzCj4gPiB0aGlzIGFzc3VtcHRpb24gd3Jv
bmc/ICAKPiAKPiBPdXIgZHRzIGhhcwo+IAo+ICDCoMKgwqDCoMKgwqDCoCBuYW5kLWVjYy1tb2Rl
ID0gInNvZnQiOwo+ICDCoMKgwqDCoMKgwqDCoCBuYW5kLWVjYy1hbGdvID0gImJjaCI7Cj4gIMKg
wqDCoMKgwqDCoMKgIG5hbmQtb24tZmxhc2gtYmJ0Owo+IAoKSSBhc3N1bWVkIEhhbW1pbmcgd2Fz
IHRoZSBvbmx5IHBvc3NpYmxlIGFsZ29yaXRobSwgdGhpcyBpcyB0aGUgZXJyb3IuCgpJIGhhdmUg
c2V2ZXJhbCBkcml2ZXJzIGluIHRoaXMgY2FzZSB0aGVuLgoKV2UgbmVlZCB0byBkZWZhdWx0IHRv
IEhhbW1pbmcgYnV0IGxldCB0aGUgdXNlciBkZWNpZGUgdGhlbi4gQ2FuIHlvdSB0cnkKc29tZXRo
aW5nIGxpa2UgdGhlIGJlbG93IGNoYW5nZSBwbGVhc2U/CgoKVGhhbmtzLApNaXF1w6hsCgoKLS0t
ODwtLS0KCkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
RGF0ZTogICBXZWQgRGVjIDIgMDk6MzE6MTQgMjAyMCArMDEwMAoKICAgIG10ZDogcmF3bmFuZDog
b3Jpb246IEZpeCBzb2Z0IEVDQyBhbGdvIHNlbGVjdGlvbgogICAgCiAgICBTaWduZWQtb2ZmLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L29yaW9uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L29yaW9uX25hbmQuYwppbmRleCBlM2JiNjVmZDNhYjIuLjY2MjExYzkzMTFkMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L29yaW9uX25hbmQuYwpAQCAtODYsNyArODYsOSBAQCBzdGF0aWMgdm9pZCBvcmlvbl9u
YW5kX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVpbnQ4X3QgKmJ1ZiwgaW50IGxl
bikKIHN0YXRpYyBpbnQgb3Jpb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwKQogewogICAgICAgIGNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lORV9U
WVBFX1NPRlQ7Ci0gICAgICAgY2hpcC0+ZWNjLmFsZ28gPSBOQU5EX0VDQ19BTEdPX0hBTU1JTkc7
CisKKyAgICAgICBpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKQor
ICAgICAgICAgICAgICAgY2hpcC0+ZWNjLmFsZ28gPSBOQU5EX0VDQ19BTEdPX0hBTU1JTkc7CiAK
ICAgICAgICByZXR1cm4gMDsKIH0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
