Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBED0CCD1BB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1G0UGDMSsPoTMfmdtPiCdNFBXFytr4QRc5niLhLLOoM=; b=R/4XLiWTh+m1Sj
	A+205EPww/8jPVSWrl5+sQkZhAQAauJcJBOx5gYAA2sXcli8nWVvDXiI50y8niwiVAzF6CApBrIYq
	7DJ5X+K55pkS3wWn83tuuFpgCIKwRLTPwcGIhNrz9JXU7q/VVTAQn/wFPpIeeUgX0D/JRjkt6a9ZX
	GsX8G16O0YhM4gPV7NUn9sGVUnYGmARrVTiZiB+/rW+JnjJAyO6tHiXpoeVFTkxuXnXuFYv0qu1Sy
	/Pd9SKRrE9MfgkqQU5XqnLiOHMB3MYQ7s8Wljw1IpD5ecZVFntOYGGHsgxXAe7li+xIIYl3uxUtiC
	6Zl6U0/i3Y3Nt4vYjc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ49-000000032gC-07Nd;
	Wed, 22 Oct 2025 13:39:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ45-000000032fS-2hIJ
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 13:39:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 191E0C0AFF6;
	Wed, 22 Oct 2025 13:39:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7D76606DC;
	Wed, 22 Oct 2025 13:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CD3D102F242F;
	Wed, 22 Oct 2025 15:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761140381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yr4VH+Yj7+1IWVKMwzrK588Y4t7EvKEaaAZKq6WNrcY=;
	b=qIN4bdNEZWAQ1AUR3KXxFWp5S2C/02EvT8z9RmzKEUN9CMSKXwaNy1zihsKU0IL5YJWmCi
	v0ccZG2qONTB9PbRRSQRLYRayYVJYOyflxJ13YbZ7O5f+Y8VTC3GPMFE4oMbnXyh4Y1Dm3
	CnYGYiCAdSwuFkvgXsAXmklHZigaeOA5+33laRmzV6KtYt9486IHAmWccNIdwJX80TVooS
	Sm2MTL2zDqboDMh9TCW+5QT+SWr1HUFZaTkgboxPMHV+mAmvaVqkE+BNv8wO/r1sMsJh7e
	r5HJdm0heK2KZynPXHVLzoI5ciXgNdIKL0Jp1cpsUdbz/L2C5VAUz1RrLyCJwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Elad Nachman <enachman@marvell.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0] mtd: rawnand: marvell: fix 8bit ECC layouts
In-Reply-To: <20251022013752.2381694-1-aryan.srivastava@alliedtelesis.co.nz>
	(Aryan Srivastava's message of "Wed, 22 Oct 2025 14:37:52 +1300")
References: <20251022013752.2381694-1-aryan.srivastava@alliedtelesis.co.nz>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 15:39:27 +0200
Message-ID: <87qzuvrr74.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_063945_868281_924BCCA1 
X-CRM114-Status: GOOD (  20.57  )
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

T24gMjIvMTAvMjAyNSBhdCAxNDozNzo1MiArMTMsIEFyeWFuIFNyaXZhc3RhdmEgPGFyeWFuLnNy
aXZhc3RhdmFAYWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6Cgo+IFRoZXNlIHdlcmUgbW9kaWZp
ZWQgdG8gYXBwZWFzZSBhIGNoZWNrIGluIG5hbmRfc2Nhbl90YWlsLiBUaGlzIGNoYW5nZSBsZWQK
PiB0byB0aGUgbGFzdCBzcGFyZSBieXRlcyBuZXZlciBiZWluZyB3cml0dGVuIHRvIG9yIHJlYWQg
ZnJvbS4KPgo+IE1vZGlmeSB0aGUgZml4IGJ5IHJlc3RvcmluZyB0aGUgbGF5b3V0cyBhbmQgc2V0
dGluZyBlY2MtPnN0ZXBzIHRvIHRoZQo+IGZ1bGxfY2h1bmtfY250IHZhbHVlIGluIHRoZSA4IGJp
dCBFQ0MgY2FzZXMgKDRrIGFuZCA4ayBwYWdlIHNpemUpLiBUaGlzCj4gYWxsb3dzIHRoZSBkcml2
ZXIgdG8gY29udGludWUgcmVhZGluZy93cml0aW5nIGFsbCBjaHVua3Mgd2hpbGUgYWxzbwo+IHBh
c3NpbmcgdGhlIGNoZWNrIGluIG5hbmRfc2Nhbl90YWlsLgo+Cj4gRml4ZXM6IGU2YTMwZDBjNDhh
MSAoIm10ZDogcmF3bmFuZDogbWFydmVsbDogZml4IGxheW91dHMiKQo+IFNpZ25lZC1vZmYtYnk6
IEFyeWFuIFNyaXZhc3RhdmEgPGFyeWFuLnNyaXZhc3RhdmFAYWxsaWVkdGVsZXNpcy5jby5uej4K
PiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgfCAxNSArKysrKysr
KysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwo+IGluZGV4IDMwM2IzMDE2YTA3
MC4uYzIwZmVhY2JhY2E4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZl
bGxfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiBA
QCAtMjkyLDEwICsyOTIsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtYXJ2ZWxsX2h3X2VjY19s
YXlvdXQgbWFydmVsbF9uZmNfbGF5b3V0c1tdID0gewo+ICAJTUFSVkVMTF9MQVlPVVQoIDIwNDgs
ICAgNTEyLCAgOCwgIDIsICAxLCAxMDI0LCAgMCwgMzAsMTAyNCw2NCwgMzApLAo+ICAJTUFSVkVM
TF9MQVlPVVQoIDIwNDgsICAgNTEyLCAgMTYsIDQsICA0LCA1MTIsICAgMCwgMzAsICAwLCAzMiwg
MzApLAo+ICAJTUFSVkVMTF9MQVlPVVQoIDQwOTYsICAgNTEyLCAgNCwgIDIsICAyLCAyMDQ4LCAz
MiwgMzAsICAwLCAgMCwgIDApLAo+IC0JTUFSVkVMTF9MQVlPVVQoIDQwOTYsICAgNTEyLCAgOCwg
IDQsICA0LCAxMDI0LCAgMCwgMzAsICAwLCA2NCwgMzApLAo+ICsJTUFSVkVMTF9MQVlPVVQoIDQw
OTYsICAgNTEyLCAgOCwgIDUsICA0LCAxMDI0LCAgMCwgMzAsICAwLCA2NCwgMzApLAo+ICAJTUFS
VkVMTF9MQVlPVVQoIDQwOTYsICAgNTEyLCAgMTYsIDgsICA4LCA1MTIsICAgMCwgMzAsICAwLCAz
MiwgMzApLAo+ICAJTUFSVkVMTF9MQVlPVVQoIDgxOTIsICAgNTEyLCAgNCwgIDQsICA0LCAyMDQ4
LCAgMCwgMzAsICAwLCAgMCwgIDApLAo+IC0JTUFSVkVMTF9MQVlPVVQoIDgxOTIsICAgNTEyLCAg
OCwgIDgsICA4LCAxMDI0LCAgMCwgMzAsICAwLCAxNjAsIDMwKSwKPiArCU1BUlZFTExfTEFZT1VU
KCA4MTkyLCAgIDUxMiwgIDgsICA5LCAgOCwgMTAyNCwgIDAsIDMwLCAgMCwgMTYwLCAzMCksCj4g
IAlNQVJWRUxMX0xBWU9VVCggODE5MiwgICA1MTIsICAxNiwgMTYsIDE2LCA1MTIsICAwLCAzMCwg
IDAsICAzMiwKPiAzMCksCj4gIH07Cj4gIAo+IEBAIC0yMjg2LDcgKzIyODYsMTYgQEAgc3RhdGlj
IGludCBtYXJ2ZWxsX25hbmRfaHdfZWNjX2NvbnRyb2xsZXJfaW5pdChzdHJ1Y3QgbXRkX2luZm8g
Km10ZCwKPiAgCX0KPiAgCj4gIAltdGRfc2V0X29vYmxheW91dChtdGQsICZtYXJ2ZWxsX25hbmRf
b29ibGF5b3V0X29wcyk7Cj4gLQllY2MtPnN0ZXBzID0gbC0+bmNodW5rczsKPiArCj4gKwkvKiBW
YWxpZGl0eSBjaGVja3MgaW4gbmFuZF9zY2FuX3RhaWwgYXNzdW1lIGV2ZW4gc2l6ZWQgY2h1bmtz
LCBidXQgaW4gdGhlIGNhc2Ugb2YgOGJpdAo+ICsJICogRUNDIHdpdGggNGsvOGsgcGFnZSBzaXpl
IHRoZSBsYXN0IGNodW5rIGlzIHNwYXJlIGRhdGEsIHdoaWNoIGlzIG5vdCBzaXplZCB0byB0aGUg
ZGF0YQo+ICsJICogY2h1bmtzLiBPdmVyd3JpdGUgdGhlIGVjYy0+c3RlcHMgdG8gcGFzcyB0aGlz
IHZhbGlkaXR5IGNoZWNrLCB3aGlsZSBtYWludGFpbmluZyB0aGUKPiArCSAqIGNvcnJlY3QgbnVt
YmVyIG9mIGNodW5rcyBpbi1kcml2ZXIuCj4gKwkgKi8KCkkgYW0gbm90IGEgYmlnIGZhbiBvZiB0
aGlzIGFwcHJvYWNoLCBJIHdvbmRlciB3aGV0aGVyIHdlIHNob3VsZCByZWxheAp0aGUgY2hlY2sg
aW4gbmFuZF9zY2FuX3RhaWwoKSBvciBub3QuIE1heWJlIHdlIGNvdWxkIGF2b2lkIHRoZSBlcnJv
ciBpbgp0aGUgY29yZSBieSBqdXN0IHByaW50aW5nIGEgd2FybmluZywgdGhpcyB3YXkgdGhlIGRy
aXZlcnMgd291bGQgbm90IG5lZWQKdG8gbGllIHRvIHRoZSBjb3JlLgoKV2hhdCBJIHdvdWxkIHN1
Z2dlc3QsIG5vdyB0aGF0IEkgcHJvcGVybHkgdW5kZXJzdG9vZCB0aGUgcHJvYmxlbSwgaXMgdG86
CjEuIFJldmVydCBFbGFkJ3MgcGF0Y2hzZXQgKmVudGlyZWx5KiAoaW5jbHVkaW5nIHRoZSByZXZl
cnQgb2YKICAgZXhpc3RpbmcvdmFsaWQgYnV0IHdpdGggbGl0dGxlIHVzZSBsYXlvdXRzKS4KMi4g
UmVsYXggdGhlIGNoZWNrIGluIHRoZSBjb3JlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
