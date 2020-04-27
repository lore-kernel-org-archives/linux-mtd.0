Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54C2C54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 14:42:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8807A20656
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 14:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X9ZXWK5F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8807A20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fHH018c121ZZO1+6GNzW6on4T/4uhnsdWt18nnLjSg=; b=X9ZXWK5Ft75zy/
	4O6tws1T4azxYZm8ELWR3w67EJjudPsJgDSrvWHXWZulFglX0Wc+c1a1kVuemXmtnkGCbUEHS6/ef
	V1QZ41zbSKC5cEsmsZGajzdA2HWiy4g1+AtPlqoJagSp7Q7usda7na6g0KqIuapF2ZgUd9OgZgfAH
	RvInLQs38fyS2lSPHhINuZtT6EAprLmVL/TUn0WMbVf7RXL9gqZSqRZLZSJnMwFqCiEdUY91f6eip
	EtJQiWmhZyr2iJ6lgE8rpi0UaWnOD9kkgVw++JAcn+/2/tF3ndqOeCtYfHo5pD6UQoGjSk4ND1tHn
	KcRTCYqGZmnE6Rnirlrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT4xK-0000R6-GU; Mon, 27 Apr 2020 14:41:58 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT4x6-0000E7-IO
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 14:41:47 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1B10FC0003;
 Mon, 27 Apr 2020 14:41:39 +0000 (UTC)
Date: Mon, 27 Apr 2020 16:41:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
Message-ID: <20200427164138.05076f3a@xps13>
In-Reply-To: <20200427114954.4fc0e8fc@collabora.com>
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com>
 <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com>
 <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com>
 <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
 <20200401094148.1786d48a@xps13>
 <20200427111623.5f93842d@collabora.com>
 <20200427114954.4fc0e8fc@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_074144_885009_1EFE0157 
X-CRM114-Status: GOOD (  41.31  )
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
Cc: ron minnich <rminnich@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9uLAoKQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4g
d3JvdGUgb24gTW9uLCAyNyBBcHIKMjAyMCAxMTo0OTo1NCArMDIwMDoKCj4gT24gTW9uLCAyNyBB
cHIgMjAyMCAxMToxNjoyMyArMDIwMAo+IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+IAo+ID4gSGkgYWxsLAo+ID4gCj4gPiBPbiBXZWQsIDEg
QXByIDIwMjAgMDk6NDE6NDggKzAyMDAKPiA+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+ID4gICAKPiA+ID4gSGkgcm9uLAo+ID4gPiAKPiA+ID4gcm9u
IG1pbm5pY2ggPHJtaW5uaWNoQGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAzMCBNYXIgMjAyMCAw
ODo1MzoyMgo+ID4gPiAtMDcwMDoKPiA+ID4gICAgIAo+ID4gPiA+IE9uIE1vbiwgTWFyIDMwLCAy
MDIwIGF0IDEyOjI3IEFNIE1pcXVlbCBSYXluYWwKPiA+ID4gPiA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4gd3JvdGU6Cj4gPiA+ID4gICAgICAgCj4gPiA+ID4gPiBXb3VsZCBpdCBiZSBoYXJk
IHRvIHN1cHBvcnQgYW4gZXh0cmEgJzonIGFmdGVyIHRoZSBNVEQgZGV2aWNlIG5hbWU/Cj4gPiA+
ID4gPiBUaGlzIHdheSB3b3VsZCB3b3VsZCBhbGxvdyBhbnl0aGluZyBpbnNpZGUgdGhlIG9wdGlv
bmFsICcoJyAnKScgYnV0Cj4gPiA+ID4gPiB3b3VsZCBrZWVwIHRoZSB0cmFpbGluZyAnOicuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gdG9UYXk6Cj4gPiA+ID4gPiAgICAgICAgIG10ZHBhcnRzPW5hbWU6
cGFydDEscGFydDIKPiA+ID4gPiA+Cj4gPiA+ID4gPiBTbzoKPiA+ID4gPiA+ICAgICAgICAgbXRk
cGFydHM9KDAwMDA6MDA6MWYuNSk6MjUxNjU4MjQoQklPUyksLShzcXVhc2hmcykgICAgICAgIAo+
ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IEkgdGhvdWdodCBhYm91dCB0aGF0ICc6JyB0b28uIEl0
IGRvZXMgYWRkIGEgYml0IG1vcmUgdG8gdGhlIGNvZGUsIGFuZAo+ID4gPiA+IGEgYml0IG1vcmUg
aW4gdGhlIHdheSBvZiBlcnJvciBjYXNlcy4gSSBhbHdheXMgd29ycnksIHdoZW4gY29kZSBpcwo+
ID4gPiA+IGdvaW5nIGludG8gZmxhc2gsCj4gPiA+ID4gYWJvdXQgZXJyb3JzIHdoZXJlIHNvbWV0
aGluZyBsb29rcyBjbG9zZSB0byByaWdodCBidXQgaXMgd3JvbmcuIChzYXlzCj4gPiA+ID4gdGhl
IHBlcnNvbiB3aG8ganVzdCB0eXBlZCBpdCBpbnN0ZWFkIG9mIGlzIGEgZmV3IHRpbWVzIDotKQo+
ID4gPiA+IAo+ID4gPiA+IFdoYXQgaWYgd2UgZGlkIHRoaXM6Cj4gPiA+ID4gbXRkcGFydHM9WzAw
MDA6MDA6MWYuNV0yNTE2NTgyNChCSU9TKSwtKHNxdWFzaGZzKQo+ID4gPiA+IAo+ID4gPiA+IElz
IHRoZSAiXSIgJ2Vub3VnaCBkaWZmZXJlbnQnIHRoYXQgd2UgZG8gbm90IG5lZWQgdGhlICc6Jz8K
PiA+ID4gPiAKPiA+ID4gPiBJIGtpbmQgb2YgbGlrZSB0aGUgW10gYmV0dGVyIGFueXdheSBhcyBp
dCBtYWtlcyB0aGUgbXRkaWQgc3RhbmQgb3V0IGEKPiA+ID4gPiBiaXQgbW9yZSBmcm9tIHRoZSBw
YXJ0IG5hbWVzPyBCdXQgaXMgaXQgZW5vdWdoIHRoYXQgd2UgZG9uJ3QgbmVlZCB0aGUKPiA+ID4g
PiAnOic/IFdvdWxkIHlvdSBzdGlsbCBwcmVmZXIgdGhlICgpIGFzIG9wcG9zZWQgdG8gdGhlIFtd
PyAgICAgIAo+ID4gPiAKPiA+ID4gSSBsaWtlIHRoZSBbXSBhcyB3ZWxsLCBtYXliZSBtb3JlIHRo
YW4gKCkgYmVjYXVzZSBhdCBsZWFzdCBpdCBkb2VzIG5vdAo+ID4gPiBjb25mbGljdCB3aXRoIHRo
ZSBwYXJ0aXRpb24gbmFtZXMuIEJ1dCBJIHJlYWxseSBwcmVmZXIga2VlcGluZyB0aGUgOiBpZgo+
ID4gPiB0aGUgY29kZSBpcyBzdGlsbCByZWFkYWJsZS4KPiA+ID4gCj4gPiA+IEl0IGlzIG11Y2gg
ZWFzaWVyIHRvIGV4cGxhaW4gdG8gcGVvcGxlIDogImlmIHlvdSBoYXZlIGEgOiBpbiB0aGUgbmFt
ZSwKPiA+ID4gZW5jbG9zZSBpdCB3aXRoIFtdIi4gICAgCj4gPiAKPiA+IFNvcnJ5IHRvIGNoaW1l
IGluIHNvIGxhdGUgaW4gdGhlIGRpc2N1c3Npb24sIGJ1dCBJIHdvbmRlciBpZiBhbnkgb2YKPiA+
IHRoYXQgaXMgbmVjZXNzYXJ5LiBDYW4ndCB3ZSBqdXN0IHNwbGl0IHRoZSBzdHJpbmcgcGVyIGRl
dmljZSAoc3BsaXQKPiA+IHN0cmluZ3MgZXZlcnkgdGltZSB3ZSBzZWUgYSAnOycpLCBhbmQgdGhl
biBmaW5kIHRoZSBsYXN0ICc6JyBpbiBlYWNoIG9mCj4gPiB0aG9zZSBzdHJpbmdzIGFuZCBjb25z
aWRlciBldmVyeXRoaW5nIGJlZm9yZSB0aGF0IGxhc3QgJzonIHRvIGJlIHRoZSBNVEQKPiA+IG5h
bWUuIFRoYXQgc2hvdWxkIHdvcmsgZXZlbiBpZiB0aGUgTVREIG5hbWUgY29udGFpbnMgb25lIG9y
IG1vcmUgJzonLgo+ID4gCj4gPiBEb24ndCBnZXQgbWUgd3JvbmcsIEknbSBwZXJmZWN0bHkgZmlu
ZSB3aXRoIGludGVsIGVuY2xvc2luZyB0aGUgUENJCj4gPiBhZGRyZXNzIGluIFtdIHRvIG1ha2Ug
aXQgY2xlYXJlciwgYnV0IEkgc2VlIHRoYXQgb3RoZXIgZHJpdmVycyB1c2UgJzonCj4gPiBpbiB0
aGVpciBNVEQgZGV2aWNlIG5hbWVzICh0aGUgYXRtZWwgcmF3IE5BTkQgY29udHJvbGxlciBkcml2
ZXIgdG8gbmFtZQo+ID4gb25lKSwgc28gSSB0aGluayBpdCdkIGJlIGdvb2QgdG8gbWFrZSB0aGUg
bXRkIHBhcnQgcGFyc2luZyByb2J1c3QgdG8KPiA+IHRoaXMgdXNlIGNhc2UuICAKPiAKPiBJIGp1
c3QgZ2F2ZSBpdCBhIHRyeSBhbmQgdGhlIGZvbGxvd2luZyBwYXRjaCBzaG91bGQgc29sdmUgdGhl
IHByb2JsZW0KPiAob25seSBjb21waWxlLXRlc3RlZCkuIEFzIEkgc2FpZCBwcmV2aW91c2x5LCBp
dCBkb2Vzbid0IHByZXZlbnQgeW91IGZyb20KPiBlbmNsb3NpbmcgdGhlIFBDSSBhZGRyZXNzIGlu
IFtdIGlmIHlvdSB0aGluayBpdCdzIGNsZWFyZXIsIGJ1dCBJIHRoaW5rCj4gdGhlIHByb2JsZW0g
c2hvdWxkIGJlIGFkZHJlc3NlZCBpbiB0aGUgY21kbGluZSBwYXJzZXIgYW55d2F5Lgo+IAo+IC0t
LT44LS0tICAKPiBGcm9tIDA4YjMwNTk3ZGQ3M2VmZDljNGM4ZDE5MDZhYjAyYTk1NDA4NzU0MTkg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBEYXRlOiBNb24sIDI3IEFwciAyMDIwIDExOjQ0OjUw
ICswMjAwCj4gU3ViamVjdDogW1BBVENIXSBtdGQ6IHBhcnNlcjogY21kbGluZTogU3VwcG9ydCBN
VEQgbmFtZXMgY29udGFpbmluZyBvbmUgb3IKPiAgbW9yZSBjb2xvbnMKPiAKPiBMb29rcyBsaWtl
IHNvbWUgZHJpdmVycyBkZWZpbmUgTVREIG5hbWVzIHdpdGggYSBjb2xvbiBpbiBpdCwgdGh1cwo+
IG1ha2luZyBtdGRwYXJ0PSBwYXJzaW5nIGltcG9zc2libGUuIExldCdzIGZpeCB0aGUgcGFyc2Vy
IHRvIGdyYWNlZnVsbHkKPiBoYW5kbGUgdGhhdCBjYXNlOiB0aGUgbGFzdCAnOicgaW4gYSBwYXJ0
aXRpb24gZGVmaW5pdGlvbiBzZXF1ZW5jZSBpcwo+IGNvbnNpZGVyZWQgaW5zdGVhZCBvZiB0aGUg
Zmlyc3Qgb25lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJl
emlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3BhcnNlcnMvY21kbGlu
ZXBhcnQuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0LmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2NtZGxpbmVw
YXJ0LmMKPiBpbmRleCBjODZmMmRiOGM4ODIuLjA2MjViMjU2MjBjYSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0LmMKPiArKysgYi9kcml2ZXJzL210ZC9wYXJz
ZXJzL2NtZGxpbmVwYXJ0LmMKPiBAQCAtMjE4LDEyICsyMTgsMjkgQEAgc3RhdGljIGludCBtdGRw
YXJ0X3NldHVwX3JlYWwoY2hhciAqcykKPiAgCQlzdHJ1Y3QgY21kbGluZV9tdGRfcGFydGl0aW9u
ICp0aGlzX210ZDsKPiAgCQlzdHJ1Y3QgbXRkX3BhcnRpdGlvbiAqcGFydHM7Cj4gIAkJaW50IG10
ZF9pZF9sZW4sIG51bV9wYXJ0czsKPiAtCQljaGFyICpwLCAqbXRkX2lkOwo+ICsJCWNoYXIgKnAs
ICptdGRfaWQsICpzZW1pY29sOwo+ICsKPiArCQkvKgo+ICsJCSAqIFJlcGxhY2UgdGhlIGZpcnN0
ICc7JyBieSBhIE5VTEwgY2hhciBzbyBzdHJyY2hyIGNhbiB3b3JrCj4gKwkJICogcHJvcGVybHku
Cj4gKwkJICovCj4gKwkJc2VtaWNvbCA9IHN0cmNocihzLCAnOycpOwo+ICsJCWlmIChzZW1pY29s
KQo+ICsJCQkqc2VtaWNvbCA9ICdcMCc7Cj4gIAo+ICAJCW10ZF9pZCA9IHM7Cj4gIAo+IC0JCS8q
IGZldGNoIDxtdGQtaWQ+ICovCj4gLQkJcCA9IHN0cmNocihzLCAnOicpOwo+ICsJCS8qCj4gKwkJ
ICogZmV0Y2ggPG10ZC1pZD4uIFdlIHVzZSBzdHJyY2hyIHRvIGlnbm9yZSBhbGwgJzonIHRoYXQg
Y291bGQKPiArCQkgKiBiZSBwcmVzZW50IGluIHRoZSBNVEQgbmFtZSwgb25seSB0aGUgbGFzdCBv
bmUgaXMgaW50ZXJwcmV0ZWQKPiArCQkgKiBhcyBhbiA8bXRkLWlkPi88cGFydC1kZWZpbml0aW9u
PiBzZXBhcmF0b3IuCj4gKwkJICovCj4gKwkJcCA9IHN0cnJjaHIocywgJzonKTsKPiArCj4gKwkJ
LyogUmVzdG9yZSB0aGUgJzsnIG5vdy4gKi8KPiArCQlpZiAoc2VtaWNvbCkKPiArCQkJKnNlbWlj
b2wgPSAnOyc7Cj4gKwo+ICAJCWlmICghcCkgewo+ICAJCQlwcl9lcnIoIm5vIG10ZC1pZFxuIik7
Cj4gIAkJCXJldHVybiAtRUlOVkFMOwoKVGhpcyBpcyBhbHNvIHRoZSBhcHByb2FjaCBJIGxpa2Ug
dGhlIG1vc3QuIEl0IGF2b2lkcyBtb2RpZnlpbmcgdGhlCnN5bnRheCBvbiB0aGUgY21kbGluZSAo
bm8gY2hhbmdlIGluIEJvb3Rsb2FkZXJzIG5lZWRlZCkgYW5kIHdlIGRvbid0CmhhdmUgdG8gY2hh
bmdlIHRoZSBwYXJzZXIgb2YgYSBkcml2ZXIgZXZlcnkgdGltZSBhIGNvbG9uIGlzIGluIHRoZQpu
YW1lLgoKSSB3b3VsZCBsaWtlIHRvIGRyb3AgIm10ZDogcGFyc2Vyczogc3VwcG9ydCAnW10nIGZp
ciB1ZCB1YiBtdGRwYXJ0cyIgYXMKd2VsbGUgYXMgIm10ZDogc3BpLW5vcjogY29udHJvbGxlcnM6
IGludGVsLXNwaTogQWRkIHN1cHBvcnQgZm9yIGNvbW1hbmQKbGluZSBwYXJ0aXRpb25zIiwgd2hh
dCBkbyB5b3UgdGhpbms/CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
