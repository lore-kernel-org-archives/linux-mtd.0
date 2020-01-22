Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB424C2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 16:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6582071E
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 16:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fZ5khb7p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6582071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vl0xI8stCyvGCQ4djEWLjtQ83g9IDdzJXAYxamuys3w=; b=fZ5khb7p8c8Ikp
	qlkgh7mIQoVtRvPOmnMmT8aTS8OEt6Kl+36A7wk5jfd3NTgpUrg9rf+Xi4GSn7vf2pr5rI6T4Qx0L
	kgNgeQ2/Grmn5ZqJk6nW94l582GpvcYGgyccS2xnhNsXNBt1VLnt+zzU7sTWXMiwvV5FNf2l7OoLS
	nst2ISFx1uyjQf+QbppiJHEeY+tuwAQWTwIJrqXHistjDU4WU2+rh32oxptYQPLfeNfTR7rK1Mxzy
	xnGaHaEhU/xsaG3dY9dL3IRQ0b3S6S0u30gzrkewqwdmMYnsVri7Cd7ahO9Fn1QokP3ZNeqHstzJU
	X8RWdICSVSKHqNU+RCyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuIYc-0007aL-Ef; Wed, 22 Jan 2020 16:08:42 +0000
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuIYX-0007T4-6F; Wed, 22 Jan 2020 16:08:37 +0000
Subject: Re: [PATCH v1 06/11] Documentation: pstore/blk: blkoops: create
 document for pstore_blk
To: liaoweixiong <liaoweixiong@allwinnertech.com>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1579482233-2672-7-git-send-email-liaoweixiong@allwinnertech.com>
 <b9cd734b-8bb1-5e26-a7ed-fbc79ab2d958@infradead.org>
 <c87bdf3a-f129-a2a7-40b2-2220f79b505a@allwinnertech.com>
 <40d7f57a-119e-e51f-99a5-63e85ab5ab91@infradead.org>
 <3337f687-a668-c058-178b-a1438641c519@allwinnertech.com>
 <597e2b49-667a-490e-91b6-641ca25401d8@infradead.org>
 <6d94b9d5-abef-db5e-1c80-00ea8c1b0003@allwinnertech.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <325251e8-79e6-ed07-f5e0-b8c149757766@infradead.org>
Date: Wed, 22 Jan 2020 08:08:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <6d94b9d5-abef-db5e-1c80-00ea8c1b0003@allwinnertech.com>
Content-Language: en-US
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMS8yMi8yMCA3OjAxIEFNLCBsaWFvd2VpeGlvbmcgd3JvdGU6Cj4gT24gMjAyMC8xLzIxIOS4
i+WNiDExOjM0LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDEvMjEvMjAgMTI6MTkgQU0sIGxp
YW93ZWl4aW9uZyB3cm90ZToKPj4+IGhpIFJhbmR5IER1bmxhcCwKPj4+Cj4+PiBPbiAyMDIwLzEv
MjEgMjozNiBQTSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+Pj4+IE9uIDEvMjAvMjAgOToyMyBQTSwg
bGlhb3dlaXhpb25nIHdyb3RlOgo+Pj4+PiBoaSBSYW5keSBEdW5sYXAsCj4+Pj4+Cj4+Pj4+IE9u
IDIwMjAvMS8yMSBQTTEyOjEzLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+Pj4+PiBIaSwKPj4+Pj4+
Cj4+Pj4+PiBJIGhhdmUgc29tZSBkb2N1bWVudGF0aW9uIGNvbW1lbnRzIGZvciB5b3U6Cj4+Pj4+
Pgo+Pj4+Pj4KPj4+Pj4+IE9uIDEvMTkvMjAgNTowMyBQTSwgV2VpWGlvbmcgTGlhbyB3cm90ZToK
Pj4+Pj4+PiBUaGUgZG9jdW1lbnQsIGF0IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcHN0b3Jl
LWJsb2NrLnJzdCwgdGVsbHMgdXMKPj4+Pj4+PiBob3cgdG8gdXNlIHBzdG9yZS9ibGsgYW5kIGJs
a29vcHMuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBXZWlYaW9uZyBMaWFvIDxsaWFv
d2VpeGlvbmdAYWxsd2lubmVydGVjaC5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqDCoCBEb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL3BzdG9yZS1ibG9jay5yc3QgfCAyNzggKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4+Pj4+PiDCoMKgIE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSAr
Cj4+Pj4+Pj4gwqDCoCBmcy9wc3RvcmUvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKwo+Pj4+Pj4+IMKgwqAgMyBmaWxlcyBj
aGFuZ2VkLCAyODEgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+IMKgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcHN0b3JlLWJsb2NrLnJzdAo+Pj4+Pj4+Cj4+Pj4+
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcHN0b3JlLWJsb2NrLnJz
dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcHN0b3JlLWJsb2NrLnJzdAo+Pj4+Pj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi41ODQxOGQ0Mjlj
NTUKPj4+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9wc3RvcmUtYmxvY2sucnN0Cgo+Pj4+Pj4+ICtDb21wcmVzc2lvbiBhbmQgaGVhZGVy
Cj4+Pj4+Pj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4+PiArCj4+Pj4+Pj4gK0Jsb2Nr
IGRldmljZSBpcyBsYXJnZSBlbm91Z2ggZm9yIHVuY29tcHJlc3NlZCBkbWVzZyBkYXRhLiBBY3R1
YWxseSB3ZSBkbyBub3QKPj4+Pj4+PiArcmVjb21tZW5kIGRhdGEgY29tcHJlc3Npb24gYmVjYXVz
ZSBwc3RvcmUvYmxrIHdpbGwgaW5zZXJ0IHNvbWUgaW5mb3JtYXRpb24gaW50bwo+Pj4+Pj4+ICt0
aGUgZmlyc3QgbGluZSBvZiBkbWVzZyBkYXRhLiBGb3IgZXhhbXBsZTo6Cj4+Pj4+Pj4gKwo+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBQYW5pYzogVG90YWwgMTYgdGltZXMKPj4+Pj4+PiArCj4+Pj4+
Pj4gK0l0IG1lYW5zIHRoYXQgaXQncyB0aGUgMTZ0aCB0aW1lcyBwYW5pYyBsb2cgc2luY2UgdGhl
IGZpcnN0IGJvb3RpbmcuIFNvbWV0aW1lcwo+Pj4+Pj4KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGltZSBvZiBh
IHBhbmljIGxvZyBzaW5jZSAuLi4KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFNob3VsZCBpdCBiZSBsaWtl
IHRoaXM/Cj4+Pj4+IEl0IG1lYW5zIHRoZSB0aW1lIG9mIGEgcGFuaWMgbG9nIHNpbmNlIHRoZSBm
aXJzdCBib290aW5nLgo+Pj4+Cj4+Pj4gVGhhdCBzb3VuZHMgbGlrZSBjbG9jayB0aW1lLCBub3Qg
dGhlIG51bWJlciBvZiBpbnN0YW5jZXMgb3Igb2NjdXJyZW5jZXMuCj4+Pj4KPj4+Cj4+PiBJdCBp
cyBhbiBvb3BzL3BhbmljIGNvdW50ZXIgdG9vLiBIb3cgYWJvdXQgdGhpcz8KPj4+Cj4+PiBJdCBt
ZWFucyB0aGF0IGl0J3MgT09QUy9QQU5JQyBmb3IgdGhlIDE2dGggdGltZSBzaW5jZSB0aGUgZmly
c3QgYm9vdGluZy4KPj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzaW5jZSB0aGUgbGFzdCBib290aW5nIHtvciBib290fS4KPj4KPiAKPiBOb3QgdGhlIGxh
c3QgYm9vdGluZyBidXQgdGhlIGZpcnN0IGJvb3RpbmcuIFRoaXMgaXMgdGhlIG51bWJlciBvZgo+
IHRyaWdnZXJzIHNpbmNlIHRoZSBmaXJzdCB0aW1lIHRoZSBzeXN0ZW0gd2FzIGluc3RhbGxlZC4K
Ck9LLCBzbyBpdCdzIGEgcGVyc2lzdGVudCBjb3VudGVyLgpUaGFua3MgZm9yIHRoZSBjbGFyaWZp
Y2F0aW9uLgoKLS0gCn5SYW5keQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
