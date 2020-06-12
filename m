Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D50C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:34:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7545E207F7
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZyvWUzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7545E207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYNAklugrJd1k3CgPa1w9XY5UpFLSLQbGf94q2F1pFU=; b=HZyvWUzogAfXbo
	VnUjaOtLBK96ZeLmMFLVYrfhkVJmmOpmUSY9gMig+3iZM7KeXaomE+hxkmzBpl7yTxQB8UvEIQgcM
	OqzR7zbsewordIse+paryHfbAk1bvkp9HMHi13retXcFmP+OJ/Y7hzOj/coHE5kbN2EutqU807s1Z
	B5auTCZOmLW4azqgvci3z9dLIh09x+6KfWlmIo28w4C42T9PShhuoWBRlPDc6e+8tl4bcoZdSAEr5
	SrD1l498KsmvfNlPgI38XaaJZ8SsbbvUgPxNrCkTPtQQz7fsWGmQt8OWFT1NTmVYdJ/65WNadITB2
	pe8/AW0h1/6NHCkWoj/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjeCQ-0002It-I7; Fri, 12 Jun 2020 07:34:02 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjeCE-00029U-AP; Fri, 12 Jun 2020 07:33:52 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 70333100007;
 Fri, 12 Jun 2020 07:33:46 +0000 (UTC)
Date: Fri, 12 Jun 2020 09:33:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200612093345.511f6d45@xps13>
In-Reply-To: <CBDB2BF7-07CB-4231-B200-86DE2BFE86A0@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
 <20200608160649.3717152-1-noltari@gmail.com>
 <20200611095540.250184d2@xps13>
 <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
 <715b0947-f4dd-0c04-5c52-5da06c04d665@gmail.com>
 <7DC0E349-1319-47FE-8565-9B30C190EACB@gmail.com>
 <20200612090252.02581c21@xps13>
 <CBDB2BF7-07CB-4231-B200-86DE2BFE86A0@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_003350_634574_8B6983E2 
X-CRM114-Status: GOOD (  22.05  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, vigneshr@ti.com, richard@nod.at,
 linus.walleij@linaro.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
 bcm-kernel-feedback-list@broadcom.com, Jonas Gorski <jonas.gorski@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgw4FsdmFybywKCsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+
IHdyb3RlIG9uIEZyaSwgMTIgSnVuIDIwMjAKMDk6MzA6MjcgKzAyMDA6Cgo+IEhpIE1pcXXDqGws
Cj4gCj4gPiBFbCAxMiBqdW4gMjAyMCwgYSBsYXMgOTowMiwgTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4gZXNjcmliacOzOgo+ID4gCj4gPiBIaSDDgWx2YXJvLAo+ID4g
Cj4gPiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPiB3cm90ZSBv
biBUaHUsIDExIEp1biAyMDIwCj4gPiAxODoxNDoyMCArMDIwMDoKPiA+ICAgCj4gPj4gSGkgRmxv
cmlhbiwKPiA+PiAgIAo+ID4+PiBFbCAxMSBqdW4gMjAyMCwgYSBsYXMgMTc6NDIsIEZsb3JpYW4g
RmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPiBlc2NyaWJpw7M6Cj4gPj4+IAo+ID4+PiAK
PiA+Pj4gCj4gPj4+IE9uIDYvMTEvMjAyMCA4OjE2IEFNLCDDgWx2YXJvIEZlcm7DoW5kZXogUm9q
YXMgd3JvdGU6ICAgIAo+ID4+Pj4gSGkgTWlxdWVsLAo+ID4+Pj4gICAKPiA+Pj4+PiBFbCAxMSBq
dW4gMjAyMCwgYSBsYXMgOTo1NSwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4gZXNjcmliacOzOgo+ID4+Pj4+IAo+ID4+Pj4+IEhpIMOBbHZhcm8sCj4gPj4+Pj4gCj4g
Pj4+Pj4gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4gd3JvdGUg
b24gTW9uLCAgOCBKdW4gMjAyMAo+ID4+Pj4+IDE4OjA2OjQ5ICswMjAwOgo+ID4+Pj4+ICAgCj4g
Pj4+Pj4+IEluc3RlYWQgb2YgdHJ5aW5nIHRvIHBhcnNlIENGRSB2ZXJzaW9uIHN0cmluZywgd2hp
Y2ggaXMgY3VzdG9taXplZCBieSBzb21lCj4gPj4+Pj4+IHZlbmRvcnMsIGxldCdzIGp1c3QgY2hl
Y2sgdGhhdCAiQ0ZFMSIgd2FzIHBhc3NlZCBvbiBhcmd1bWVudCAzLgo+ID4+Pj4+PiAKPiA+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWls
LmNvbT4KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9uYXMgR29yc2tpIDxqb25hcy5nb3Jza2lA
Z21haWwuY29tPgo+ID4+Pj4+PiAtLS0KPiA+Pj4+Pj4gdjI6IHVzZSBDRkVfRVBUU0VBTCBkZWZp
bml0aW9uIGFuZCBhdm9pZCB1c2luZyBhbiBhZGRpdGlvbmFsIGZ1bnRpb24uCj4gPj4+Pj4+IAo+
ID4+Pj4+PiBkcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMgfCAyOSArKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyNSBkZWxldGlvbnMoLSkKPiA+Pj4+Pj4gCj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYz
eHhwYXJ0LmMKPiA+Pj4+Pj4gaW5kZXggNzhmOTBjNmMxOGZkLi40OTNhNzViMmYyNjYgMTAwNjQ0
Cj4gPj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNjN4eHBhcnQuYwo+ID4+Pj4+
PiArKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMKPiA+Pj4+Pj4gQEAgLTIy
LDYgKzIyLDkgQEAKPiA+Pj4+Pj4gI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+Cj4g
Pj4+Pj4+ICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ID4+Pj4+PiAKPiA+Pj4+Pj4gKyNpbmNsdWRl
IDxhc20vYm9vdGluZm8uaD4KPiA+Pj4+Pj4gKyNpbmNsdWRlIDxhc20vZncvY2ZlL2NmZV9hcGku
aD4gICAgCj4gPj4+Pj4gCj4gPj4+Pj4gQXJlIHlvdSBzdXJlIGJvdGggaW5jbHVkZXMgYXJlIG5l
ZWRlZD8gICAgCj4gPj4+PiAKPiA+Pj4+IGFzbS9ib290aW5mby5oIGlzIG5lZWRlZCBmb3IgZndf
YXJnMyBhbmQgYXNtL2Z3L2NmZS9jZmVfYXBpLmggaXMgbmVlZGVkIGZvciBDRkVfRVBUU0VBTC4K
PiA+Pj4+ICAgCj4gPj4+Pj4gCj4gPj4+Pj4gSSBkb24ndCB0aGluayBpdCBpcyBhIGdvb2QgaGFi
aXQgdG8gaW5jbHVkZSBhc20vIGhlYWRlcnMsIGFyZSB5b3Ugc3VyZQo+ID4+Pj4+IHRoZXJlIGlz
IG5vdCBhbm90aGVyIGhlYWRlciBkb2luZyBpdCBqdXN0IGZpbmU/ICAgIAo+ID4+Pj4gCj4gPj4+
PiBCb3RoIGFyZSBuZWVkZWQgdW5sZXNzIHlvdSB3YW50IHRvIGFkZCBhbm90aGVyIGRlZmluaXRp
b24gb2YgQ0ZFX0VQVFNFQUwgdmFsdWUuCj4gPj4+PiBUaGVyZSBhcmUgY3VycmVudGx5IHR3byBD
RkUgbWFnaWMgZGVmaW5pdGlvbnMsIHRoZSBvbmUgaW4gYXNtL2Z3L2NmZS9jZmVfYXBpLmggYW5k
IGFub3RoZXIgb25lIGluIGJjbTQ3eHhwYXJ0LmM6Cj4gPj4+PiBodHRwczovL2dpdGh1Yi5jb20v
dG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2Z3L2NmZS9j
ZmVfYXBpLmgjTDI4Cj4gPj4+PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxv
Yi9tYXN0ZXIvZHJpdmVycy9tdGQvcGFyc2Vycy9iY200N3h4cGFydC5jI0wzMyAgICAKPiA+Pj4g
Cj4gPj4+IFRoZSBjYXZlYXQgd2l0aCB0aGF0IGFwcHJvYWNoIGlzIHRoYXQgdGhpcyByZWR1Y2Vz
IHRoZSBjb21waWxhdGlvbgo+ID4+PiBzdXJmYWNlIHRvIE1JUFMgYW5kIEJNSVBTX0dFTkVSSUMg
YW5kIEJDTTYzWFggb25seSwgd2hpY2ggaXMgYSBiaXQKPiA+Pj4gc21hbGwuIElmIHdlIGNvdWxk
IG1vdmUgdGhlIENGRSBkZWZpbml0aW9ucyB0byBhIHNoYXJlZCBoZWFkZXIsIGFuZAo+ID4+PiBj
b25zb2xpZGF0ZSB0aGUgdmFsdWUgdXNlZCBieSBiY200N3h4cGFydC5jIGFzIHdlbGwsIHRoYXQg
d291bGQgYWxsb3cgdXMKPiA+Pj4gdG8gYnVpbGQgdGhlIGJjbTYzeHhwYXJ0LmMgZmlsZSB3aXRo
IENPTVBJTEVfVEVTVCBvbiBvdGhlcgo+ID4+PiBhcmNoaXRlY3R1cmVzLiBUaGlzIGRvZXMgbm90
IHJlYWxseSBoYXZlIGZ1bmN0aW9uYWwgdmFsdWUsIGJ1dCBmb3IKPiA+Pj4gbWFpbnRhaW5lcnMg
bGlrZSBNaXF1ZWwsIGl0IGFsbG93cyB0aGVtIHRvIHF1aWNrbHkgdGVzdCB0aGVpciBlbnRpcmUK
PiA+Pj4gZHJpdmVycy9tdGQvIGRpcmVjdG9yeS4gICAgCj4gPj4gCj4gPj4gSSBkb27igJl0IHRo
aW5rIGZ3X2FyZzMgYXZhaWxhYmxlIG9uIG5vbiBtaXBzIGFyY2hzLCBpcyBpdD8KPiA+PiBJ4oCZ
bSBoYXBweSB0byBtb3ZlIGl0IHRvIGEgc2hhcmVkIGhlYWRlciAod2hpY2ggd291bGQgYmUgYSBn
b29kIGxvY2F0aW9uIGZvciB0aGlzPyksIGJ1dCBpZiBJ4oCZbSByaWdodCBpdCB3b3VsZCBzdGls
bCBiZSByZXN0cmljdGVkIHRvIE1JUFMuICAKPiA+IAo+ID4gUmVzdHJpY3RpbmcgYSBkZWZpbml0
aW9uIHRvIE1JUFMsIGV2ZW4gaWYgaXQgbWFrZXMgc2Vuc2UgZm9yIHlvdSBpcwo+ID4gdmVyeSBs
aW1pdGluZyBmb3IgbWUuIEkgbmVlZCB0byBiZSBhYmxlIHRvIGJ1aWxkIGFzIG11Y2ggZHJpdmVy
cyBhcyBJCj4gPiBjYW4gZnJvbSBteSBsYXB0b3AgYW5kIHZlcmlmeSB0aGV5IGF0IGxlYXN0IGNv
bXBpbGUgY29ycmVjdGx5LiBJZiBJIG5lZWQKPiA+IGEgTUlQUyB0b29sY2hhaW4sIGFuIEFSQyB0
b29sY2hhaW4sIGEgUG93ZXJQQywgYW4gQVJNLCBhbiBBUk02NCBhbmQKPiA+IHdoYXRldmVyIG90
aGVyIGZ1bmt5IHRvb2xjaGFpbiB0byBkbyBqdXN0IHRoYXQgaW4gWCBzdGVwczogaXQncyB2ZXJ5
Cj4gPiBwYWluZnVsLiBXZSBoYXZlIGJlZW4gYWRkaW5nIENPTVBJTEVfVEVTVCBkZXBlbmRlbmNp
ZXMgb24gYXMgbXVjaAo+ID4gZHJpdmVycyBhcyB3ZSBjb3VsZCBhbmQgd2Ugd2FudCB0byBjb250
aW51ZSBtb3ZpbmcgZm9yd2FyZC4gVXNpbmcgc3VjaAo+ID4gaW5jbHVkZSB3b3VsZCBuZWVkIHRv
IGRyb3AgdGhlIENPTVBJTEVfVEVTVCBjb25kaXRpb24gZnJvbSBLY29uZmlnIGFuZAo+ID4gdGhp
cyBpcyBub3Qgc29tZXRoaW5nIEkgYW0gd2lsbGluZyB0byBkby4gIAo+IAo+IEkgdG90YWxseSB1
bmRlcnN0YW5kIGFuZCBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQsIGJ1dCBJIHN0aWxsIHRoaW5rIHRo
YXQgdGhlcmUgY291bGQgYmUgYSBzb2x1dGlvbiB3aGljaCB3b3VsZCBiZSB2YWxpZCBmb3IgYm90
aCBvZiB1cy4KCldoYXQgZG8geW91IHN1Z2dlc3Q/Cgo+IAo+ID4gCj4gPiBUaGFua3MgZm9yIHlv
dXIgdW5kZXJzdGFuZGluZyA6KSAgCj4gCj4gVGhlIGN1cnJlbnQgd2F5IG9mIGRldGVjdGluZyBD
RkUgaXNu4oCZdCB0aGUgcHJvcGVyIG9uZS4KPiBUaGFuayB5b3UgZm9yIHVuZGVyc3RhbmRpbmcg
dGhhdCB0b28uCgpPZiBjb3Vyc2UsIEknbSBub3Qgc2F5aW5nIEkgZG9uJ3Qgd2FudCB0aGlzIGNo
YW5nZSwgSSdtIGp1c3Qgc2F5aW5nIHdlCnNob3VsZCBmaW5kIGFub3RoZXIgd2F5IHRvIGhhbmRs
ZSBpdCwgdGhlIGJlbG93IGlkZWEgaXMgdG90YWxseSBmaW5lIGJ5Cm1lLgoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
