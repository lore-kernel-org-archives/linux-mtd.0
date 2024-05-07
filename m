Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D1C25B4F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLmkzSSRpZdtBLYG8Fbw+ZH8YTqgjRp28sp0+4vYX9Y=; b=VlrTAUzu1tBt0w
	yiH2Do8fAtDdAyreXnNFWFGAs/+nrSHgt7y9W+gVXfvIPieoe6DlBLVYl3VFb6bIkoLHAlBOX5FiA
	prcSCsIyCv1LbUIfZgLFb8wNk+E7dr7jc4kKBhtqyyMORHYJiUWbbbyOsshlBji10aJF7kAT6AF1A
	PpOM1RZk5wX9Io0ylFkavV5qh09+EHSrcZW5NM6BEceG/o0XwHy1kKvCeRJhriS1gg0BNrtoP5RR7
	QfD01ProVhDac5qC0g4ndEZri5MyVN8tHZhXqf3/a/iQ1CtZuDSXQOs97Wd6S4S3P2Orw5TCxJihW
	2eDlztfptnkHxYamiaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NMY-0000000BsxX-1vN7;
	Tue, 07 May 2024 16:08:18 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NMU-0000000Bstj-1vzz
	for linux-mtd@lists.infradead.org;
	Tue, 07 May 2024 16:08:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E60E240005;
	Tue,  7 May 2024 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715098090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fAJH7dRylBLnvkV617G2uaFst1GpsCSemSBMzD0bvWo=;
	b=ny2YCMEunzaVbC9LA/DcWNyi6dmZ8jSL0cDIbnvdyl4YxLnDJdnkkKm5Fx0omiVqfMfJ1D
	rX4gGpT8ymBi/q0Dqprfbz+p0Pktlm8q9nApEck6zqGlq1VPgyyOAoAsn7HxQ2L/wdqlEc
	vlEMaIu7vfJs8BwLLDFecpyC2ycebtGXLKh/b11dRVHmUqWKxA+rM9iIdV60ziSOJt4Pjo
	ivfHkcl1Auwb6jBTm13aYs2x12H7rTOnYKs5liFit/gtQGF9f+8IQBg0hK7LwHy/JS+00M
	2GCYjPkHrJ7wGnUlpQTQve60QmvJuOXq2eeDuGcC0rJnoK251lAzYvI1QgDyjg==
Date: Tue, 7 May 2024 18:08:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: mtd: nand: raw: Possible bug in nand_onfi_detect()?
Message-ID: <20240507180808.7f252532@xps-13>
In-Reply-To: <20240306-shaky-bunion-d28b65ea97d7@thorsis.com>
References: <20240306-shaky-bunion-d28b65ea97d7@thorsis.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_090814_794912_3AB05B52 
X-CRM114-Status: GOOD (  26.28  )
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

SGVsbG8sCgphZGFAdGhvcnNpcy5jb20gd3JvdGUgb24gV2VkLCA2IE1hciAyMDI0IDE1OjM2OjA0
ICswMTAwOgoKPiBIZWxsbyBldmVyeW9uZSwKPiAKPiBJIHRoaW5rIEkgZm91bmQgYSBidWcgaW4g
bmFuZF9vbmZpX2RldGVjdCgpIHdoaWNoIHdhcyBpbnRyb2R1Y2VkIHdpdGgKPiBjb21taXQgYzI3
ODQyZTdlMTFmICgibXRkOiByYXduYW5kOiBvbmZpOiBBZGFwdCB0aGUgcGFyYW1ldGVyIHBhZ2UK
PiByZWFkIHRvIGNvbnN0cmFpbnQgY29udHJvbGxlcnMiKSBiYWNrIGluIDIwMjAuCj4gCj4gQmFj
a2dyb3VuZCBvbiBob3cgSSBmb3VuZCB0aGlzOiBJJ20gY3VycmVudGx5IHN0cnVnZ2xpbmcgZ2V0
dGluZyByYXcKPiBuYW5kIGZsYXNoIGFjY2VzcyB0byBmbHkgd2l0aCBhbiBhdDkxIHNhbTl4NjAg
U29DIGFuZCBhIFMzNE1MMDJHMQo+IFNwYW5zaW9uIFNMQyByYXcgTkFORCBmbGFzaCBvbiBhIGN1
c3RvbSBib2FyZC4gIFRoZSBzZXR1cCBpcwo+IGNvbXBhcmFibGUgdG8gdGhlIHNhbTl4NjAgY3Vy
aW9zaXR5IGJvYXJkIGFuZCBjYW4gYmUgcmVwcm9kdWNlZCB3aXRoCj4gdGhhdCBvbmUuCj4gCj4g
TkFORCBmbGFzaCBvbiBzYW05eDYwIGN1cmlvc2l0eSBib2FyZCB3b3JrcyBmaW5lIHdpdGggd2hh
dCBpcyBpbgo+IG1haW5saW5lIExpbnV4IGtlcm5lbC4gIEhvd2V2ZXIgYWZ0ZXIgcmVtb3Zpbmcg
dGhlIGxpbmUgJ3JiLWdwaW9zID0KPiA8JnBpb0QgNSBHUElPX0FDVElWRV9ISUdIPjsnIGZyb20g
YXQ5MS1zYW05eDYwX2N1cmlvc2l0eS5kdHMgYWxsIGRhdGEKPiByZWFkIGZyb20gdGhlIGZsYXNo
IGFwcGVhcnMgdG8gYmUgemVyb3Mgb25seS4gIChJIGRpZCBub3QgYWRkIHRoYXQKPiBsaW5lIHRv
IHRoZSBkdHMgb2YgbXkgY3VzdG9tIGJvYXJkIGZpcnN0LCB0aGlzIGlzIGhvdyBJIHN0dW1ibGVk
IG92ZXIKPiB0aGlzLikKPiAKPiBJIGhhdmUgbm8gZXhwbGFuYXRpb24gZm9yIHRoYXQgYmVoYXZp
b3VyLCBpdCBzaG91bGQgd29yayB3aXRob3V0IFIvQiMKPiBieSByZWFkaW5nIHRoZSBzdGF0dXMg
cmVnaXN0ZXIsIG1heWJlIHdlIGludmVzdGlnYXRlIHRoYXQKPiBpbiBkZXB0aCBsYXRlci4gIEhv
d2V2ZXIgdGhvc2UgYWxsIHplcm9zIGRhdGEgcmVhZHMgaGFwcGVucyB3aGVuCj4gcmVhZGluZyB0
aGUgT05GSSBwYXJhbSBwYWdlIGFzIHdlbGwgZXMgZGF0YSByZWFkIGZyb20gT09CL3NwYXJlIGFy
ZWEKPiBsYXRlciBhbmQgSSBiZXQgaXQncyB0aGUgc2FtZSB3aXRoIHVzdWFsIGRhdGEuCj4gCj4g
VGhpcyByZWFkIGVycm9yIHJldmVhbHMgYSBidWcgaW4gbmFuZF9vbmZpX2RldGVjdCgpLiAgQWZ0
ZXIgc2V0dGluZwo+IHVwIHNvbWUgdGhpbmdzIHRoZXJlJ3MgdGhpcyBmb3IgbG9vcDoKPiAKPiAg
ICAgZm9yIChpID0gMDsgaSA8IE9ORklfUEFSQU1fUEFHRVM7IGkrKykgewo+IAo+IEZvciBpID0g
MCBuYW5kX3JlYWRfcGFyYW1fcGFnZV9vcCgpIGlzIGNhbGxlZCBhbmQgaW4gbXkgY2FzZSBhbGwg
emVyb3MKPiBhcmUgcmV0dXJuZWQgYW5kIHRodXMgdGhlIENSQyBjYWxjdWxhdGVkIGRvZXMgbm90
IG1hdGNoIHRoZSBhbGwgemVyb3MKPiBDUkMgcmVhZC4gIFNvIHRoZSB1c3VhbCBicmVhayBvbiBz
dWNjZXNzZnVsIHJlYWRpbmcgdGhlIGZpcnN0IHBhZ2UgaXMKPiBza2lwcGVkIGFuZCBmb3IgcmVh
ZGluZyB0aGUgc2Vjb25kIHBhZ2UgbmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3AoKQo+IGlzIGNh
bGxlZC4gIEkgdGhpbmsgdGhhdCBvbmUgYWx3YXlzIGZhaWxzIG9uIHRoaXMgbGluZToKPiAKPiAg
ICAgaWYgKG9mZnNldF9pbl9wYWdlICsgbGVuID4gbXRkLT53cml0ZXNpemUgKyBtdGQtPm9vYnNp
emUpIHsKPiAKPiBUaG9zZSB2YXJpYWJsZXMgY29udGFpbiB0aGUgZm9sbG93aW5nIHZhbHVlczoK
PiAKPiAgICAgb2Zmc2V0X2luX3BhZ2U6IDI1Ngo+ICAgICBsZW46IDI1Ngo+ICAgICBtdGQtPndy
aXRlc2l6ZTogMAo+ICAgICBtdGQtPm9vYnNpemU6IDAKPiAKPiBUaGUgY29uZGl0aW9uIGlzIHRy
dWUgYW5kIG5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKCkgcmV0dXJucyB3aXRoCj4gLUVJTlZB
TCwgYmVjYXVzZSBtdGQtPndyaXRlc2l6ZSBhbmQgbXRkLT5vb2JzaXplIGFyZSBub3Qgc2V0IHll
dCBpbgo+IHRoYXQgY29kZSBwYXRoLiAgVGhvc2UgYXJlIHByb2JhYmx5IGluaXRpYWxpemVkIGxh
dGVyLCBtYXliZSB3aXRoCj4gcGFyYW1ldGVycyByZWFkIGZyb20gdGhhdCBPTkZJIHBhcmFtIHBh
Z2U/Cj4gCj4gUmV0dXJuaW5nIHdpdGggZXJyb3IgZnJvbSBuYW5kX2NoYW5nZV9yZWFkX2NvbHVt
bl9vcCgpIGxlYWRzIHRvCj4ganVtcGluZyBvdXQgb2YgbmFuZF9vbmZpX2RldGVjdCgpIGVhcmx5
LCBhbmQgbm8gT05GSSBwYXJhbSBwYWdlIGlzCj4gZXZhbHVhdGVkIGF0IGFsbCwgYWx0aG91Z2gg
dGhlIHNlY29uZCBvciB0aGlyZCBwYWdlIGNvdWxkIGJlIGludGFjdC4KPiAKPiBJIGd1ZXNzIHRo
aXMgd291bGQgYWxzbyBmYWlsIHdpdGggYW55IG90aGVyIHJlYXNvbiBmb3Igbm90IG1hdGNoaW5n
Cj4gQ1JDcyBpbiB0aGUgZmlyc3QgcGFnZSwgYnV0IEkgaGF2ZSBub3QgZmF1bHR5IE5BTkQgZmxh
c2ggY2hpcCB0bwo+IGNvbmZpcm0gdGhhdC4KClNvcnJ5IGZvciB0aGUgdGltZSBpdCB0b29rIG9u
IG15IHNpZGUuCgpIZXJlIGlzIGEgbGluayB0byBhbm90aGVyIHNpbWlsYXIgcmVwb3J0OgpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvRE02UFIwNU1CNDUwNjU1NDQ1N0NGOTUxOTFB
NjcwQkRFRjcwNjJARE02UFIwNU1CNDUwNi5uYW1wcmQwNS5wcm9kLm91dGxvb2suY29tLwpBbmQg
aGVyZSBpcyBhIGxpbmsgdG8gdGhlIHNlcmllcyBhdHRlbXB0aW5nIHRvIGZpeCB0aGlzOgpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNDA1MDcxNjA1NDYuMTMwMjU1LTEtbWlx
dWVsLnJheW5hbEBib290bGluLmNvbS9ULyN0CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
