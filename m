Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33640D33998
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Dec 2025 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=garH25iob5PC/GcPH5K+hMK7GG0uTUPyUof3ERkl2kk=; b=2c45viBlxc//tG
	Yon8z2nwCdq68zL1p/nV0PdXz++YKN/J6dUsM8RRd6ym+JOJw6vqg5IIzlz3uIVXXjBOFa9OBJEQ5
	SzE/gDe82vWuWagQu4PDpyLuH6vK8kRfI9E67EAZJ7kJrzHoGvjpJY/XTeUxsxQZxwC7gcldNyeqR
	ZUb3fvSmWAHIA5+JVjFPE0FfREOJVx3CnKGltz2PtYmfDYiBr6kI0I6QIvYe3SaeKvYH0SfLDDFrd
	vVtdMZAiNE35wAUxP49arMp947DAzsP791KYRxA+DzLXfZ8+OKk54NTgbryNdqhgg1IFLlojqO9qB
	V5CAxrciNIO5bUaKeWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRZqQ-00000009lcA-1py6;
	Fri, 05 Dec 2025 17:43:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRZqM-00000009lbk-241W
	for linux-mtd@lists.infradead.org;
	Fri, 05 Dec 2025 17:43:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A0F740904;
	Fri,  5 Dec 2025 17:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85D2C4CEF1;
	Fri,  5 Dec 2025 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764956625;
	bh=gZ+nhvoXcKl5YDk6X4vQwpAGg5+nX3o6NoEl3T1o2QM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iyIWLkhzbfbv+BAmFiPjLjoq+aP+sovIvZSYclOu2hsAHSCgO1T3gfFbL3efl1Txx
	 KtT6izF3akV3hIzb0F0ytzBwLlQc1zA1kb0cOmRikZPf/xAMN/grUMsKvcNCyqM+24
	 hzMR6YS4ZQSc757gj31H654Sx5TDnZZYcE+r0fc+n/QshJVGi4wbIJT3y2HJkiMpuz
	 nvb0n7kZjvmaFwRkorMo6FGWYHgEgv40q1oEKG2rgLDIFG1UBZGwAAx28LajeOKjGg
	 +ZMPw0q3lkoSKLux8F0xHtYi1alL8PTkbLZvmF8GxgF2O4e1avYPKQWfJIgi8CmT7Y
	 MeZLGzgjcofWw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>,  "richard@nod.at"
 <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,  Tudor
 Ambarus <tudor.ambarus@linaro.org>,  Michael Walle <michael@walle.cc>,
  Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [BUG] MTD: refcount underflow/use-after-free during rapid SPI
 NOR unbind/bind cycles
In-Reply-To: <87bjkd8hl8.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 05
	Dec 2025 09:21:07 +0100")
References: <CO6PR11MB5586C35409D4E416C4AE79DFCDDCA@CO6PR11MB5586.namprd11.prod.outlook.com>
	<87bjkd8hl8.fsf@bootlin.com>
Date: Fri, 05 Dec 2025 18:43:39 +0100
Message-ID: <86h5u4rfhw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_094346_574091_4743C4A4 
X-CRM114-Status: GOOD (  18.79  )
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

T24gRnJpLCBEZWMgMDUgMjAyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKCj4gSGVsbG8sCj4KPiBP
biAyOC8xMS8yMDI1IGF0IDAyOjI0OjExIEdNVCwgIkhlLCBHdW9jYWkgKENOKSIgPEd1b2NhaS5I
ZS5DTkB3aW5kcml2ZXIuY29tPiB3cm90ZToKPgo+PiBIaSBNVEQgbWFpbnRhaW5lcnMsCj4+Cj4+
IEknbSByZXBvcnRpbmcgYSBrZXJuZWwgYnVnIGluIHRoZSBNVEQgc3Vic3lzdGVtIHRoYXQgY2F1
c2VzIGEgcmVmY291bnQKPj4gdW5kZXJmbG93IGFuZCB1c2UtYWZ0ZXItZnJlZSB3YXJuaW5nIGR1
cmluZyByYXBpZCBTUEkgTk9SIGRyaXZlcgo+PiB1bmJpbmQvYmluZCBvcGVyYXRpb25zLgo+Cj4g
QWRkaW5nIGFsbCBTUEkgTk9SIGd1cnVzIGluIHRoZSBDYyBsaXN0LgoKU291bmRzIGEgYml0IHNp
bWlsYXIgdG8gc29tZXRoaW5nIHdlIGdvdCByZXBvcnRzIGZvciBlYXJsaWVyIGFzIHdlbGwgWzBd
Cih0aG91Z2ggdGhpcyBvbmUgY291bGQgYmUgYSBzaW1pbGFyIGJ1dCBkaWZmZXJlbnQgYnVnKS4g
SUlSQyB0aGVyZSB3YXMKYW5vdGhlciBwYXRjaC90aHJlYWQgZm9yIGl0IGJ1dCBJIGNhbid0IHNl
ZW0gdG8gZmluZCBpdC4KCkkgdGhpbmsgd2Ugc2hvdWxkIGRvIHNvbWUgc29ydCBvZiBsb2NraW5n
IG9yIHJlZiBjb3VudGluZyB0byBtYWtlIHN1cmUKbm8gb3BlcmF0aW9ucyBhcmUgaW4gcHJvZ3Jl
c3MgZHVyaW5nIHRoZSBkcml2ZXIgYmluZCBvciB1bmJpbmQuIEkgbmV2ZXIKZ290IGFyb3VuZCB0
byBwb2tpbmcgaW50byBpdCB0b28gZGVlcGx5LCBhbmQgSSBhbSBub3Qgc3VyZSBJIGNhbiBmaW5k
CnRpbWUgZm9yIGl0IGluIHRoZSBuZWFyIGZ1dHVyZSBlaXRoZXIuCgpUaGlzIGlzIHNvbWV0aGlu
ZyB3ZSBzaG91bGQgZml4LCBidXQgSSBhbSBub3QgdG9vIHdvcnJpZWQgYWJvdXQgaXQgc2luY2UK
SSBkb24ndCB0aGluayBhbnlvbmUgc2hvdWxkIGJlIHJhcGlkbHkgYmluZGluZyBhbmQgdW5iaW5k
aW5nIHRoZSBkcml2ZXIKaW4gYW55IHJlYWwgd29ya2xvYWQuCgpbMF0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbXRkLzIwMjUwMzI1MTMzOTU0LjM2OTk1MzUtMS1saXdlaS5zb25nLmxz
b25nQGdtYWlsLmNvbS9ULyN1Cgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPgo+PiAjIyBFbnZpcm9u
bWVudAo+PiAtIEtlcm5lbCB2ZXJzaW9uOiA2LjYuMTE2LXlvY3RvLXN0YW5kYXJkICMxICAoNi4x
MiBoYXZlIHRoZSBzYW1lIGlzc3VlKQo+PiAtIEFyY2hpdGVjdHVyZTogU29DRlBHQSBTdHJhdGl4
IDEwIFNvQ0RLIChBUk02NCAgaGF2ZSB0aGUgc2FtZSBpc3N1ZSkKPj4gLSBEZXZpY2U6IFNQSSBO
T1IgZmxhc2ggKG10MjVxdTAyZywgMjYyMTQ0IEtieXRlcykKPj4gLSBTUEkgY29udHJvbGxlcjog
ZmY4ZDIwMDAuc3BpLjAKPj4KPj4gIyMgUmVwcm9kdWN0aW9uIFN0ZXBzCj4+IDEuIEluIG9uZSBT
U0ggc2Vzc2lvbiwgcnVuIGNvbnRpbnVvdXMgdW5iaW5kL2JpbmQ6Cj4+ICAgIGBgYGJhc2gKPj4g
ICAgd2hpbGUgOjsgZG8KPj4gICAgICAgIGVjaG8gc3BpMC4wID4vc3lzL2J1cy9zcGkvZGV2aWNl
cy9zcGkwLjAvZHJpdmVyL3VuYmluZAo+PiAgICAgICAgZWNobyBzcGkwLjAgPi9zeXMvYnVzL3Nw
aS9kcml2ZXJzL3NwaS1ub3IvYmluZAo+PiAgICBkb25lCj4+ICAgIGBgYAo+Pgo+PiAyLiBJbiBh
bm90aGVyIFNTSCBzZXNzaW9uLCBjb250aW51b3VzbHkgcmVhZCBNVEQgaW5mbzoKPj4gICAgYGBg
YmFzaAo+PiAgICB3aGlsZSA6OyBkbyBjYXQgL3Byb2MvbXRkOyBkb25lCj4+ICAgIGBgYAo+Pgo+
PiAzLiBBZnRlciBydW5uaW5nIGZvciBzb21lIHRpbWUsIHRoZSBmb2xsb3dpbmcgY2FsbCB0cmFj
ZSBhcHBlYXJzOgo+Pgo+PiAjIyBDYWxsIFRyYWNlCj4+IGBgYAo+PiBEZWxldGluZyBNVEQgcGFy
dGl0aW9ucyBvbiAiZmY4ZDIwMDAuc3BpLjAiOgo+PiBEZWxldGluZyB1LWJvb3QgTVREIHBhcnRp
dGlvbgo+PiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4gcmVmY291bnRf
dDogdW5kZXJmbG93OyB1c2UtYWZ0ZXItZnJlZS4KPj4gV0FSTklORzogQ1BVOiAyIFBJRDogOTIx
IGF0IC9saWIvcmVmY291bnQuYzoyOCByZWZjb3VudF93YXJuX3NhdHVyYXRlKzB4ZjQvMHgxNDgK
Pj4gTW9kdWxlcyBsaW5rZWQgaW46IHNjaF9mcV9jb2RlbCBvcGVudnN3aXRjaCBuc2ggbmZfY29u
bmNvdW50IG5mX25hdCBmdXNlIG5mbmV0bGluawo+PiBDUFU6IDIgUElEOiA5MjEgQ29tbTogc2gg
Tm90IHRhaW50ZWQgNi42LjExNi15b2N0by1zdGFuZGFyZCAjMQo+PiBIYXJkd2FyZSBuYW1lOiBT
b0NGUEdBIFN0cmF0aXggMTAgU29DREsgKERUKQo+PiBwc3RhdGU6IDYwMDAwMDA1IChuWkN2IGRh
aWYgLVBBTiAtVUFPIC1UQ08gLURJVCAtU1NCUyBCVFlQRT0tLSkKPj4gcGMgOiByZWZjb3VudF93
YXJuX3NhdHVyYXRlKzB4ZjQvMHgxNDgKPj4gbHIgOiByZWZjb3VudF93YXJuX3NhdHVyYXRlKzB4
ZjQvMHgxNDgKPj4gc3AgOiBmZmZmODAwMDgyOWFiYWYwCj4+Cj4+IENhbGwgdHJhY2U6Cj4+ICBy
ZWZjb3VudF93YXJuX3NhdHVyYXRlKzB4ZjQvMHgxNDgKPj4gIGRlbF9tdGRfZGV2aWNlKzB4MTE4
LzB4MTQwCj4+ICBfX2RlbF9tdGRfcGFydGl0aW9ucysweDk0LzB4ZjgKPj4gIGRlbF9tdGRfcGFy
dGl0aW9ucysweDUwLzB4ODAKPj4gIG10ZF9kZXZpY2VfdW5yZWdpc3RlcisweDUwLzB4OTAKPj4g
IHNwaV9ub3JfcmVtb3ZlKzB4MmMvMHg0OAo+PiAgc3BpX21lbV9yZW1vdmUrMHgyOC8weDQwCj4+
ICBzcGlfcmVtb3ZlKzB4MzgvMHg2MAo+PiAgZGV2aWNlX3JlbW92ZSsweDU0LzB4OTAKPj4gIGRl
dmljZV9yZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCsweDFkNC8weDIzOAo+PiAgZGV2aWNlX2RyaXZl
cl9kZXRhY2grMHgyMC8weDM4Cj4+ICB1bmJpbmRfc3RvcmUrMHhiYy8weGM4Cj4+ICBkcnZfYXR0
cl9zdG9yZSsweDJjLzB4NDgKPj4gIHN5c2ZzX2tmX3dyaXRlKzB4NGMvMHg2OAo+PiAga2VybmZz
X2ZvcF93cml0ZV9pdGVyKzB4MTM4LzB4MWYwCj4+ICB2ZnNfd3JpdGUrMHgxYjgvMHgyZTAKPj4g
IGtzeXNfd3JpdGUrMHg3Yy8weDEyMAo+PiAgX19hcm02NF9zeXNfd3JpdGUrMHgyNC8weDM4Cj4+
ICBpbnZva2Vfc3lzY2FsbCsweDVjLzB4MTM4Cj4+ICBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3Au
MCsweDQ4LzB4ZjAKPj4gIGRvX2VsMF9zdmMrMHgyNC8weDM4Cj4+IGRvX2VsMF9zdmMrMHgyNC8w
eDM4Cj4+ICBlbDBfc3ZjKzB4MzgvMHgxMDgKPj4gIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4MTIw
LzB4MTMwCj4+ICBlbDB0XzY0X3N5bmMrMHgxOTAvMHgxOTgKPj4gYGBgCj4+Cj4+ICMjIEFuYWx5
c2lzCj4+IFRoaXMgYXBwZWFycyB0byBiZSBhIHJhY2UgY29uZGl0aW9uPyA6Cj4+IDEuIFRoZSB1
bmJpbmQgb3BlcmF0aW9uIHRyaWdnZXJzIE1URCBwYXJ0aXRpb24gZGVsZXRpb24gdmlhIGRlbF9t
dGRfZGV2aWNlKCkKPj4gMi4gU2ltdWx0YW5lb3VzbHksIGFub3RoZXIgcHJvY2VzcyByZWFkaW5n
IC9wcm9jL210ZCBob2xkcyByZWZlcmVuY2VzIHRvIHRoZSBNVEQgZGV2aWNlCj4+IDMuIFRoZSBy
ZWZlcmVuY2UgY291bnQgZ29lcyBuZWdhdGl2ZSwgaW5kaWNhdGluZyB0aGUgZGV2aWNlIHdhcyBm
cmVlZCB3aGlsZSBzdGlsbCBiZWluZyBhY2Nlc3NlZAo+Pgo+PiAjIyBBZGRpdGlvbmFsIEluZm9y
bWF0aW9uCj4+IC0gVGhlIGlzc3VlIGlzIHJlcHJvZHVjaWJsZSB3aXRoIHRoZSBhYm92ZSB0ZXN0
IGNhc2UKPj4KPj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBuZWVkIGFueSBhZGRpdGlvbmFs
IGluZm9ybWF0aW9uIG9yIHRlc3RpbmcuCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gR3VvY2FpIEhl
CgotLSAKUmVnYXJkcywKUHJhdHl1c2ggWWFkYXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
