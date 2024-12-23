Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02073E7718B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2024 19:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwJVO4l3PuuI4ISLo4ozivDS/tvclvssbl+uR53vAow=; b=sIX6n5wGx1ygjm
	JxwfZ0HhbjsGQ4C/id1btzii19aIWNQzW1aUDUs7AhhkVDZNXwE3HvMoQDOHFpU6reLhY3EifE1bf
	aGWXW3OHRqYbUPucX3ytudscF3cCRYwQKBfkOaMnqPDev4rkTmC/YHxYMXcN0BVt+yWr9Nq67/+uU
	vnhYGtBeT8tkHGvrlB6CMoW7Lxi1+TWHgUHznjJk7xGMPELZTsKgN5sKwAFI+82+mTle9tG9tiU8q
	fHgJJNDsqQadQj2mje4Il65bjr/HOTf3TpaSelhLmsRDLn6xxzP2jR74k9balArRxwT08tmYUDP1O
	N4RXixMJ9zT/c1XtQWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnnI-0000000AbFj-0WsN;
	Mon, 23 Dec 2024 19:08:44 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnnE-0000000AbF1-3JAd
	for linux-mtd@lists.infradead.org;
	Mon, 23 Dec 2024 19:08:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4668FC0004;
	Mon, 23 Dec 2024 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734980918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqURXi3l46EDvS3X4w9AsKnpPDUaild06xBnrpCyckU=;
	b=if2ua8W6RHeDTM+5FSbytQdCWM4SlaT8RVKn8OTnrOSFEb0lq/cjCbrhlAcprQYjIiRSs1
	9rYUupBKoUauJABn7lkq53QF2iEX1s7+EwiZp6nhda+WJii5HWv+WtMLBT1H6bwlKRuDqf
	ug/5GlsaMHUWA0DDnrFM86S9eJd5JthB9vMY5QKOAoV4CsvVhRBtCgyv7kPDRvhqrMcRap
	EuPPmp0vR4caJvzNVfOcZ5bszW6qtslwdJZ2eO+zHj6swSpv0Pe1S8Bph9sAJRonw0FLQe
	1zZgaGxjk/sHPFbTMhxfKBVAoj8AxJhhVq3Rbmi2bYqc9L3t128JI5EmvIXFAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a
 per-operation maximum frequency
In-Reply-To: <8738dbbc-e2a9-49dc-9234-65de6435bc45@linaro.org> (Tudor
	Ambarus's message of "Wed, 18 Dec 2024 10:13:39 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-2-miquel.raynal@bootlin.com>
	<e76ff30b-342e-4e4c-aa84-40312c3ffc72@linaro.org>
	<87jzc3oo6g.fsf@bootlin.com>
	<01f1bddd-7aee-4c90-9fa0-3b94c87eb469@linaro.org>
	<878qsde3i4.fsf@bootlin.com>
	<d12cc014-1e59-455e-8ee4-202997ddf846@linaro.org>
	<8738dbbc-e2a9-49dc-9234-65de6435bc45@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 20:08:35 +0100
Message-ID: <878qs6rzd8.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_110841_100653_8EED98C2 
X-CRM114-Status: GOOD (  21.75  )
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

SGVsbG8sCgpPbiAxOC8xMi8yMDI0IGF0IDEwOjEzOjM5IEdNVCwgVHVkb3IgQW1iYXJ1cyA8dHVk
b3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gT24gMTIvMTgvMjQgMTA6MDMgQU0sIFR1
ZG9yIEFtYmFydXMgd3JvdGU6Cj4+IAo+PiAKPj4gT24gMTIvMTgvMjQgOTozNyBBTSwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPj4+IE9uIDE4LzEyLzIwMjQgYXQgMDg6MDc6MjQgR01ULCBUdWRvciBB
bWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4KPj4+PiBPbiAxMi8x
My8yNCAxMDo0NiBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4gSGVsbG8gVHVkb3IsCj4+
Pj4+Cj4+Pj4KPj4+PiBIaSEKPj4+Pgo+Pj4+PiBPbiAxMS8xMS8yMDI0IGF0IDEzOjA3OjA5IEdN
VCwgVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKPj4+Pj4K
Pj4+Pj4+IE9uIDEwLzI1LzI0IDU6MTQgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4+Pgo+
Pj4+Pj4gY3V0Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Bp
L3NwaS1tZW0uYyBiL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+Pj4+Pj4+IGluZGV4IDE3YjhiYWY3
NDllNi4uYWI2NTBhZTk1M2JiIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1t
ZW0uYwo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+Pj4+Cj4+Pj4gY3V0Cj4+
Pj4KPj4+Pj4+PiArCWlmICghb3AtPm1heF9mcmVxIHx8IG9wLT5tYXhfZnJlcSA+IG1lbS0+c3Bp
LT5tYXhfc3BlZWRfaHopCj4+Pj4+Pj4gKwkJKChzdHJ1Y3Qgc3BpX21lbV9vcCAqKW9wKS0+bWF4
X2ZyZXEgPSBtZW0tPnNwaS0+bWF4X3NwZWVkX2h6Owo+Pj4+Pj4KPj4+Pj4+IG5vdCBhIGJpZyBm
YW4gb2YgY2FzdGluZyB0aGUgY29uc3Qgb3V0LiBIb3cgYWJvdXQgaW50cm9kdWNpbmcgYQo+Pj4+
Pj4gc3BpX21lbV9hZGp1c3Rfb3BfZnJlcSgpPyBUaGUgdXBwZXIgbGF5ZXJzIHdpbGwgdXNlIHRo
YXQgd2VyZSBuZWVkZWQsCj4+Pj4+PiBhbmQgeW91J2xsIHN0aWxsIGJlIGFibGUgdG8gcGFzcyBh
IGNvbnN0IG9wIHRvIHNwaV9tZW1fZXhlY19vcCgpCj4+Pj4+Cj4+Pj4+IEkga25vdyBpdCBpcyBu
b3QgaWRlYWwgc28gdG8gZm9sbG93IHlvdXIgaWRlYSBJIGRyYWZ0ZWQgdGhlIHVzZSBvZgo+Pj4+
PiBzcGlfbWVtX2FkanVzdF9vcF9mcmVxKCkuIEluIG9yZGVyIHRvIGF2b2lkIHRoZSBjYXN0LCB3
ZSBhY3R1YWxseSBuZWVkCj4+Pj4+IHRvIGNhbGwgdGhpcyBmdW5jdGlvbiBldmVyeXdoZXJlIGlu
IHRoZSBjb3JlIGFuZCB0aGUgZHJpdmVycyB0byBtYWtlCj4+Pj4+IHN1cmUgd2UgbmV2ZXIgZ2V0
IG91dCBvZiBib3VuZHMsIGJ1dCBoZXJlIGlzIHRoZSBwcm9ibGVtOgo+Pj4+Pgo+Pj4+PiAgICAg
JCBnaXQgZ3JlcCAtdyBzcGlfbWVtX2V4ZWNfb3AgLS0gZHJpdmVycy8gfCB3YyAtbAo+Pj4+PiAg
ICAgNDIKPj4+Pj4KPj4+Pj4gVGhpcyBhcHByb2FjaCByZXF1aXJlcyB0byBhZGQgYSBjYWxsIHRv
IHNwaV9tZW1fYWRqdXN0X29wX2ZyZXEoKSBiZWZvcmUKPj4+Pj4gKmV2ZXJ5KiBzcGlfbWVtX2V4
ZWNfb3AoKS4gWWVzIEkgY2FuIGRvIHRoYXQgYnV0IHRoYXQgbWVhbnMgdG8gYmUgdmVyeQo+Pj4+
PiBhdHRlbnRpdmUgdG8gdGhlIGZhY3QgdGhhdCB0aGVzZSB0d28gZnVuY3Rpb25zIGFyZSBhbHdh
eXMgY2FsbGVkCj4+Pj4+IHRvZ2V0aGVyLiBJIGFtIG5vdCBzdXJlIGl0IGlzIGEgZ29vZCBpZGVh
Lgo+Pj4+Pgo+Pj4+PiBXaGF0IGFib3V0IGRvaW5nIHRoZSBmb2xsb3dpbmcgb25jZSBpbiBzcGlf
bWVtX2V4ZWNfb3AoKSBpbnN0ZWFkPwo+Pj4+Pgo+Pj4+PiAgICAgc3BpX21lbV9hZGp1c3Rfb3Bf
ZnJlcShkZXNjLT5tZW0sIChzdHJ1Y3Qgc3BpX21lbV9vcCAqKW9wKTsKPj4+Pj4KPj4+Pj4gSSBr
bm93IHdlIHN0aWxsIGhhdmUgYSBjYXN0LCBidXQgaXQgZmVlbHMgbW9yZSBhY2NlcHRhYmxlIHRo
YW4gdGhlIG9uZSBJCj4+Pj4+IGluaXRpYWxseSBwcm9wb3NlZCBhbmQgY292ZXJzIGFsbCBjYXNl
cy4gSSB3b3VsZCBub3QgYWNjZXB0IHRoYXQgaW4gYQo+Pj4+PiBkcml2ZXIsIGJ1dCBoZXJlIHdl
IGFyZSBpbiB0aGUgY29yZSwgc28gdGhhdCBzb3VuZHMgYWNjZXB0YWJsZS4KPj4+Pj4KPj4+Pj4g
QW5vdGhlciBwb3NzaWJpbGl0eSBvdGhlcndpc2Ugd291bGQgYmUgdG8gZHJvcCB0aGUgY29uc3Qg
ZnJvbSB0aGUKPj4+Pj4gc3BpX21lbV9vcCBzdHJ1Y3R1cmUgZW50aXJlbHkuIEJ1dCBJIHByZWZl
ciB0aGUgYWJvdmUgZnVuY3Rpb24gY2FsbC4KPj4+Pgo+Pj4+IEhvdyBhYm91dCBpbnRyb2R1Y2lu
ZyBhIHNwaV9uYW5kX3NwaW1lbV9leGVjX29wKCkgd2hlcmUgeW91IGNhbGwKPj4+PiBzcGlfbWVt
X2FkanVzdF9vcF9mcmVxKCkgYW5kIHNwaV9tZW1fZXhlY19vcCgpPwo+Pj4KPj4+IFRoYXQgd291
bGQgd29yayB0byBtYWtlIHRoZSBjYXN0IGRpc2FwcGVhciBidXQgVEJIIHdvdWxkIG5vdCBiZSB0
b3RhbGx5Cj4+PiByZWxldmFudCBhcyBhZGp1c3RpbmcgdGhlIGZyZXF1ZW5jeSBpcyB0eXBpY2Fs
bHkgc29tZXRoaW5nIHRoYXQgd291bGQKPj4+IGJlbmVmaXQgdG8gc3BpLW5vciBhcyB3ZWxsICht
YXliZSBpbiB0aGUgZnV0dXJlKSBhbmQgdGhlcmVmb3JlIHdvdWxkCj4+IAo+PiBSaWdodCwgU1BJ
IE5PUiB3aWxsIGJlbmVmaXQgb2YgdGhpcyB0b28uCj4+IAo+Pj4gZnVsbHkgYXBwbHkgdG8gc3Bp
IG1lbW9yaWVzIGFzIGEgd2hvbGUsIG5vdCBqdXN0IHNwaS1uYW5kLiBXZSBjYW4gdGhpbmsKPj4+
IGFib3V0IGFub3RoZXIgbmFtaW5nIG1heWJlLCBidXQgSSBmaW5kIGxpa2Ugc3BpX21lbV9leGVj
X29wKCkgaXMgdGhlCj4+PiByaWdodCBsb2NhdGlvbiB0byBkbyB0aGlzLgo+Pj4KPj4gCj4+IEl0
J3Mgbm90IHRoZSBmaXJzdCB0aW1lIHRoYXQgd2UgYWRqdXN0IHNwaV9tZW1fb3AgcGFyYW1ldGVy
cywgc2VlOgo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0L3RyZWUvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmM/aD1zcGktbm9y
L25leHQjbjE1Mwo+PiAKPj4gRG9lcyBTUEkgTkFORCBuZWVkIHRvIGNhbGwgc3BpX21lbV9hZGp1
c3Rfb3Bfc2l6ZSBhcyB3ZWxsPyBJIHNlZSBpdAo+PiBjYWxscyBpdCB3aGVuIHVzaW5nIGRpcm1h
cCwgYnV0IG5vdCB3aXRoIGEgcGxhaW4gc3BpX21lbV9leGVjX29wKCkuCj4+IAo+Cj4gSSBhc2sg
YmVjYXVzZSBJJ20gdGhpbmtpbmcgb2YgYWRkaW5nIGluIHRoZSBTUElNRU0gY29yZSBhIHByZXBh
cmUoKQo+IG1ldGhvZCwgYW5kIG1heWJlIHJlbmFtZSBleGVjX29wKCkgdG8gZXhlYygpLiBBbmQg
dGhlbiBpbnRyb2R1Y2UgYQo+IHByZXBhcmVfZXhlYygpIG1ldGhvZCB0aGF0IHRoZSB1cHBlciBs
YXllcnMgd291bGQgY2FsbD8gU2ltaWxhciB0bwo+IGNsa19wcmVwYXJlX2VuYWJsZS4KCkRvIHlv
dSBoYXZlIHNvbWV0aGluZyBlbHNlIGluIG1pbmQgeW91IHdvdWxkIGxpa2UgdG8gcHV0IGluIHRo
ZSBwcmVwYXJlCnN0ZXA/IEkgYW0gbm90IGF0IGFsbCBvcHBvc2VkIHRvIGl0LCBidXQgSSBmZWVs
IGxpa2UgZm9yIG5vdyB0aGUKc3BpX21lbV9leGVjX29wKCkgaXMgYSBmaW5lIHBhdGggZm9yIHRo
YXQsIGVzcGVjaWFsbHkgc2luY2UgdGhlcmUgYXJlCnZlcnkgbGl0dGxlIHRoaW5ncyB0byAicHJl
cGFyZSIgKGZvciBub3cpLgoKRG8geW91IG1pbmQgaWYgSSBrZWVwIHRoZSBjYXN0IChub3QgdGhl
IG9uZSBmcm9tIHRoZSBzZXJpZXMsIEkgY2xlYW5lZAp0aGF0IHVwIHRvIGhhdmUgYW4gYWRqdXN0
X29wIGZ1bmN0aW9uIGFzIGRpc2N1c3NlZCkgZm9yIG5vdywgYW5kIGlmIHlvdQpldmVyIGdvIHRo
ZSBwcmVwYXJlL2V4ZWMgcGF0aCB3ZSB3b3VsZCBnZXQgdGhpcyBjb252ZXJ0ZWQgdG8gdXNlIHRo
ZSBuZXcKQVBJPyBJJ2QgbGlrZSB0byBtYWtlIHByb2dyZXNzZXMgb24gb3RoZXIgdG9waWNzIGlu
IHRoZSBzcGktbmFuZCBjb3JlCmFuZCBhdm9pZCBiZWluZyBibG9ja2VkIGJ5IGEgYmlnZ2VyIHRh
c2sgdGhhdCB3ZSBuZWVkIHRvIGRpc2N1c3MgZmlyc3QuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
