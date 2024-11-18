Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471C7D4920B
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QqN51iHJdIb56ZWqyJqWY/G5AwAYUf/9bs9gxrEnuI=; b=qbg/EvG/8gJsQW
	T5xB6Ai7iL0Jt6LL2vsIxI2c9+5mmTkREGTmYNv6Z3Apd/TU3gKYJAy3zUHwLDv0MMjnxAIn40/Gf
	UOoeIdbOjnIPvghBcVFKNZwPJqlrwpDhx1PfVurjDOqoK6CYnzspmefuMERmf1Tm5FpFRjIHMYtd/
	mlVD1h3M35Bg3squoJ9Bp7UjzmRDtm9cGYxvTxw18q8OMDa40IV71E6PoCObwSNfx89scHhdSqPkB
	9l08zvubL+d8qdgn6EkyyKfLkMNdN5h/2FMVoR59n7ZALl5avYND7bV5W9qFB8aKYwLF1ILsMbjV4
	Y3jl8JizuZ5uwSIVoAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzPA-000000099zl-2cEI;
	Mon, 18 Nov 2024 10:54:52 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzO6-000000099lC-2FCE;
	Mon, 18 Nov 2024 10:53:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 171D4E000A;
	Mon, 18 Nov 2024 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731927223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMNhhf4AJiQlf8seJMUUIANSuBH8/Hc53QQnO/Pwl2s=;
	b=lWsTJ83Z7/D+bGIImekxeCyyueE+xJcz98Pb44JXUiEJmRV7QrJZGzx3WJ2lS8lDLS/QXi
	yXY9qgssIyx/qIwEiERDdhJtfJy30kNlyobMcraZR+wbSZNKwUULdpAYtjE22GzWMmJq8A
	WmTNDd5TivV0/xPtYz106JuRfDnuXjMBUdW1gmerJ13Mvh7ogKHSHsVfhBEG+sXJruaOLL
	FymCMg8v+4HxTo5WzpY6QNX93F50/CmK/0fH1+i/9Rw3ruos41ZOE568AFtLtMjuhdYk6U
	US8m0wb7AiJ06zHMUwopSR3MYjzD+BT9MIdWk2jNJntChaFkq0dB0ovUfpvQgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  Mika
 Westerberg <mika.westerberg@linux.intel.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  Steven Liu
 <Steven.Liu@mediatek.com>
Subject: Re: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
In-Reply-To: <20241020132722.20565-1-SkyLake.Huang@mediatek.com> (Sky Huang's
	message of "Sun, 20 Oct 2024 21:27:18 +0800")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 11:53:35 +0100
Message-ID: <87jzd0zuc0.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_025346_874357_51D66BE1 
X-CRM114-Status: GOOD (  15.18  )
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

T24gMjAvMTAvMjAyNCBhdCAyMToyNzoxOCArMDgsIFNreSBIdWFuZyA8U2t5TGFrZS5IdWFuZ0Bt
ZWRpYXRlay5jb20+IHdyb3RlOgoKPiBGcm9tOiAiU2t5IEh1YW5nIiA8c2t5bGFrZS5odWFuZ0Bt
ZWRpYXRlay5jb20+Cj4KPiBIaSwgdGhpcyBpcyBRaS1aZSBIdWFuZyhTa3kgSHVhbmcpIGZyb20g
TWVkaWFUZWsuIE9uIG91ciByb3V0ZXIgcGxhdGZvcm1zCj4gY2hpcHMsIHdlIGhhdmUgdG8gcXVh
bGl0eSBsb3RzIG9mIFNQSS1OQU5EIGRldmljZXMgYW5kIGFyZSBlYWdlciBmb3IKPiBhIHN0YW5k
YXJkIHNvIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBtYWludGFpbiB0cml2aWFsIGZsYXNoIElEIHRh
YmxlCj4gYW55bW9yZS4gSSBhbHNvIG5vdGljZWQgYSB0YWxrIGluIDIwMTkgRW1iZWRkZWQgTGlu
dXggQ29uZmVyZW5jZSwKPiBNZW1vcnkgVGVjaG5vbG9neSBEZXZpY2VzOiB3aGF0J3MgbmV3LCB3
aGljaCBtZW50aW9uZWQgIk9ORkkgZm9yCj4gU1BJLU5BTkRzPyBNYXliZSwgbWF5YmUgbm90Ii4K
Pgo+IFNvIGVhcmxpZXIgdGhpcyB5ZWFyLCBJIHByb3Bvc2VkIGEgYm9sZCBpZGVhLCBDQVNOIHBh
Z2UgKENvbW1vbiBBdHRyaWJ1dGVzCj4gZm9yIFNQSS1OQU5EKS4gSSB3b3JrZWQgdG9nZXRoZXIg
d2l0aCB0b3AgMyBTUEktTkFORCBtYXJrZXQgc2hhcmUgZmxhc2gKPiB2ZW5kb3JzIGFuZCBvdGhl
ciB2ZW5kb3JzIHRvIGludGVncmF0ZSBDQVNOIHBhZ2Ugb24gdGhlaXIgU1BJLU5BTkQgZGV2aWNl
cwo+IGluY2x1ZGluZyBidXQgbm90IGxpbWl0ZWQgdG86Cj4gW0VTTVRdCj4gRjUwTDFHNDFMQgo+
IEY1MEwyRzQxS0EKPgo+IFtFdHJvbl0KPiBFTTczQzA0NFZDRi1ICj4gRU03M0QwNDRWQ08tSAo+
IEVNNzNFMDQ0VkNFLUgKPiBFTTczRjA0NFZDQS1ICj4KPiBbR2lnYURldmljZV0KPiBHRDVGMUdN
N1VFCj4gR0Q1RjFHUTVVRVlJRwo+IEdENUYyR003VUUKPiBHRDVGMkdRNVVFWUlHCj4gR0Q1RjRH
TThVRQo+IEdENUY0R1E2VUVZSUcKPgo+IFtNYWNyb25peCAoTVhJQyldCj4gTVgzNUxGMUdFNEFC
WjRJRwo+Cj4gW1dpbmJvbmRdCj4gVzI1TjAxR1YKPiBXMjVOMDFLVgo+IFcyNU4wMktWCj4gVzI1
TjA0S1YKPgo+IEEgZG9jdW1lbnQgb2YgQ0FTTiBpcyBob3N0ZWQgb24gZ2l0aHViKGh0dHBzOi8v
Z2l0aHViLmNvbS9tdGstb3BlbndydC8KPiBkb2MvYmxvYi9tYWluL0NBU04lMjBQYWdlJTIwSW50
cm9kdWN0aW9uLnBkZikgU28gSSdsbCB0cnkgdG8ga2VlcCBpdAo+IHNpbXBsZSBoZXJlLgo+Cj4g
V2l0aCBDQVNOIHBhZ2UsIHdlIGRvbid0IG5lZWQgdG8gbWFpbnRhaW4gU1BJLU5BTkQgZmxhc2gg
SUQgdGFibGUgYW55bW9yZS4KPiBDdXJyZW50bHksIGl0J3MgaW50ZWdyYXRlZCBpbiAzLjNWIFNQ
SS1OQU5EcyBvZiBzbWFsbCBkZW5zaXR5IGFuZCBpdCdzIG5vdAo+IEpFREVDIHN0YW5kYXJkIHll
dC4gQnV0IGl0IHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSAxLjhWIGFuZCBjYW4gYmUgZWFzaWx5
Cj4gaW50ZWdyYXRlZCBieSBmbGFzaCB2ZW5kb3JzLgo+Cj4gSSBiZWxpZXZlIHRoaXMgaWRlYSBh
bmQgaW1wbGVtZW50YXRpb24gaGF2ZSByb29tIGZvciBpbXByb3ZlbWVudC4gSG9wZSB0bwo+IGhl
YXIgeW91IG9wZW4gc291cmNlIGNvbW11bml0eSdzIGNvbW1lbnRzIHNvb24uCgpJIHRoaW5rIHRo
aXMgaXMgYSBicmlnaHQgaW5pdGlhdGl2ZS4gSSdkIHdlbGNvbWUgc29tZSBzdGFuZGFyZGlzYXRp
b24gb24KdGhlIGRpc2NvdmVyeSBpbmRlZWQuCgpCdXQgdG8gYmUgcmVhbGx5IHVzZWZ1bCwgSSBi
ZWxpZXZlIHRoaXMgdGFibGUgbXVzdCBiZSByZWFsbHkgY29tcGxldGUsCm90aGVyd2lzZSBJRCdz
IHdpbGwgcmVtYWluLiBGb3IgaW5zdGFuY2UgU0RSL0REUiBtb2RlcyBhcmUgbm90IGVudGlyZWx5
CmRlZmluZWQgYXMgd2UgYWxyZWFkeSBoYXZlIG1peGVkIG1vZGVzLiBUaGVyZSBpcyBhbHNvIG5v
IGluZm9ybWF0aW9uCmFib3V0IHdoYXQgbWF4aW11bSBmcmVxdWVuY2llcyBjYW4gYmUgdXNlZCB3
aXRoIGVhY2ggb3BlcmF0aW9uLiBBcwphbm90aGVyIGV4YW1wbGUsIHRoZXJlIGlzIG5vIHJlYWQg
cmV0cnkgaW5mb3JtYXRpb24uIE5vciBhbnl0aGluZyBhYm91dAp0aGUgZmFjdCB0aGF0IHRoZSBv
bi1kaWUgRUNDIGVuZ2luZSBtaWdodCBub3QgYmUgZGlzYWJsZWQuCgpPdmVyYWxsIEkgdGhpbmsg
dGhpcyBpcyBhbiBpbnRlcmVzdGluZyBpbml0aWF0aXZlIGJ1dCBJIHdvdWxkIGxpa2UgaXQgdG8K
YmUgbW9yZSBhZHZhbmNlZC4gSXMgdGhlcmUgYSBwbGFuIG9uIGdldHRpbmcgdGhpcyBzdGFuZGFy
ZGl6ZWQgdGhyb3VnaAplZy4gYSBKRURFQyBzcGVjPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
