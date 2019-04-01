Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3B8C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 09:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E11542082C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 09:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HqYNgnKy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E11542082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjJBATQC0ePgSi9l4KzDUZ1ehMCnlGGqR7lep7emUUo=; b=HqYNgnKyxk1CM2
	mgEYJWj+Bj+ron8adSbCNBgZy+hb2niNv36oUvnfVESVsqmVgjkyY+fm708lxBtrlQMAyd/KNOl0J
	uGIDb/fari9MJCEomqZk1krU2FrWR8yhBd3hfxb2hCDXm/8B/WsVpElhDnXjKlLb8U7y0HR1PT+4e
	xHLTs6JhTKyedfznwiQRGd0Pli25WR2C7nUao2PVBa2bGBffLiSv/sV6VUbK4G1f0FBhr7uprVYd1
	BqOoj6Qwd7ZLiO3iXV/Dzx+e4wMXIHFb9mVm92F+q13wwPjSqTasB8ogigXkfdxX0S0ZBZ/sEgZ11
	pveA8b/qH0RwCSJPgnRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAtAm-0004qw-FI; Mon, 01 Apr 2019 09:24:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAtAj-0004oa-ND
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 09:24:07 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3C3A9C0011;
 Mon,  1 Apr 2019 09:23:50 +0000 (UTC)
Date: Mon, 1 Apr 2019 11:23:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: i.MX28 nand driver broken in Linux 4.18
Message-ID: <20190401112349.60bcf6d7@xps13>
In-Reply-To: <1c876ede-7321-a7c3-a366-86ca1dafce20@grandegger.com>
References: <8ec3f0b1-b288-d208-c0e4-431b49719d08@grandegger.com>
 <20190304125435.0e33d362@xps13>
 <e5450dfe-9228-569a-2c59-3b6f7bb05d2d@grandegger.com>
 <17beb0d3-6202-00ee-ff42-a656c4d8cb23@grandegger.com>
 <20190306145942.625b5c87@xps13>
 <1c876ede-7321-a7c3-a366-86ca1dafce20@grandegger.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_022405_904507_AC73E405 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV29sZmdhbmcsCgpXb2xmZ2FuZyBHcmFuZGVnZ2VyIDx3Z0BncmFuZGVnZ2VyLmNvbT4gd3Jv
dGUgb24gU2F0LCAyMyBNYXIgMjAxOQoyMDo1NToxOSArMDEwMDoKCj4gSGVsbG8gTWlxdWVsLAo+
IAo+IEFtIDA2LjAzLjE5IHVtIDE0OjU5IHNjaHJpZWIgTWlxdWVsIFJheW5hbDoKPiA+IEhpIFdv
bGZnYW5nLAo+ID4gCj4gPiBXb2xmZ2FuZyBHcmFuZGVnZ2VyIDx3Z0BncmFuZGVnZ2VyLmNvbT4g
d3JvdGUgb24gVHVlLCA1IE1hciAyMDE5Cj4gPiAxNTo1Mjo1MiArMDEwMDoKPiA+ICAgCj4gPj4g
SGVsbG8sCj4gPj4KPiA+PiBJIHdpbGwgYmlzZWN0IHRoZSBwcm9ibGVtIG5leHQgd2VlayB3aGVu
IEkgaGF2ZSBhY2Nlc3MgdG8gdGhlCj4gPj4gaGFyZHdhcmUuLi4gbW9yZSBzb29uLi4uCj4gPj4g
IAo+ID4gCj4gPiBHcmVhdCwgdGhhbmtzLiAgCj4gCj4gSGVyZSBpcyB0aGUgcmVzdWx0IG9mIGdp
dCBiaXNlY3Rpb246Cj4gCj4gd29sZkBiZXJuZXg6fi9naXQvbGludXgkIGdpdCBiaXNlY3QgZ29v
ZAo+IDc2ZTFhMDA4NmEwYzMyNzZiMzg0Zjc3OTA1MzQ1ZTBmY2M4ODZmZGQgaXMgdGhlIGZpcnN0
IGJhZCBjb21taXQKPiBjb21taXQgNzZlMWEwMDg2YTBjMzI3NmIzODRmNzc5MDUzNDVlMGZjYzg4
NmZkZAo+IEF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
PiBEYXRlOiAgIEZyaSBNYXIgMiAxNTozODozOSAyMDE4ICswMTAwCj4gCj4gICAgIG10ZDogcmF3
bmFuZDogZ3BtaTogc3VwcG9ydCAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkKPiAgICAgCj4gICAg
IFVudGlsIG5vdyB0aGUgR1BNSSBkcml2ZXIgaGFkIGl0cyBvd24gdGltaW5ncyBsb2dpYyB3aGls
ZSB0aGUgY29yZQo+ICAgICBhbHJlYWR5IGhhbmRsZXMgdGhhdCBhbmQgcmVxdWVzdCB0aGUgTkFO
RCBjb250cm9sbGVyIGRyaXZlcnMgdG8gc3VwcG9ydAo+ICAgICB0aGUgLT5zZXR1cF9kYXRhX2lu
dGVyZmFjZSgpIGhvb2suIEltcGxlbWVudCB0aGF0IGhvb2sgYnkgcmV1c2luZyB0aGUKPiAgICAg
YWxyZWFkeSBleGlzdGluZyBmdW5jdGlvbi4gTm8gcmVhbCBnbHVlIGlzIG5lY2Vzc2FyeSBiZXR3
ZWVuIGNvcmUgdGltaW5nCj4gICAgIGRlbGF5cyBhbmQgR1BNSSByZWdpc3RlcnMgYmVjYXVzZSB0
aGUgZHJpdmVyIGFscmVhZHkgdHJhbnNsYXRlcyB0aGUKPiAgICAgT05GSSB0aW1pbmcgbW9kZXMg
aW50byByZWdpc3RlciB2YWx1ZXMuCj4gICAgIAo+ICAgICBNYWtlIHVzZSBvZiB0aGUgY29yZSdz
IHRSRUEsIHRSTE9IIGFuZCB0UkhPSCB2YWx1ZXMgdGhhdCBhbGxvdyBjb21wdXRpbmcKPiAgICAg
bW9yZSBwcmVjaXNlIHRpbWluZ3MgZm9yIG1vZGUgWzAtM10gYW5kIGdldCBzaWduaWZpY2FudGx5
IGJldHRlciB2YWx1ZXMKPiAgICAgKCsyMCUgd2l0aCBhbiBpLk1YNiBTYWJyZSBBdXRvIGJvYXJk
KS4gT3RoZXJ3aXNlIHVzZSB0aGUgZXhpc3RpbmcgbG9naWMuCj4gICAgIAo+ICAgICBTaWduZWQt
b2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ICAgICBU
ZXN0ZWQtYnk6IEhhbiBYdSA8aGFuLnh1QG54cC5jb20+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4uY29tPgoKVGhhbmsgeW91IGZv
ciB0aGUgYmlzZWN0aW9uLCB0aGVyZSBpcyBkZWZpbml0ZWx5IHNvbWV0aGluZyB3cm9uZyB3aXRo
CnRoaXMgY29tbWl0IGJ1dCBpdCB3b3JrZWQgZm9yIG1lIGFuZCBmb3IgSGFuIHNvIGl0J3MgcXVp
dGUgZGlmZmljdWx0IHRvCmZpbmQgb3V0IHdoYXQgaXMgZmFpbGluZyBpZiBJIGNhbm5vdCByZXBy
b2R1Y2UuIENvdWxkIHlvdSBwbGVhc2UgZHVtcAp0aGUgdGltaW5nIHJlZ2lzdGVycyBpbiBib3Ro
IGNhc2VzICh3b3JraW5nL25vdCB3b3JraW5nKSBhbmQgb2JzZXJ2ZXIgaWYKdGhlcmUgYXJlIG9k
ZCB2YWx1ZXMgPyAoMCwgdG9vIHNob3J0IG9yIHRvbyBiaWcgdmFsdWVzLCBldGMpLgoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
