Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3646C77B7A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aV4W9BMv5j7pBK5wWwK5332pfno5bNzPwOg/6Zb1xLk=; b=BLak/Zis+jcXIS
	v+Kz3qx8twmzVQSsRBo55464Ppg/ErGWwwefzwO/TecN4GTTjidmMFmRK4ii9pxeqJH8yu1WgdGK6
	rzOi514ru1O0IjAPCA+s9PiNakSVsjZnDC7/fEaA2Rg24eVikMHO6UehauELnkqKqGdE6Wcn7ToqY
	RbV7Mi/7HLKs/MaH3MXImOZZ3vUjtriHeiwXCR1iZYAWuEfhpRpRnJ4If37wYFTtl3y1DyoHwP6B5
	4vwiFmtNlBzdDsLgTctvY9HhDPF6H0TMav9kTO3OlMQNtFhjIgSdK6VcDMAwDpbeywup5Qk9hr35C
	E+RPLYfxH1P8xw/wBUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bE6-003Ijw-21;
	Fri, 26 May 2023 17:27:42 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bE3-003Iik-1h
	for linux-mtd@lists.infradead.org;
	Fri, 26 May 2023 17:27:41 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685122055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLLkkTARqYG2/kq9zm8hqhnR4AX8Ph/c88jn0yKAnqU=;
	b=j6AmoKuokt9TL+mjt11P5LSYrljI4dAEec4BwDJ6vF3J5DeiGOkx5kcRtPk4dBcV1Q5l0i
	uKGtfCsVvoD842m+YZ5yJXxCAlWb0/l9bSXIVd7Tn8YBNcKbBhoPOFdy4zk/wF19fFQ4Ix
	wCnpJh9Og2gf/56IaDe/wkAtqvTd0hTF2BEncqDhoU4LiIXOSgPNR8eNN9AOt0Evro1Xak
	y6GLycoh4ZHTY7pbaKunrX/+IvNuvthcRHGabMvvh6NnHaoqhGXw3fAKb4bU0C6N+dlKxW
	OFR2lzz3nxyl7WK9CqUV7umUJrhKyiiCec2QEDFpGxv4BEr0frzgVVLSQ9727A==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77D28C0003;
	Fri, 26 May 2023 17:27:34 +0000 (UTC)
Date: Fri, 26 May 2023 19:27:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
Subject: Re: [PATCH v2 2/5] mtd: rawnand: qcom: Add support for reset,
 readid, status exec_op
Message-ID: <20230526192733.003b5293@xps-13>
In-Reply-To: <a92d2d3f-34b5-9cf1-ed40-1c812cbd0125@quicinc.com>
References: <20230511133017.6307-1-quic_mdalam@quicinc.com>
	<20230511133017.6307-3-quic_mdalam@quicinc.com>
	<20230522154507.0255d902@xps-13>
	<a92d2d3f-34b5-9cf1-ed40-1c812cbd0125@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_102739_880952_8975889C 
X-CRM114-Status: GOOD (  28.83  )
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

SGkgTWQsCgpxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBXZWQsIDI0IE1heSAyMDIz
IDE0OjU0OjM0ICswNTMwOgoKPiBPbiA1LzIyLzIwMjMgNzoxNSBQTSwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiA+IEhpIE1kLAo+ID4gCj4gPiBxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBv
biBUaHUsIDExIE1heSAyMDIzIDE5OjAwOjE0ICswNTMwOgo+ID4gICAKPiA+PiBUaGlzIGNoYW5n
ZSB3aWxsIGFkZCBleGVjX29wcyBzdXBwb3J0IGZvciBSRVNFVCAsIFJFQURfSUQsIFNUQVRVUwo+
ID4+IGNvbW1hbmQuCj4gPj4KPiA+PiBDby1kZXZlbG9wZWQtYnk6IFNyaWNoYXJhbiBSYW1hYmFk
aHJhbiA8cXVpY19zcmljaGFyYUBxdWljaW5jLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTcmlj
aGFyYW4gUmFtYWJhZGhyYW4gPHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4gPj4gLS0t
Cj4gPj4gQ2hhbmdlIGluIFt2Ml0KPiA+Pgo+ID4+ICogTWlzc2VkIHRvIHBvc3QgQ292ZXItbGV0
dGVyLCBzbyBwb3N0aW5nIHYyIHBhdGNoIHdpdGggY292ZXItbGV0dGVyCj4gPj4KPiA+PiAgIGRy
aXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDE2NiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNjMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9x
Y29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+PiBpbmRl
eCBkYWU0NjBlMmFhMGIuLmQyZjJhODk3MTkwNyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9x
Y29tX25hbmRjLmMKPiA+PiBAQCAtMzg0LDYgKzM4NCw5IEBAIHN0cnVjdCBuYW5kY19yZWdzIHsK
PiA+PiAgICAqIEByZWdfcmVhZF9wb3M6CQltYXJrZXIgZm9yIGRhdGEgcmVhZCBpbiByZWdfcmVh
ZF9idWYKPiA+PiAgICAqCj4gPj4gICAgKiBAY21kMS92bGQ6CQkJc29tZSBmaXhlZCBjb250cm9s
bGVyIHJlZ2lzdGVyIHZhbHVlcwo+ID4+ICsgKgo+ID4+ICsgKiBAZXhlY19vcHdyaXRlOgkJZmxh
ZyB0byBzZWxlY3QgY29ycmVjdCBudW1iZXIgb2YgY29kZSB3b3JkCj4gPj4gKyAqCQkJCXdoaWxl
IHJlYWRpbmcgc3RhdHVzCj4gPj4gICAgKi8KPiA+PiAgIHN0cnVjdCBxY29tX25hbmRfY29udHJv
bGxlciB7Cj4gPj4gICAJc3RydWN0IGRldmljZSAqZGV2Owo+ID4+IEBAIC00MzQsNiArNDM3LDcg
QEAgc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyIHsKPiA+PiAgIAlpbnQgcmVnX3JlYWRfcG9z
OyAgCj4gPj4gICA+PiAgIAl1MzIgY21kMSwgdmxkOyAgCj4gPj4gKwlib29sIGV4ZWNfb3B3cml0
ZTsKPiA+PiAgIH07ICAKPiA+PiAgID4+ICAgLyogIAo+ID4+IEBAIC0yOTIwLDYgKzI5MjQsOCBA
QCBzdGF0aWMgaW50IHFjb21fb3BfY21kX21hcHBpbmcoc3RydWN0IHFjb21fbmFuZF9jb250cm9s
bGVyICpuYW5kYywgdTggY21kLAo+ID4+ICAgCQlicmVhazsKPiA+PiAgIAljYXNlIE5BTkRfQ01E
X1BBR0VQUk9HOgo+ID4+ICAgCQlyZXQgPSBPUF9QUk9HUkFNX1BBR0U7Cj4gPj4gKwkJcV9vcC0+
ZmxhZyA9IE5BTkRfQ01EX1BBR0VQUk9HOyAgCj4gPiAKPiA+IEp1c3QgdXNlIHRoZSBpbnN0cnVj
dGlvbiB2YWx1ZT8gIAo+IAo+ICAgIFN1cmUgLCB3aWxsIGZpeCB0aGlzIGluIG5leHQgcGF0Y2gg
VjMuCj4gPiAgIAo+ID4+ICsJCW5hbmRjLT5leGVjX29wd3JpdGUgPSB0cnVlOwo+ID4+ICAgCQli
cmVhazsKPiA+PiAgIAlkZWZhdWx0Ogo+ID4+ICAgCQlicmVhazsKPiA+PiBAQCAtMjk4MiwxMCAr
Mjk4OCw5NSBAQCBzdGF0aWMgdm9pZCBxY29tX3BhcnNlX2luc3RydWN0aW9ucyhzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwLAo+ID4+ICAgCX0KPiA+PiAgIH0gIAo+ID4+ICAgPj4gK3N0YXRpYyB2b2lk
IHFjb21fZGVsYXlfbnModW5zaWduZWQgaW50IG5zKSAgCj4gPj4gK3sKPiA+PiArCWlmICghbnMp
Cj4gPj4gKwkJcmV0dXJuOwo+ID4+ICsKPiA+PiArCWlmIChucyA8IDEwMDAwKQo+ID4+ICsJCW5k
ZWxheShucyk7Cj4gPj4gKwllbHNlCj4gPj4gKwkJdWRlbGF5KERJVl9ST1VORF9VUChucywgMTAw
MCkpOwo+ID4+ICt9Cj4gPj4gKwo+ID4+ICtzdGF0aWMgaW50IHFjb21fd2FpdF9yZHlfcG9sbChz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgdGltZV9tcykKPiA+PiArewo+ID4+
ICsJc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYyA9IGdldF9xY29tX25hbmRfY29u
dHJvbGxlcihjaGlwKTsKPiA+PiArCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSBqaWZmaWVzICsgbXNl
Y3NfdG9famlmZmllcyh0aW1lX21zKTsKPiA+PiArCXUzMiBmbGFzaDsKPiA+PiArCj4gPj4gKwlu
YW5kY19yZWFkX2J1ZmZlcl9zeW5jKG5hbmRjLCB0cnVlKTsKPiA+PiArCj4gPj4gKwlkbyB7Cj4g
Pj4gKwkJZmxhc2ggPSBsZTMyX3RvX2NwdShuYW5kYy0+cmVnX3JlYWRfYnVmWzBdKTsKPiA+PiAr
CQlpZiAoZmxhc2ggJiBGU19SRUFEWV9CU1lfTikKPiA+PiArCQkJcmV0dXJuIDA7Cj4gPj4gKwkJ
Y3B1X3JlbGF4KCk7Cj4gPj4gKwl9IHdoaWxlICh0aW1lX2FmdGVyKHN0YXJ0LCBqaWZmaWVzKSk7
Cj4gPj4gKwo+ID4+ICsJZGV2X2VycihuYW5kYy0+ZGV2LCAiVGltZW91dCB3YWl0aW5nIGZvciBk
ZXZpY2UgdG8gYmUgcmVhZHk6MHglMDh4XG4iLCBmbGFzaCk7Cj4gPj4gKwo+ID4+ICsJcmV0dXJu
IC1FVElNRURPVVQ7Cj4gPj4gK30KPiA+PiArCj4gPj4gICBzdGF0aWMgaW50IHFjb21fcmVhZF9z
dGF0dXNfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ID4+ICAgCQkJCSBjb25zdCBzdHJ1
Y3QgbmFuZF9zdWJvcCAqc3Vib3ApCj4gPj4gICB7Cj4gPj4gLQlyZXR1cm4gMDsKPiA+PiArCXN0
cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCA9IHRvX3Fjb21fbmFuZF9ob3N0KGNoaXApOwo+ID4+
ICsJc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYyA9IGdldF9xY29tX25hbmRfY29u
dHJvbGxlcihjaGlwKTsKPiA+PiArCXN0cnVjdCBuYW5kX2VjY19jdHJsICplY2MgPSAmY2hpcC0+
ZWNjOwo+ID4+ICsJc3RydWN0IHFjb21fb3AgcV9vcDsKPiA+PiArCWNvbnN0IHN0cnVjdCBuYW5k
X29wX2luc3RyICppbnN0ciA9IE5VTEw7Cj4gPj4gKwl1bnNpZ25lZCBpbnQgb3BfaWQgPSAwOwo+
ID4+ICsJdW5zaWduZWQgaW50IGxlbiA9IDA7Cj4gPj4gKwlpbnQgcmV0ID0gMCwgbnVtX2N3ID0g
MSwgaTsKPiA+PiArCXUzMiBmbGFzaF9zdGF0dXM7Cj4gPj4gKwo+ID4+ICsJaG9zdC0+c3RhdHVz
ID0gTkFORF9TVEFUVVNfUkVBRFkgfCBOQU5EX1NUQVRVU19XUDsKPiA+PiArCj4gPj4gKwlxY29t
X3BhcnNlX2luc3RydWN0aW9ucyhjaGlwLCBzdWJvcCwgJnFfb3ApOwo+ID4+ICsKPiA+PiArCWlm
IChuYW5kYy0+ZXhlY19vcHdyaXRlKSB7ICAKPiA+IAo+ID4gSSBkZWZpbml0ZWx5IGRvbid0IHVu
ZGVyc3RhbmQgdGhpcyBmbGFnIGF0IGFsbC4gIAo+IAo+ICAgIFRoaXMgZmxhZyBpcyB0byBnZXQg
dGhlIHN0YXR1cyBmb3IgYWxsIGNvZGUgd29yZCBpbiBjYXNlIG9mIHByb2dyYW0gcGFnZSBvcGVy
YXRpb24uCj4gICAgU2luY2UgdGhpcyByZWFkIHN0YXR1cyBpcyBjb21tb24gZm9yIHJlYWRpbmcg
c3RhdHVzIGZvciBhbGwga2luZCBvZiBvcGVyYXRpb24uCj4gICAgc28gaW4gcGFnZSBwcm9ncmFt
IG9wZXJhdGlvbiBpdCBuZWVkcyB0byBnZXQgc3RhdHVzIGZvciBhbGwgY29kZSB3b3JkIGkuZSA0
IGluIDJLIHBhZ2UuCj4gICAgYnV0IGZvciBub3JtYWwgb3BlcmF0aW9uIG51bWJlciBvZiBjb2Rl
IHdvcmQgd2lsbCBiZSAxLgoKVGhlbiB5b3UgZG9uJ3QgbmVlZCB0aGF0IGRhcmsgZmxhZywganVz
dCBhc2sgZm9yIGEgbnVtYmVyIG9mIENXIHRvCmNoZWNrLiBJdCB3aWxsIGFsd2F5cyBiZSAxIHVu
bGVzcyB5b3UncmUgaW4gYSBwYWdlIGhlbHBlciBhbmQgd2FudCBhcwptYW55IENXIGFzIGNodW5r
cy4KCj4gPiAgIAo+ID4+ICsJCW51bV9jdyA9IGVjYy0+c3RlcHM7Cj4gPj4gKwkJbmFuZGMtPmV4
ZWNfb3B3cml0ZSA9IGZhbHNlOwo+ID4+ICsJfQo+ID4+ICsKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
