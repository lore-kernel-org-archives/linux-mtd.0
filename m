Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D3DC10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 22:11:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC162078A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 22:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hozSBQj+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC162078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yjBnwlDUXMSyPYYwhNO8rYka/j07w0T3cV9CCUCHyQ=; b=hozSBQj+9jbso3
	iSzbUV08Sq9rs1874C6vyy1lQhLM2pWa56ZiPz0HdycmdW3/ijKnOar3Bbkzv8ehcdt/8WvkgnRJR
	PpJgbG25d71lIjVK4qO/KTntZN/3IF9xPNsFmv69yBa8FWiODFxqcMgjnGe9BNEgWux1aWREFBIHq
	ztIUjw2DkszeDSQZPu3oyZNcFn/P9qZFPZp4Z8tofCsWqO+G1CkUE+kX4ugt64+FqbtWlo8fP4SkD
	rwNJvFEkMZ7m7cOi+i53jWg+60E+paiVcYQ0EfQwkFK+lSIncXrTAUQAdzkAuEAeaN1LN03GEc772
	cUPAcRKHtKpFyDpxjNlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGrlz-0001Iu-Mu; Tue, 24 Mar 2020 22:11:47 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGrlw-0001Ia-UF
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 22:11:46 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 42818FF804;
 Tue, 24 Mar 2020 22:11:42 +0000 (UTC)
Date: Tue, 24 Mar 2020 23:11:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: fix calculating partition end address
Message-ID: <20200324231140.44aecf7a@xps13>
In-Reply-To: <9fe546f30130cf3569cd139d559d9c44@milecki.pl>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13>
 <6125d86fee0c83653cc281b3069e1587@milecki.pl>
 <20200324225859.56b2a301@xps13>
 <9fe546f30130cf3569cd139d559d9c44@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_151145_110727_2AFE4E23 
X-CRM114-Status: GOOD (  20.43  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYcWCLAoKUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPiB3cm90ZSBvbiBU
dWUsIDI0IE1hciAyMDIwIDIzOjA2OjA1CiswMTAwOgoKPiBIZXksCj4gCj4gT24gMjAyMC0wMy0y
NCAyMjo1OCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IFJhZmHFgiBNacWCZWNraSA8cmFmYWxA
bWlsZWNraS5wbD4gd3JvdGUgb24gTW9uLCAwOSBNYXIgMjAyMCAxNToxOToxMAo+ID4gKzAxMDA6
Cj4gPiAgIAo+ID4+IE9uIDIwMjAtMDMtMDkgMTU6MDQsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAK
PiA+PiA+IFJhZmHFgiBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAg
OSBNYXIgMjAyMCAwODo0NDo0NQo+ID4+ID4gKzAxMDA6Cj4gPj4gPiAgCj4gPj4gPj4gRnJvbTog
UmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPiAgCj4gPj4gPj4gPj4gVGhpcyBmaXhl
cyBjaGVjayBmb3IgcGFydGl0aW9ucyB0aGF0IGRvbid0IHN0YXJ0IGF0IGJlZ2lubmluZyBvZiB0
aGVpciAgCj4gPj4gPj4gcGFyZW50cy4gTWlzc2luZyBwYXJ0aXRpb24ncyBvZmZzZXQgaW4gZm9y
bXVsYSBjb3VsZCByZXN1bHQgaW4gZm9yY2luZwo+ID4+ID4+IHJlYWQtb25seSBpbmNvcnJlY3Rs
eS4gIAo+ID4+ID4+ID4+IEZpeGVzOiA2NzUwZjYxYTEzYTAgKCJtdGQ6IGltcHJvdmUgY2FsY3Vs
YXRpbmcgcGFydGl0aW9uIGJvdW5kYXJpZXMgPj4gd2hlbiBjaGVja2luZyBmb3IgYWxpZ25tZW50
IikgIAo+ID4+ID4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KPiA+PiA+PiAtLS0KPiA+PiA+PiAgZHJpdmVycy9tdGQvbXRkcGFydC5jIHwgMiArLQo+
ID4+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkgIAo+
ID4+ID4+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210
ZC9tdGRwYXJ0LmMgIAo+ID4+ID4+IGluZGV4IDczMjhjMDY2YzViYS4uYzY4M2I0MzJjYzVlIDEw
MDY0NAo+ID4+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+ID4+ID4+ICsrKyBiL2Ry
aXZlcnMvbXRkL210ZHBhcnQuYwo+ID4+ID4+IEBAIC01MjQsNyArNTI0LDcgQEAgc3RhdGljIHN0
cnVjdCBtdGRfcGFydCAqYWxsb2NhdGVfcGFydGl0aW9uKHN0cnVjdCA+PiBtdGRfaW5mbyAqcGFy
ZW50LAo+ID4+ID4+ICAJCQlwYXJ0LT5uYW1lKTsKPiA+PiA+PiAgCX0gIAo+ID4+ID4+ID4+IC0J
dG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50KSArIHNsYXZlLT5tdGQuc2l6ZTsgIAo+
ID4+ID4+ICsJdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50KSArIHNsYXZlLT5vZmZz
ZXQgKyA+PiBzbGF2ZS0+bXRkLnNpemU7ICAKPiA+PiA+Cj4gPj4gPiBJIHRoaW5rIHlvdSBhcmUg
ZG9pbmcgdGhlIGNoYW5nZSBhdCB0aGUgd3JvbmcgcGxhY2UsIGlmIHlvdSB3YW50IHRvCj4gPj4g
PiBjaGVjayB3aGVyZSB0aGUgcGFydGl0aW9uICpzdGFydHMqIHlvdSBzaG91bGQgZG8gaXQgYSBm
ZXcgbGluZXMgYWJvdmUuCj4gPj4gPiBCdXQgSSB0aGluayB0aGUgY2hlY2sgc2hvdWxkIGJlIGhl
cmUgYXMgd2VsbCwgcHJvYmFibHkuICAKPiA+PiA+PiBUaGUgY2hlY2sgd2hlcmUgdGhlIHBhcnRp
dGlvbiAqc3RhcnRzKiBpcyBPSyBhbmQgSSBkb24ndCBtZWFuIHRvID4+IGNoYW5nZSAgCj4gPj4g
aXQuIFRoZSBidWcgaXMgYWJvdXQgY2FsY3VsYXRpbmcgYWJzb2x1dGUgKmVuZCogYWRkcmVzcyBv
ZiBwYXJ0aXRpb24uICAKPiA+PiA+PiA+PiA+IEFueXdheSwgSSBqdXN0IGFwcGxpZWQgb24gbXkg
bG9jYWwgdHJlZSBhIHBhdGNoIHJld3JpdGluZyBhIGJpdCB0aGUgIAo+ID4+ID4gcGFydGl0aW9u
aW5nIHNjaGVtZSwgY291bGQgeW91IHBsZWFzZSByZWJhc2Ugb24gdG9wIG9mIHRvZGF5J3MKPiA+
PiA+IG10ZC9uZXh0IGFuZCByZXNlbmQgdGhpcyBwYXRjaCB1cGRhdGVkPwo+ID4+ID4KPiA+PiA+
IEhlcmUgaXMgdGhlIGNoYW5nZSB0aGF0IEkndmUgZG9uZSBhdCB0aGlzIHBsYWNlOgo+ID4+ID4g
CS0gICAgICAgdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50KSArIHNsYXZlLT5tdGQu
c2l6ZTsKPiA+PiA+IAkrICAgICAgIHRtcCA9IG10ZF9nZXRfbWFzdGVyX29mcyhjaGlsZCwgMCkg
KyBjaGlsZC0+c2l6ZTsgIAo+ID4+ID4+IEknbGwgZ2l2ZSBpdCBhIHRyeS4gIAo+ID4gCj4gPiBJ
IHdvdWxkIGxpa2UgdG8gYXBwbHkgeW91ciBmaXggdGhpcyB3ZWVrLCBkbyB5b3UgdGhpbmsgeW91
IGNhbiByZWJhc2UKPiA+IGFuZCByZXNlbmQgc29vbj8gIAo+IAo+IEl0J3Mgbm90IG5lZWRlZCBh
bnltb3JlIGFzIHlvdSBmaXhlZCB0aGlzIGJ1ZyBpbiB5b3VyIGNvbW1pdCByZXdvcmtpbmcKPiBw
YXJ0aXRpb25zLgoKR3JlYXQhCgoKVGhhbmtzIGZvciB0aGUgaW5mbwpNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
