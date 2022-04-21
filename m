Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9281C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+FA42//GPf3q3vmju7DhfJY4XWc/4TeRKeahsPCsk8=; b=fCwj7xKhXQ94RawhuvxalS8zJQ
	/MJ9Zy6sq2TZtxjzRVcjSnHKbWAHVUBEbF3v3Z3O5JkE80MpVdlaHHy4pw1aAZoH+QaDqqvfkWvJs
	UFUkSUa4BdgJZEzfEFjAeOXhRYvxvZI8Dk1Mr9IijIiIDj51Bo4rya2S0tO9ogEPXlCkTRoAi9fPb
	ynlTQb1KRXEIiysBCDf+UX1uNtL4fZ/Irfbv2Oq76YfTFgkZ+8wwEOONsUW3XqKwHncrwUiosqkSb
	Pbrgd9j6dLNq2zHdpwiB8YVj11kKSk+Rd6Q/Uqj9a6cVdSyUeFXaB6zX1teCibBSHHXZOwzsau8Fp
	LXYAiZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhX59-00Db6K-13; Thu, 21 Apr 2022 13:42:51 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhX56-00Db5o-2b
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 13:42:49 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 07DD1221D4;
 Thu, 21 Apr 2022 15:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650548566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78YC4aUvmWiMhlou5a5uADfOgsbtDILRsuzeLuHdcLI=;
 b=oygB5GAasd2TG0hZg3IN4CXwbRYG/IZaj8Eb9UjkvPpZ2B1AcQNr7EWDPEG6Bghu4G7MwO
 NhBznaINuDW+p53uV1myP3KGNfny9PtA14RPYfpY2ifWwPnTHpcEA9oNz3DIfAf3gSm5pg
 5GMVouiVQM+OX85KEwYCajokiShFCrc=
MIME-Version: 1.0
Date: Thu, 21 Apr 2022 15:42:45 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, p.yadav@ti.com,
 richard@nod.at, tkuw584924@gmail.com, vigneshr@ti.com
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
In-Reply-To: <af0fd418-7097-c2d4-dbbf-8cde0c62f765@microchip.com>
References: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
 <20220421112956.292089-1-michael@walle.cc>
 <6f72bda7-4447-7f8c-eaa5-fa2c21c7bfe1@microchip.com>
 <9495fb0f56e187ade9b428fd69d84aec@walle.cc>
 <af0fd418-7097-c2d4-dbbf-8cde0c62f765@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5a7ba92487dcb1f776b76dcf069fbdf5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_064248_311266_046E26AD 
X-CRM114-Status: GOOD (  20.41  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0wNC0yMSAxNToxMywgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cgo+PiBJZiB0aGUgcGFyc2luZyB3b3VsZG4ndCBjaGFuZ2UgYW55IHJ1bnRpbWUgcGFyYW1ldGVy
cyB3ZSB3b3VsZG4ndAo+PiBoYXZlIHRoaXMgcHJvYmxlbSBhdCBhbGwuIG5vPwo+IAo+IEl0IGRv
ZXNuJ3QgY2hhbmdlLCBfYnV0XyBpdCBzZXRzIHRoZSBjb3JyZWN0IG51bWJlciBvZiBhZGRyZXNz
IG5ieXRlcy4KCkl0IGNoYW5nZXMgbm9yLT5hZGRyX3dpZHRoIHdoaWNoIG1pZ2h0IGJlIHVzZWQg
Zm9yIGFsbCBjb21tYW5kcwpleGNlcHQgdGhlIHJlYWRfc2ZkcF9kYXRhKCkuIEl0IGNoYW5nZXMg
aXQgYmVmb3JlIHdlIGFyZSBlbnRlcmluZwp0aGUgNCBieXRlIG1vZGUuIEFsc28gcGFyc2Vfc2Zk
cCBjaGFuZ2VzIHRoZSBvcGNvZGVzLiBJdCBzZWVtcyB0aGlzCndhcyB0aGUgcmVhc29uIGZvciB0
aGUgU05PUl9GX0hBU180QkFJVCBmbGFnIGluIHRoZSBmaXJzdCBwbGFjZSwKc28gdGhlIGNvcmUg
ZG9lc24ndCBjb252ZXJ0IHRoZSBvcGNvZGVzIGFnYWluLgoKPj4gVGhlIHBhcnNlX3NmZHAoKSBz
aG91bGQgb25seSBjaGFuZ2UgbWVtYmVycyBvZiBzdHJ1Y3QKPj4gc3BpX25vcl9mbGFzaF9wYXJh
bWV0ZXJzLCB0aGUgY2FsbGVyIHdpbGwgdGhlbiBkZWNpZGUgaWYgdGhleQo+PiBzaG91bGQgYmUg
dXNlZCBhbmQgbW9yZSBpbXBvcmFudGx5ICp3aGVuKiB0aGV5IHNob3VsZCBiZSB1c2VkLgo+IAo+
IHRoaXMgd291bGQgbWVhbiBpbnRyb2R1Y2luZyBhIG5vci0+cGFyYW1zLT5hZGRyX25ieXRlcywg
d2hpY2gKPiBpcyByZWR1bmRhbnQgd2l0aCBTTk9SX0ZfSEFTXzRCQUlULgoKU28/IFRoZSBTRkRQ
IHRhYmxlIGhhcyBib3RoIGluZm9ybWF0aW9uLCBJIGRvbid0IHNlZSBhIHByb2JsZW0Kd2l0aCB0
aGF0LiBBbmQgSSdtIG5vdCBzdXJlIHRoZXkgYXJlIHJlZHVuYW50LCBJIHRoaW5rIGEgZmxhc2gK
Y2FuIGhhdmUgNCBieXRlIGFkZHJlc3NlcyBhbmQgbm8gNEJBSVQgdGFibGUuCgpBbmQgaWYgaXQg
d291bGQgYmUgcmVkdW5kYW50IHdoeSBkbyB3ZSBuZWVkIHRoYXQgZW1wdHkKY2FzZSBiZWxvdy4u
Cgo+PiBUaGVuIHlvdSBjYW4gZG8gdGhlIHNhbmUgdGhpbmcgaW4gc3BpX25vcl9zZXRfYWRkcl93
aWR0aCgpOgo+PiBzZXR0aW5nIHRoZSBhZGRyX3dpZHRoLgo+PiAKPj4gUmlnaHQgbm93IGl0J3M6
Cj4+IAo+PiArc3RhdGljIGludCBzcGlfbm9yX3NldF9hZGRyX3dpZHRoKHN0cnVjdCBzcGlfbm9y
ICpub3IpCj4+ICt7Cj4+ICvCoMKgwqDCoMKgwqAgaWYgKG5vci0+ZmxhZ3MgJiBTTk9SX0ZfSEFT
XzRCQUlUKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3ItPmFkZHJfd2lkdGgg
PSA0Owo+PiArCj4+ICvCoMKgwqDCoMKgwqAgaWYgKG5vci0+YWRkcl93aWR0aCkgewo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBhbHJlYWR5IGNvbmZpZ3VyZWQgZnJvbSBTRkRQ
ICovCj4+ICsgICAgICAgfQo+PiAuLgoKaGVyZS4KCj4+IAo+PiBTb21ldGltZXMgaXQgd2lsbCBz
ZXQgYWRkcl93aWR0aCwgc29tZXRpbWVzIGl0IHdpbGwgbm90IGJlIHNldAo+PiBhbmQgZXZlcnkg
b25jZSBpbiBhIHdoaWxlIDRieXRlIG1vZGUgaXMgZGV0ZXJtaW5lZCBieSBTRkRQIGJ1dAo+PiBp
dCBpcyBub3QgY29uZmlndXJlZCAoU05PUl9GX0hBU180QkFJVCkuCj4gCj4gd2hpY2ggaXMgZ29v
ZCEgd2UgcHJlZmVyIHVzaW5nIDRiIG9wY29kZXMgdGhhbiBlbnRlcmluZyA0Ynl0ZSBhZGRyZXNz
Cj4gbW9kZS4KCllvdSBkaWRuJ3QgdW5kZXJzdGFuZCBteSBwb2ludC4gQWxsIHRoZSBhc3NpZ25t
ZW50cyBvZiBhZGRyX3dpZHRoCmFyZSBjbHVzdGVyZWQgYXJvdW5kIGluIHRoZSBjb2RlLiBXaHkg
Y2FuJ3Qgd2UgaGF2ZSB0aGVtIGluIGEgY29tbW9uCnBsYWNlLiBXZSBldmVuIGhhdmUgdGhpcyBw
bGFjZSBhbHJlYWR5OiBzcGlfbm9yX3NldF9hZGRyX3dpZHRoKCkuCkFsc28geW91IGNvdWxkIHBy
b2JhYmx5IGdldCByaWQgb2YgdGhhdCAiZG9uJ3QgY2hhbmdlIG9wY29kZXMKaWYgU05PUl9GX0hB
U180QkFJVCBpcyBzZXQiIHRoaW5neSBpZiB0aGUgcGFyc2luZyBjb2RlIHdvdWxkbid0CmNoYW5n
ZSB0aGUgb3Bjb2RlcyBidXQgcmV0dXJucyB0aGUgcGFyc2VkIG9uZXMgZm9yIHRoZSBjb3JlCnRv
IGRlY2lkZSB3aGF0IHRvIHVzZS4gV2l0aCB0aGUgYmVuZWZpdCBvZiBiZXR0ZXIgcmVhZGFiaWxp
dHkKYW5kIGxlc3NlciBidWdzLgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
