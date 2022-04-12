Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91827C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=be+VoxNZHeXxyso1lY0yDFa11sZVqODi1CLEAINXdzs=; b=AByPDOF0t67DPM
	ia9RbY0khOLCJ2qAuC2x1vJlM9ymbFEH19o3trZYBdnWlU2187PIkT8731U8Mkia6k8meI9F/y9sO
	H3X3oAE3mHnSep1Boq0kAA3hWCd8ymGBJ39O95HJCvyPijjywZbQzWsvmcmf9Ju3j3SqjW+mVyOdr
	ia+fAOVd4hc4fXY+DoHh2Au3wGH12SjyiB+I8Gy5Ctp6AenswMr+z6WbIlkPDXLalBuO4G9EMgE+c
	m7M49xzK7H/ti+xo0s4QXBA+Ya0gGdVsiViHF0MMiAI3j+82yrBYvVLPxYmKjHLruGgbbgFtUzWnc
	uUfv5ys6yz0//kh09Utg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBtD-00CYsI-Pj; Tue, 12 Apr 2022 08:28:43 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBt9-00CYoT-Ri
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 08:28:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B09881C0014;
 Tue, 12 Apr 2022 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649752115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzGSuUZ52CEXpm0PjnzfqryT/AQxVArAKAFDHRtNmXY=;
 b=hyMuocSLSq+lLIQ8M72hif0KMCKsTDDXZeOqDwiA2O+v3q/dvAS/1JbUle4m64ZC6ZGCvF
 LpPgQQVD5SoJrrNEZbaxXjN8ZbXIkRsd1w5yXhiuswDfYieCnb06YSVeY92LMt5D+Q9qYD
 TysR0VEHDbAEt1QE+CwwHvgaWBjAK1zJ2+35Eelc3TRDZ4cw6ucnsKTWibqcBHIhRphWRf
 onjHrZIm6100vw631T7BiLHk8Fvf80WyfkpTe8V8RJaOXt8QrqrLj12yn33CmBGlfRKX0V
 G3FesljFtwLtVcRAzfukTp0/b1ErKARhYxZxP4YCN7aYwxFPPQm6VBnpumZoIw==
Date: Tue, 12 Apr 2022 10:28:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <p.yadav@ti.com>, Paul Cercueil
 <paul@crapouillou.net>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bastian Hecht <hechtb@googlemail.com>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Guennadi Liakhovetski
 <g.liakhovetski@gmx.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: Fix return value check of
 wait_for_completion_timeout
Message-ID: <20220412102832.09957c35@xps13>
In-Reply-To: <bf603638-cc34-b185-3001-9caeba1884d7@gmail.com>
References: <202204121253.NcZifMQi-lkp@intel.com>
 <20220412063703.8537-1-linmq006@gmail.com>
 <20220412090649.33bb3f8b@xps13>
 <61783400-4df2-47af-78a7-7acb715c3a71@gmail.com>
 <20220412094822.3818ebc2@xps13>
 <bf603638-cc34-b185-3001-9caeba1884d7@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_012840_239802_5BC304FF 
X-CRM114-Status: GOOD (  30.86  )
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

SGkgTWlhb3FpYW4sCgpsaW5tcTAwNkBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAxMiBBcHIgMjAy
MiAxNjoyMzoyNCArMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDIwMjIvNC8xMiAxNTo0OCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPiA+ICAKPiA+Pj4gSGkgTWlhb3FpYW4sCj4gPj4+Cj4gPj4+
IGxpbm1xMDA2QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDEyIEFwciAyMDIyIDA2OjM2OjUyICsw
MDAwOgo+ID4+PiAgICAKPiA+Pj4+IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpIHJldHVy
bnMgdW5zaWduZWQgbG9uZyBub3QgaW50Lgo+ID4+Pj4gSXQgcmV0dXJucyAwIGlmIHRpbWVkIG91
dCwgYW5kIHBvc2l0aXZlIGlmIGNvbXBsZXRlZC4KPiA+Pj4+IFRoZSBjaGVjayBmb3IgPD0gMCBp
cyBhbWJpZ3VvdXMgYW5kIHNob3VsZCBiZSA9PSAwIGhlcmUKPiA+Pj4+IGluZGljYXRpbmcgdGlt
ZW91dCB3aGljaCBpcyB0aGUgb25seSBlcnJvciBjYXNlLgo+ID4+Pj4KPiA+Pj4+IEZpeGVzOiA4
MzczOGQ4N2UzYTAgKCJtdGQ6IHNoX2ZsY3RsOiBBZGQgRE1BIGNhcGFiaWx0eSIpCj4gPj4+PiBT
aWduZWQtb2ZmLWJ5OiBNaWFvcWlhbiBMaW4gPGxpbm1xMDA2QGdtYWlsLmNvbT4KPiA+Pj4+IC0t
LQo+ID4+Pj4gY2hhbmdlIGluIHYyOgo+ID4+Pj4gLSBpbml0aWFsaXplIHJldCB0byAxLgo+ID4+
Pj4gLS0tCj4gPj4+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc2hfZmxjdGwuYyB8IDggKysrKyst
LS0KPiA+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0
bC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc2hfZmxjdGwuYwo+ID4+Pj4gaW5kZXggYjg1Yjlj
NmZjYzQyLi4yMzczMjUxZjU4NWIgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9zaF9mbGN0bC5jCj4gPj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0
bC5jCj4gPj4+PiBAQCAtMzg0LDcgKzM4NCw4IEBAIHN0YXRpYyBpbnQgZmxjdGxfZG1hX2ZpZm8w
X3RyYW5zZmVyKHN0cnVjdCBzaF9mbGN0bCAqZmxjdGwsIHVuc2lnbmVkIGxvbmcgKmJ1ZiwKPiA+
Pj4+ICAJZG1hX2FkZHJfdCBkbWFfYWRkcjsKPiA+Pj4+ICAJZG1hX2Nvb2tpZV90IGNvb2tpZTsK
PiA+Pj4+ICAJdWludDMyX3QgcmVnOwo+ID4+Pj4gLQlpbnQgcmV0Owo+ID4+Pj4gKwlpbnQgcmV0
ID0gMTsgICAgCj4gPj4+IERvZXMgbm90IGxvb2sgcmlnaHQuIEkga25vdyB0aGlzIGZ1bmN0aW9u
IHJldHVybnMgPiAwIG9uIHBvc2l0aXZlCj4gPj4+IG91dGNvbWVzIGJ1dCB0aGlzIGRvZXMgbm90
IG1ha2UgYW55IHNlbnNlIGluIHRoZSBmaXJzdCBwbGFjZS4gICAgCj4gPj4gWWVzLCBJIG1hZGUg
YSBtaXN0YWtlLCBOb3cgSSByZWFsaXplIHRoYXQgaW4gdjIsIGl0IHdpbGwgcmV0dXJuIDEgaW4g
ZXJyb3IgcGF0aAo+ID4+Cj4gPj4gd2hlbiBETUEgc3VibWl0IGZhaWxlZC4gIAo+ID4gTm90IDEs
IGJ1dCBhIHByb3BlciBlcnJvciBjb2RlIHBsZWFzZSAoLUVUSU1FRE9VVCwgLUVJTlZBTCwgd2hh
dGV2ZXIpCj4gPiAgCj4gPj4gQW5kIGZvciBwYXRjaCB2MSwgaXQgd2lsbCByZXR1cm4gMMKgIGlm
IGNhbGxzIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCBzdWNjZWVkcy4KPiA+PiAgCj4gPj4+
IFRoaXMgZnVuY3Rpb24gaXMgc3RhdGljIGFuZCBvbmx5IGNhbGxlZCB0d2ljZSwgcGxlYXNlIHR1
cm4gaXQgaW50bwo+ID4+PiBzb21ldGhpbmcgbGlrZToKPiA+Pj4KPiA+Pj4gaWYgKGRtYV9maWZv
X3RyYW5zZmVyKCkpCj4gPj4+IAllcnJvcgo+ID4+PiBlbHNlCj4gPj4+IAlvayAgICAKPiA+PiBT
byBJIHdhbnQgdG8ga2VlcCByZXQ+MCBtZWFucyBzdWNjZXNzLgo+ID4+Cj4gPj4gT3IgY291bGQg
SSBzZXQgcmV0ID4gMCBhZnRlciBpbiB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSBzdWNj
ZXNzIHBhdGg/Cj4gPj4KPiA+PiBsaWtlOgo+ID4+Cj4gPj4gwqDCoMKgIGlmKHRpbWVfbGVmdCA9
PSAwKQo+ID4+Cj4gPj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgcmV0ID0gLUVUSU1FRE9VVDsKPiA+
Pgo+ID4+IMKgwqDCoCBlbHNlCj4gPj4KPiA+PiDCoMKgwqAgwqDCoMKgwqDCoCDCoCByZXQgPSAx
OyAgCj4gPiBZb3UgY2FuIGluaXRpYWxpemUgcmV0IHRvIHplcm8gYXQgdG8gdG9wLiBTbyB0aGF0
IGFueXRoaW5nICE9IDAgaXMgYW4KPiA+IGVycm9yIChsaWtlIGEgbG90IG9mIGZ1bmN0aW9ucyBp
biB0aGUga2VybmVsKS4gICAKPiAKPiBUaGFua3MgZm9yIHlvdXIgYWR2aWNlLCBJIHdpbGwgZG8g
dGhpcy4KPiA+IEFuZCB1c2U6Cj4gPgo+ID4gCWlmIChkbWFfZmlmb190cmFuc2ZlcigpKQo+ID4g
CQllcnJvcigpOyAgCj4gSSB0aGluayBrZWVwaW5nIHRoZSBvcmlnaW5hbCBjb25kaXRpb24gc3Ry
dWN0dXJlIGlzIGJldHRlciwKPiBzb21ldGhpbmcgbGlrZToKPiAKPiBpZiAoZG1hX2ZpZm9fdHJh
bnNmZXIoKT09MCkKCiAgaWYgKGNvbmQgJiYgY29uZCAmJiAhZG1hX2ZpZm9fdHJhbnNmZXIoKSkK
Cj4gCXN1Y2NlZWQoKTsKPiAKPiBJbiB0aGlzIHdheSwgb25seSBtaW5vciBjaGFuZ2VzIGlzIG5l
ZWRlZOKAlOKAlG9ubHkgbmVlZCB0byB1cGRhdGUgdGhlIHN5bWJvbCBpbiBjb25kaXRpb24uCj4g
T3RoZXJ3aXNlIEl0IG5lZWRzIHRvIHJlc3RydWN0dXJlIHRoZSBjb2RlIGFuZCBiZSBtb3JlIGNv
bXBsaWNhdGVkLgo+IAo+IAo+IFRoYW5rcywKPiAKPiA+PiBXaGF0IGRvIHlvdSB0aGluaz8KPiA+
Pgo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+ICAKPiA+Pj4+ICsJdW5zaWduZWQgbG9uZyB0aW1lX2xl
ZnQ7Cj4gPj4+PiAgCj4gPj4+PiAgCWlmIChkaXIgPT0gRE1BX0ZST01fREVWSUNFKSB7Cj4gPj4+
PiAgCQljaGFuID0gZmxjdGwtPmNoYW5fZmlmbzBfcng7Cj4gPj4+PiBAQCAtNDI1LDEzICs0MjYs
MTQgQEAgc3RhdGljIGludCBmbGN0bF9kbWFfZmlmbzBfdHJhbnNmZXIoc3RydWN0IHNoX2ZsY3Rs
ICpmbGN0bCwgdW5zaWduZWQgbG9uZyAqYnVmLAo+ID4+Pj4gIAkJZ290byBvdXQ7Cj4gPj4+PiAg
CX0KPiA+Pj4+ICAKPiA+Pj4+IC0JcmV0ID0KPiA+Pj4+ICsJdGltZV9sZWZ0ID0KPiA+Pj4+ICAJ
d2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZmbGN0bC0+ZG1hX2NvbXBsZXRlLAo+ID4+Pj4g
IAkJCQltc2Vjc190b19qaWZmaWVzKDMwMDApKTsKPiA+Pj4+ICAKPiA+Pj4+IC0JaWYgKHJldCA8
PSAwKSB7Cj4gPj4+PiArCWlmICh0aW1lX2xlZnQgPT0gMCkgewo+ID4+Pj4gIAkJZG1hZW5naW5l
X3Rlcm1pbmF0ZV9hbGwoY2hhbik7Cj4gPj4+PiAgCQlkZXZfZXJyKCZmbGN0bC0+cGRldi0+ZGV2
LCAid2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0XG4iKTsKPiA+Pj4+ICsJCXJldCA9IC1FVElN
RURPVVQ7Cj4gPj4+PiAgCX0KPiA+Pj4+ICAKPiA+Pj4+ICBvdXQ6ICAgIAo+ID4+PiBUaGFua3Ms
Cj4gPj4+IE1pcXXDqGwgICAgCj4gPgo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
