Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E753CC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 12:16:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5CBB204EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 12:16:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Km5K2m0J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5CBB204EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ut9Gk77RdDSMQNwgj/9gkVID10xcv3rBR468ZVutQhc=; b=Km5K2m0JGw/R8G
	YJyoFXiCveFQBggp9rCOmAcp3LL1cNSkCNlSCiz93SoZrZgtgvn/8I2fnsenoZwktjNpIGESMzPT+
	RGzMDSSILqpwp4bwS3jxr09turOYq5JGwowaidhsh7/D6jL6es1F7vT+eP2WZMeBlol8wMJQy3ACU
	3YDW4wj/8Jkc9ambythkzZ5m6E2ZIOZ+xEhFzzAlO3u88q9hk1ZByUhvdtbP04wXbHKxl+3i7auOM
	MVWSdo36mvGyvF70SW99rOF5209uMWa6XcGjcykWWD0Sq+i4NxFc72TetkZpb8yxHmVcz52HKS64k
	QIyIrycopf/Iee6bPQVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb1A8-0005pB-0b; Tue, 19 May 2020 12:16:00 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1A4-0005of-C9
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 12:15:58 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E291020004;
 Tue, 19 May 2020 12:15:52 +0000 (UTC)
Date: Tue, 19 May 2020 14:15:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v5 4/8] mtd: rawnand: Add nand_extract_bits()
Message-ID: <20200519141551.5faf9e92@xps13>
In-Reply-To: <20200519104827.6cb3010d@collabora.com>
References: <20200519074549.23673-1-miquel.raynal@bootlin.com>
 <20200519074549.23673-5-miquel.raynal@bootlin.com>
 <20200519104827.6cb3010d@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_051556_682422_8F3F5927 
X-CRM114-Status: GOOD (  20.34  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBUdWUsIDE5IE1heQoyMDIwIDEwOjQ4OjI3ICswMjAwOgoKPiBPbiBUdWUsIDE5
IE1heSAyMDIwIDA5OjQ1OjQ1ICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGVyZSBhcmUgY2FzZXMgd2hlcmUgRUNDIGJ5dGVz
IGFyZSBub3QgYnl0ZS1hbGlnbmVkLiBJbmRlZWQsIEJDSAo+ID4gaW1wbGllcyB1c2luZyBhIG51
bWJlciBvZiBFQ0MgYml0cywgd2hpY2ggYXJlIG5vdCBhbHdheXMgYSBtdWx0aXBsZSBvZgo+ID4g
OC4gV2UgdGhlbiBuZWVkIGEgaGVscGVyIGxpa2UgbmFuZF9leHRyYWN0X2JpdHMoKSB0byBleHRy
YWN0IHRoZXNlCj4gPiBzeW5kcm9tZXMgZnJvbSBhIGJ1ZmZlci4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwgNDIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICB8
ICA0ICsrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4gaW5kZXggNjVlOWIyZmEyZmM1Li4xNDM4N2I5Njdl
OGIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+IEBAIC0yNzQsNiArMjc0
LDQ4IEBAIHN0YXRpYyBpbnQgY2hlY2tfb2Zmc19sZW4oc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
bG9mZl90IG9mcywgdWludDY0X3QgbGVuKQo+ID4gIAlyZXR1cm4gcmV0Owo+ID4gIH0KPiA+ICAK
PiA+ICsvKiogbmFuZF9leHRyYWN0X2JpdHMgLSBDb3B5IHVuYWxpZ25lZCBiaXRzIGZyb20gb25l
IGJ1ZmZlciB0byBhbm90aGVyIG9uZSAgCj4gCj4gSXQgc2hvdWxkIGJlCj4gCj4gLyoqCj4gICog
bmFuZF9leHRyYWN0X2JpdHMgLSBDb3B5IHVuYWxpZ25lZCBiaXRzIGZyb20gb25lIGJ1ZmZlciB0
byBhbm90aGVyCj4gCj4gT25jZSBhZGRyZXNzZWQgeW91IGNhbiBhZGQKPiAKPiBSZXZpZXdlZC1i
eTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KCk9oIHll
YWgsIHJpZ2h0LgoKSSdsbCBmaXggaXQgd2hlbiBhcHBseWluZy4KCj4gCj4gSWYgc29tZW9uZSBy
ZWFkcyB0aGF0IGFuZCBoYXMgZW5vdWdoIGVuZXJneSwgaXQnZCBiZSBncmVhdCB0byBoYXZlIGEK
PiBnZW5lcmljIGJpdGNweSgpIGZ1bmN0aW9uIChsb29rcyBsaWtlIHRoZSBmYmRldiBbMV0gc3Vi
c3lzdGVtIGhhcyBhCj4gcHJpdmF0ZSBpbXBsZW1lbnRhdGlvbiB0b28pLgoKQWJzb2x1dGVseSEK
Cj4gCj4gPiArICogQGRzdDogZGVzdGluYXRpb24gYnVmZmVyCj4gPiArICogQGRzdF9vZmY6IGJp
dCBvZmZzZXQgYXQgd2hpY2ggdGhlIHdyaXRpbmcgc3RhcnRzCj4gPiArICogQHNyYzogc291cmNl
IGJ1ZmZlcgo+ID4gKyAqIEBzcmNfb2ZmOiBiaXQgb2Zmc2V0IGF0IHdoaWNoIHRoZSByZWFkaW5n
IHN0YXJ0cwo+ID4gKyAqIEBuYml0czogbnVtYmVyIG9mIGJpdHMgdG8gY29weSBmcm9tIEBzcmMg
dG8gQGRzdAo+ID4gKyAqCj4gPiArICogQ29weSBiaXRzIGZyb20gb25lIG1lbW9yeSByZWdpb24g
dG8gYW5vdGhlciAob3ZlcmxhcCBhdXRob3JpemVkKS4KPiA+ICsgKi8KPiA+ICt2b2lkIG5hbmRf
ZXh0cmFjdF9iaXRzKHU4ICpkc3QsIHVuc2lnbmVkIGludCBkc3Rfb2ZmLCBjb25zdCB1OCAqc3Jj
LAo+ID4gKwkJICAgICAgIHVuc2lnbmVkIGludCBzcmNfb2ZmLCB1bnNpZ25lZCBpbnQgbmJpdHMp
Cj4gPiArewo+ID4gKwl1bnNpZ25lZCBpbnQgdG1wLCBuOwo+ID4gKwo+ID4gKwlkc3QgKz0gZHN0
X29mZiAvIDg7Cj4gPiArCWRzdF9vZmYgJT0gODsKPiA+ICsJc3JjICs9IHNyY19vZmYgLyA4Owo+
ID4gKwlzcmNfb2ZmICU9IDg7Cj4gPiArCj4gPiArCXdoaWxlIChuYml0cykgewo+ID4gKwkJbiA9
IG1pbjMoOCAtIGRzdF9vZmYsIDggLSBzcmNfb2ZmLCBuYml0cyk7Cj4gPiArCj4gPiArCQl0bXAg
PSAoKnNyYyA+PiBzcmNfb2ZmKSAmIEdFTk1BU0sobiAtIDEsIDApOwo+ID4gKwkJKmRzdCAmPSB+
R0VOTUFTSyhuIC0gMSArIGRzdF9vZmYsIGRzdF9vZmYpOwo+ID4gKwkJKmRzdCB8PSB0bXAgPDwg
ZHN0X29mZjsKPiA+ICsKPiA+ICsJCWRzdF9vZmYgKz0gbjsKPiA+ICsJCWlmIChkc3Rfb2ZmID49
IDgpIHsKPiA+ICsJCQlkc3QrKzsKPiA+ICsJCQlkc3Rfb2ZmIC09IDg7Cj4gPiArCQl9Cj4gPiAr
Cj4gPiArCQlzcmNfb2ZmICs9IG47Cj4gPiArCQlpZiAoc3JjX29mZiA+PSA4KSB7Cj4gPiArCQkJ
c3JjKys7Cj4gPiArCQkJc3JjX29mZiAtPSA4Owo+ID4gKwkJfQo+ID4gKwo+ID4gKwkJbmJpdHMg
LT0gbjsKPiA+ICsJfQo+ID4gK30KPiA+ICsKPiA+ICAvKioKPiA+ICAgKiBuYW5kX3NlbGVjdF90
YXJnZXQoKSAtIFNlbGVjdCBhIE5BTkQgdGFyZ2V0IChBLksuQS4gZGllKQo+ID4gICAqIEBjaGlw
OiBOQU5EIGNoaXAgb2JqZWN0Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvcmF3
bmFuZC5oIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gPiBpbmRleCAwZjQ1YjY5ODRh
ZDEuLjQ1ZGQ1N2UyYTIyMyAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL3Jhd25h
bmQuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gPiBAQCAtMTQxMiw2
ICsxNDEyLDEwIEBAIGludCBuYW5kX2dwaW9fd2FpdHJkeShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
LCBzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvZCwKPiA+ICB2b2lkIG5hbmRfc2VsZWN0X3RhcmdldChz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgY3MpOwo+ID4gIHZvaWQgbmFuZF9k
ZXNlbGVjdF90YXJnZXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCk7Cj4gPiAgCj4gPiArLyogQml0
b3BzICovCj4gPiArdm9pZCBuYW5kX2V4dHJhY3RfYml0cyh1OCAqZHN0LCB1bnNpZ25lZCBpbnQg
ZHN0X29mZiwgY29uc3QgdTggKnNyYywKPiA+ICsJCSAgICAgICB1bnNpZ25lZCBpbnQgc3JjX29m
ZiwgdW5zaWduZWQgaW50IG5iaXRzKTsKPiA+ICsKPiA+ICAvKioKPiA+ICAgKiBuYW5kX2dldF9k
YXRhX2J1ZigpIC0gR2V0IHRoZSBpbnRlcm5hbCBwYWdlIGJ1ZmZlcgo+ID4gICAqIEBjaGlwOiBO
QU5EIGNoaXAgb2JqZWN0ICAKPiAKPiBbMV1odHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvdmlkZW8vZmJkZXYvYW1pZmIuYyNMMjU5OAoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
