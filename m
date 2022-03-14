Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE67C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 20:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6fL+J+f67TTnJD3yHT6PdF89c7uhWvYpmkqA3bbAFY=; b=XdunkwulnzeAnCutkkf7AAClLz
	0Vl9auaLdRcfNI8d9TnjLzoH2TY+9bzpm50kuMLr0Zy0SdckP+UeUpFP5kwWTzBb1998LSsb4vgwI
	nTH3gU8xwlaKJDJNhuh5b5bGEk5wvrmuKa3e42MP/kVLKelONl/HO8rUjlowfVglUBiUpCd5WVmGF
	PjPvV8lmLXYc/s7i+xmVPO7m17Z9qeg725sQYY49hxLCXwM4j4b7Sv6SYVBDTUg5unTnCh8OLy1If
	mgdfArzz86LEmbU3uCxbgPFPLw40mRsFi5KOQR8W+c26J4AFtX8IZEuZpsqU7Ez/ut7iktSpmgk9y
	gIOYpGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTrWA-006qA7-Pp; Mon, 14 Mar 2022 20:42:14 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTrW6-006q7d-Qz
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 20:42:13 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8E06222175;
 Mon, 14 Mar 2022 21:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647290521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w84Z0F8O1Ah3HQhNPWrjd7zOfg1YqIIcdK9x95xpU6U=;
 b=hv5JGuPxRouNQNoH+0+wxjsYB02EVe+pSNl4g1F42+yvvEl8zCsr6uQ2c1COo9qlskVbuY
 VB/GTUQapSH8jy0LMTEREEPA3aSXWcslBhqbjFv+voeD1STzAesYZUCS1wzuv77Z+e0iWn
 CgRDRdYJRfqWTou0o5AsouYCMjaJsmY=
MIME-Version: 1.0
Date: Mon, 14 Mar 2022 21:42:01 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, heiko.thiery@gmail.com
Subject: Re: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
In-Reply-To: <91393780-1521-09b7-8dea-14c65e18b37e@microchip.com>
References: <20220304185137.3376011-1-michael@walle.cc>
 <7f339d0c-5ca9-261c-a545-d4ebf3bda140@microchip.com>
 <92cde38c-d398-44f4-26f8-ef4919f5944e@microchip.com>
 <7f947928e7189f98eb950828990b3920@walle.cc>
 <91393780-1521-09b7-8dea-14c65e18b37e@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0cf8dbbf4ad005abd3db825fb257dedd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_134211_188212_BE06C180 
X-CRM114-Status: GOOD (  28.20  )
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

QW0gMjAyMi0wMy0wOSAwNTo0OSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMy83LzIyIDIwOjU2LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IAo+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBBbSAyMDIyLTAzLTA3IDEwOjIzLCBzY2hy
aWViIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToKPj4+IE9uIDMvNy8yMiAwOToxMiwgVHVk
b3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IAo+Pj4+IGtub3cK
Pj4+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+Pj4gCj4+Pj4gT24gMy80LzIyIDIwOjUxLCBNaWNo
YWVsIFdhbGxlIHdyb3RlOgo+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQo+Pj4+PiBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUKPj4+Pj4gCj4+Pj4+IFdoaWxlIHRoZSBmaXJzdCB2ZXJzaW9uIG9mIEpFU0QyMTYgc3Bl
Y2lmeSB0aGUgb3Bjb2RlIGZvciA0IGJpdCBJL08KPj4+Pj4gYWNjZXNzZXMsIGl0IGxhY2tzIGlu
Zm9ybWF0aW9uIG9uIGhvdyB0byBhY3R1YWxseSBlbmFibGUgdGhpcyBtb2RlLgo+Pj4+PiAKPj4+
Pj4gRm9yIG5vdywgdGhlIG9uZSBzZXQgaW4gc3BpX25vcl9pbml0X2RlZmF1bHRfcGFyYW1zKCkg
d2lsbCBiZSB1c2VkLgo+Pj4+PiBCdXQgdGhpcyBvbmUgaXMgbGlrZWx5IHdyb25nIGZvciBzb21l
IGZsYXNoZXMsIGluIHBhcnRpY3VsYXIgdGhlCj4+Pj4+IE1hY3Jvbml4IE1YMjVMMTI4MzVGLiBU
aHVzIHdlIG5lZWQgdG8gY2xlYXIgdGhlIGVuYWJsZSBtZXRob2Qgd2hlbgo+Pj4+PiBwYXJzaW5n
IHRoZSBTRkRQLiBGbGFzaGVzIHdpdGggc3VjaCBhbiBTRkRQIHJldmlzaW9uIHdpbGwgaGF2ZSB0
byAKPj4+Pj4gdXNlCj4+Pj4+IGEKPj4+Pj4gZmxhc2ggKGFuZCBTRkRQIHJldmlzaW9uKSBzcGVj
aWZpYyBmaXh1cC4KPj4+Pj4gCj4+Pj4+IFRoaXMgbWlnaHQgYnJlYWsgcXVhZCBJL08gZm9yIHNv
bWUgZmxhc2hlcyB3aGljaCByZWxpZWQgb24gdGhlCj4+Pj4+IHNwaV9ub3Jfc3IyX2JpdDFfcXVh
ZF9lbmFibGUoKSB0aGF0IHdhcyBmb3JtZXJseSBzZXQuIElmIHlvdXIgCj4+Pj4+IGJpc2VjdAo+
Pj4+PiB0dXJucyB1cCB0aGlzIGNvbW1pdCwgeW91J2xsIHByb2JhYmx5IGhhdmUgdG8gc2V0IHRo
ZSBwcm9wZXIKPj4+Pj4gcXVhZF9lbmFibGUgbWV0aG9kIGluIGEgcG9zdF9iZnB0KCkgZml4dXAg
Zm9yIHlvdXIgZmxhc2guCj4+Pj4+IAo+Pj4+IAo+Pj4+IFJpZ2h0LCBJIG1lYW50IGFkZGluZyBh
IHBhcmFncmFwaCBzdWNoIGFzIHRoZSBvbmUgZnJvbSBhYm92ZS4KPj4+PiAKPj4+Pj4gU2lnbmVk
LW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPj4+Pj4gVGVzdGVkLWJ5
OiBIZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBj
aGFuZ2VzIHNpbmNlIFJGQzoKPj4+Pj4gwqAtIHJld29yZGVkIGNvbW1pdCBtZXNzYWdlCj4+Pj4+
IMKgLSBhZGRlZCBjb21tZW50IGFib3V0IHBvc3RfYmZwdCBob29rCj4+Pj4+IAo+Pj4+PiBUdWRv
ciwgSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW50IHdpdGgKPj4+Pj4gwqAgTWF5YmUgeW91IGNh
biB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBleHBsYWluIHdoeSB3b3VsZCAKPj4+Pj4g
c29tZQo+Pj4+PiDCoCBmbGFzaGVzIGZhaWwgdG8gZW5hYmxlIHF1YWQgbW9kZSwgc2ltaWxhciB0
byB3aGF0IEkgZGlkLgo+Pj4+PiAKPj4+Pj4gSXQgZG9lc24ndCB3b3JrIGJlY2F1c2UgdGhlIHdy
b25nIG1ldGhvZCBpcyBjaG9zZW4/IDspCj4+Pj4+IAo+Pj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1u
b3Ivc2ZkcC5jIHwgMTEgKysrKysrKysrKy0KPj4+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+PiAKPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL3NwaS1ub3Ivc2ZkcC5jIAo+Pj4+PiBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5j
Cj4+Pj4+IGluZGV4IGE1MjExNTQzZDMwZC4uNmJiYTliNjAxODQ2IDEwMDY0NAo+Pj4+PiAtLS0g
YS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGkt
bm9yL3NmZHAuYwo+Pj4+PiBAQCAtNTQ5LDYgKzU0OSwxNiBAQCBzdGF0aWMgaW50IHNwaV9ub3Jf
cGFyc2VfYmZwdChzdHJ1Y3Qgc3BpX25vcgo+Pj4+PiAqbm9yLAo+Pj4+PiDCoMKgwqDCoMKgwqDC
oCBtYXAtPnVuaWZvcm1fZXJhc2VfdHlwZSA9IG1hcC0+dW5pZm9ybV9yZWdpb24ub2Zmc2V0ICYK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFNOT1JfRVJBU0VfVFlQRV9NQVNLOwo+Pj4+PiAKPj4+Pj4gK8KgwqDC
oMKgwqDCoCAvKgo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgKiBUaGUgZmlyc3QgSkVTRDIxNiByZXZp
c2lvbiBkb2Vzbid0IHNwZWNpZnkgYSBtZXRob2QgdG8KPj4+Pj4gZW5hYmxlCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCAqIHF1YWQgbW9kZS4gc3BpX25vcl9pbml0X2RlZmF1bHRfcGFyYW1zKCkgd2ls
bCBzZXQgYSAKPj4+Pj4gbGVnYWN5Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAqIGRlZmF1bHQgbWV0
aG9kIHRvIGVuYWJsZSBxdWFkIG1vZGUuIFdlIGhhdmUgdG8gZGlzYWJsZSAKPj4+Pj4gaXQKPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgICogYWdhaW4uCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAqIEZsYXNo
ZXMgd2l0aCB0aGlzIEpFU0QyMTYgcmV2aXNpb24gbmVlZCB0byBzZXQgdGhlCj4+Pj4+IHF1YWRf
ZW5hYmxlCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAqIG1ldGhvZCBpbiB0aGVpciBwb3N0X2JmcHQo
KSBmaXh1cCBpZiB0aGV5IHdhbnQgdG8gdXNlIAo+Pj4+PiBxdWFkCj4+Pj4+IEkvTy4KPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgICovCj4+Pj4gCj4+Pj4gR3JlYXQuIExvb2tzIGdvb2QgdG8gbWUuIEkn
bGwgY2hhbmdlIHRoZSBzdWJqZWN0IHRvICJtdGQ6IHNwaS1ub3I6Cj4+Pj4gc2ZkcDoiCj4+Pj4g
d2hlbiBhcHBseWluZy4KPj4+IAo+Pj4gQXMgd2UgdGFsa2VkIG9uIHRoZSBtZWV0aW5nLCB3ZSBj
YW4gaW5zdGVhZCBtb3ZlIHRoZSBkZWZhdWx0IHF1YWQgCj4+PiBtb2RlCj4+PiBpbml0Cj4+PiB0
byB0aGUgZGVwcmVjYXRlZCB3YXkgb2YgaW5pdGlhbGl6aW5nIHRoZSBwYXJhbXMsIG9yL2FuZCB0
byB3aGVyZQo+Pj4gU0tJUF9TRkRQCj4+PiBpcyB1c2VkLiBUaGlzIHdheSB5b3UnbGwgbm8gbG9u
Z2VyIG5lZWQgdG8gY2xlYXIgaXQgaGVyZS4KPj4gCj4+IE1oLCBJIGp1c3QgaGFkIGEgbG9vayBh
bmQgSSdtIG5vdCBzdXJlIGl0IHdpbGwgd29yayB0aGVyZSwKPj4gYmVjYXVzZSBpbiB0aGUgZGVw
cmVjYXRlZCB3YXksIHRoZSBTRkRQIGlzIHN0aWxsIHBhcnNlZCBhbmQKPj4gdGh1cyB3ZSBtaWdo
dCBzdGlsbCBoYXZlIHRoZSB3cm9uZyBlbmFibGUgbWV0aG9kIGZvciBmbGFzaGVzCj4+IHdoaWNo
IGRvbid0IGhhdmUgUEFSU0VfU0ZEUCBzZXQuCj4gCj4gTW92aW5nIHRoZSBkZWZhdWx0IHF1YWRf
ZW5hYmxlIG1ldGhvZCB0byBzcGlfbm9yX25vX3NmZHBfaW5pdF9wYXJhbXMoKSwKPiB0aHVzIGFs
c28gZm9yIHNwaV9ub3JfaW5pdF9wYXJhbXNfZGVwcmVjYXRlZCgpIGJlY2F1c2UgaXQgY2FsbHMK
PiBzcGlfbm9yX25vX3NmZHBfaW5pdF9wYXJhbXMoKSwgd2lsbCBub3QgY2hhbmdlIHRoZSBiZWhh
dmlvciBmb3IgdGhlCj4gZGVwcmVjYXRlZCB3YXkgb2YgaW5pdGlhbGl6aW5nIHRoZSBwYXJhbXMs
IGlzbid0IGl0PwoKV2hhdCBkbyB5b3UgbWVhbj8gVGhlIGJlaGF2aW9yIGlzIG5vdCBjaGFuZ2Vk
IGFuZCB0aGUgYnVnIGlzIG5vdApmaXhlZCBmb3IgdGhlIGZsYXNoZXMgd2hpY2ggdXNlIHRoZSBk
ZXByZWNhdGVkIHdheS4gSXQgd2lsbCBnZXQKb3ZlcndyaXR0ZW4gYnkgdGhlIHNwaV9ub3JfcGFy
c2Vfc2ZkcCBjYWxsIGluCnNwaV9ub3Jfc2ZkcF9pbml0X3BhcmFtc19kZXByZWNhdGVkKCkuCgo+
IEEgbW9yZSByZWFzb24KPiB0byB1c2UgUEFSU0VfU0ZEUC9TS0lQX1NGRFAsIHdlJ2xsIGdldCBy
aWQgb2YgdGhlIGRlcHJlY2F0ZWQgcGFyYW1zCj4gaW5pdCBhdCBzb21lIHBvaW50Lgo+IAo+IE5v
IG5ldyBmaXhlcyBmb3Igc3BpX25vcl9pbml0X3BhcmFtc19kZXByZWNhdGVkKCkuCgpIbSwgc28g
d2UgZGVsaWJlcmF0ZWx5IHdvbid0IGZpeCBrbm93biBidWdzIHRoZXJlPyBJJ20gbm90IHN1cmUK
SSdkIGFncmVlIGhlcmUuIEVzcC4gYmVjYXVzZSBpdCBpcyBoYXJkIHRvIGRlYnVnIGFuZCBtaWdo
dCBldmVuCmRlcGVuZCBvbiBub24tdm9sYXRpbGUgc3RhdGUgb2YgdGhlIGZsYXNoLgoKLW1pY2hh
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
