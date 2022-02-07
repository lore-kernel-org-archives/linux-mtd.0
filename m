Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEC5C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Feb 2022 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=livtIkDTk86MUcKQPytHdnS+BukMNCCTXjQIfNGPHCs=; b=aDOUe7aLqc4iI5
	buhDltNvTP8BE4KNldNNL9qqXdXIX/s8Xw7Lu4a2FTXDmMEcJmF+aXRfwHpBDX6C6D08A2mBJnICH
	WdhvZ/9Aw2g2nXU91itEpABzOkSMTl7aKWkxMAyhoJMCjtEpn5HM1/HAxBMaJVz6nQceb86sNJfgG
	KYE2/T8i82zHq8DEZRoj9hU8gIwubs1oB819uGed4z2K5UPgEy+gbO6oSgSd2gecG4eokKiGrH0C3
	16vrWtO51VR1g5hFgxOg+aas8Jxc9IOD4u27+VNFvzZ0ATTFvG+Aadze0XAbhhZlLsn1CDILWrPvf
	Ts51X1MB8VvJ4Rge9yWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6UV-00AwzB-Tm; Mon, 07 Feb 2022 16:03:48 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH61w-00Akvb-Gr
 for linux-mtd@lists.infradead.org; Mon, 07 Feb 2022 15:34:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58FD860008;
 Mon,  7 Feb 2022 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644248051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNbH3GXexGdP8asRoGUVYUSmCCb0DsippkqLnYR8tlU=;
 b=NaR/jhgiusyCl0F+9RdOyYfrupXLDC8VV/qcRtRuEt4vS3svCLgTIv563RWOw4i+k7B0Ze
 UXp/T202w0dggkozb7gjFMDHn682+IMwdKjPhylUg2ggKyZC+4tiEVkLg/0c5NsJE+ozfX
 B/OBxqFw/Ie52fF2/8R3xlxV8sbzPk7q9Q/pppk1WGtV7UJpUlLzPnaV6LDBe8bV3LBluS
 ZvWvJ657wOJRJZeVPGqTWkiAQIyP0nynuBMTYiTyW2nDifhoJbFodAbiGrxygO1MXu6Nmx
 HMHyUjL1OBfM3SvWSZEz/ncDgE79LohA+x7DfcdgPu4IEs4h9PDFEeZ0PklRXw==
Date: Mon, 7 Feb 2022 16:34:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtdoops: Fix the size of the header read buffer.
Message-ID: <20220207163409.19c3bc4c@xps13>
In-Reply-To: <CAL3wywWSDJUsbgJf4NXctxJmrJRzyO9V-PVcu3qftM1GGPyU_Q@mail.gmail.com>
References: <20220128220156.4057446-1-jmeurin@google.com>
 <20220131110003.7aacad70@xps13>
 <CAL3wywWSDJUsbgJf4NXctxJmrJRzyO9V-PVcu3qftM1GGPyU_Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_073416_923225_2AFD7E7A 
X-CRM114-Status: GOOD (  28.78  )
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

SGkgSmVhbi1NYXJjLAoKSXQgbG9va3MgbGlrZSB5b3UgY2hhbmdlZCB0aGUgdGl0bGUgd2hlbiBh
bnN3ZXJpbmcgdG8gbXkgcXVlc3Rpb24sIEkKdGhvdWdodCB0aGlzIHdhcyBhIHYyIGFuZCBjb3Vs
ZCBub3QgZmluZCBpdCBpbiBwYXRjaHdvcmsuIFRoYXQgaXMKYmVjYXVzZSB0aGUgdjIgZG9lcyBu
b3QgYWN0dWFsbHkgZXhpc3Q/CgpqbWV1cmluQGdvb2dsZS5jb20gd3JvdGUgb24gVGh1LCAzIEZl
YiAyMDIyIDE3OjUzOjQ3Ci0wODAwOgoKPiBPbiBNb24sIEphbiAzMSwgMjAyMiBhdCAyOjAwIEFN
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+
IEhpIEplYW4tTWFyYywKPiA+Cj4gPiBqbWV1cmluQGdvb2dsZS5jb20gd3JvdGUgb24gRnJpLCAy
OCBKYW4gMjAyMiAxNDowMTo1NiAtMDgwMDoKPiA+ICAKPiA+ID4gVGhlIHJlYWQgYnVmZmVyIHNp
emUgZGVwZW5kcyBvbiB0aGUgTVRET09QU19IRUFERVJfU0laRS4KPiA+ID4KPiA+ID4gVGVzdGVk
OiBDaGFuZ2VkIHRoZSBoZWFkZXIgc2l6ZSwgaXQgZG9lc24ndCBwYW5pYywgaGVhZGVyIGlzIHN0
aWxsCj4gPiA+IHJlYWQvd3JpdHRlbiBjb3JyZWN0bHkuICAKPiA+Cj4gPiBPbiB3aGF0IExpbnV4
IGtlcm5lbCB2ZXJzaW9uIGFyZSB5b3U/IEl0IGxvb2tzIGxpa2Ugd2UgZG9uJ3Qgc2hhcmUgdGhl
Cj4gPiBzYW1lIGNvZGUgYmFzZSwgYXJlIHdlPyAgCj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVy
cy9tdGQvbXRkb29wcy5jP2g9djUuMTctcmMyCj4gaGFzIHRoYXQgYnVnLiAgSWYgeW91IHRyeSB0
byBpbmNyZWFzZSB0aGUgTVRET09QU19IRUFERVJfU0laRSwKPiBmaW5kX25leHRfcG9zaXRpb24o
KSB3aWxsIHRyeSB0byBkbyBhbiBtdGRfcmVhZCgpIG9mCj4gTVRET09QU19IRUFERVJfU0laRSBi
eXRlcyBpbiBhIGNvdW50IGJ1ZmZlciB0aGF0IGlzIGZpeGVkIHRvIG9ubHkgOAo+IGJ5dGVzLgoK
SSBtaWdodCBoYXZlIGNoZWNrZWQgYW5vdGhlciBmdW5jdGlvbiB0aGVuLiBJbmRlZWQgdGhlIGZp
eCBsb29rcyBsZWdpdC4KCkNhbiB5b3UgcGxlYXNlIHNlbmQgYSB2MiB3aXRoOgotIFlvdXIgdHdv
IHBhdGNoZXMgaW4gdGhlIHNhbWUgc2VyaWVzIChmb3JtYXR0ZWQgd2l0aCBnaXQtZm9ybWF0LXBh
dGNoCiAgdG8gZ2V0IHRoZSBkZXBlbmRlbmN5L29yZGVyIHJpZ2h0KQotIEluIHRoZSBvdGhlciBj
b21taXQsIGRyb3AgdGhlIHJlZmVyZW5jZSBwb2ludGluZyB0byAoSSBiZWxpZXZlKSBhCiAgY29t
bWl0IGhhc2ggdGhhdCBpcyBsb2NhbCB0byB5b3VyIHRyZWUgb25seS4KLSBVc2UgdGhlIHJpZ2h0
IHByZWZpeCAoIm10ZDogbXRkb29wczoiKS4KCkFuZCB3ZSBzaG91bGQgYmUgZ29vZC4KCj4gCj4g
VGhhbmtzLAo+IAo+IEplYW4tTWFyYwo+IAo+ID4gIAo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBKZWFuLU1hcmMgRXVyaW4gPGptZXVyaW5AZ29vZ2xlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBk
cml2ZXJzL210ZC9tdGRvb3BzLmMgfCAyICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL210ZG9vcHMuYyBiL2RyaXZlcnMvbXRkL210ZG9vcHMuYwo+ID4gPiBpbmRleCAyMjdkZjI0
Mzg3ZGYuLjA5YTI2NzQ3ZjQ5MCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkb29w
cy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL210ZG9vcHMuYwo+ID4gPiBAQCAtMjIzLDcgKzIy
Myw3IEBAIHN0YXRpYyB2b2lkIGZpbmRfbmV4dF9wb3NpdGlvbihzdHJ1Y3QgbXRkb29wc19jb250
ZXh0ICpjeHQpCj4gPiA+ICB7Cj4gPiA+ICAgICAgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gY3h0
LT5tdGQ7Cj4gPiA+ICAgICAgIGludCByZXQsIHBhZ2UsIG1heHBvcyA9IDA7Cj4gPiA+IC0gICAg
IHUzMiBjb3VudFsyXSwgbWF4Y291bnQgPSAweGZmZmZmZmZmOwo+ID4gPiArICAgICB1MzIgY291
bnRbTVRET09QU19IRUFERVJfU0laRS9zaXplb2YodTMyKV0sIG1heGNvdW50ID0gMHhmZmZmZmZm
ZjsKPiA+ID4gICAgICAgc2l6ZV90IHJldGxlbjsKPiA+ID4KPiA+ID4gICAgICAgZm9yIChwYWdl
ID0gMDsgcGFnZSA8IGN4dC0+b29wc19wYWdlczsgcGFnZSsrKSB7ICAKPiA+Cj4gPgo+ID4gVGhh
bmtzLAo+ID4gTWlxdcOobCAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
