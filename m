Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5004FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bigCstA2YfGrUOdunK+rU7ZBy5wr8qu6YMlx7DQ32V4=; b=M7wVQyD6RHdyL2NfSdbJ02PG4K
	Wdjzai9llMxAIQYfF0nutNWDNHgGBpVPawTVyAD/8yDhQqDkRMW+rYR+m7xw/EuMj/cUtXuij+GGE
	XlZ02cczsn+MDd/MdCqoTGGkZOiSvigMR62Tf/ogrRS0Slm9weGZO4lltBMfcskZJ+pwcPKTIS7bW
	DKsEuvfOpVuOdRJfXZOucgubN3Tghr8ZqGGnovR7bLJiw+/Yxfb9Y8XeWlDM5SFyiQ85PyPyT5Dem
	sdB678NcaOPWq1QxCcAVW+RNljbBfmtVadFo6LXpzgoGF+wzZAlKiFeN1FiHKkU47fbngjU++Olpn
	9zseg3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPmoN-006heY-0N; Thu, 03 Mar 2022 14:52:11 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPmo7-006hb5-Cw; Thu, 03 Mar 2022 14:51:58 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C03EE2223B;
 Thu,  3 Mar 2022 15:51:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646319110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MESaQXOZFqQ/rx3dzdeTzRIrlKK2gAcP6t3Ddw9A/w=;
 b=m9tW0WeRvyeigxQHCRPYO1q8dxVtb8Wh3XtjWXK/fSopGxQsIAQJVTx3/BAsfBxg0M4u+S
 XenYBk0rchqdbla4JkvroQ1t0Nl4lcPKSse/yNsSbXuzmwTAT5o6+yBsOJ8vyYXyE+latq
 ENL6/+lozY/UW7T2vAbNdeeP110CTbc=
MIME-Version: 1.0
Date: Thu, 03 Mar 2022 15:51:47 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between
 SFDP & non-SFDP flashes
In-Reply-To: <72679fc7-42e4-d7b8-1fb9-463f225217fc@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-3-tudor.ambarus@microchip.com>
 <328762851786f1158505f9159ba3e5bc@walle.cc>
 <72679fc7-42e4-d7b8-1fb9-463f225217fc@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <9ef79f480651777e0da4309a039070d0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_065156_085141_3BDDF232 
X-CRM114-Status: GOOD (  24.03  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0wMy0wMyAxNTo0MSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMy8xLzIyIDIzOjUyLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IAo+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBBbSAyMDIyLTAyLTI4IDE0OjQ1LCBzY2hy
aWViIFR1ZG9yIEFtYmFydXM6Cj4+PiBBIHR5cGljYWwgZGlmZmVyZW50aWF0b3IgYmV0d2VlbiBm
bGFzaGVzIHdob3NlIElEIGNvbGxpZGUgaXMgd2hldGhlcgo+Pj4gdGhleQo+Pj4gc3VwcG9ydCBT
RkRQIG9yIG5vdC4gRm9yIHN1Y2ggYSBjb2xsaXNpb24gdGhlcmUgd2lsbCBiZSBhIHNpbmdsZQo+
Pj4gZmxhc2hfaW5mbyBlbnRyeSB3aGVyZSB0aGUgZGV2ZWxvcGVyIHNob3VsZCBzcGVjaWZ5Ogo+
Pj4gMS8gUEFSU0VfU0ZEUCAtIHNvIHRoYXQgdGhlIGZsYXNoIHRoYXQgc3VwcG9ydHMgU0ZEUCB0
byBpbml0aWFsaXplIAo+Pj4gaXRzCj4+PiDCoMKgIHBhcmFtZXRlcnMgYnkgcGFyc2luZyB0aGUg
U0ZEUCB0YWJsZXMKPj4+IDIvIGFueSBvZiB0aGUgbm9fc2ZkcF9mbGFncyBsZXNzIFNQSV9OT1Jf
U0tJUF9TRkRQLCB0byBpbml0aWFsaXplIHRoZQo+Pj4gwqDCoCBmbGFzaCBwYXJhbWV0ZXJzIHZp
YSB0aGUgc3RhdGljIG5vX3NmZHBfZmxhZ3MgZm9yIHRoZSBmbGFzaCB0aGF0Cj4+PiDCoMKgIGRv
ZXNuJ3Qgc3VwcG9ydCBTRkRQLgo+Pj4gVXNlIHRoZSBsb2dpYyB0aGUgYWJvdmUgdG8gaGFuZGxl
IElEIGNvbGxpc2lvbnMgYmV0d2VlbiBTRkRQICYgCj4+PiBub24tU0ZEUAo+Pj4gZmxhc2hlcy4K
Pj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNy
b2NoaXAuY29tPgo+Pj4gLS0tCj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIHwgMTMg
KysrKysrKysrKystLQo+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4+IAo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4+IGluZGV4IGZiZjMyNzhiYTI5YS4u
YWVmMDAxNTFjMTE2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMK
Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+PiBAQCAtMjYzOSw4ICsyNjM5
LDE3IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9pbml0X3BhcmFtcyhzdHJ1Y3Qgc3BpX25vcgo+Pj4g
Km5vcikKPj4+IMKgwqDCoMKgwqAgaWYgKG5vci0+aW5mby0+cGFyc2Vfc2ZkcCkgewo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc3BpX25vcl9wYXJzZV9zZmRwKG5vcik7Cj4+
IAo+PiBDYW4gd2UgcmV0dXJuIC1FTk9FTlQgaGVyZSBpZiBzZmRwIGlzbid0IHN1cHBvcnRlZCwg
c28gd2UKPj4gY2FuIGRpZmZlcmVudGlhdGUgYmV0d2VlbiAibm8gc2ZkcCBwcmVzZW50IiBhbmQg
b3RoZXIgZXJyb3JzPwo+IAo+IEknbGwgdGFrZSBhIGxvb2suCj4gCj4+IAo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihub3ItPmRldiwgIkJGUFQgcGFyc2luZyBmYWlsZWQu
IFBsZWFzZSAKPj4+IGNvbnNpZGVyIHVzaW5nCj4+PiBTUElfTk9SX1NLSVBfU0ZEUCB3aGVuIGRl
Y2xhcmluZyB0aGUgZmxhc2hcbiIpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8qCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICogSGFuZGxlIElEIGNvbGxpc2lvbnMgYmV0d2VlbiBmbGFzaGVzIHRoYXQgCj4+PiBz
dXBwb3J0Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICog
U0ZEUCBhbmQgZmxhc2hlcyB0aGF0IGRvbid0LiBJbml0aWFsaXplIAo+Pj4gcGFyYW1ldGVycwo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGZvciB0aGUg
Zmxhc2ggdGhhdCBkb2Vzbid0IHN1cHBvcnQgU0ZEUC4KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChub3ItPmluZm8tPm5vX3NmZHBfZmxhZ3MgJiAKPj4+IH5TUElf
Tk9SX1NLSVBfU0ZEUCkgewo+PiAKPj4gU2hvdWxkbid0IHRoaXMgYmUKPj4gaWYgKCEobm9yLT5p
bmZvLT5ub19zZmRwX2ZsYWdzICYgU1BJX05PUl9TS0lQX1NGRFApKQoKQWhoIEkgbWlzcmVhZCB0
aGF0IGZvciB0aGUgInNraXAgbm8gc2Z0cCBoYW5kbGluZyIuIEJ1dCBkb2Vzbid0IHJlbmRlcgpt
eSBwb2ludCBiZWxvdyBpbnZhbGlkLgoKPiBObywgYmVjYXVzZSB0aGlzIHdpbGwgYmUgdHJ1ZSB3
aGVuIG5vX3NmZHBfZmxhZ3MgaXMgemVybywgYW5kIHRoZSAKPiBtZXRob2QKPiBmcm9tIGJlbG93
IHdpbGwgYmUgY2FsbGVkLiBJIHdvdWxkIGxpa2UgdG8gY2FsbCBpdCB3aGVuIGFueSBvZiB0aGUK
PiBub19zZmRwX2ZsYWdzIGFyZSBkZWZpbmVkLCBsZXNzIHRoZSBTUElfTk9SX1NLSVBfU0ZEUCBm
bGFnLgoKWW91IHNob3VsZCBhZGQgYSBjb21tZW50IHRoZW4uCgo+IFNvIHdoZW4gb25lCj4gZGVj
bGFyZXMgYSBmbGFzaCBsaWtlOgo+ICsgICAgICB7ICJteDI1bDMyMDVkIiwgIElORk8oMHhjMjIw
MTYsIDAsIDY0ICogMTAyNCwgIDY0KQo+ICsgICAgICAgICAgICAgLyogSUQgY29sbGlzaW9uIHdp
dGggbXgyNWwzMjMzZi4gKi8KPiArICAgICAgICAgICAgIFBBUlNFX1NGRFAKPiArICAgICAgICAg
ICAgIE5PX1NGRFBfRkxBR1MoU0VDVF80SykKCkJ1dCB3aGF0IGFib3V0CisgICAgICB7ICJkaWZm
ZXJlbnRmbGFzaCIsICBJTkZPKDB4YzIyMDE2LCAwLCA2NCAqIDEwMjQsICA2NCkKKyAgICAgICAg
ICAgICAvKiBJRCBjb2xsaXNpb24gd2l0aCBteDI1bDMyMzNmLiAqLworICAgICAgICAgICAgIFBB
UlNFX1NGRFAKClRoYXRzIGFsc28gdmFsaWQsIG5vPyBXaHkgaXMgaGF2aW5nIDRrIHNlY3RvcnMg
c3BlY2lhbD8gRldJVywgdGhlCmZ1bmN0aW9uIG5vdCBvbmx5IGhhbmRsZXMgbm9fc2ZkcF9mbGFn
cyBidXQgYWxzbyBlcmFzZSByZWxhdGVkCnRoaW5ncy4KClNvIGluIHN1bW1hcnksIHRoZSBub3Nm
ZHAgaGFuZGxpbmcgaXMgYWx3YXlzIGNhbGxlZCB3aGVuIHBhcnNpbmcKZmFpbHMgKHRoYXQgaXMg
d2hlbiB0aGVyZSBpcyBubyBTRkRQLCBub3QgZHVlIHRvIHJlYWQgZXJyb3JzIG9yCnNpbWlsYXIp
LiBJIGRvbid0IHNlZSB3aHkgdGhhdCBzaG91bGRuJ3QgYmUgdGhlIGNhc2UuCgotbWljaGFlbAoK
PiBGaXJzdCB3ZSB3aWxsIHRyeSB0byByZXRyaWV2ZSB0aGUgZmxhc2ggcGFyYW1zIGZyb20gU0ZE
UC4gSWYgU0ZEUCAKPiBmYWlscywKPiB0aGVuIHdlJ2xsIGluaXQgdGhlIGZsYXNoIGJhc2VkIG9u
IHRoZSBub19zZmRwX2ZsYWdzLiBJZiBTRkRQIHN1Y2NlZWRzCj4gdGhlIG5vX3NmZHBfZmxhZ3Mg
aXMgaWdub3JlZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
