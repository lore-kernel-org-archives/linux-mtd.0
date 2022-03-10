Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08EFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Mar 2022 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6jV6rS/Vph4C8fgDIjMS26vcDuYfGtsxIsQpVqSJrc=; b=fRoA+bAkrKJGlJ
	O0U+hkl0OnPRuoF9juqkytl2pYnCmi5dV8kEgWHQLnsutqvr3K8ZwPQc+st0X5almagPIofgqhjWA
	PzP1JSdcIqT8WkG0aJ8FoxwghTNyi6lMdw7109rnzGf1+QsVtXfcSYhQKIvF9nQF+OIP5JqMvJA7R
	uRztOCjWhlAECUScufMPQLCaGl2XC5grEZh5nYDZiZI5F1e8BD3YF3s6p97lgTG+s5vleMPAbl1aD
	n6xHImM4mA3f3XycVa3FmDgo7SSccn3uf+XoMefATUuywn3kWWlki5VtXn4NZFVIwmqEWNb8NPBx8
	Mb0s1KEV3iETBtBNpItg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSEMG-00Bxzb-38; Thu, 10 Mar 2022 08:41:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSEM8-00BxwV-EL
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2022 08:41:12 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3E9131F40657;
 Thu, 10 Mar 2022 08:41:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646901664;
 bh=85vN9gn1Lw3CJSZnGfyA8Bn3SkFiBOBdf9hHKsmOVGA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m527BWDAr30hv4G5IwjbwSOAdTl+OrMkJHc6C5Xbow13UR7C4FVUre2sBy6gaXXX7
 XBmblJjkKAdVh/oL2WWY+RI/2+/RqAJ4dmzSQtfMZY2ALVqnCoAEpz38G5R09NWqbR
 /Y0vQUi8fDRjGMsJF30dxTd1kyTTEhHQuZPoesdLz5bhLvbU+Fptn75L3jFQURxTZa
 w4vRy3nxSBrJ0ev4eBnMzzyWVU5wY46sbgJVuVSUqBezJGnTmjmirlycCMj62kyxzo
 SsOcKc4pjleYwMbGMgbztHH3Y6yku67G2JqPMpFSGTTVTX8p5Ob/tISeX/t/5bXKBO
 mINUouXYId3Iw==
Date: Thu, 10 Mar 2022 09:40:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Daniel Palmer
 <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 05/17] mtd: spinand: Define ctrl_ops for non-page
 read/write op templates
Message-ID: <20220310094053.1d86d13a@collabora.com>
In-Reply-To: <12c7a6a6-8b49-1c3e-087f-79c77388b091@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-6-a-nandan@ti.com>
 <20220103110107.45594e78@collabora.com>
 <bf3ea909-e0a5-eeac-12e9-c8a809685f48@ti.com>
 <20220215183705.574df0c1@collabora.com>
 <12c7a6a6-8b49-1c3e-087f-79c77388b091@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_004108_723725_F457E201 
X-CRM114-Status: GOOD (  34.34  )
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

T24gVGh1LCAxMCBNYXIgMjAyMiAxMzoyNzowNiArMDUzMApBcHVydmEgTmFuZGFuIDxhLW5hbmRh
bkB0aS5jb20+IHdyb3RlOgoKPiA+Pj4gVGhpcyB3YXksIHlvdSBjYW4gZWFzaWx5IHBpY2sgdGhl
IHJpZ2h0IHNldCBvZiBvcGVyYXRpb25zIGJhc2VkCj4gPj4+IG9uIHRoZSBwcm90b2NvbC9tb2Rl
IHlvdSdyZSBpbjoKPiA+Pj4KPiA+Pj4gI2RlZmluZSBzcGluYW5kX2dldF9vcF90ZW1wbGF0ZShz
cGluYW5kLCBvcG5hbWUpIFwKPiA+Pj4gCSgoc3BpbmFuZCktPm9wX3RlbXBsYXRlc1soc3BpbmFu
ZCktPnByb3RvY29sXS0+b3BuYW1lKQo+ID4+Pgo+ID4+PiBzdGF0aWMgaW50IHNwaW5hbmRfcmVh
ZF9yZWdfb3Aoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLCB1OCByZWcsIHU4ICp2YWwp
Cj4gPj4+IHsKPiA+Pj4gCXN0cnVjdCBzcGlfbWVtX29wIG9wID0gKnNwaW5hbmRfZ2V0X29wX3Rl
bXBsYXRlKHNwaW5hbmQsIGdldF9mZWF0dXJlKTsKPiA+Pj4gCWludCByZXQ7Cj4gPj4+Cj4gPj4+
IAkuLi4KPiA+Pj4gfSAgCj4gPj4gSSBmaW5kIGEgY291cGxlIG9mIGlzc3VlcyB3aXRoIHRoaXPC
oCBtZXRob2QsCj4gPj4KPiA+PiAxLiByZWFkX2NhY2hlLCB3cml0ZV9jYWNoZSwgdXBkYXRlX2Nh
Y2hlIG9wIHRlbXBsYXRlcyBkb24ndCBmaXQgd2VsbAo+ID4+IHdpdGggdGhlIG90aGVyIG5vbi1k
YXRhIG9wcywgYXMKPiA+PiB0aGVzZSBkYXRhIG9wcyBhcmUgdXNlZCB0byBjcmVhdGUgYSBkaXJt
YXAsIGFuZCB0aGF0IGNhbiBiZSBkb25lIG9ubHkKPiA+PiBvbmNlIGF0IHByb2JlIHRpbWUuIEhl
bmNlLCB0aGVyZQo+ID4+IGlzIGEgZGlmZmVyZW50IG1lY2hhbmlzbSBvZiBzZWxlY3Rpbmcgb2Yg
ZGF0YSBvcHMgYW5kIG5vbi1kYXRhIG9wcy4gIAo+ID4gTm90IHN1cmUgSSBzZWUgd2h5IHRoaXMg
aXMgYSBwcm9ibGVtLiBZb3UgY2FuIHBvcHVsYXRlIGRhdGEtb3BzIGZvciBhbGwKPiA+IG1vZGVz
LCBhbmQgcGljayB0aGUgb25lIHRoYXQgcHJvdmlkZXMgdGhlIGJlc3QgcGVyZnMgd2hlbiB5b3Ug
Y3JlYXRlCj4gPiB0aGUgZGlybWFwICh3aGljaCBzaG91bGQgcmVhbGx5IGJlIGF0IHRoZSBlbmQg
b2YgdGhlIHByb2JlLCBpZiBpdCdzIG5vdAo+ID4gYWxyZWFkeSkuCj4gPiAgCj4gPj4gSGVuY2Us
IHRoaXMgZGl2aXNpb24gaW4gdGhlIG9wIHRlbXBsYXRlcwo+ID4+IHN0cnVjdCBhcyBkYXRhX29w
cyBhbmQgY3RybF9vcHMgaXMgcmVxdWlyZWQuIEN1cnJlbnRseSwgdGhlIGNvcmUgb25seQo+ID4+
IHN1cHBvcnRzIHVzaW5nIGEgc2luZ2xlIHByb3RvY29sIGZvcgo+ID4+IGRhdGEgb3BzLCBjaG9z
ZW4gYXQgdGhlIHRpbWUgb2YgcHJvYmluZy4gIAo+ID4gQWdhaW4sIEkgZG9uJ3Qgc2VlIHdoeSB5
b3UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIHRoZSBjb250cm9sIGFuZCBkYXRhCj4gPiBvcHMgd2hl
biBwb3B1bGF0aW5nIHRoaXMgdGFibGUuIFRob3NlIGFyZSBqdXN0IG9wZXJhdGlvbnMgdGhlIE5B
TkQKPiA+IHN1cHBvcnRzLCBhbmQgdGhlIGRhdGEgb3BlcmF0aW9ucyBpcyBqdXN0IGEgc3Vic2V0
Lgo+ID4gIAo+ID4+IDIuIElmIHdlIHVzZSB0aGlzIHNpbmdsZSBvcF90ZW1wbGF0ZXMgc3RydWN0
LCBJIGNhbid0IHRoaW5rIG9mIGFueSBnb29kCj4gPj4gd2F5IHRvIGluaXRpYWxpemUgdGhlc2Ug
aW4gdGhlCj4gPj4gbWFudWZhY3R1cmVycyBkcml2ZXIgKHdpbmJvbmQuYyksIHJlZmVyIHRvIDE3
dGggcGF0Y2ggaW4gdGhpcyBzZXJpZXMuCj4gPj4gQ291bGQgeW91IHBsZWFzZSBzdWdnZXN0IGEg
bWFjcm8KPiA+PiBpbXBsZW1lbnRhdGlvbiBhbHNvIGZvciB3aW5ib25kLmMgd2l0aCB0aGUgc3Vn
Z2VzdGVkIG9wX3RlbXBsYXRlcyBzdHJ1Y3QuICAKPiA+IEZpcnN0IHJlcGxhY2UgdGhlIG9wX3Zh
cmlhbnRzIGZpZWxkIGJ5IHNvbWV0aGluZyBtb3JlIGdlbmVyaWM6Cj4gPgo+ID4gc3RydWN0IHNw
aW5hbmRfaW5mbyB7Cj4gPiAuLi4KPiA+IAljb25zdCBzdHJ1Y3Qgc3BpbmFuZF9vcF92YXJpYW50
cyAqKm9wc192YXJpYW50czsKPiA+IC4uLgo+ID4gfTsKPiA+Cj4gPiAjZGVmaW5lIFNQSU5BTkRf
T1BfVkFSSUFOVFMoX2lkLCAuLi4pIFwKPiA+IAlbU1BJX05BTkRfT1BfICMjIF9pZF0gPSB7IF9f
VkFfQVJHU19fIH0KPiA+Cj4gPiAjZGVmaW5lIFNQSU5BTkRfT1BTX1ZBUklBTlRTKG5hbWUsIC4u
LikKPiA+IAljb25zdCBzdHJ1Y3Qgc3BpbmFuZF9vcF92YXJpYW50cyBuYW1lW117Cj4gPiAJCV9f
VkFfQVJHU19fLAo+ID4gCX07Cj4gPgo+ID4gI2RlZmluZSBTUElOQU5EX0lORk9fT1BTX1ZBUklB
TlRTKGRlZnMpCj4gPiAJLm9wc192YXJpYW50cyA9IGRlZnMgIAo+IAo+IElmIHdlIG1vZGlmeSB0
aGVzZSBtYWNyb3MsIGl0IHdvdWxkIHJlcXVpcmUgb3RoZXIgc3BpbmFuZCB2ZW5kb3IgZHJpdmVy
cyAKPiB0byBjaGFuZ2UgKHRvc2hpYmEsIG1pY3JvbiwgZXRjKS4KPiBUaGUgb2xkZXIgbWFjcm9z
IHN1aXQgdGhlbSB3ZWxsLCBzaG91bGQgd2UgZ28gYWJvdXQgY2hhbmdpbmcgdGhlbSB0byAKPiB0
aGlzIG5ldyBtYWNybyAod2lsbCByZXF1aXJlIHJlLXRlc3RpbmcgYWxsIG9mIHRoZW0pLAo+IG9y
IGNhbiB3ZSBrZWVwIHRoZW0gdW5jaGFuZ2VkIGFuZCBoYXZlIG5ldyBzZXQgb2YgbWFjcm9zIHdp
dGggZGlmZmVyZW50IAo+IG5hbWUgKHBsZWFzZSBnaXZlIHN1Z2dlc3Rpb24gZm9yIGl0KSBmb3Ig
b3AgdmFyaWFudHMuCgpJJ2QgcmF0aGVyIGhhdmUgZXZlcnl0aGluZyBjb252ZXJ0ZWQgdG8gdGhl
IG5ldyBhcHByb2FjaCAod2UgZG9uJ3Qgd2FudAoyIHdheXMgb2YgZGVzY3JpYmluZyB0aGUgc2Ft
ZSB0aGluZyksIGFuZCBJJ20gbm90IHN1cmUgeW91IGNhbiBtYWtlIHRoZQpvbGQgbWFjcm9zIG1h
cCB0byB0aGUgbmV3IHNvbHV0aW9uLCBzbyBJIGZlYXIgeW91J2xsIGhhdmUgdG8gcGF0Y2ggYWxs
CnZlbmRvcnMuIFRoaXMgYmVpbmcgc2FpZCwgSSdtIGZpbmUgcHJvdmlkaW5nIHNpbXBsZSB3cmFw
cGVycyBpZiB0aGF0CmhlbHBzLCBidXQgSSBkb24ndCBzZWUgaG93IHRoZXknZCBtYWtlIHRoZSBk
ZXNjcmlwdGlvbiBzaW1wbGVyL21vcmUKY29tcGFjdCB0byBiZSBob25lc3QuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
