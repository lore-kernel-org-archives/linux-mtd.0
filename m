Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE00DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 07:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDSdlWVcFRHLjCuFYasyMfVFxmrwfCH7yiOd/nApxZc=; b=pXWsfABwHMoJ7x/xXRsE4UVRrS
	n2VsFnct27apnCS8KJ3q7bz4X44kEG95UJRrh1mT3Cco0TxuP/sc6PCSeccNkAUyr85SiUKhECrOB
	o5Bly04zhirIM54iVzidcOC7g6iH3o3xZn3p60QEvpTo2lAwfCF97dw84kfsomuJZ+CHw/NmUTEkG
	qUB+G+oWdCpbE9joRJdEUk1H7AfHjOf1HehoctSjVjLpLEpeVey5TUZwgjpMVdOn1EbAGUDsn//yL
	SfQ/NTXrBFxx1qLfVCFH6Rj16nEhTh/zQ18oAui/Os6Jrd79sk5lSohF5KRRgYJCkaBVOY53cAPov
	Wy4c8B6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU1Xb-0085Wq-Q1; Tue, 15 Mar 2022 07:24:23 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU1XY-0085VY-Ex
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 07:24:22 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id ECD4122175;
 Tue, 15 Mar 2022 08:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647329058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Htjix7TSLCItIjRZsFkiAlRrbgCghf5IE1f0p+mejCE=;
 b=MWWVFhhMIV56Xqginm6itLLbY/zNFKO682NEw/sXlf/V/4ANGelr6xB06ElOyJ0N/uDNnx
 F0ll3I+6kKz+RpkWQXIzptRcuirn9IrgWvo9BuOlnGjf5m7aMIsHl4qJaZ5XWV7rByRAQa
 r50hNgxud4MBhuPqftAmQgIExjYtzXU=
MIME-Version: 1.0
Date: Tue, 15 Mar 2022 08:24:17 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, heiko.thiery@gmail.com
Subject: Re: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
In-Reply-To: <33464af7-b445-6229-a02d-703a5ce6b5ef@microchip.com>
References: <20220304185137.3376011-1-michael@walle.cc>
 <7f339d0c-5ca9-261c-a545-d4ebf3bda140@microchip.com>
 <92cde38c-d398-44f4-26f8-ef4919f5944e@microchip.com>
 <7f947928e7189f98eb950828990b3920@walle.cc>
 <91393780-1521-09b7-8dea-14c65e18b37e@microchip.com>
 <0cf8dbbf4ad005abd3db825fb257dedd@walle.cc>
 <33464af7-b445-6229-a02d-703a5ce6b5ef@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <77c2c64f362b08cbbdab517bbaa49101@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_002420_824116_FF766FEE 
X-CRM114-Status: GOOD (  32.65  )
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

QW0gMjAyMi0wMy0xNSAwNjo1NSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMy8xNC8yMiAyMjo0MiwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyAKPj4gdGhlIGNvbnRlbnQgaXMgc2FmZQo+PiAKPj4gQW0gMjAyMi0wMy0wOSAwNTo0OSwgc2No
cmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206Cj4+PiBPbiAzLzcvMjIgMjA6NTYsIE1p
Y2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgCj4+Pj4ga25vdwo+Pj4+IHRoZSBjb250
ZW50IGlzIHNhZmUKPj4+PiAKPj4+PiBBbSAyMDIyLTAzLTA3IDEwOjIzLCBzY2hyaWViIFR1ZG9y
LkFtYmFydXNAbWljcm9jaGlwLmNvbToKPj4+Pj4gT24gMy83LzIyIDA5OjEyLCBUdWRvci5BbWJh
cnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQo+Pj4+Pj4ga25vdwo+Pj4+
Pj4gdGhlIGNvbnRlbnQgaXMgc2FmZQo+Pj4+Pj4gCj4+Pj4+PiBPbiAzLzQvMjIgMjA6NTEsIE1p
Y2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UKPj4+Pj4+PiBrbm93IHRoZSBjb250
ZW50IGlzIHNhZmUKPj4+Pj4+PiAKPj4+Pj4+PiBXaGlsZSB0aGUgZmlyc3QgdmVyc2lvbiBvZiBK
RVNEMjE2IHNwZWNpZnkgdGhlIG9wY29kZSBmb3IgNCBiaXQgCj4+Pj4+Pj4gSS9PCj4+Pj4+Pj4g
YWNjZXNzZXMsIGl0IGxhY2tzIGluZm9ybWF0aW9uIG9uIGhvdyB0byBhY3R1YWxseSBlbmFibGUg
dGhpcyAKPj4+Pj4+PiBtb2RlLgo+Pj4+Pj4+IAo+Pj4+Pj4+IEZvciBub3csIHRoZSBvbmUgc2V0
IGluIHNwaV9ub3JfaW5pdF9kZWZhdWx0X3BhcmFtcygpIHdpbGwgYmUgCj4+Pj4+Pj4gdXNlZC4K
Pj4+Pj4+PiBCdXQgdGhpcyBvbmUgaXMgbGlrZWx5IHdyb25nIGZvciBzb21lIGZsYXNoZXMsIGlu
IHBhcnRpY3VsYXIgdGhlCj4+Pj4+Pj4gTWFjcm9uaXggTVgyNUwxMjgzNUYuIFRodXMgd2UgbmVl
ZCB0byBjbGVhciB0aGUgZW5hYmxlIG1ldGhvZCAKPj4+Pj4+PiB3aGVuCj4+Pj4+Pj4gcGFyc2lu
ZyB0aGUgU0ZEUC4gRmxhc2hlcyB3aXRoIHN1Y2ggYW4gU0ZEUCByZXZpc2lvbiB3aWxsIGhhdmUg
dG8KPj4+Pj4+PiB1c2UKPj4+Pj4+PiBhCj4+Pj4+Pj4gZmxhc2ggKGFuZCBTRkRQIHJldmlzaW9u
KSBzcGVjaWZpYyBmaXh1cC4KPj4+Pj4+PiAKPj4+Pj4+PiBUaGlzIG1pZ2h0IGJyZWFrIHF1YWQg
SS9PIGZvciBzb21lIGZsYXNoZXMgd2hpY2ggcmVsaWVkIG9uIHRoZQo+Pj4+Pj4+IHNwaV9ub3Jf
c3IyX2JpdDFfcXVhZF9lbmFibGUoKSB0aGF0IHdhcyBmb3JtZXJseSBzZXQuIElmIHlvdXIKPj4+
Pj4+PiBiaXNlY3QKPj4+Pj4+PiB0dXJucyB1cCB0aGlzIGNvbW1pdCwgeW91J2xsIHByb2JhYmx5
IGhhdmUgdG8gc2V0IHRoZSBwcm9wZXIKPj4+Pj4+PiBxdWFkX2VuYWJsZSBtZXRob2QgaW4gYSBw
b3N0X2JmcHQoKSBmaXh1cCBmb3IgeW91ciBmbGFzaC4KPj4+Pj4+PiAKPj4+Pj4+IAo+Pj4+Pj4g
UmlnaHQsIEkgbWVhbnQgYWRkaW5nIGEgcGFyYWdyYXBoIHN1Y2ggYXMgdGhlIG9uZSBmcm9tIGFi
b3ZlLgo+Pj4+Pj4gCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFl
bEB3YWxsZS5jYz4KPj4+Pj4+PiBUZXN0ZWQtYnk6IEhlaWtvIFRoaWVyeSA8aGVpa28udGhpZXJ5
QGdtYWlsLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiBjaGFuZ2VzIHNpbmNlIFJGQzoKPj4+Pj4+
PiDCoC0gcmV3b3JkZWQgY29tbWl0IG1lc3NhZ2UKPj4+Pj4+PiDCoC0gYWRkZWQgY29tbWVudCBh
Ym91dCBwb3N0X2JmcHQgaG9vawo+Pj4+Pj4+IAo+Pj4+Pj4+IFR1ZG9yLCBJJ20gbm90IHN1cmUg
d2hhdCB5b3UgbWVhbnQgd2l0aAo+Pj4+Pj4+IMKgIE1heWJlIHlvdSBjYW4gdXBkYXRlIHRoZSBj
b21taXQgbWVzc2FnZSBhbmQgZXhwbGFpbiB3aHkgd291bGQKPj4+Pj4+PiBzb21lCj4+Pj4+Pj4g
wqAgZmxhc2hlcyBmYWlsIHRvIGVuYWJsZSBxdWFkIG1vZGUsIHNpbWlsYXIgdG8gd2hhdCBJIGRp
ZC4KPj4+Pj4+PiAKPj4+Pj4+PiBJdCBkb2Vzbid0IHdvcmsgYmVjYXVzZSB0aGUgd3JvbmcgbWV0
aG9kIGlzIGNob3Nlbj8gOykKPj4+Pj4+PiAKPj4+Pj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3Iv
c2ZkcC5jIHwgMTEgKysrKysrKysrKy0KPj4+Pj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Pj4gCj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4+Pj4+Pj4gYi9kcml2ZXJzL210ZC9zcGktbm9yL3Nm
ZHAuYwo+Pj4+Pj4+IGluZGV4IGE1MjExNTQzZDMwZC4uNmJiYTliNjAxODQ2IDEwMDY0NAo+Pj4+
Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4+Pj4+Pj4gKysrIGIvZHJpdmVy
cy9tdGQvc3BpLW5vci9zZmRwLmMKPj4+Pj4+PiBAQCAtNTQ5LDYgKzU0OSwxNiBAQCBzdGF0aWMg
aW50IHNwaV9ub3JfcGFyc2VfYmZwdChzdHJ1Y3Qgc3BpX25vcgo+Pj4+Pj4+ICpub3IsCj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqAgbWFwLT51bmlmb3JtX2VyYXNlX3R5cGUgPSBtYXAtPnVuaWZvcm1f
cmVnaW9uLm9mZnNldCAmCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNOT1JfRVJBU0VfVFlQRV9NQVNLOwo+
Pj4+Pj4+IAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqAgLyoKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
KiBUaGUgZmlyc3QgSkVTRDIxNiByZXZpc2lvbiBkb2Vzbid0IHNwZWNpZnkgYSBtZXRob2QgdG8K
Pj4+Pj4+PiBlbmFibGUKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgKiBxdWFkIG1vZGUuIHNwaV9u
b3JfaW5pdF9kZWZhdWx0X3BhcmFtcygpIHdpbGwgc2V0IGEKPj4+Pj4+PiBsZWdhY3kKPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgKiBkZWZhdWx0IG1ldGhvZCB0byBlbmFibGUgcXVhZCBtb2RlLiBX
ZSBoYXZlIHRvIGRpc2FibGUKPj4+Pj4+PiBpdAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAqIGFn
YWluLgo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAqIEZsYXNoZXMgd2l0aCB0aGlzIEpFU0QyMTYg
cmV2aXNpb24gbmVlZCB0byBzZXQgdGhlCj4+Pj4+Pj4gcXVhZF9lbmFibGUKPj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgKiBtZXRob2QgaW4gdGhlaXIgcG9zdF9iZnB0KCkgZml4dXAgaWYgdGhleSB3
YW50IHRvIHVzZQo+Pj4+Pj4+IHF1YWQKPj4+Pj4+PiBJL08uCj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgICovCj4+Pj4+PiAKPj4+Pj4+IEdyZWF0LiBMb29rcyBnb29kIHRvIG1lLiBJJ2xsIGNoYW5n
ZSB0aGUgc3ViamVjdCB0byAibXRkOiBzcGktbm9yOgo+Pj4+Pj4gc2ZkcDoiCj4+Pj4+PiB3aGVu
IGFwcGx5aW5nLgo+Pj4+PiAKPj4+Pj4gQXMgd2UgdGFsa2VkIG9uIHRoZSBtZWV0aW5nLCB3ZSBj
YW4gaW5zdGVhZCBtb3ZlIHRoZSBkZWZhdWx0IHF1YWQKPj4+Pj4gbW9kZQo+Pj4+PiBpbml0Cj4+
Pj4+IHRvIHRoZSBkZXByZWNhdGVkIHdheSBvZiBpbml0aWFsaXppbmcgdGhlIHBhcmFtcywgb3Iv
YW5kIHRvIHdoZXJlCj4+Pj4+IFNLSVBfU0ZEUAo+Pj4+PiBpcyB1c2VkLiBUaGlzIHdheSB5b3Un
bGwgbm8gbG9uZ2VyIG5lZWQgdG8gY2xlYXIgaXQgaGVyZS4KPj4+PiAKPj4+PiBNaCwgSSBqdXN0
IGhhZCBhIGxvb2sgYW5kIEknbSBub3Qgc3VyZSBpdCB3aWxsIHdvcmsgdGhlcmUsCj4+Pj4gYmVj
YXVzZSBpbiB0aGUgZGVwcmVjYXRlZCB3YXksIHRoZSBTRkRQIGlzIHN0aWxsIHBhcnNlZCBhbmQK
Pj4+PiB0aHVzIHdlIG1pZ2h0IHN0aWxsIGhhdmUgdGhlIHdyb25nIGVuYWJsZSBtZXRob2QgZm9y
IGZsYXNoZXMKPj4+PiB3aGljaCBkb24ndCBoYXZlIFBBUlNFX1NGRFAgc2V0Lgo+Pj4gCj4+PiBN
b3ZpbmcgdGhlIGRlZmF1bHQgcXVhZF9lbmFibGUgbWV0aG9kIHRvIAo+Pj4gc3BpX25vcl9ub19z
ZmRwX2luaXRfcGFyYW1zKCksCj4+PiB0aHVzIGFsc28gZm9yIHNwaV9ub3JfaW5pdF9wYXJhbXNf
ZGVwcmVjYXRlZCgpIGJlY2F1c2UgaXQgY2FsbHMKPj4+IHNwaV9ub3Jfbm9fc2ZkcF9pbml0X3Bh
cmFtcygpLCB3aWxsIG5vdCBjaGFuZ2UgdGhlIGJlaGF2aW9yIGZvciB0aGUKPj4+IGRlcHJlY2F0
ZWQgd2F5IG9mIGluaXRpYWxpemluZyB0aGUgcGFyYW1zLCBpc24ndCBpdD8KPj4gCj4+IFdoYXQg
ZG8geW91IG1lYW4/IFRoZSBiZWhhdmlvciBpcyBub3QgY2hhbmdlZCBhbmQgdGhlIGJ1ZyBpcyBu
b3QKPj4gZml4ZWQgZm9yIHRoZSBmbGFzaGVzIHdoaWNoIHVzZSB0aGUgZGVwcmVjYXRlZCB3YXku
IEl0IHdpbGwgZ2V0Cj4+IG92ZXJ3cml0dGVuIGJ5IHRoZSBzcGlfbm9yX3BhcnNlX3NmZHAgY2Fs
bCBpbgo+PiBzcGlfbm9yX3NmZHBfaW5pdF9wYXJhbXNfZGVwcmVjYXRlZCgpLgo+IAo+IHJpZ2h0
LCBpdCB3aWxsIG5vdCBjaGFuZ2UgdGhlIGxvZ2ljIGZvciB0aGUgZGVwcmVjYXRlZCB3YXkgb2Yg
Cj4gaW5pdGlhbGl6aW5nCj4gdGhlIHBhcmFtcy4KPiAKPj4gCj4+PiBBIG1vcmUgcmVhc29uCj4+
PiB0byB1c2UgUEFSU0VfU0ZEUC9TS0lQX1NGRFAsIHdlJ2xsIGdldCByaWQgb2YgdGhlIGRlcHJl
Y2F0ZWQgcGFyYW1zCj4+PiBpbml0IGF0IHNvbWUgcG9pbnQuCj4+PiAKPj4+IE5vIG5ldyBmaXhl
cyBmb3Igc3BpX25vcl9pbml0X3BhcmFtc19kZXByZWNhdGVkKCkuCj4+IAo+PiBIbSwgc28gd2Ug
ZGVsaWJlcmF0ZWx5IHdvbid0IGZpeCBrbm93biBidWdzIHRoZXJlPyBJJ20gbm90IHN1cmUKPj4g
SSdkIGFncmVlIGhlcmUuIEVzcC4gYmVjYXVzZSBpdCBpcyBoYXJkIHRvIGRlYnVnIGFuZCBtaWdo
dCBldmVuCj4+IGRlcGVuZCBvbiBub24tdm9sYXRpbGUgc3RhdGUgb2YgdGhlIGZsYXNoLgo+PiAK
PiAKPiBldmVuIG1vcmUgYSByZWFzb24gdG8gc3dpdGNoIHRvIHRoZSByZWNvbW1lbmRlZCB3YXkg
b2YgaW5pdGlhbGl6aW5nCj4gdGhlIGZsYXNoLiBXZSdsbCBnZXQgcmlkIG9mIHRoZSBkZXByZWNh
dGVkIGNvZGUgYW55d2F5LCBubz8KCkkgZ2V0IHlvdXIgcG9pbnQuIEJ1dCBJIGRpc2FncmVlIHdp
dGggeW91IG9uIHRoYXQgcG9pbnQgOikgRmVhdHVyZXM/CnN1cmUgd2UgY2FuIHNheSB0aGlzIHNo
b3VsZG4ndCBnbyB0byBhbnkgZGVwcmVjdGF0ZWQgY29kZSBmbG93IGFuZAptaWdodCBwb2tlIHVz
ZXJzIHRvIHBvc3QgYSBwYXRjaC4gQnV0IGJ1ZyBmaXhlcz8gSSBkb24ndCB0aGluawp3ZSBzaG91
bGQgaG9sZCB0aGVzZSBiYWNrLgpDb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0IHdlIGNhbiBn
ZXQgcmlkIG9mIHRoZSBkZXByZWNhdGVkIHdheQpvbmx5IGlmIGFsbCB0aGUgZmxhc2hlcyBhcmUg
Y29udmVydGVkIHRvIFBBUlNFX1NGRFAgb3IgU0tJUF9TRkRQLApyaWdodD8gQW5kIEkgZG9uJ3Qg
c2VlIHRoaXMgaGFwcGVuaW5nIGFueXRpbWUgc29vbi4KCi1taWNoYWVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
