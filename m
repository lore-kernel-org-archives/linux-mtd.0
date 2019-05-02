Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE27C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 07:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDE462085A
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 07:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wb4JnnIC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDE462085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sCOt7Z0ypRHulyPPDNyld2g3f3B/XDeHtrav4vJd5k=; b=Wb4JnnICYYLDPv
	GYvPyM7fJ8+MWK8gkcoG7yygfgmvqozVdqArIwt/w86u+UiPNAZfWgdaqYOJrhfLmQb+sjauJubKG
	EXYNMM6uG6VZyukUk87VEyQ3iabdXCre7aI604TbOXdRd0P/Z/ry4KPYfbiryt5ADjrr8Ek9bLK8g
	8NwMHfOAcMbmYCZsFr5Cfmeg2G0x9MgnngU2g2R3hCbb9tsR46mMo+tU7sxi/TG55M5/QqC3T/pJq
	2jTS5YU1jtSNmVJt60TNEHLt1YuOxi1UJbmrVPkdmzJ09q8V1EqL/aamQQQWtGbmYXgBOKnTxa4JR
	/1hGBRlLteUkFCzyu2EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM62A-0006Av-42; Thu, 02 May 2019 07:21:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM626-0006AV-7E
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 07:21:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 86C1527124E;
 Thu,  2 May 2019 08:21:28 +0100 (BST)
Date: Thu, 2 May 2019 09:21:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomasz Figa <tomasz.figa@gmail.com>, computersforpeace@gmail.com,
 marek.vasut@gmail.com, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree
 support
Message-ID: <20190502092126.22f1ace5@collabora.com>
In-Reply-To: <CA+Ln22EJ3G9ez4XZ3ysZBt6thsqDYDtik8fw-gfExR9Y7wFN9A@mail.gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
 <20190502015408.GA11612@bogus>
 <CA+Ln22HLqnbbY37FG6CwjZvZH7G35Z+0kNq7XFU4WtZyk_EqZQ@mail.gmail.com>
 <20190502083632.0ec0fb4e@collabora.com>
 <CA+Ln22H4ua9Zuh4eKaWfHtqh8DieyiS=5s7wS6-TbmA5Dsop4A@mail.gmail.com>
 <20190502085518.5d248167@collabora.com>
 <CA+Ln22EJ3G9ez4XZ3ysZBt6thsqDYDtik8fw-gfExR9Y7wFN9A@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_002130_517026_BFA43EE8 
X-CRM114-Status: GOOD (  37.93  )
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
Cc: Rob Herring <robh@kernel.org>, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, David Woodhouse <dwmw2@infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyIE1heSAyMDE5IDE1OjU4OjI0ICswOTAwClRvbWFzeiBGaWdhIDx0b21hc3ouZmln
YUBnbWFpbC5jb20+IHdyb3RlOgoKPiAyMDE55bm0NeaciDLml6Uo5pyoKSAxNTo1NSBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPjoKPiA+Cj4gPiBPbiBUaHUs
IDIgTWF5IDIwMTkgMTU6NDI6NTkgKzA5MDAKPiA+IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBn
bWFpbC5jb20+IHdyb3RlOgo+ID4gIAo+ID4gPiAyMDE55bm0NeaciDLml6Uo5pyoKSAxNTozNiBC
b3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPjogIAo+ID4gPiA+
Cj4gPiA+ID4gSGkgVG9tYXN6LAo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCAyIE1heSAyMDE5IDE1
OjIzOjMzICswOTAwCj4gPiA+ID4gVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPiA+ID4gIAo+ID4gPiA+ID4gMjAxOeW5tDXmnIgy5pelKOacqCkgMTA6NTQgUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz46ICAKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24g
RnJpLCBBcHIgMjYsIDIwMTkgYXQgMDY6NDI6MjNQTSArMDIwMCwgUGF3ZcWCIENobWllbCB3cm90
ZTogIAo+ID4gPiA+ID4gPiA+IEZyb206IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5j
b20+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgZHQtYmluZGlu
Z3MgZm9yIFNhbXN1bmcgT25lTkFORCBkcml2ZXIuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPgo+ID4g
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhd2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2ht
aWVsQGdtYWlsLmNvbT4KPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiAgLi4uL2JpbmRp
bmdzL210ZC9zYW1zdW5nLW9uZW5hbmQudHh0ICAgICAgICAgIHwgNDYgKysrKysrKysrKysrKysr
KysrKwo+ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+ID4g
PiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9zYW1zdW5nLW9uZW5hbmQudHh0Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zYW1z
dW5nLW9uZW5hbmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9z
YW1zdW5nLW9uZW5hbmQudHh0Cj4gPiA+ID4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
ID4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjM0MWQ5N2NjMTUxMwo+ID4gPiA+ID4gPiA+
IC0tLSAvZGV2L251bGwKPiA+ID4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQKPiA+ID4gPiA+ID4gPiBAQCAtMCww
ICsxLDQ2IEBACj4gPiA+ID4gPiA+ID4gK0RldmljZSB0cmVlIGJpbmRpbmdzIGZvciBTYW1zdW5n
IFNvQyBPbmVOQU5EIGNvbnRyb2xsZXIKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gK1Jl
cXVpcmVkIHByb3BlcnRpZXM6Cj4gPiA+ID4gPiA+ID4gKyAtIGNvbXBhdGlibGUgOiB2YWx1ZSBz
aG91bGQgYmUgZWl0aGVyIG9mIHRoZSBmb2xsb3dpbmcuCj4gPiA+ID4gPiA+ID4gKyAgIChhKSAi
c2Ftc3VuZyxzM2M2NDAwLW9uZW5hbmQiIC0gZm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRp
YmxlIHdpdGgKPiA+ID4gPiA+ID4gPiArICAgICAgIFMzQzY0MDAgU29DLAo+ID4gPiA+ID4gPiA+
ICsgICAoYikgInNhbXN1bmcsczNjNjQxMC1vbmVuYW5kIiAtIGZvciBvbmVuYW5kIGNvbnRyb2xs
ZXIgY29tcGF0aWJsZSB3aXRoCj4gPiA+ID4gPiA+ID4gKyAgICAgICBTM0M2NDEwIFNvQywKPiA+
ID4gPiA+ID4gPiArICAgKGMpICJzYW1zdW5nLHM1cGMxMDAtb25lbmFuZCIgLSBmb3Igb25lbmFu
ZCBjb250cm9sbGVyIGNvbXBhdGlibGUgd2l0aAo+ID4gPiA+ID4gPiA+ICsgICAgICAgUzVQQzEw
MCBTb0MsCj4gPiA+ID4gPiA+ID4gKyAgIChkKSAic2Ftc3VuZyxzNXB2MjEwLW9uZW5hbmQiIC0g
Zm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gPiA+ID4gPiArICAg
ICAgIFM1UEMxMTAvUzVQVjIxMCBTb0NzLgo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiAr
IC0gcmVnIDogdHdvIG1lbW9yeSBtYXBwZWQgcmVnaXN0ZXIgcmVnaW9uczoKPiA+ID4gPiA+ID4g
PiArICAgLSBmaXJzdCBlbnRyeTogY29udHJvbCByZWdpc3RlcnMuCj4gPiA+ID4gPiA+ID4gKyAg
IC0gc2Vjb25kIGFuZCBuZXh0IGVudHJpZXM6IG1lbW9yeSB3aW5kb3dzIG9mIHBhcnRpY3VsYXIg
T25lTkFORCBjaGlwczsKPiA+ID4gPiA+ID4gPiArICAgICBmb3IgdmFyaWFudHMgYSksIGIpIGFu
ZCBjKSBvbmx5IG9uZSBpcyBhbGxvd2VkLCBpbiBjYXNlIG9mIGQpIHVwIHRvCj4gPiA+ID4gPiA+
ID4gKyAgICAgdHdvIGNoaXBzIGNhbiBiZSBzdXBwb3J0ZWQuCj4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ICsgLSBpbnRlcnJ1cHQtcGFyZW50IDogcGhhbmRsZSBvZiBpbnRlcnJ1cHQgY29u
dHJvbGxlciB0byB3aGljaCB0aGUgT25lTkFORAo+ID4gPiA+ID4gPiA+ICsgICBjb250cm9sbGVy
IGlzIHdpcmVkLCAgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoaXMgaXMgaW1wbGllZCBhbmQg
Y2FuIGJlIHJlbW92ZWQuCj4gPiA+ID4gPiA+ICAKPiA+ID4gPiA+ID4gPiArIC0gaW50ZXJydXB0
cyA6IHNwZWNpZmllciBvZiBpbnRlcnJ1cHQgc2lnbmFsIHRvIHdoaWNoIHRoZSBPbmVOQU5EIGNv
bnRyb2xsZXIKPiA+ID4gPiA+ID4gPiArICAgaXMgd2lyZWQ7IHNob3VsZCBjb250YWluIGp1c3Qg
b25lIGVudHJ5Lgo+ID4gPiA+ID4gPiA+ICsgLSBjbG9jay1uYW1lcyA6IHNob3VsZCBjb250YWlu
IHR3byBlbnRyaWVzOgo+ID4gPiA+ID4gPiA+ICsgICAtICJidXMiIC0gYnVzIGNsb2NrIG9mIHRo
ZSBjb250cm9sbGVyLAo+ID4gPiA+ID4gPiA+ICsgICAtICJvbmVuYW5kIiAtIGNsb2NrIHN1cHBs
aWVkIHRvIE9uZU5BTkQgbWVtb3J5LiAgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IElmIHRoZSBj
bG9jayBqdXN0IGdvZXMgdG8gdGhlIE9uZU5BTkQgZGV2aWNlLCB0aGVuIGl0IHNob3VsZCBiZSBp
biB0aGUKPiA+ID4gPiA+ID4gbmFuZCBkZXZpY2Ugbm9kZSByYXRoZXIgdGhhbiB0aGUgY29udHJv
bGxlciBub2RlLgo+ID4gPiA+ID4gPiAgCj4gPiA+ID4gPgo+ID4gPiA+ID4gKFRyeWluZyBoYXJk
IHRvIHJlY2FsbCB0aGUgZGV0YWlscyBhYm91dCB0aGlzIGhhcmR3YXJlLikKPiA+ID4gPiA+IEFG
QUlSIHRoZSBjbG9jayBnb2VzIHRvIHRoZSBjb250cm9sbGVyIGFuZCB0aGUgY29udHJvbGxlciB0
aGVuIGZlZWRzCj4gPiA+ID4gPiBpdCB0byB0aGUgbWVtb3J5IGNoaXBzLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEFsc28gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgaGF2ZSBhbnkgbmFuZCBkZXZpY2Ug
bm9kZXMgaGVyZSwgc2luY2UKPiA+ID4gPiA+IHRoZSBtZW1vcnkgaXRzZWxmIGlzIG9ubHkgZXhw
b3NlZCB2aWEgdGhlIGNvbnRyb2xsZXIsIHdoaWNoIG9mZmVycwo+ID4gPiA+ID4gdmFyaW91cyBx
dWVyaWVzIHRvIHByb2JlIHRoZSBtZW1vcnkgYXQgcnVudGltZSwgc28gdGhlcmUgaXMgbm8gbmVl
ZCB0bwo+ID4gPiA+ID4gZGVzY3JpYmUgaXQgaW4gRFQuICAKPiA+ID4gPgo+ID4gPiA+IEl0J3Mg
cHJvYmFibHkgdHJ1ZSwgdGhvdWdoIG5vdCBwcm92aWRpbmcgdGhpcyBjb250cm9sbGVyL2Rldmlj
ZQo+ID4gPiA+IHNlcGFyYXRpb24gZm9yIE5BTkQgY29udHJvbGxlci9kZXZpY2VzIGhhcyBwcm92
ZW4gdG8gYmUgYSBtaXN0YWtlIGZvcgo+ID4gPiA+IHJhdyBOQU5EIGNvbnRyb2xsZXJzIChzb21l
IHByb3BzIGFwcGx5IHRvIHRoZSBjb250cm9sbGVycyBhbmQgb3RoZXJzIHRvCj4gPiA+ID4gdGhl
IE5BTkQgZGV2aWNlLCBub3QgdG8gbWVudGlvbiB0aGF0IHNvbWUgY29udHJvbGxlcnMgc3VwcG9y
dAo+ID4gPiA+IGludGVyYWN0aW5nIHdpdGggc2V2ZXJhbCBjaGlwcyksIHNvLCBpZiB0aGF0J3Mg
YSBuZXcgYmluZGluZywgSSdkCj4gPiA+ID4gcmVjb21tZW5kIGhhdmluZyB0aGlzIHNlcGFyYXRp
b24gZXZlbiBpZiBpdCdzIG5vdCBzdHJpY3RseSByZXF1aXJlZC4KPiA+ID4gPiAgCj4gPiA+Cj4g
PiA+IE5vdGUgdGhhdCBPbmVOQU5EIGlzIGEgdG90YWxseSBkaWZmZXJlbnQgdGhpbmcgdGhhbiB0
aGUgdHlwaWNhbCBOQU5ECj4gPiA+IG1lbW9yeSB3aXRoIE5BTkQgaW50ZXJmYWNlLiBPbmVOQU5E
IGNoaXBzIGhhdmUgYSBOT1ItbGlrZSBpbnRlcmZhY2UsCj4gPiA+IHdpdGggaW50ZXJuYWwgY29u
dHJvbGxlciBhbmQgYnVmZmVycyBpbnNpZGUsIHNvIHRlY2huaWNhbGx5IHRoZXkgY2FuCj4gPiA+
IGJlIGV2ZW4gdXNlZCB3aXRob3V0IGFueSBzcGVjaWFsIGNvbnRyb2xsZXIgb24gdGhlIFNvQywg
dmlhIGEgZ2VuZXJpYwo+ID4gPiBwYXJhbGxlbCBob3N0IGludGVyZmFjZSBhbmQgcG9zc2libHkg
c29tZSByZWd1bGFyIERNQSBlbmdpbmUgZm9yIENQVQo+ID4gPiBvZmZsb2FkLiAgCj4gPgo+ID4g
WWVzLCBJIGtub3cgdGhhdC4KPiA+ICAKPiA+ID4KPiA+ID4gVGhlIGNvbnRyb2xsZXIgZGVzaWdu
IG9mIHRoZSBTb0NzIGluIHF1ZXN0aW9uIGZ1cnRoZXIgYWJzdHJhY3RzIHRoZQo+ID4gPiBPbmVO
QU5EJ3MgcHJvZ3JhbW1pbmcgaW50ZXJmYWNlIGludG8gYSBudW1iZXIgb2YgaGlnaCBsZXZlbCBv
cGVyYXRpb25zCj4gPiA+IGFuZCBhdHRlbXB0cyB0byBoaWRlIHRoZSBkZXRhaWxzIG9mIHRoZSB1
bmRlcmx5aW5nIG1lbW9yeSwgc28gSSBkb24ndAo+ID4gPiBzZWUgdGhlIHBvaW50IG9mIGRlc2Ny
aWJpbmcgdGhlIG1lbW9yeSBpbiBEVCBoZXJlLCBpdCB3b3VsZCBhY3R1YWxseQo+ID4gPiBkZWZl
YXQgdGhlIHB1cnBvc2Ugb2YgdGhpcyBjb250cm9sbGVyLiAgCj4gPgo+ID4gSSBkb24ndCBzZWUg
aG93IGhhdmluZyBhIHN1Ym5vZGUgZm9yIHRoZSBOQU5EIGNoaXAgd291bGQgY2hhbmdlCj4gPiBh
bnl0aGluZyBvbiBob3cgdGhlIGNvbnRyb2xsZXIgaW50ZXJhY3RzIHdpdGggdGhlIE5BTkQgZGV2
aWNlLiBNeSBwb2ludAo+ID4gaXMsIGlmIHdlIGV2ZXIgbmVlZCB0byBhZGQgcHJvcHMgdGhhdCBh
cHBseSB0byB0aGUgZGV2aWNlIHJhdGhlciB0aGFuCj4gPiB0aGUgY29udHJvbGxlciBpdHNlbGYs
IGhhdmluZyBhIHNpbmdsZSBub2RlIHRvIHJlcHJlc2VudCBib3RoIGVsZW1lbnRzCj4gPiBpcyBu
b3QgdGhhdCBncmVhdC4gIAo+IAo+IFlvdSBtZWFuLCBqdXN0IGhhdmluZyBhIHZlcnkgZ2VuZXJp
YyBvbmVuYW5kQDAgbm9kZSB0aGF0IGRvZXNuJ3QKPiByZWFsbHkgaW5jbHVkZSBhbnkgaW5mb3Jt
YXRpb24sIGV4Y2VwdCBtYXliZSB0aGUgcGFydGl0aW9uIHRhYmxlPwoKWWVzLgoKPiBJCj4gZ3Vl
c3MgdGhhdCB3b3VsZG4ndCBoYXZlIGFueSBuZWdhdGl2ZSBzaWRlIGVmZmVjdHMgaW5kZWVkLgo+
IAo+IE15IHBvaW50IHdhcyB0aGF0IHdlIGRvbid0IHdhbnQgdG8gcHV0IHRoaW5ncyBsaWtlIGNo
aXAgdmVuZG9yLCBzaXplLAo+IGV0Yy4gaW4gRFQsIHNpbmNlIHRoYXQncyBlbnVtZXJhYmxlLgoK
T2gsIGRlZmluaXRlbHkgbm90LCBhbmQgdGhhdCdzIGV4YWN0bHkgaG93IHdlIGRvIGl0IGZvciBO
QU5EIGRldmljZXMuCkV2ZXJ5dGhpbmcgdGhhdCdzIGRpc2NvdmVyYWJsZSBpcyBub3QgZGVzY3Jp
YmVkIGluIHRoZSBEVCwgYnV0IHNvbWUKdGhpbmdzIGNhbid0IGJlIGRpc2NvdmVyZWQgdGhpcyB3
YXkgKGxpa2Ugd2hlbiB5b3Ugd2FudCB0byBvdmVycmlkZSB0aGUKRUNDIHN0cmVuZ3RoIGFuZCB1
c2UgU1ctYmFzZWQgaW1wbGVtIGluc3RlYWQgb2YgdGhlIEhXLWJhc2VkIG9uZSkuIEkKa25vdyBu
b25lIG9mIHRoaXMgYXBwbGllcyB0byBPbmVOQU5EIHlldCwgSSdtIGp1c3Qgb3Zlci1jYXV0aW91
cyBhYm91dAp0aGF0IHNpbmNlIERUIGJpbmRpbmdzIGNoYW5nZXMgYXJlIGhhcmQgdG8gbWFrZSBv
bmNlIHRoZSBiaW5kaW5ncyBhcmUKaW4gdXNlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
