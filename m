Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C865CC3A5A0
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 14:35:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94AC820651
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 14:35:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ekn5Jm8d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94AC820651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/hj/OnGy0cXuEWie7EUN1qYaEgm/F4ggu9xkmx6e3g=; b=Ekn5Jm8dssL6yK
	1cHWpUSOtOTBtCC7E6qNCmpKLA+nRRW2an5NqUWZO49plR4gGEZn3+7GqVyhnF0535XmICf2ezFJM
	HSGGG8jcLWI4Y/eWIYRXF44U1DN8+BY6fanLu6UyMohHp17j5OYC0cps0OpCyLqc9Ygs0TPuAPDRQ
	E8vlvdhOQYfyY/TBL8ceYs21KUL4K4cGHihmxejow4oidxFRa4aeTmj48nOxr2m35/lAzk6PgxaGZ
	rlEJMRvQFUHHmH7NiX8Z2WOjuQqEBvmEJQOIIx0Gad41KTGavHGkzGJo9p+xdhw7QmSj1SeQeiFx3
	fqacJoz/p1+pPnW55a2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzikQ-0002vl-M2; Mon, 19 Aug 2019 14:35:02 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzikM-0002ki-Jj
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2019 14:35:00 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8ECA7200002;
 Mon, 19 Aug 2019 14:34:50 +0000 (UTC)
Date: Mon, 19 Aug 2019 16:34:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Message-ID: <20190819163449.6e62e6a5@xps13>
In-Reply-To: <20190819133042.23jpf3eap2u5teuo@pengutronix.de>
References: <20190814082232.2119-1-m.felsch@pengutronix.de>
 <20190819101718.39b3a5ca@xps13>
 <20190819133042.23jpf3eap2u5teuo@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_073458_951220_E9A4A24F 
X-CRM114-Status: GOOD (  22.05  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyY28sCgpNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBNb24sIDE5IEF1ZyAyMDE5CjE1OjMwOjQyICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24g
MTktMDgtMTkgMTA6MTcsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBNYXJjbywKPiA+IAo+
ID4gTWFyY28gRmVsc2NoIDxtLmZlbHNjaEBwZW5ndXRyb25peC5kZT4gd3JvdGUgb24gV2VkLCAx
NCBBdWcgMjAxOQo+ID4gMTA6MjI6MzIgKzAyMDA6Cj4gPiAgIAo+ID4gPiBUaGUgTVQyOUYxRzAx
QUFBREQgaXMgYSBzaW5nbGUgZGllLCBTTEMgYmFzZWQgU1BJIE5BTkQuIEl0IGhhcyBhCj4gPiA+
IGNhcGFjaXR5IG9mIDFHYiBhbmQgc3VwcG9ydHMgNC1iaXQgRUNDLiBUaGUgZGF0YXNoZWV0IGNh
biBiZSBmb3VuZCBbMV0uCj4gPiA+IAo+ID4gPiBVbmZvcnR1bmF0bHkgdGhlIGxpbmtlZCBkZXZp
Y2UgaXMgbWFya2VkIGFzIEVvTCwgYnV0IEkgd2lsbCBleHBlY3QgdGhhdAo+ID4gPiB0aGUgTVQy
OUYxRzAxQUFBRERINC1JVFggYmVoYXZlcyB0aGUgc2FtZSB3YXkuCj4gPiA+IAo+ID4gPiBbMV0g
aHR0cHM6Ly9kYXRhc2hlZXQub2N0b3BhcnQuY29tLyBcCj4gPiA+ICAgICAgIE1UMjlGMUcwMUFB
QURESDQtSVQ6RC1NaWNyb24tZGF0YXNoZWV0LTExNTcyMzgwLnBkZgo+ID4gPiAKPiA+ID4gQ2M6
IFBldGVyIFBhbiA8cGV0ZXJwYW5kb25nQG1pY3Jvbi5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6
IE1hcmNvIEZlbHNjaCA8bS5mZWxzY2hAcGVuZ3V0cm9uaXguZGU+Cj4gPiA+IC0tLQo+ID4gPiAg
ZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgfCA2OCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPiA+
ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYyBiL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jCj4gPiA+IGluZGV4IDdkN2IxZjdmY2Y3MS4uOWQ2
MzQ1MGFmYzY5IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24u
Ywo+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+ID4gPiBAQCAtMzQs
NiArMzQsMTggQEAgc3RhdGljIFNQSU5BTkRfT1BfVkFSSUFOVFModXBkYXRlX2NhY2hlX3Zhcmlh
bnRzLAo+ID4gPiAgCQlTUElOQU5EX1BST0dfTE9BRF9YNChmYWxzZSwgMCwgTlVMTCwgMCksCj4g
PiA+ICAJCVNQSU5BTkRfUFJPR19MT0FEKGZhbHNlLCAwLCBOVUxMLCAwKSk7Cj4gPiA+ICAKPiA+
ID4gK3N0YXRpYyBTUElOQU5EX09QX1ZBUklBTlRTKHJlYWRfY2FjaGVfdmFyaWFudHNfbXQyOWYx
ZzAxYWFhZGQsCj4gPiA+ICsJCVNQSU5BTkRfUEFHRV9SRUFEX0ZST01fQ0FDSEVfWDRfT1AoMCwg
MSwgTlVMTCwgMCksCj4gPiA+ICsJCVNQSU5BTkRfUEFHRV9SRUFEX0ZST01fQ0FDSEVfWDJfT1Ao
MCwgMSwgTlVMTCwgMCksCj4gPiA+ICsJCVNQSU5BTkRfUEFHRV9SRUFEX0ZST01fQ0FDSEVfT1Ao
dHJ1ZSwgMCwgMSwgTlVMTCwgMCksCj4gPiA+ICsJCVNQSU5BTkRfUEFHRV9SRUFEX0ZST01fQ0FD
SEVfT1AoZmFsc2UsIDAsIDEsIE5VTEwsIDApKTsKPiA+ID4gKwo+ID4gPiArc3RhdGljIFNQSU5B
TkRfT1BfVkFSSUFOVFMod3JpdGVfY2FjaGVfdmFyaWFudHNfbXQyOWYxZzAxYWFhZGQsCj4gPiA+
ICsJCVNQSU5BTkRfUFJPR19MT0FEKHRydWUsIDAsIE5VTEwsIDApKTsKPiA+ID4gKwo+ID4gPiAr
c3RhdGljIFNQSU5BTkRfT1BfVkFSSUFOVFModXBkYXRlX2NhY2hlX3ZhcmlhbnRzX210MjlmMWcw
MWFhYWRkLAo+ID4gPiArCQlTUElOQU5EX1BST0dfTE9BRChmYWxzZSwgMCwgTlVMTCwgMCkpOwo+
ID4gPiArCj4gPiA+ICBzdGF0aWMgaW50IG10MjlmMmcwMWFiYWdkX29vYmxheW91dF9lY2Moc3Ry
dWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAo+ID4gPiAgCQkJCQlzdHJ1Y3QgbXRkX29v
Yl9yZWdpb24gKnJlZ2lvbikKPiA+ID4gIHsKPiA+ID4gQEAgLTkwLDYgKzEwMiw1MiBAQCBzdGF0
aWMgaW50IG10MjlmMmcwMWFiYWdkX2VjY19nZXRfc3RhdHVzKHN0cnVjdCBzcGluYW5kX2Rldmlj
ZSAqc3BpbmFuZCwKPiA+ID4gIAlyZXR1cm4gLUVJTlZBTDsKPiA+ID4gIH0KPiA+ID4gIAo+ID4g
PiArc3RhdGljIGludCBtdDI5ZjFnMDFhYWFkZF9vb2JsYXlvdXRfZWNjKHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBpbnQgc2VjdGlvbiwKPiA+ID4gKwkJCQkJc3RydWN0IG10ZF9vb2JfcmVnaW9uICpy
ZWdpb24pCj4gPiA+ICt7Cj4gPiA+ICsJaWYgKHNlY3Rpb24gPiAzKQo+ID4gPiArCQlyZXR1cm4g
LUVSQU5HRTsKPiA+ID4gKwo+ID4gPiArCXJlZ2lvbi0+b2Zmc2V0ID0gKHNlY3Rpb24gKiAweDEw
KSArIDg7ICAKPiA+IAo+ID4gQW55IHJlYXNvbiB0byB1c2UgaGV4IGhlcmU/ICAgICAgICAgXgo+
ID4gCj4gPiBJZiBub3QgSSB3b3VsZCBwcmVmZXIgZGVjaW1hbCBudW1iZXJzLiAgCj4gCj4gU2lu
Y2UgdGhlIGRhdGFzaGVldCBkZXNjcmliZSBpdCBpbiBoZXggdG8uCj4gCj4gQ2FuIHlvdSBoYXZl
IGEgbG9vayBvbiBbMV0gdGFibGUgMTE/IE1heSB3ZSBkbyBzb21ldGhpbmcgbGlrZToKPiAKPiAJ
cmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAqIDB4MTApICsgMHg4Owo+IAo+IFsxXSBodHRwczov
L2RhdGFzaGVldC5vY3RvcGFydC5jb20vTVQyOUYxRzAxQUFBRERINC1JVDpELU1pY3Jvbi1kYXRh
c2hlZXQtMTE1NzIzODAucGRmCj4gCj4gPiAKPiA+IE90aGVyd2lzZSBsb29rcyBmaW5lLiAgCj4g
Cj4gQW55d2F5IEkgY2FuIGNoYW5nZSB0aGUgYWJvdmUgY29kZSB0byB1c2Ugb25seSBkZWNpbWFs
IHZhbHVlcyBpZiB5b3UKPiBsaWtlIGl0IG1vcmUuCgpJIHRoaW5rIGl0IGlzIGJldHRlciB0byBy
ZXNlcnZlIGhleGFkZWNpbWFsIHZhbHVlcyB0byByZWdpc3RlcgpvcGVyYXRpb25zLiBQbGVhc2Ug
dHJhbnNsYXRlIGludG8gZGVjaW1hbC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
