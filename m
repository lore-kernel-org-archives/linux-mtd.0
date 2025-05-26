Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECB9C5AD49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNJwUOc+ApB1Hqn8aw1nW/ou2RW4/A8qMUFwH6o3SLA=; b=iBrk+bROPRIA6a
	/RW+4Dj8fo27JbY/s171sqSSYClN+MI+Ix10GRniWTrHnXI1nj5hT8ssJTrQKbZzyOcH4dUWs2ZWw
	z3YhGoKB8w3ldghgIev4jDUfqLxhffJzdbSG9fr3xpa1mS4C6P6MDUjAbLXlZ/wUkWtMv0Dkj0F4O
	ZTQHWtD0via2odQjKK+SvfWQ0bF+5VNL1aQMeuS+ofWg5mNSU+aEa0y2qt71hUKK5C0RfzIHAYSbo
	I1J/gUDJFtYtQTMb95Hp896szR3gkSxjGyn5hmTi0pp2GCQYYtPNOjv1ZcP9oNZUKFx5FDs950tsp
	O+V+cGS3IElg01lMQxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWve-00000008n1H-0pKq;
	Mon, 26 May 2025 12:27:42 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWtU-00000008msD-42SO;
	Mon, 26 May 2025 12:25:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6A7A43999;
	Mon, 26 May 2025 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748262325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SGcFMzxRqwZHeyCIUfXG3hV8hcSrtdD19rnC1FAfz94=;
	b=OGi0+/oi9B3QDJ1KGV+hqFr4jwgJ66ptIKnfiXUyHOp8YjRVIngeyqOZjOtY3z+rI0y7ug
	5z7jfbQ1Ld1G9sISQaoa1It6KFL0gQfrAaFLu1EzG5V4NBnzavkxG/WjWgXRTSeGgTQLWR
	HsjLu8qP2BEIjmtxcIOKePLrqejwQU/kvU/pcTIq2dogwQiWAOugpH7wUE+UzzE7FgJyMY
	RjxNiaXyAwVw8ETuf/74U/ccYcEXIDjq4aheJt98HrSZgfIZqN3vq82/mH7TzMxcir7YsQ
	j/ng/O0laZGNuT038HrZk6FIs5UFuOQJ+ivag8upCNg10izXEde8A9sca3ajpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  Cheng
 Ming Lin <chengminglin@mxic.com.tw>,  Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and
 then update_cache in write operation
In-Reply-To: <CAJsYDVKiMeYY2rw_BxuW4BAxvMcq5hDwzhiPoAR=tkXzZpRYiw@mail.gmail.com>
	(Chuanhong Guo's message of "Tue, 29 Apr 2025 19:58:05 +0800")
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
	<871pymtab3.fsf@bootlin.com>
	<c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com>
	<87bjsfv0x1.fsf@bootlin.com>
	<CAJsYDVKiMeYY2rw_BxuW4BAxvMcq5hDwzhiPoAR=tkXzZpRYiw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 14:25:21 +0200
Message-ID: <87sekry2xa.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeehudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepghgthhelkeduvddufeesghhmrghilhdrtghomhdprhgtphhtthhopefukhihnfgrkhgvrdfjuhgrnhhgsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmp
 dhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopegurghnihgvlhesmhgrkhhrohhtohhpihgrrdhorhhgpdhrtghpthhtoheprggtvghlrghnrdhkrghosegtrghnohhnihgtrghlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_052529_341026_BCD960A9 
X-CRM114-Status: GOOD (  21.40  )
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

SGVsbG8gQ2h1YW5ob25nLAoKPj4gPj4+IEJlZm9yZSBhcHBseWluZyB0aGlzIHBhdGNoLCB3cml0
ZSBvcGVyYXRpb24gdXNlcyBvbmx5IDM0SCh1cGRhdGVfY2FjaGUpOgo+PiA+Pj4gWzc4LjkzNzcy
MF0gT1AgY29kZTogMHgzNCwgYWRkciB2YWw6IDB4MCwgZGF0YSBuYnl0ZXM6IDEwMjAsIGRhdGEg
MXN0IGJ5dGU6IDB4YTUKPj4gPj4+IFs3OC45NDUyOTddIE9QIGNvZGU6IDB4MzQsIGFkZHIgdmFs
OiAweDNmYywgZGF0YSBuYnl0ZXM6IDEwMjAsIGRhdGEgMXN0IGJ5dGU6IDB4YTUKPj4gPj4+IFs3
OC45NTQyNTFdIE9QIGNvZGU6IDB4MzQsIGFkZHIgdmFsOiAweDdmOCwgZGF0YSBuYnl0ZXM6IDcy
LCBkYXRhIDFzdCBieXRlOiAweGE1Cj4+ID4+PiBbNzguOTYyOTY2XSBPUCBjb2RlOiAweDEwLCBh
ZGRyIHZhbDogMHgzMDAKPj4gPj4+IFs3OC45Njg4MTZdIE9QIGNvZGU6IDB4MzQsIGFkZHIgdmFs
OiAweDAsIGRhdGEgbmJ5dGVzOiAxMDIwLCBkYXRhIDFzdCBieXRlOiAweGZmCj4+ID4+PiBbNzgu
OTc3MjMzXSBPUCBjb2RlOiAweDM0LCBhZGRyIHZhbDogMHgzZmMsIGRhdGEgbmJ5dGVzOiAxMDIw
LCBkYXRhIDFzdCBieXRlOiAweGZmCj4+ID4+PiBbNzguOTg1MTI0XSBPUCBjb2RlOiAweDM0LCBh
ZGRyIHZhbDogMHg3ZjgsIGRhdGEgbmJ5dGVzOiA3MiwgZGF0YSAxc3QgYnl0ZTogMHhmZgo+PiA+
Pj4gWzc4Ljk5MjUyN10gT1AgY29kZTogMHgxMCwgYWRkciB2YWw6IDB4MzAxCj4+ID4+PiBbNzgu
OTk2OTgxXSBPUCBjb2RlOiAweDM0LCBhZGRyIHZhbDogMHgwLCBkYXRhIG5ieXRlczogMTAyMCwg
ZGF0YSAxc3QgYnl0ZTogMHhmZgo+PiA+Pj4gWzc5LjAwNDQxNl0gT1AgY29kZTogMHgzNCwgYWRk
ciB2YWw6IDB4M2ZjLCBkYXRhIG5ieXRlczogMTAyMCwgZGF0YSAxc3QgYnl0ZTogMHhmZgo+PiA+
Pj4gWzc5LjAxMjAzMV0gT1AgY29kZTogMHgzNCwgYWRkciB2YWw6IDB4N2Y4LCBkYXRhIG5ieXRl
czogNzIsIGRhdGEgMXN0IGJ5dGU6IDB4ZmYKPj4gPj4+IFs3OS4wMTk0MzVdIE9QIGNvZGU6IDB4
MTAsIGFkZHIgdmFsOiAweDMwMgo+PiA+PiBJIGFtIHNvcnJ5IGJ1dCBhYm92ZSB5b3Ugc2FpZCB0
aGF0IHdlIHNob3VsZCBub3QgcGVyZm9ybToKPj4gPj4gICAgICAweDMyLCAweDMyLCAweDMyLi4u
Cj4+ID4+IGJlY2F1c2UgdGhlIHNlY29uZCB0aW1lIGl0IHdvdWxkIGNsZWFyIHRoZSBjYWNoZSBh
Z2Fpbi4gQW5kIGhlcmUKPj4gPj4geW91IHRlbGwgdXMgdGhhdCBhY3R1YWxseSB0aGUgY29yZSBh
bHJlYWR5IGhhbmRsZXMgdGhhdCBieSBwZXJmb3JtaW5nCj4+ID4+IGluc3RlYWQ6Cj4+ID4+ICAg
ICAgMHgzNCwgMHgzNCwgMHgzNC4uLgo+PiA+PiBTbyB3aGF0IGlzIHRoZSBwcm9ibGVtPwo+PiA+
PiBPciBtYXliZSBJIG1pc3VuZGVyc3Rvb2QgdGhlIGlzc3VlLCBidXQgSSB0aGluayBDaHVhbmhv
bmcgcmFpc2VkIGFuCj4+ID4+IGlzc3VlIHRoYXQgaXMgYWxyZWFkeSBzb2x2ZWQ/IElzbid0IGl0
Pwo+PiA+Pgo+PiA+Cj4+ID4gVGhlIGlzc3VlIGlzIHRoYXQgdGhlIEZPUkVTRUUgTkFORHMgcmVx
dWlyZSB0aGUgZmlyc3QgY2FjaGUgd3JpdGluZwo+PiA+IGluc3RydWN0aW9uIHRvIGJlIFdSSVRF
X0NBQ0hFIGluc3RlYWQgb2YgVVBEQVRFX0NBQ0hFLiBpLmUuIGl0IG5lZWRzIGEKPj4gPiBjb21t
YW5kIHNlcXVlbmNlIG9mOgo+PiA+ICAgICAweDMyLCAweDM0LCAweDM0LCAweDM0Li4uCj4+Cj4+
IFNvIEZvcmVzZWUgTkFORHMgZG8gbm90IHN1cHBvcnQgdXBkYXRlX2NhY2hlLCB3aHkgYXJlIHRo
ZXkgYWR2ZXJ0aXNlZCBpbgo+PiB0aGUgZmlyc3QgcGxhY2U/IENvdWxkIHlvdSB3ZSBoYXZlIGEg
bGVzcyBpbXBhY3Rpbmcgc29sdXRpb24gZm9yIHRoZQo+PiBvdGhlciBOQU5Ecz8KPj4KPj4gPiBU
aGlzIHBhdGNoIGRvZXMgZXhhY3RseSB0aGF0LCBtYWtpbmcgdGhlIGZpcnN0IGluc3RydWN0aW9u
IGlzc3VlZCAweDMyLgo+PiA+IEl0IHNob3VsZCBiZSBhcHBsaWVkIHRvIGZpeCB0aGUgaXNzdWUg
YWJvdmUuCj4+Cj4+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGlzIGlzIHZlcnkgc3BlY2lm
aWMgdG8gRk9SRVNFRSBOQU5EcyBhbmQgeW91Cj4+IGFyZSBjaGFuZ2luZyB0aGlzIGZvciBhbGwg
TkFORHMuIEkgaGF2ZSBmZWFycyB0aGF0IGl0IHdpbGwgYnJlYWsKPj4gZXZlcnl3aGVyZSBlbHNl
Lgo+Cj4gSSBqdXN0IGNoZWNrZWQgYSBmZXcgZGF0YXNoZWV0cyBvZiBTUEktTkFORHMgZnJvbQo+
IFRvc2hpYmEvV2luYm9uZC9FdHJvbi9FU01UL0dpZ2FEZXZpY2UvTWFjcm9uaXguCj4gQWxsIG9m
IHRoZW0gc3BlY2lmeSB0aGUgcHJvZ3JhbW1pbmcgc2VxdWVuY2UgdG8gYmU6Cj4gd3JpdGVfZW5h
YmxlLT53cml0ZV9jYWNoZS0+dXBkYXRlX2NhY2hlIGlmIG5lZWRlZC0+Cj4gcHJvZ3JhbV9leGVj
dXRlLT5wb2xsIHN0YXR1cy4KPiBTb21lIG9mIHRoZW0gbWVudGlvbnMgdGhhdCB0aGUgb25seSBk
aWZmZXJlbmNlIGJldHdlZW4gd3JpdGVfY2FjaGUKPiBhbmQgdXBkYXRlX2NhY2hlIGlzIHdoZXRo
ZXIgdGhlIHBhZ2UgY2FjaGUgaXMgY2xlYXJlZCBiZWZvcmUKPiB3cml0aW5nIChXaW5ib25kKSwg
d2hpbGUgb3RoZXJzIGRvbid0IHNwZWNpZmljYWxseSBzYXkgdGhhdC4KPgo+IFRoZSBvcmlnaW5h
bCBzZXF1ZW5jZSBkb2Vzbid0IHNlZW0gdG8gYmUgZm9sbG93aW5nIGFueSBtYW51ZmFjdHVyZXJz
Jwo+IGluc3RydWN0aW9ucy4gV2UganVzdCBoYXZlbid0IHJ1biBpbnRvIGFueSBwcm9ibGVtcyB1
bnRpbCB0aGlzIEZPUkVTRUUKPiBvbmUuCgpUaGF0IGlzIHdoYXQgSSBhbSBzYXlpbmcuIEl0IGN1
cnJlbnRseSB3b3JrcywgYW5kIHdlIG1heSBlbmNvdW50ZXIKc2lsZW50IGZhaWx1cmVzIGFsbCBh
cm91bmQgYmVjYXVzZSBvZiB0aGlzIGNoYW5nZSwgZXZlbiBpZiBpdCBtaWdodCBiZQp0aGVvcmV0
aWNhbGx5IGNvcnJlY3QuIEFueWhvdywgd2UgaGF2ZSB0aGVzZSB0ZW1wbGF0ZXMgKGJvdGggd3Jp
dGUgYW5kCnVwZGF0ZSkgc28gbGV0J3MgdHJ5IHRvIHJlLXVzZSB0aGVtLgoKSG93ZXZlciBJIGRp
c2xpa2UgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gd2hpY2ggY2hhbmdlcyB0aGUgZ2xvYmFs
CndkZXNjIHRlbXBsYXRlIGFuZCBwdXRzIGl0IGJhY2suIENhbiB5b3UgcGxlYXNlIHByb3Bvc2Ug
c29tZXRoaW5nIGNsZWFuZXI/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
