Return-Path: <SRS0=kzX/=OM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1C6C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Sep 2021 08:32:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67EA561168
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Sep 2021 08:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67EA561168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1fOCwlfjh5VlPzU6Dr9yx0I7LUzrXSkKtrNafZLQ7M=; b=A66D8DHRNrdB3o
	Q3FRWXE2+mx/vmSTdjEaQlNohHog+jDxeWsvYXqEEirBLtkRFZ5EVlUfLAnYYgSBn3cUZBJB00ey5
	EORiJOMUiShGZSc4MFMbH88aZgnJ8btYyu1sWW3NuFMJymrgYZC9oo1S1vcT70pJDOuhAkgaCHYE0
	5vvR7ndLr7tDU5a2SYHa1JJ8O6J4GtDHvcIawCxNmNkcUXmW04/15EuCW+Fdt5abdqRdAZZ7bP4eO
	Hf8pvtaTfEiB/0AXWrVxmvVLpQnOoHKftEvc9jAoN89OD7JhCaFU7UOEmy2Q+qrOU4GbQ1LWtvmSQ
	7tfT82pzTHlEzjqx5Jmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSxfB-007TsO-CO; Wed, 22 Sep 2021 08:31:33 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSxf5-007TrP-HE
 for linux-mtd@lists.infradead.org; Wed, 22 Sep 2021 08:31:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E243EC0004;
 Wed, 22 Sep 2021 08:31:21 +0000 (UTC)
Date: Wed, 22 Sep 2021 10:31:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Apurva Nandan <a-nandan@ti.com>, Serge Semin <fancer.lancer@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, MTD Maling List
 <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-spi
 <linux-spi@vger.kernel.org>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nand: Convert to DT schema
 format
Message-ID: <20210922103121.28d489ef@xps13>
In-Reply-To: <CAL_Jsq+sg7f4pJGBhU48a4=uR7cYQmXsoSjbrktovV94m3+qFw@mail.gmail.com>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-2-a-nandan@ti.com>
 <20210920150651.vvdhennblwhdi3jw@mobilestation>
 <YUj6RUNYDoWA30Ln@robh.at.kernel.org>
 <3c03fcdd-b015-8fda-eadc-e1b6d24ba88d@ti.com>
 <CAL_Jsq+sg7f4pJGBhU48a4=uR7cYQmXsoSjbrktovV94m3+qFw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_013127_892167_EFF69882 
X-CRM114-Status: GOOD (  42.54  )
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

SGVsbG8gUm9iLCBNYXJrLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFR1ZSwgMjEgU2VwIDIw
MjEgMTQ6MTY6MDIgLTA1MDA6Cgo+IE9uIFR1ZSwgU2VwIDIxLCAyMDIxIGF0IDg6NDMgQU0gQXB1
cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBSb2IsCj4gPgo+
ID4gT24gMjEvMDkvMjEgMjo0NiBhbSwgUm9iIEhlcnJpbmcgd3JvdGU6ICAKPiA+ID4gT24gTW9u
LCBTZXAgMjAsIDIwMjEgYXQgMDY6MDY6NTFQTSArMDMwMCwgU2VyZ2UgU2VtaW4gd3JvdGU6ICAK
PiA+ID4+IEhlbGxvIEFwdXJ2YQo+ID4gPj4KPiA+ID4+IE9uIE1vbiwgU2VwIDIwLCAyMDIxIGF0
IDA3OjU3OjEyUE0gKzA1MzAsIEFwdXJ2YSBOYW5kYW4gd3JvdGU6ICAKPiA+ID4+PiBDb252ZXJ0
IHNwaS1uYW5kLnR4dCBiaW5kaW5nIHRvIFlBTUwgZm9ybWF0IHdpdGggYW4gYWRkZWQgZXhhbXBs
ZS4KPiA+ID4+Pgo+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFu
QHRpLmNvbT4KPiA+ID4+PiAtLS0KPiA+ID4+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9zcGktbmFuZC50eHQgICAgICB8ICA1IC0tCj4gPiA+Pj4gICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvc3BpLW5hbmQueWFtbCAgICAgfCA2MiArKysrKysrKysrKysrKysrKysrCj4gPiA+
Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
PiA+Pj4gICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9zcGktbmFuZC50eHQKPiA+ID4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwaS1uYW5kLnlhbWwgIAo+ID4gPj4gVGhh
bmtzIGZvciB0aGUgYmluZGluZ3MgY29udmVyc2lvbiBwYXRjaC4gVGhlcmUgYXJlIHNldmVyYWwg
Y29tbWVudHMKPiA+ID4+IGJlbG93LiBCdXQgYmVmb3JlIGFkZHJlc3NpbmcgdGhlbSBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gYWxzbyBnZXQgYQo+ID4gPj4gcmVzcG9uc2UgZnJvbSBSb2IuCj4gPiA+
PiAgCj4gPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvc3BpLW5hbmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9zcGktbmFuZC50eHQKPiA+ID4+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4+PiBp
bmRleCA4YjUxZjNiNmQ1NWMuLjAwMDAwMDAwMDAwMAo+ID4gPj4+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BpLW5hbmQudHh0Cj4gPiA+Pj4gKysrIC9kZXYv
bnVsbAo+ID4gPj4+IEBAIC0xLDUgKzAsMCBAQAo+ID4gPj4+IC1TUEkgTkFORCBmbGFzaAo+ID4g
Pj4+IC0KPiA+ID4+PiAtUmVxdWlyZWQgcHJvcGVydGllczoKPiA+ID4+PiAtLSBjb21wYXRpYmxl
OiBzaG91bGQgYmUgInNwaS1uYW5kIgo+ID4gPj4+IC0tIHJlZzogc2hvdWxkIGVuY29kZSB0aGUg
Y2hpcC1zZWxlY3QgbGluZSB1c2VkIHRvIGFjY2VzcyB0aGUgTkFORCBjaGlwCj4gPiA+Pj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BpLW5hbmQu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BpLW5hbmQueWFt
bAo+ID4gPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+Pj4gaW5kZXggMDAwMDAwMDAwMDAw
Li42MDFiZWJhOGQ5NzEKPiA+ID4+PiAtLS0gL2Rldi9udWxsCj4gPiA+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFuZC55YW1sCj4gPiA+Pj4gQEAg
LTAsMCArMSw2MiBAQAo+ID4gPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MCBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+Pj4gKyVZQU1MIDEuMgo+ID4gPj4+ICstLS0KPiA+ID4+
PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvc3BpLW5hbmQueWFtbCMK
PiA+ID4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCj4gPiA+Pj4gKwo+ID4gPj4+ICt0aXRsZTogU1BJIE5BTkQgZmxhc2gKPiA+ID4+PiAr
Cj4gPiA+Pj4gK21haW50YWluZXJzOgo+ID4gPj4+ICsgIC0gQXB1cnZhIE5hbmRhbiA8YS1uYW5k
YW5AdGkuY29tPgo+ID4gPj4+ICsKPiA+ID4+PiArYWxsT2Y6Cj4gPiA+Pj4gKyAgLSAkcmVmOiAi
bXRkLnlhbWwjIgo+ID4gPj4+ICsKPiA+ID4+PiArcHJvcGVydGllczoKPiA+ID4+PiArICBjb21w
YXRpYmxlOgo+ID4gPj4+ICsgICAgY29uc3Q6IHNwaS1uYW5kCj4gPiA+Pj4gKwo+ID4gPj4+ICsg
IHJlZzoKPiA+ID4+PiArICAgIG1heEl0ZW1zOiAxCj4gPiA+Pj4gKwo+ID4gPj4+ICsgIHNwaS1t
YXgtZnJlcXVlbmN5OiB0cnVlCj4gPiA+Pj4gKyAgc3BpLXJ4LWJ1cy13aWR0aDogdHJ1ZQo+ID4g
Pj4+ICsgIHNwaS10eC1idXMtd2lkdGg6IHRydWUKPiA+ID4+PiArICByeC1zYW1wbGUtZGVsYXkt
bnM6IHRydWUgIAo+ID4gPj4gU2luY2UgaXQncyBhbiBTUEktY2xpZW50IGRldmljZSB0aGVyZSBh
cmUgbW9yZSB0aGFuIHRoZXNlIHByb3BlcnRpZXMKPiA+ID4+IGNvdWxkIGJlIHNldCBmb3IgaXQu
IFNlZSB0aGUgU1BJLWNvbnRyb2xsZXIgYmluZGluZ3Mgc2NoZW1hOgo+ID4gPj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sCj4gPiA+PiBT
byB0aGVyZSBpcyB0d28gcG9zc2libGUgd2F5cyB0byBtYWtlIGl0IG1vcmUgZ2VuZXJpYzoKPiA+
ID4+IDEpIERldGFjaCB0aGUgc3BpLWNsaWVudCBwYXJ0IGZyb20gdGhlIHNwaS1jb250cm9sbGVy
LnlhbWwgYmluZGluZ3MKPiA+ID4+IGludG8gYSBkZWRpY2F0ZWQgRFQtc2NoZW1hIGZpbGUgYW5k
IHJlZmVyIHRvIHRoYXQgbmV3IHNjaGVtZSBmcm9tCj4gPiA+PiBoZXJlLiAgCj4gPiA+IFllcywg
YXMgbWVudGlvbmVkIHRoZXJlJ3MgcGF0Y2hlcyBkb2luZyB0aGlzLiBCdXQgdGhlIGFib3ZlIGlz
IGZpbmUuCj4gPiA+IFRoZXJlJ3Mgc29tZSB2YWx1ZSBpbiBkZWZpbmluZyBoZXJlIHdoaWNoIHBy
b3BlcnRpZXMgYXJlIHZhbGlkLiAgCj4gPiBZZWFoIHJpZ2h0ICAKPiA+ID4+IDIpIEZvcmdldCBh
Ym91dCB0aGVzZSBjb250cm9sbGVyLXNwZWNpZmljIHByb3BlcnRpZXMgYW5kIGxldCB0aGUKPiA+
ID4+IHBhcmVudGFsIFNQSS1jb250cm9sbGVyIGJpbmRpbmdzIHBhcnNpbmcgdGhlbS4gT2YgY291
cnNlIHRoZXJlIG11c3QgYmUKPiA+ID4+IGF0IGxlYXN0IG9uZSBvZiB0aGUgbmV4dCBwcm9wZXJ0
aWVzIGRlY2xhcmVkIGZvciBpdCB0byB3b3JrOgo+ID4gPj4ge3VuZXZhbHVhdGVkUHJvcGVydGll
cywgYWRkaXRpb25hbFByb3BlcnRpZXN9Lgo+ID4gPj4KPiA+ID4+IEl0J3MgdXAgdG8gUm9iIHRv
IGRlY2lkZWQgd2hpY2ggYXBwcm9hY2ggaXMgYmV0dGVyIHRob3VnaC4uLgo+ID4gPj4gIAo+ID4g
Pj4+ICsKPiA+ID4+PiArICAnI2FkZHJlc3MtY2VsbHMnOiB0cnVlCj4gPiA+Pj4gKyAgJyNzaXpl
LWNlbGxzJzogdHJ1ZSAgCj4gPiA+PiBBcmVuJ3QgdGhleSBhbHdheXMgZXF1YWwgdG8gMT8gIAo+
ID4gPiBObyBTUEkgbmFuZCBkZXZpY2VzID40R0I/ICAKPiA+IFllYWgsIHdlIGhhdmUgU1BJIE5B
TkRzID40R0IsIGFuZCAiJyNhZGRyZXNzLWNlbGxzJzogdHJ1ZSIgYWxsb3dzIHRob3NlCj4gPiBz
aXplcy4gIAo+ID4gPiAgCj4gPiA+Pj4gKwo+ID4gPj4+ICthZGRpdGlvbmFsUHJvcGVydGllczoK
PiA+ID4+PiArICB0eXBlOiBvYmplY3QgIAo+ID4gPj4gSSdkIHN1Z2dlc3QgdG8gZWxhYm9yYXRl
IHRoZSB3YXkgdGhlIHBhcnRpdGlvbiBzdWItbm9kZXMgbG9va3MKPiA+ID4+IGxpa2UsIGZvciBp
bnN0YW5jZSwgdGhlIG5vZGUgbmFtZXMsIHN1cHBvcnRlZCBjb21wYXRpYmxlIG5hbWVzLAo+ID4g
Pj4gbGFiZWxzLCBldGMuICAKPiA+ID4gVGhhdCBzaG91bGQgcHJvYmFibHkgYWxsIGJlIGluIG10
ZC55YW1sLiBUaGUgcXVlc3Rpb24gaGVyZSBpcyB3aGV0aGVyCj4gPiA+IHBhcnRpdGlvbnMgYXJl
IGFsd2F5cyB1bmRlciBhICdwYXJ0aXRpb25zJyBub2RlLiBNYXliZSB0aGlzIGlzIG5ldwo+ID4g
PiBlbm91Z2ggdGhhdCBvbmx5IHRoZSBuZXcgd2F5IGhhcyB0byBiZSBzdXBwb3J0ZWQuIFRob3Vn
aCBpZiBtdGQueWFtbAo+ID4gPiBzdXBwb3J0ZWQgYm90aCBmb3JtcywgYWxsb3dpbmcgYm90aCBh
bGwgdGhlIHRpbWUgaXMgb2theSBJTU8uCj4gPiA+Cj4gPiA+IFJvYiAgCj4gPgo+ID4gSSBoYWQg
YWRkZWQgdGhlICJwYXJ0aXRpb24iIG5vZGUgcHJvcGVydGllcyBpbiB0aGUgdjEgcGF0Y2gsIGJ1
dCBhcyBwZXIKPiA+IHRoZSByZXZpZXdzIEkgcmVtb3ZlZCBpdC4KPiA+IEkgdGhpbmsgd2UgY2Fu
IHByZWZlciBoYXZpbmcgdGhlbSBpbiBtdGQueWFtbCBpZiBuZWVkZWQsIGluIGEgc2VwYXJhdGUK
PiA+IHBhdGNoIHNlcmllcy4KPiA+IERvIHlvdSBwcmVmZXIgdGhlIG10ZC55YW1sIGNoYW5nZXMg
YXMgYSBwYXJ0IG9mIHRoaXMgc2VyaWVzIG9yIGFzIGEKPiA+IHNlcGFyYXRlIHBhdGNoPwo+ID4K
PiA+IE90aGVyIHRoYW4gdGhhdCwgSSBkb24ndCBmaW5kIGFueSBuZWVkIGZvciBhIHYzIHBhdGNo
IHJlLXJvbGwsIGRvIHlvdSBhZ3JlZT8gIAo+IAo+IFllYWgsIEkgc3VwcG9zZSBub3QuCj4gCj4g
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gCj4gQW5kIGFjdHVh
bGx5LCBpdCdzIE1pcXVlbCB0aGF0IHNob3VsZCBhcHBseSB0aGVzZSAyIHJhdGhlciB0aGFuIE1h
cmsuCgpZZWFoLCBidXQgdGhhdCdzIGZpbmUgZm9yIHRoaXMgb25lLCBJIGRvbid0IGV4cGVjdCBj
b25mbGljdHMgYW55d2F5LgoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
