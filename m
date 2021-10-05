Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23138C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 10:23:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD65861505
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 10:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD65861505
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GJpUzn3/wly/0zucbhk1qsJjk1uoSa5V2mYmdFbNlg=; b=K8NhS8p9Kiodo9
	mpiT8jVXGyp/YmNwB8VXvXDPwpK04zD0+Lxz+5Yn3X9aokNndIdnnSPRGs6b8hzKoBWS7QxT8HCtp
	oDd/T8mw2fjjBRUOeS0fAtFmZCI8r/8GT7rDzqOp+TYQ1Ld3Lw56q2YwfADnZNg1RUArUzN3IM3Np
	+65XV+VYdkK1M1tbfYdxc6xhVPrUvz7ya/3ykoB4DIuWzPHEYcJxB8OzJRbldHHnymeTCeq532BK7
	wp9zgYf63eeYaB+IxEr34SQ5k6+/3/VBLye5eNXEyum6mf1XK3wbUUijgv3nYKd3YOcnXW267Krv7
	5dreVqacX+zRDYiJ0XAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXhb0-009yo5-M8; Tue, 05 Oct 2021 10:22:50 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXhao-009ymW-7B
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 10:22:39 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mXhac-00027b-W0; Tue, 05 Oct 2021 12:22:26 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mXhab-0006B5-TG; Tue, 05 Oct 2021 12:22:25 +0200
Message-ID: <6993ccdaf8f3f248f4ff1c739445e0f798ee0efa.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] reset: socfpga: add empty driver allowing consumers
 to probe
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Pawe=C5=82?= Anikiel <pan@semihalf.com>, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org,  arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tomasz
 Nowicki <tn@semihalf.com>, Konrad Adamczyk <ka@semihalf.com>, Jacek
 Majkowski <jam@semihalf.com>
Date: Tue, 05 Oct 2021 12:22:25 +0200
In-Reply-To: <CAF9_jYQVpG8imn3zjAGKeZqZqDPtWRYWLQjNSXi2SXjjzAKvfA@mail.gmail.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
 <20210920124141.1166544-4-pan@semihalf.com>
 <ce254cc123f2809976c2f2404941a9074c458309.camel@pengutronix.de>
 <CAF9_jYQVpG8imn3zjAGKeZqZqDPtWRYWLQjNSXi2SXjjzAKvfA@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_032238_291480_638F38D7 
X-CRM114-Status: GOOD (  29.39  )
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

T24gVHVlLCAyMDIxLTEwLTA1IGF0IDEzOjEyICswMjAwLCBQYXdlxYIgQW5pa2llbCB3cm90ZToK
PiBPbiBUdWUsIE9jdCA1LCAyMDIxIGF0IDExOjM0IEFNIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gSGkgUGF3ZcWCLAo+ID4gCj4gPiBPbiBNb24sIDIw
MjEtMDktMjAgYXQgMTQ6NDEgKzAyMDAsIFBhd2XFgiBBbmlraWVsIHdyb3RlOgo+ID4gPiBUaGUg
ZWFybHkgcmVzZXQgZHJpdmVyIGRvZXNuJ3QgZXZlciBwcm9iZSwgd2hpY2ggY2F1c2VzIGNvbnN1
bWluZwo+ID4gPiBkZXZpY2VzIHRvIGJlIHVuYWJsZSB0byBwcm9iZS4gQWRkIGFuIGVtcHR5IGRy
aXZlciB0byBzZXQgdGhpcyBkZXZpY2UKPiA+ID4gYXMgYXZhaWxhYmxlLCBhbGxvd2luZyBjb25z
dW1lcnMgdG8gcHJvYmUuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgQW5pa2ll
bCA8cGFuQHNlbWloYWxmLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3Jlc2V0L3Jlc2V0
LXNvY2ZwZ2EuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcmVzZXQvcmVzZXQtc29jZnBnYS5jIGIvZHJpdmVycy9yZXNldC9yZXNldC1zb2NmcGdhLmMK
PiA+ID4gaW5kZXggMmE3MmY4NjFmNzk4Li44YzY0OTJlNTY5M2MgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2RyaXZlcnMvcmVzZXQvcmVzZXQtc29jZnBnYS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvcmVzZXQv
cmVzZXQtc29jZnBnYS5jCj4gPiA+IEBAIC05MiwzICs5MiwyOSBAQCB2b2lkIF9faW5pdCBzb2Nm
cGdhX3Jlc2V0X2luaXQodm9pZCkKPiA+ID4gICAgICAgZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZShu
cCwgc29jZnBnYV9lYXJseV9yZXNldF9kdF9pZHMpCj4gPiA+ICAgICAgICAgICAgICAgYTEwX3Jl
c2V0X2luaXQobnApOwo+ID4gPiAgfQo+ID4gPiArCj4gPiA+ICsvKgo+ID4gPiArICogVGhlIGVh
cmx5IGRyaXZlciBpcyBwcm9ibGVtYXRpYywgYmVjYXVzZSBpdCBkb2Vzbid0IHJlZ2lzdGVyCj4g
PiA+ICsgKiBpdHNlbGYgYXMgYSBkcml2ZXIuIFRoaXMgY2F1c2VzIGNlcnRhaW4gZGV2aWNlIGxp
bmtzIHRvIHByZXZlbnQKPiA+ID4gKyAqIGNvbnN1bWVyIGRldmljZXMgZnJvbSBwcm9iaW5nLiBU
aGUgaGFja3kgc29sdXRpb24gaXMgdG8gcmVnaXN0ZXIKPiA+ID4gKyAqIGFuIGVtcHR5IGRyaXZl
ciwgd2hvc2Ugb25seSBqb2IgaXMgdG8gYXR0YWNoIGl0c2VsZiB0byB0aGUgcmVzZXQKPiA+ID4g
KyAqIG1hbmFnZXIgYW5kIGNhbGwgcHJvYmUuCj4gPiA+ICsgKi8KPiA+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNvY2ZwZ2FfcmVzZXRfZHRfaWRzW10gPSB7Cj4gPiA+ICsg
ICAgIHsgLmNvbXBhdGlibGUgPSAiYWx0cixyc3QtbWdyIiwgfSwKPiA+ID4gKyAgICAgeyAvKiBz
ZW50aW5lbCAqLyB9LAo+ID4gPiArfTsKPiA+ID4gKwo+ID4gPiArc3RhdGljIGludCByZXNldF9z
aW1wbGVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ID4gK3sKPiA+ID4g
KyAgICAgcmV0dXJuIDA7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIHJlc2V0X3NvY2ZwZ2FfZHJpdmVyID0gewo+ID4gPiArICAgICAucHJvYmUg
ID0gcmVzZXRfc2ltcGxlX3Byb2JlLAo+ID4gPiArICAgICAuZHJpdmVyID0gewo+ID4gPiArICAg
ICAgICAgICAgIC5uYW1lICAgICAgICAgICA9ICJzb2NmcGdhLXJlc2V0IiwKPiA+ID4gKyAgICAg
ICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBzb2NmcGdhX3Jlc2V0X2R0X2lkcywKPiA+ID4gKyAg
ICAgfSwKPiA+ID4gK307Cj4gPiA+ICtidWlsdGluX3BsYXRmb3JtX2RyaXZlcihyZXNldF9zb2Nm
cGdhX2RyaXZlcik7Cj4gPiAKPiA+IElmIHdlIGNhbiBqdXN0IGxldCBkZXZsaW5rIGRlbGF5IGFs
bCBjb25zdW1lcnMgdW50aWwgdGhlIGVtcHR5IGRyaXZlciBpcwo+ID4gcHJvYmVkLCBkb2VzIHRo
ZSByZXNldCBjb250cm9sbGVyIGhhdmUgdG8gYmUgcmVnaXN0ZXJlZCBlYXJseSBhdCBhbGw/Cj4g
PiAKPiA+IHJlZ2FyZHMKPiA+IFBoaWxpcHAKPiAKPiBJIGFza2VkIERpbmggaWYgdGhlIHJlc2V0
IGNvbnRyb2xsZXIgY29kZSBuZWVkcyB0byBiZSBjYWxsZWQgZWFybHk6Cj4gCj4gPiBUaGF0J3Mg
Y29ycmVjdC4gSXQncyBmb3Igb25lIG9mIHRoZSBTUCB0aW1lcnMuCgpBaCwgcmlnaHQsIHRob3Nl
IGNhbGwgb2ZfcmVzZXRfY29udHJvbF9nZXQoKSBmcm9tIFRJTUVSX09GX0RFQ0xBUkUoKS4KVGhh
bmsgeW91LCBJJ2xsIGFwcGx5IHRoaXMgdG8gcmVzZXQvZml4ZXMuCgpyZWdhcmRzClBoaWxpcHAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
