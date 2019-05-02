Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B349FC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:55:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CDEF2085A
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6hJA/3D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CDEF2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RQzcefixxFwGiGF5M+hOhlM/u6ZpEPR1+NSnA1S/3Q=; b=M6hJA/3DdiRoK+
	hO73S6JJjxQuCZug5RVf9AQuyF73dAb3fSYaBje6rfbddMEO0R4oPTSKg2sw9HMdXmRFW6FzqO+yV
	psk8ehS4BI0XyYg/rjFsIr2NC1NbZmnag1wtmekU+2yqzqMTgkcVilxbvgp0qvvMgVbqba5xaWDxO
	Avl3fANkc8GUfztgImk6VJ8eCqoqWNwxwi185OzTI8li8hfUk96U0rwKAIKKAgCiHuO5UV0/ac8sw
	cf1oSbw1jyaPIyNkgwPOYsH63R1S8Y+5ZxneTq4z+yAk60LjM53yI4Kk17zPD3IFoWd1Zc/sQf5+c
	KkrYOqd8//x3FS1N03IQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM5cs-0006SR-E1; Thu, 02 May 2019 06:55:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM5cp-0006Rq-6k
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 06:55:24 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 544E2261282;
 Thu,  2 May 2019 07:55:21 +0100 (BST)
Date: Thu, 2 May 2019 08:55:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree
 support
Message-ID: <20190502085518.5d248167@collabora.com>
In-Reply-To: <CA+Ln22H4ua9Zuh4eKaWfHtqh8DieyiS=5s7wS6-TbmA5Dsop4A@mail.gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
 <20190502015408.GA11612@bogus>
 <CA+Ln22HLqnbbY37FG6CwjZvZH7G35Z+0kNq7XFU4WtZyk_EqZQ@mail.gmail.com>
 <20190502083632.0ec0fb4e@collabora.com>
 <CA+Ln22H4ua9Zuh4eKaWfHtqh8DieyiS=5s7wS6-TbmA5Dsop4A@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_235523_511013_C0BB9313 
X-CRM114-Status: GOOD (  34.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 bbrezillon@kernel.org, richard@nod.at,
 linux-kernel <linux-kernel@vger.kernel.org>, marek.vasut@gmail.com,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyIE1heSAyMDE5IDE1OjQyOjU5ICswOTAwClRvbWFzeiBGaWdhIDx0b21hc3ouZmln
YUBnbWFpbC5jb20+IHdyb3RlOgoKPiAyMDE55bm0NeaciDLml6Uo5pyoKSAxNTozNiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPjoKPiA+Cj4gPiBIaSBUb21h
c3osCj4gPgo+ID4gT24gVGh1LCAyIE1heSAyMDE5IDE1OjIzOjMzICswOTAwCj4gPiBUb21hc3og
RmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPiB3cm90ZToKPiA+ICAKPiA+ID4gMjAxOeW5tDXm
nIgy5pelKOacqCkgMTA6NTQgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz46ICAKPiA+ID4g
Pgo+ID4gPiA+IE9uIEZyaSwgQXByIDI2LCAyMDE5IGF0IDA2OjQyOjIzUE0gKzAyMDAsIFBhd2XF
giBDaG1pZWwgd3JvdGU6ICAKPiA+ID4gPiA+IEZyb206IFRvbWFzeiBGaWdhIDx0b21hc3ouZmln
YUBnbWFpbC5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIGR0LWJpbmRp
bmdzIGZvciBTYW1zdW5nIE9uZU5BTkQgZHJpdmVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFpbC5j
b20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICAuLi4vYmluZGluZ3MvbXRkL3NhbXN1bmctb25l
bmFuZC50eHQgICAgICAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zYW1zdW5nLW9uZW5hbmQu
dHh0Cj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4dAo+ID4gPiA+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzQxZDk3Y2MxNTEz
Cj4gPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQKPiA+ID4gPiA+IEBAIC0w
LDAgKzEsNDYgQEAKPiA+ID4gPiA+ICtEZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgU2Ftc3VuZyBT
b0MgT25lTkFORCBjb250cm9sbGVyCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArUmVxdWlyZWQgcHJv
cGVydGllczoKPiA+ID4gPiA+ICsgLSBjb21wYXRpYmxlIDogdmFsdWUgc2hvdWxkIGJlIGVpdGhl
ciBvZiB0aGUgZm9sbG93aW5nLgo+ID4gPiA+ID4gKyAgIChhKSAic2Ftc3VuZyxzM2M2NDAwLW9u
ZW5hbmQiIC0gZm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gPiA+
ICsgICAgICAgUzNDNjQwMCBTb0MsCj4gPiA+ID4gPiArICAgKGIpICJzYW1zdW5nLHMzYzY0MTAt
b25lbmFuZCIgLSBmb3Igb25lbmFuZCBjb250cm9sbGVyIGNvbXBhdGlibGUgd2l0aAo+ID4gPiA+
ID4gKyAgICAgICBTM0M2NDEwIFNvQywKPiA+ID4gPiA+ICsgICAoYykgInNhbXN1bmcsczVwYzEw
MC1vbmVuYW5kIiAtIGZvciBvbmVuYW5kIGNvbnRyb2xsZXIgY29tcGF0aWJsZSB3aXRoCj4gPiA+
ID4gPiArICAgICAgIFM1UEMxMDAgU29DLAo+ID4gPiA+ID4gKyAgIChkKSAic2Ftc3VuZyxzNXB2
MjEwLW9uZW5hbmQiIC0gZm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+
ID4gPiA+ICsgICAgICAgUzVQQzExMC9TNVBWMjEwIFNvQ3MuCj4gPiA+ID4gPiArCj4gPiA+ID4g
PiArIC0gcmVnIDogdHdvIG1lbW9yeSBtYXBwZWQgcmVnaXN0ZXIgcmVnaW9uczoKPiA+ID4gPiA+
ICsgICAtIGZpcnN0IGVudHJ5OiBjb250cm9sIHJlZ2lzdGVycy4KPiA+ID4gPiA+ICsgICAtIHNl
Y29uZCBhbmQgbmV4dCBlbnRyaWVzOiBtZW1vcnkgd2luZG93cyBvZiBwYXJ0aWN1bGFyIE9uZU5B
TkQgY2hpcHM7Cj4gPiA+ID4gPiArICAgICBmb3IgdmFyaWFudHMgYSksIGIpIGFuZCBjKSBvbmx5
IG9uZSBpcyBhbGxvd2VkLCBpbiBjYXNlIG9mIGQpIHVwIHRvCj4gPiA+ID4gPiArICAgICB0d28g
Y2hpcHMgY2FuIGJlIHN1cHBvcnRlZC4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgLSBpbnRlcnJ1
cHQtcGFyZW50IDogcGhhbmRsZSBvZiBpbnRlcnJ1cHQgY29udHJvbGxlciB0byB3aGljaCB0aGUg
T25lTkFORAo+ID4gPiA+ID4gKyAgIGNvbnRyb2xsZXIgaXMgd2lyZWQsICAKPiA+ID4gPgo+ID4g
PiA+IFRoaXMgaXMgaW1wbGllZCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4gPiA+ID4gIAo+ID4gPiA+
ID4gKyAtIGludGVycnVwdHMgOiBzcGVjaWZpZXIgb2YgaW50ZXJydXB0IHNpZ25hbCB0byB3aGlj
aCB0aGUgT25lTkFORCBjb250cm9sbGVyCj4gPiA+ID4gPiArICAgaXMgd2lyZWQ7IHNob3VsZCBj
b250YWluIGp1c3Qgb25lIGVudHJ5Lgo+ID4gPiA+ID4gKyAtIGNsb2NrLW5hbWVzIDogc2hvdWxk
IGNvbnRhaW4gdHdvIGVudHJpZXM6Cj4gPiA+ID4gPiArICAgLSAiYnVzIiAtIGJ1cyBjbG9jayBv
ZiB0aGUgY29udHJvbGxlciwKPiA+ID4gPiA+ICsgICAtICJvbmVuYW5kIiAtIGNsb2NrIHN1cHBs
aWVkIHRvIE9uZU5BTkQgbWVtb3J5LiAgCj4gPiA+ID4KPiA+ID4gPiBJZiB0aGUgY2xvY2sganVz
dCBnb2VzIHRvIHRoZSBPbmVOQU5EIGRldmljZSwgdGhlbiBpdCBzaG91bGQgYmUgaW4gdGhlCj4g
PiA+ID4gbmFuZCBkZXZpY2Ugbm9kZSByYXRoZXIgdGhhbiB0aGUgY29udHJvbGxlciBub2RlLgo+
ID4gPiA+ICAKPiA+ID4KPiA+ID4gKFRyeWluZyBoYXJkIHRvIHJlY2FsbCB0aGUgZGV0YWlscyBh
Ym91dCB0aGlzIGhhcmR3YXJlLikKPiA+ID4gQUZBSVIgdGhlIGNsb2NrIGdvZXMgdG8gdGhlIGNv
bnRyb2xsZXIgYW5kIHRoZSBjb250cm9sbGVyIHRoZW4gZmVlZHMKPiA+ID4gaXQgdG8gdGhlIG1l
bW9yeSBjaGlwcy4KPiA+ID4KPiA+ID4gQWxzbyBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBoYXZl
IGFueSBuYW5kIGRldmljZSBub2RlcyBoZXJlLCBzaW5jZQo+ID4gPiB0aGUgbWVtb3J5IGl0c2Vs
ZiBpcyBvbmx5IGV4cG9zZWQgdmlhIHRoZSBjb250cm9sbGVyLCB3aGljaCBvZmZlcnMKPiA+ID4g
dmFyaW91cyBxdWVyaWVzIHRvIHByb2JlIHRoZSBtZW1vcnkgYXQgcnVudGltZSwgc28gdGhlcmUg
aXMgbm8gbmVlZCB0bwo+ID4gPiBkZXNjcmliZSBpdCBpbiBEVC4gIAo+ID4KPiA+IEl0J3MgcHJv
YmFibHkgdHJ1ZSwgdGhvdWdoIG5vdCBwcm92aWRpbmcgdGhpcyBjb250cm9sbGVyL2RldmljZQo+
ID4gc2VwYXJhdGlvbiBmb3IgTkFORCBjb250cm9sbGVyL2RldmljZXMgaGFzIHByb3ZlbiB0byBi
ZSBhIG1pc3Rha2UgZm9yCj4gPiByYXcgTkFORCBjb250cm9sbGVycyAoc29tZSBwcm9wcyBhcHBs
eSB0byB0aGUgY29udHJvbGxlcnMgYW5kIG90aGVycyB0bwo+ID4gdGhlIE5BTkQgZGV2aWNlLCBu
b3QgdG8gbWVudGlvbiB0aGF0IHNvbWUgY29udHJvbGxlcnMgc3VwcG9ydAo+ID4gaW50ZXJhY3Rp
bmcgd2l0aCBzZXZlcmFsIGNoaXBzKSwgc28sIGlmIHRoYXQncyBhIG5ldyBiaW5kaW5nLCBJJ2QK
PiA+IHJlY29tbWVuZCBoYXZpbmcgdGhpcyBzZXBhcmF0aW9uIGV2ZW4gaWYgaXQncyBub3Qgc3Ry
aWN0bHkgcmVxdWlyZWQuCj4gPiAgCj4gCj4gTm90ZSB0aGF0IE9uZU5BTkQgaXMgYSB0b3RhbGx5
IGRpZmZlcmVudCB0aGluZyB0aGFuIHRoZSB0eXBpY2FsIE5BTkQKPiBtZW1vcnkgd2l0aCBOQU5E
IGludGVyZmFjZS4gT25lTkFORCBjaGlwcyBoYXZlIGEgTk9SLWxpa2UgaW50ZXJmYWNlLAo+IHdp
dGggaW50ZXJuYWwgY29udHJvbGxlciBhbmQgYnVmZmVycyBpbnNpZGUsIHNvIHRlY2huaWNhbGx5
IHRoZXkgY2FuCj4gYmUgZXZlbiB1c2VkIHdpdGhvdXQgYW55IHNwZWNpYWwgY29udHJvbGxlciBv
biB0aGUgU29DLCB2aWEgYSBnZW5lcmljCj4gcGFyYWxsZWwgaG9zdCBpbnRlcmZhY2UgYW5kIHBv
c3NpYmx5IHNvbWUgcmVndWxhciBETUEgZW5naW5lIGZvciBDUFUKPiBvZmZsb2FkLgoKWWVzLCBJ
IGtub3cgdGhhdC4KCj4gCj4gVGhlIGNvbnRyb2xsZXIgZGVzaWduIG9mIHRoZSBTb0NzIGluIHF1
ZXN0aW9uIGZ1cnRoZXIgYWJzdHJhY3RzIHRoZQo+IE9uZU5BTkQncyBwcm9ncmFtbWluZyBpbnRl
cmZhY2UgaW50byBhIG51bWJlciBvZiBoaWdoIGxldmVsIG9wZXJhdGlvbnMKPiBhbmQgYXR0ZW1w
dHMgdG8gaGlkZSB0aGUgZGV0YWlscyBvZiB0aGUgdW5kZXJseWluZyBtZW1vcnksIHNvIEkgZG9u
J3QKPiBzZWUgdGhlIHBvaW50IG9mIGRlc2NyaWJpbmcgdGhlIG1lbW9yeSBpbiBEVCBoZXJlLCBp
dCB3b3VsZCBhY3R1YWxseQo+IGRlZmVhdCB0aGUgcHVycG9zZSBvZiB0aGlzIGNvbnRyb2xsZXIu
CgpJIGRvbid0IHNlZSBob3cgaGF2aW5nIGEgc3Vibm9kZSBmb3IgdGhlIE5BTkQgY2hpcCB3b3Vs
ZCBjaGFuZ2UKYW55dGhpbmcgb24gaG93IHRoZSBjb250cm9sbGVyIGludGVyYWN0cyB3aXRoIHRo
ZSBOQU5EIGRldmljZS4gTXkgcG9pbnQKaXMsIGlmIHdlIGV2ZXIgbmVlZCB0byBhZGQgcHJvcHMg
dGhhdCBhcHBseSB0byB0aGUgZGV2aWNlIHJhdGhlciB0aGFuCnRoZSBjb250cm9sbGVyIGl0c2Vs
ZiwgaGF2aW5nIGEgc2luZ2xlIG5vZGUgdG8gcmVwcmVzZW50IGJvdGggZWxlbWVudHMKaXMgbm90
IHRoYXQgZ3JlYXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
