Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B963CC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 09:09:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8856F2087E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 09:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4dk/3DX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8856F2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JObnC242VovpCwCp7C8NEW6eHDLvxLCVbbiOfzMe6Sk=; b=l4dk/3DXYou8f9
	jiod7TNBdmPArs1zV0rdqOLXeuyKhoO4nLTV4B+wFmA5FuuazLVFB2cUwiw6aml/Dy4NcIspn5n4m
	s2P+xnRdBxT7SvDocB7LTaFHg8Flca08qu0QD4aBBsC1yS/FWQmSiwFLngM4a5H96DYMBYpR6xAis
	0SREqrUT1fh6i3AQJ9F1gtefng4XlR6a+HUjkfXKa3LqCLo+jB/RFZnfmb4Jx9Y3Mmsmyz4XAOR8y
	cM7yzdRuc+OrOnWHjHYJfOQ9tEiEH1LvXYRG80pnDSVhxz5B0UyNNQ357ISDu0hmKwWBgstfxsaTk
	2WTUc7JKIGNYma8HFzbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Lbz-0004sM-71; Mon, 25 Mar 2019 09:09:43 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Lbq-0004kb-J0; Mon, 25 Mar 2019 09:09:36 +0000
Received: from xps13 (aaubervilliers-681-1-92-153.w90-88.abo.wanadoo.fr
 [90.88.33.153]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id F1A80100022;
 Mon, 25 Mar 2019 09:09:10 +0000 (UTC)
Date: Mon, 25 Mar 2019 10:09:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: select target before setting up
 data interface
Message-ID: <20190325100909.5f3558b9@xps13>
In-Reply-To: <6bcd6f18-6e57-2221-9e32-5bbabfffc48d@zonque.org>
References: <20190321212010.3995-1-daniel@zonque.org>
 <20190322093046.71df010d@xps13>
 <6bcd6f18-6e57-2221-9e32-5bbabfffc48d@zonque.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_020934_772766_339BE45C 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>, stable@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLAoKRGFuaWVsIE1hY2sgPGRhbmllbEB6b25xdWUub3JnPiB3cm90ZSBvbiBGcmks
IDIyIE1hciAyMDE5IDE5OjQ4OjA4CiswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMjIvMy8y
MDE5IDk6MzAgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiArIFJpY2hhcmQ6IHRoaXMgaXMg
Zml4ZXMgbWF0ZXJpYWxzCj4gPiAKPiA+IERhbmllbCBNYWNrIDxkYW5pZWxAem9ucXVlLm9yZz4g
d3JvdGUgb24gVGh1LCAyMSBNYXIgMjAxOSAyMjoyMDoxMAo+ID4gKzAxMDA6Cj4gPiAgIAo+ID4+
IE5vdyB0aGF0IHRoZSBuYW5kIGRyaXZlcnMgYXJlIHJlc3BvbnNpYmxlIGZvciBzZWxlY3Rpbmcg
dGhlIHRhcmdldAo+ID4+IHByaW9yIHRvIGhhcmR3YXJlIGFjY2VzcywgYSBjYWxsIHRvIG1hcnZl
bGxfbmZjX3NlbGVjdF90YXJnZXQoKSBpcwo+ID4+IG5lY2Vzc2FyeSBmcm9tIG1hcnZlbGxfbmZj
X3NldHVwX2RhdGFfaW50ZXJmYWNlKCkuCj4gPj4KPiA+PiBUaGlzIGlzIGEgcmVncmVzc2lvbiBp
bnRyb2R1Y2VkIGJ5IGNvbW1pdCBiMjUyNTE0MTRmNmUgKCJtdGQ6Cj4gPj4gcmF3bmFuZDogbWFy
dmVsbDogU3RvcCBpbXBsZW1lbnRpbmcgLT5zZWxlY3RfY2hpcCgpIikuCj4gPj4KPiA+PiBGaXhl
czogYjI1MjUxNDE0ZjZlICgibXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBTdG9wIGltcGxlbWVudGlu
ZyAtPnNlbGVjdF9jaGlwKCkiKQo+ID4+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPgo+ID4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTWFjayA8ZGFuaWVsQHpvbnF1ZS5vcmc+Cj4gPj4gLS0t
Cj4gPj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIHwgMiArKwo+ID4+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9t
YXJ2ZWxsX25hbmQuYwo+ID4+IGluZGV4IDg0MjgzYzZiYjBmZi4uOTNhYmU1YmU4OTk1IDEwMDY0
NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gPj4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiA+PiBAQCAtMjMyNSw2ICsy
MzI1LDggQEAgc3RhdGljIGludCBtYXJ2ZWxsX25mY19zZXR1cF9kYXRhX2ludGVyZmFjZShzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+ID4+ICAJc3RydWN0IG1hcnZlbGxfbmZj
X3RpbWluZ3MgbmZjX3RtZzsKPiA+PiAgCWludCByZWFkX2RlbGF5Owo+ID4+ICAKPiA+PiArCW1h
cnZlbGxfbmZjX3NlbGVjdF90YXJnZXQoY2hpcCwgY2hpcC0+Y3VyX2NzKTsKPiA+PiArCj4gPj4g
IAlzZHIgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjb25mKTsKPiA+PiAgCWlmIChJU19FUlIoc2Ry
KSkKPiA+PiAgCQlyZXR1cm4gUFRSX0VSUihzZHIpOyAgCj4gPiAKPiA+IEkgaGFkIGEgc2hvcnQg
bG9vayB5ZXN0ZXJkYXkgYW5kIHRoaXMgaXMgdmVyeSBsaWtlbHkgdG8gYmUgdGhlIHJvb3QKPiA+
IGNhdXNlIG9mIHRoZSByZWdyZXNzaW9uLCB0aGFuayB5b3UgdmVyeSBtdWNoISAgCj4gCj4gWWVz
IGl0IGlzLCBpdCBmaXhlcyB0aGUgcmVncmVzc2lvbiBJIGhhdmUgcmVwb3J0ZWQuCj4gCj4gRG8g
eW91IHdhbnQgbWUgdG8gcmVzZW5kIHdpdGggdGhhdCBuaXQgYWRkcmVzc2VkIHlvdSBtZW50aW9u
ZWQ/IE15Cj4gdmVyc2lvbiB3b3JrcyB3ZWxsLCBJIGtub3cgdGhhdCBtdWNoIDopCgpZZXMgcGxl
YXNlLCByZXNlbnQgd2l0aCBCb3JpcycgY29tbWVudCBhZGRyZXNzZWQgYW5kIHdlJ2xsIGJlIGZp
bmUuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
