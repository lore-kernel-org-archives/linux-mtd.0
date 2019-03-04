Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697EBC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:14:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E7D20675
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 18:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lqc5oQw0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E7D20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/U+0CnQkXeE2W6t6EI0qwPzeKv8QUFMgA8un/x3ulwE=; b=lqc5oQw0uR8Gu1
	EI+tXmirCi/i8gzL4HbJB9bJ8AhRWFL0K2wvyneoKq6CmC8f5CCfP2IVIcTgFvwKEUqawpzcQRkQq
	mLt3AG0e0npNas3ZvRn5C2yNbZpAOSCL4Ri2hylpRGchupe7dQBnxRtj9+g1aXpxhDV/E+PQfNVg4
	ZbIsPFURL4wAxmdk0OyEcT9tWvoLLWG1LlwlD+mmgk8rgbUI4gJJfe3Q8NfggObrfdO80XaTujgDK
	ajQMroXt6gCdYldrvrgJ37O11s3kI4KfNV5b0Ozsv4+12YFr9DdHtrY25VYsZ5vYvnGVE8MM41hnZ
	ciNvQ1ah2vonA8KJkdIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0s6O-0006AJ-Nn; Mon, 04 Mar 2019 18:14:12 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0s6K-00069b-4f
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 18:14:10 +0000
Received: from xps13 (136.87.136.77.rev.sfr.net [77.136.87.136])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 84F80240003;
 Mon,  4 Mar 2019 18:13:56 +0000 (UTC)
Date: Mon, 4 Mar 2019 19:13:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [EXT] Re: [PATCH 2/2] mtd: spinand: micron: Support for all
 Micron SPI NAND flashes
Message-ID: <20190304191349.71f8b147@xps13>
In-Reply-To: <MN2PR08MB5951EE4ACB78BAD12EDA5F76B8710@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <MN2PR08MB5951FD3B8244ABBA72FF7430B86D0@MN2PR08MB5951.namprd08.prod.outlook.com>
 <20190204190151.2c7987b7@bbrezillon>
 <MN2PR08MB5951EE4ACB78BAD12EDA5F76B8710@MN2PR08MB5951.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_101408_480686_C7631D49 
X-CRM114-Status: GOOD (  20.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.De>,
 Marek Vasut <marek.vasut@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgoiU2hpdmFtdXJ0aHkgU2hhc3RyaSAoc3NoaXZhbXVydGh5KSIgPHNzaGl2YW11cnRo
eUBtaWNyb24uY29tPiB3cm90ZSBvbgpNb24sIDQgTWFyIDIwMTkgMTM6Mjk6MjEgKzAwMDA6Cgo+
IEhpIEJvcmlzLAo+IAo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEJv
cmlzIEJyZXppbGxvbiA8YmJyZXppbGxvbkBrZXJuZWwub3JnPgo+ID4gU2VudDogTW9uZGF5LCBG
ZWJydWFyeSA0LCAyMDE5IDc6MDIgUE0KPiA+IFRvOiBTaGl2YW11cnRoeSBTaGFzdHJpIChzc2hp
dmFtdXJ0aHkpIDxzc2hpdmFtdXJ0aHlAbWljcm9uLmNvbT4KPiA+IENjOiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjsgbGludXgtCj4gPiBtdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQ2h1YW5ob25nIEd1bwo+ID4g
PGdjaDk4MTIxM0BnbWFpbC5jb20+OyBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0
PjsgU2NocmVtcGYKPiA+IEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5EZT47IE1h
cmVrIFZhc3V0Cj4gPiA8bWFyZWsudmFzdXRAZ21haWwuY29tPjsgRnJpZWRlciBTY2hyZW1wZgo+
ID4gPGZyaWVkZXIuc2NocmVtcGZAZXhjZWV0LmRlPjsgQnJpYW4gTm9ycmlzCj4gPiA8Y29tcHV0
ZXJzZm9ycGVhY2VAZ21haWwuY29tPjsgRGF2aWQgV29vZGhvdXNlCj4gPiA8ZHdtdzJAaW5mcmFk
ZWFkLm9yZz47IEJlYW4gSHVvIChiZWFuaHVvKSA8YmVhbmh1b0BtaWNyb24uY29tPgo+ID4gU3Vi
amVjdDogW0VYVF0gUmU6IFtQQVRDSCAyLzJdIG10ZDogc3BpbmFuZDogbWljcm9uOiBTdXBwb3J0
IGZvciBhbGwgTWljcm9uCj4gPiBTUEkgTkFORCBmbGFzaGVzCj4gPiAKPiA+IEhpIFNoaXZhbXVy
dGh5LAo+ID4gCj4gPiBPbiBNb24sIDQgRmViIDIwMTkgMTE6MTc6NTEgKzAwMDAKPiA+ICJTaGl2
YW11cnRoeSBTaGFzdHJpIChzc2hpdmFtdXJ0aHkpIiA8c3NoaXZhbXVydGh5QG1pY3Jvbi5jb20+
IHdyb3RlOgo+ID4gICAKPiA+ID4gRHJpdmVyIGlzIHJlZGVzaWduZWQgdXNpbmcgcGFyYW1ldGVy
IHBhZ2UgdG8gc3VwcG9ydCBhbGwgdGhlIE1pY3Jvbgo+ID4gPiBTUEkgTkFORCBmbGFzaGVzLiAg
Cj4gPiAKPiA+IERvIGFsbCBNaWNyb24gU1BJIE5BTkRzIHJlYWxseSBleHBvc2UgYSB2YWxpZCBP
TkZJIHBhcmFtIHBhZ2U/IElmCj4gPiB0aGF0J3Mgbm90IHRoZSBjYXNlLCB0aGVuIHJlbHlpbmcg
b24gT05GaSBwYXJzaW5nIG9ubHkgc291bmRzIGxpa2UgYQo+ID4gYmFkIGlkZWEuICAKPiAKPiBN
aWNyb24gU1BJIE5BTkQgZGF0YXNoZWV0IGRvZXMgbm90IGNvbmZpcm0gdG8gYmUgYXMgT05GSSBz
dGFuZGFyZC4KPiBIb3dldmVyLCB0aGV5IGFsbCBleHBvc2UgcGFyYW1ldGVyIHBhZ2UsIHdoaWNo
IEkgdXNlZCBmb3IgZGV2ZWxvcG1lbnQuCj4gCj4gPiAgIAo+ID4gPgo+ID4gPiBQYXJhbWV0ZXIg
cGFnZSBvZiBNaWNyb24gZmxhc2hlcyBpcyBzaW1pbGFyIHRvIE9ORkkgcGFyYW1ldGVyIHRhYmxl
IGFuZAo+ID4gPiBmdW5jdGlvbmFsaXR5IGlzIHNhbWUsIHNvIGNvcGllZCBzb21lIG9mIHRoZSBj
b21tb24gZnVuY3Rpb25zIGxpa2UgY3JjMTYKPiA+ID4gYW5kIGJpdF93aXNlX21ham9yaXR5IGZy
b20gbmFuZF9vbmZpLmMuICAKPiA+IAo+ID4gTW9zdCBvZiB0aGUgY29kZSBpcyBnZW5lcmljIGFu
ZCBkb2VzIG5vdCBkZXBlbmQgb24gdGhlIHNwaW5hbmQgbGF5ZXIsCj4gPiBwbHVzLCB3ZSBhbHJl
YWR5IGhhdmUgT05GSSBwYXJhbSBwYWdlIHBhcnNpbmcgY29kZSBpbgo+ID4gZHJpdmVycy9tdGQv
bmFuZC9yYXcvIHdoaWNoIHlvdSdyZSBpbnRlbnRpb25hbGx5IGR1cGxpY2F0aW5nIGluIGEKPiA+
IHZlcnNpb24gdGhhdCB3aWxsIG5vdCBiZSByZS11c2FibGUgYnkgdGhlIHJhdyBOQU5EIGxheWVy
IGV2ZW4gYWZ0ZXIKPiA+IGNvbnZlcnRpbmcgaXQgdG8gdXNlIHRoZSBnZW5lcmljIE5BTkQgbGF5
ZXIuCj4gPiAKPiA+IFBsZWFzZSBtb3ZlIE9ORmkgcGFyc2luZyBjb2RlIHRvIGRyaXZlcnMvbXRk
L25hbmQvb25maS5jIGFuZCBtYWtlIGl0Cj4gPiBnZW5lcmljLiAgCj4gCj4gQXMgSSBzYWlkIGJl
Zm9yZSwgaXQgaXMgbm90IGNvbXBsaWFudCB0byBPTkZJIHN0YW5kYXJkLCBJIHRoaW5rIGl0IGlz
IGJldHRlciBub3QgCj4gdG8gbWFrZSBpdCBnZW5lcmljLgoKRm9yIHdoYXQgSSBzZWUgaXQgaXMg
dG9vIHNpbWlsYXIgdG8gY29weSBhbGwgdGhhdCBjb2RlLiBJIGFncmVlIHdpdGgKQm9yaXMuIElm
IHRoZXJlIGFyZSBzb21lIHNwZWNpZmljaXRpZXMgdGhhdCBhcmUgbm90IGluIHRoZSBPTkZJCnN0
YW5kYXJkIHlvdSBjYW4gZG8gc29tZSBsYXRlIGNoYW5nZXMgaW4gdGhlIHBhcmFtZXRlciBwYWdl
IGZyb20KTWljcm9uJ3MgZHJpdmVyIEkgZ3Vlc3M/CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
