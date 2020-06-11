Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F28EC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:47:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3223F206C3
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o7OF4xWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3223F206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfjNBl1eXax3qhQeFYRVJuVIpQKG0U/9JXrnLD/T7ng=; b=o7OF4xWK2z4VV4
	Iew+p7aFg0EMT4JJVoMJV+pTmVW6xAZ+4guB5C0LElghq0Yd8mEWu6eJA3gv8sHWfOPeo0csT0Kc4
	ntjhPCaVu4kSAs2kFhwR3RTkpyEj1ICFnY2XXcSzY8XVTPADz+RO+39qUO5ors5s9uUeF59clEvH1
	WOS0SiTzw7s4AsTZ0bVOYKedaMYSpEKIs4cX5jA7SJkL+g+dueesoqaP/NDi7mFj1SWKmwgv7IXcC
	+GlsVaPfO1pR2aQCxw0DUAlD3EnLfm4vfW2UqaOvKhYvBYhjF1u18SAzASnZncS4W7hDK1ieQp4uo
	YWkuk73ovawXP5PcajDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjPPn-0000aX-8a; Thu, 11 Jun 2020 15:46:51 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjPPA-0008D1-U2; Thu, 11 Jun 2020 15:46:14 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0E8222000A;
 Thu, 11 Jun 2020 15:46:06 +0000 (UTC)
Date: Thu, 11 Jun 2020 17:46:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200611174605.11fb6e84@xps13>
In-Reply-To: <715b0947-f4dd-0c04-5c52-5da06c04d665@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
 <20200608160649.3717152-1-noltari@gmail.com>
 <20200611095540.250184d2@xps13>
 <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
 <715b0947-f4dd-0c04-5c52-5da06c04d665@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_084613_117491_9573D067 
X-CRM114-Status: GOOD (  17.32  )
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
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>,
 vigneshr@ti.com, richard@nod.at, linus.walleij@linaro.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 tsbogend@alpha.franken.de, bcm-kernel-feedback-list@broadcom.com,
 Jonas Gorski <jonas.gorski@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CkZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPiB3cm90ZSBvbiBUaHUsIDEx
IEp1biAyMDIwCjA4OjQyOjQyIC0wNzAwOgoKPiBPbiA2LzExLzIwMjAgODoxNiBBTSwgw4FsdmFy
byBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+ID4gSGkgTWlxdWVsLAo+ID4gICAKPiA+PiBFbCAx
MSBqdW4gMjAyMCwgYSBsYXMgOTo1NSwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4gZXNjcmliacOzOgo+ID4+Cj4gPj4gSGkgw4FsdmFybywKPiA+Pgo+ID4+IMOBbHZh
cm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgIDgg
SnVuIDIwMjAKPiA+PiAxODowNjo0OSArMDIwMDoKPiA+PiAgCj4gPj4+IEluc3RlYWQgb2YgdHJ5
aW5nIHRvIHBhcnNlIENGRSB2ZXJzaW9uIHN0cmluZywgd2hpY2ggaXMgY3VzdG9taXplZCBieSBz
b21lCj4gPj4+IHZlbmRvcnMsIGxldCdzIGp1c3QgY2hlY2sgdGhhdCAiQ0ZFMSIgd2FzIHBhc3Nl
ZCBvbiBhcmd1bWVudCAzLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7D
oW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKb25h
cyBHb3Jza2kgPGpvbmFzLmdvcnNraUBnbWFpbC5jb20+Cj4gPj4+IC0tLQo+ID4+PiB2MjogdXNl
IENGRV9FUFRTRUFMIGRlZmluaXRpb24gYW5kIGF2b2lkIHVzaW5nIGFuIGFkZGl0aW9uYWwgZnVu
dGlvbi4KPiA+Pj4KPiA+Pj4gZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jIHwgMjkg
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+Pj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYz
eHhwYXJ0LmMKPiA+Pj4gaW5kZXggNzhmOTBjNmMxOGZkLi40OTNhNzViMmYyNjYgMTAwNjQ0Cj4g
Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNjN4eHBhcnQuYwo+ID4+PiArKysgYi9k
cml2ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMKPiA+Pj4gQEAgLTIyLDYgKzIyLDkgQEAK
PiA+Pj4gI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+Cj4gPj4+ICNpbmNsdWRlIDxs
aW51eC9vZi5oPgo+ID4+Pgo+ID4+PiArI2luY2x1ZGUgPGFzbS9ib290aW5mby5oPgo+ID4+PiAr
I2luY2x1ZGUgPGFzbS9mdy9jZmUvY2ZlX2FwaS5oPiAgCj4gPj4KPiA+PiBBcmUgeW91IHN1cmUg
Ym90aCBpbmNsdWRlcyBhcmUgbmVlZGVkPyAgCj4gPiAKPiA+IGFzbS9ib290aW5mby5oIGlzIG5l
ZWRlZCBmb3IgZndfYXJnMyBhbmQgYXNtL2Z3L2NmZS9jZmVfYXBpLmggaXMgbmVlZGVkIGZvciBD
RkVfRVBUU0VBTC4KPiA+ICAgCj4gPj4KPiA+PiBJIGRvbid0IHRoaW5rIGl0IGlzIGEgZ29vZCBo
YWJpdCB0byBpbmNsdWRlIGFzbS8gaGVhZGVycywgYXJlIHlvdSBzdXJlCj4gPj4gdGhlcmUgaXMg
bm90IGFub3RoZXIgaGVhZGVyIGRvaW5nIGl0IGp1c3QgZmluZT8gIAo+ID4gCj4gPiBCb3RoIGFy
ZSBuZWVkZWQgdW5sZXNzIHlvdSB3YW50IHRvIGFkZCBhbm90aGVyIGRlZmluaXRpb24gb2YgQ0ZF
X0VQVFNFQUwgdmFsdWUuCj4gPiBUaGVyZSBhcmUgY3VycmVudGx5IHR3byBDRkUgbWFnaWMgZGVm
aW5pdGlvbnMsIHRoZSBvbmUgaW4gYXNtL2Z3L2NmZS9jZmVfYXBpLmggYW5kIGFub3RoZXIgb25l
IGluIGJjbTQ3eHhwYXJ0LmM6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
YmxvYi9tYXN0ZXIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2Z3L2NmZS9jZmVfYXBpLmgjTDI4Cj4g
PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9t
dGQvcGFyc2Vycy9iY200N3h4cGFydC5jI0wzMyAgCj4gCj4gVGhlIGNhdmVhdCB3aXRoIHRoYXQg
YXBwcm9hY2ggaXMgdGhhdCB0aGlzIHJlZHVjZXMgdGhlIGNvbXBpbGF0aW9uCj4gc3VyZmFjZSB0
byBNSVBTIGFuZCBCTUlQU19HRU5FUklDIGFuZCBCQ002M1hYIG9ubHksIHdoaWNoIGlzIGEgYml0
Cj4gc21hbGwuIElmIHdlIGNvdWxkIG1vdmUgdGhlIENGRSBkZWZpbml0aW9ucyB0byBhIHNoYXJl
ZCBoZWFkZXIsIGFuZAo+IGNvbnNvbGlkYXRlIHRoZSB2YWx1ZSB1c2VkIGJ5IGJjbTQ3eHhwYXJ0
LmMgYXMgd2VsbCwgdGhhdCB3b3VsZCBhbGxvdyB1cwo+IHRvIGJ1aWxkIHRoZSBiY202M3h4cGFy
dC5jIGZpbGUgd2l0aCBDT01QSUxFX1RFU1Qgb24gb3RoZXIKPiBhcmNoaXRlY3R1cmVzLiBUaGlz
IGRvZXMgbm90IHJlYWxseSBoYXZlIGZ1bmN0aW9uYWwgdmFsdWUsIGJ1dCBmb3IKPiBtYWludGFp
bmVycyBsaWtlIE1pcXVlbCwgaXQgYWxsb3dzIHRoZW0gdG8gcXVpY2tseSB0ZXN0IHRoZWlyIGVu
dGlyZQo+IGRyaXZlcnMvbXRkLyBkaXJlY3RvcnkuCgpBYnNvbHV0ZWx5IQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
