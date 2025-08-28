Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142C3C8303F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Aug 2025 10:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUexNrefvcVg0A/2AOUXsgpW951pIVBDxD/sB1Uw/sE=; b=UneViXZfr6yVeX
	i//KtYvXtq9MxavVy/A64VVYNVy9TLnivy1aFuu100XvjskbSumEc/X+HouZvlU5npZjJe0m87IA/
	beCEMwo7UpHQPfLG7GixWQICTj9HFSqyN9oG8XLHFDJYAQlfbdMA6UVYxEiYQN/WXKWw7bVLa1Mc9
	JPBGvwKRIQUSTRXrHaaDV46Tc/nkPzbrQEtEO2bZ4AGnlfv0b0+gNGoerqcRdFUJzN/YFb13uR1lX
	uANPZO/jN5G+fYLyYsnPdgWOgwZVwEL/942ZzEajr0gRkCnG0/zMAp3ETzvelZ14lKyUoU2v4mK4w
	ytLnWupasta4jXpMo53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraKp-00000001FCI-0DxD;
	Thu, 28 Aug 2025 10:58:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZMR-0000000135I-1yrF
	for linux-mtd@lists.infradead.org;
	Thu, 28 Aug 2025 09:56:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27903C653FE;
	Thu, 28 Aug 2025 09:55:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8353660303;
	Thu, 28 Aug 2025 09:55:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B003F1C22A4EA;
	Thu, 28 Aug 2025 11:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756374957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t/e+r53Kr2WVs5clJikEqXBawtBTIiBYKx7C79TTHH8=;
	b=lQI+mVaCcrkIvJaKFn1eL0V9AIDlsM1H2Dy4A6KE/J4kybwAFzvlf7u6Xvg/J9XaTpRAVk
	r+4Map0/+BNU/uOi7lRKwfka7erZgdsJUNUe8rz0Wjy2b77ZQIEG5GX/C6irzFH3yCQRT1
	FDsVeLut9a151FghsKWn9YPEJK5qOexsPDEBRExhpKvBnMTXwfkPoMCvoP3EDFcF5ylUtC
	7WqjdcyeXnUFd3r8Wm11UFKF25GHaPvPhXchI2BR/zKXTFpl2xmTJq22QS2Nf7ByvoueMG
	+ECrx+3Qzn6hGBLSI3AgsBf+VzNsArHKinb6Thnkd663uYoOtO+Ix8ptWc+SMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Eggers <ceggers@arri.de>
Cc: Richard Weinberger <richard@nod.at>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: mtd: rawnand: Inconsistent parameter page on Foresee FSNS8A002G ?
In-Reply-To: <4990592.OV4Wx5bFTl@n9w6sw14> (Christian Eggers's message of
	"Thu, 28 Aug 2025 07:24:48 +0200")
References: <3542795.LZWGnKmheA@n9w6sw14> <87tt1whe19.fsf@bootlin.com>
	<4990592.OV4Wx5bFTl@n9w6sw14>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 28 Aug 2025 11:55:46 +0200
Message-ID: <87o6rz6a8t.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_025603_691641_F7F7D4ED 
X-CRM114-Status: GOOD (  24.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0aWFuLAoKT24gMjgvMDgvMjAyNSBhdCAwNzoyNDo0OCArMDIsIENocmlzdGlhbiBF
Z2dlcnMgPGNlZ2dlcnNAYXJyaS5kZT4gd3JvdGU6Cgo+IEhpIE1pcXVlbCwKPgo+IE9uIFN1bmRh
eSwgMjQgQXVndXN0IDIwMjUsIDE4OjM3OjA2IENFU1QsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+
IEhpIENocmlzdGlhbiwKPj4gCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fIOKAi+KAi+KAi+KAiyAgIAo+IENocmlzdGlhbiAgIEVnZ2Vy
cyAgICAgCj4gU29mdHdhcmUgRW5naW5lZXIgICAgIAo+IOKAiyAgICAgCj4gQVJSSSAgICAgCj4g
QXJub2xkICYgUmljaHRlciBDaW5lIFRlY2huaWsgR21iSCAmIENvLiBCZXRyaWVicyBLRyAgICAg
IAo+IEFycml3ZWcgMTcgLCAgODMwNzEgICBTdGVwaGFuc2tpcmNoZW4gICAgIAo+IHd3dy5hcnJp
LmNvbSAgICAgIAo+ICogKzQ5IDgwMzYgMzAwOS0zMTE4ICAgICAgCj4gICAgICAgIAo+ICAgICAg
ICAKPiAqIENFZ2dlcnNAYXJyaS5kZSAgICAgIAo+IOKAiyAgIAo+IEFMRVhBIDM1IFhUUkVNRSAg
Cj4gICAKPiBBcm5vbGQgJiBSaWNodGVyIENpbmUgVGVjaG5payBHbWJIICYgQ28uIEJldHJpZWJz
IEtHICAgCj4gU2l0ejogTcO8bmNoZW4g4oCRIFJlZ2lzdGVyZ2VyaWNodDogQW10c2dlcmljaHQg
TcO8bmNoZW4g4oCRIEhhbmRlbHNyZWdpc3Rlcm51bW1lcjogSFJBIDU3OTE4ICAgCj4gUGVyc8O2
bmxpY2ggaGFmdGVuZGVyIEdlc2VsbHNjaGFmdGVyOiBBcm5vbGQgJiBSaWNodGVyIENpbmUgVGVj
aG5payBHbWJIICAgCj4gU2l0ejogTcO8bmNoZW4g4oCRIFJlZ2lzdGVyZ2VyaWNodDogQW10c2dl
cmljaHQgTcO8bmNoZW4g4oCRIEhhbmRlbHNyZWdpc3Rlcm51bW1lcjogSFJCIDU0NDc3ICAgCj4g
R2VzY2jDpGZ0c2bDvGhyZXI6IERhdmlkIEJlcm1iYWNoLCBXb2xmZ2FuZyBCw7Zyc2lnLCBDaHJp
c3RpYW4gUmljaHRlciAgIAo+IOKAiyAgIAo+ICoKPiAqCj4gQUxFWEEgMzUgWFRSRU1FCj4+IE9u
IDE4LzA4LzIwMjUgYXQgMTk6MDI6NDkgKzAyLCBDaHJpc3RpYW4gRWdnZXJzIDxjZWdnZXJzQGFy
cmkuZGU+IHdyb3RlOgo+PiAKPj4gPiBJIHRyeSB0byB1c2UgYSBGb3Jlc2VlIEZTTlM4QTAwMkcg
U0xDIGZsYXNoIGNoaXAgb24gYW4gaS5NWDYgR1BNSSBjb250cm9sbGVyOgo+PiA+Cj4+ID4gaHR0
cHM6Ly93d3cubGNzYy5jb20vZGF0YXNoZWV0L0M1MTI2ODM1LnBkZgo+PiA+Cj4+ID4gVGhlIGtl
cm5lbCBvdXRwdXQgbG9va3MgcHJvbWlzaW5nLCBidXQgb25lIGxpbmUgbG9va3Mgc3VzcGljaW91
czoKPj4gPgo+PiA+IC4uLgo+PiA+IG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElE
OiAweGNkLCBDaGlwIElEOiAweGRhCj4+ID4gbmFuZDogRm9yZXNlZSBGU05TOEEwMDJHCj4+ID4g
bmFuZDogMjU2IE1pQiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lCLCBwYWdlIHNpemU6IDIwNDgs
IE9PQiBzaXplOiA2NAo+PiA+IG5hbmQ6IFNEUiB0aW1pbmcgbW9kZSA0IG5vdCBhY2tub3dsZWRn
ZWQgYnkgdGhlIE5BTkQgY2hpcAo+PiA+IF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+PiA+IEJhZCBibG9jayB0YWJsZSBmb3VuZCBhdCBw
YWdlIDEzMTAwOCwgdmVyc2lvbiAweDAxCj4+ID4gQmFkIGJsb2NrIHRhYmxlIGZvdW5kIGF0IHBh
Z2UgMTMwOTQ0LCB2ZXJzaW9uIDB4MDEKPj4gPiAzIGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9u
cyBmb3VuZCBvbiBNVEQgZGV2aWNlIGdwbWktbmFuZAo+PiA+IC4uLgo+PiA+Cj4+ID4gQWNjb3Jk
aW5nIHRvIHRoZSBkb2N1bWVudGF0aW9uIG9mICJSZWFkIFBhcmFtZXRlciBQYWdlIiwgYnl0ZSAx
MjktMTMwLCAKPj4gPiBTRFIgbW9kZXMgMCB0byA1IHNob3VsZCBiZSBzdXBwb3J0ZWQgKHBhZ2Ug
MTkgb24gdGhlIGRhdGEgc2hlZXQpLgo+PiA+IEJ1dCB0aGUgZG9jdW1lbnRhdGlvbiBvZiB0aGUg
R0VUX0ZFQVRVUkUvU0VUX0ZFQVRVUkUgb3BlcmF0aW9uIG1pc3Nlcwo+PiA+IHRoZSAiVGltaW5n
IG1vZGUiIHJlZ2lzdGVyIChkYXRhIHNoZWV0LCBwYWdlIDI0KS4KPj4gPgo+PiA+IEkgc2F3IHRo
YXQgdGhlcmUgaXMgYSBxdWlyayBmb3Igc29tZSBNYWNyb25peCBjaGlwcyB3aGljaCBhbHNvIHNl
ZW0KPj4gPiBub3QgdG8gc3VwcG9ydCBnZXR0aW5nL3NldHRpbmcgdGhlIHRpbWluZyBtb2RlIChi
dXQgZGVjbGFyaW5nIHRoZW0KPj4gPiBpbiB0aGUgcGFyYW1ldGVyIHBhZ2UpLgo+PiAKPj4gVW5m
b3J0dW5hdGVseSwgaXQgaGFwcGVucyB0aGF0IHNvbWV0aW1lcyBmbGFzaCB2ZW5kb3IgbWVzcyB1
cCBwYXJhbWV0ZXIKPj4gcGFnZXMsIHNvIGVpdGhlciB0aGUgZmxhc2ggc3VwcG9ydHMgbW9kZSA1
IGFuZCBpdCBpcyBseWluZyB0byB5b3UgKHlvdQo+PiBjYW4gdGVzdCBpdCBhbmQgYWRkIGEgcXVp
cmspIG9yIHRoZSBmbGFzaCBkb2VzIG5vdCBiZWNhdXNlIHRoaXMgYmF0Y2gKPj4gY291bGQgbm90
IHN0YW5kIGEgZmFzdGVyIHJhdGUgKD8pLgo+Cj4gV2hhdCBkb2VzICJseWluZyIgaW4gdGhpcyBj
b250ZXh0IG1lYW4/IFRoZSBtZXNzYWdlIAo+ICJuYW5kOiBTRFIgdGltaW5nIG1vZGUgNCBub3Qg
YWNrbm93bGVkZ2VkIGJ5IHRoZSBOQU5EIGNoaXAiCj4gaW1wbGllcyB0byBtZSwgdGhhdCB0aGUg
Zmxhc2ggZGV2aWNlIGRvZXNuJ3QgcmVzcG9uZCB0byB0aGUgbW9kZSBzZXR0aW5nCj4gY29tbWFu
ZC4gSSBzZWUgMiBwb3NzaWJsZSByZWFzb25zOgo+IDEuIFRoZSBtb2RlIHNldHRpbmcgY29tbWFu
ZCBpcyBub3Qgc3VwcG9ydGVkIChhdCBsZWFzdCBpdCBpc24ndCBtZW50aW9uZWQKPiBpbiB0aGUg
ZGF0YSBzaGVldCkuCgpTZXR0aW5nIGEgbW9kZSByZXF1aXJlczoKLSBzZXRfZmVhdHVyZXMsIHRv
IGNoYW5nZSB0aGUgdmFsdWUKLSBnZXRfZmVhdHVyZXMsIHRvIHZlcmlmeSB0aGUgdmFsdWUgaGFz
IGJlZW4gY2hhbmdlZAoKTm9ybWFsbHkgZGV2aWNlIHdoaWNoIHN1cHBvcnQgdGhlIGZvcm1lciBz
dXBwb3J0IHRoZSBsYXR0ZXIsIGJ1dApzb21ldGltZXMgdGhleSBkbyBub3QuIEp1c3QgZ2V0IHJp
ZCBvZiB0aGUgY2hlY2sgbWFudWFsbHkgYW5kIG1ha2UgYQp0ZXN0LCBpZiB0aGF0IHdvcmtzLCB0
aGUgY2hpcCBpcyB3b3JraW5nIGp1c3QgZmluZSBhbmQgeW91IG11c3QgZmxhZyBpdAphcyB1bmFi
bGUgdG8gcGVyZm9ybSBhIGdldF9mZWF0dXJlcyh0aW1pbmdzKS4KClNlZToKaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTYuMy9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9tYWNyb25peC5jI0wxODYKKHlvdSB3b3VsZCBvbmx5IG5lZWQgdGhlIGdldF9mZWF0dXJl
cygpIHBhcnQgb2YgdGhpcyBxdWlyaykuCgo+IDIuIFRoZSBzZWxlY3RlZCBtb2RlIGlzIHRvbyBm
YXN0IGZvciB0aGUgZmxhc2gvUENCLCBzbyB0aGUgcmVzcG9uc2UgZnJvbQo+IHRoZSBmbGFzaCBp
cyBub3QgY29ycmVjdCByZWNlaXZlZCBieSB0aGUgQ1BVLgoKSSBkb24ndCBiZWxpZXZlIHNvLgoK
Pgo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UsIHRyeWluZyB0byByZWFwcGx5IHRoZSBjdXJyZW50IG1v
ZGUgKDApIGZpcnN0IGluIG9yZGVyCj4gdG8gY29uZmlybSB0aGF0IHRoZSBmbGFzaCBzdXBwb3J0
cyB0aGUgbW9kZSBzZXR0aW5nIG9wY29kZSBhdCBhbGw/CgpDb21tZW50aW5nIG91dCB0aGUgY2hl
Y2sgYW5kIHVzaW5nIHRoZSBjaGlwIGF0IHRoaXMgc3BlZWQgc291bmRzIG1vcmUKcmVsZXZhbnQg
SU1PLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
