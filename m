Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84FFC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 11 May 2022 07:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHTSBbyZY8NsaZdsgb2etdH6YCyMZq+15YLuchNZphc=; b=5EDl3mfHN1Dc6v
	M6OHvmTD/x4wIE3ECEkbpU1wc/f9zbP2cTxtGdIFFyhniRa4stWroc3ygcHXRoC4QWJ3Q9CjYAZKA
	O6S+e2oA/KGw8X2yz61B6g0pCMvhHmJLw8sBhwcLJmIjFZi8qFFcXvBTYfmzATTeMoZFhFyP5iHcZ
	/EH3X3012NVPdSlEfacuh6yoP56FWF1+eVDFx+rMaLGgidZ67t4Sf5/1vZ7jtxe0UOK8/YpCtpH2E
	DnUxZw7mbglOXAI3nPGdRWv18KUKuXcj0ApoHz3Y6bTiwAjJMUcFq9V1ws9NMujZpy/rv8E5VTJak
	acihRpmkZjXUHyQNlaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nogae-005eTQ-L5; Wed, 11 May 2022 07:16:56 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nogaa-005eSN-GO
 for linux-mtd@lists.infradead.org; Wed, 11 May 2022 07:16:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F5AF1C0002;
 Wed, 11 May 2022 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652253406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOqxb4Qu9rmih6DzG9zt5c/lYLp6jBz4NYLyC5x7wow=;
 b=BzgOuVt+7Zca6d+dNLk2gWvrAkAqOfykz9eziVZyd3Z9zJzIwFb2oIETTedQIGbTi6y4sg
 5Ska0+kn3yD2mX3EOatDjrPVRqosF9cWc8TqaStubN2zIj04GVmiY3J3yLZ85Hw/0W9Glz
 iYs5UgjNHwcyWrRXrp0N1JNc2K9c2uXetfAz/X+T8Zhgbk5CC4vHdm3R2ckSPZ5euvDjDX
 hGkO28k69Fs264A8+2uJhsNLNFwgoD8LCq5GavzW0yQgRYtMZIByxNKLPWJA6tHRCiOz7A
 iaBIrElYm74U2o+vlc1PkgcTQZ9lWGzdvKWorcZF4M28rQCr1xrQ2/ma4mHWqA==
Date: Wed, 11 May 2022 09:16:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, NOGUCHI Hiroshi
 <drvlabo@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Karim
 <Karimdplay@gmail.com>, M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: add support for Sercomm partitions
Message-ID: <20220511091643.064f9d13@xps13>
In-Reply-To: <ede9e050-3b60-ba0e-c626-044f7825adb7@gmail.com>
References: <20220329122016.4122899-1-csharper2005@gmail.com>
 <20220330100958.57dc4d61@xps13>
 <ede9e050-3b60-ba0e-c626-044f7825adb7@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_001652_851957_549D61A5 
X-CRM114-Status: GOOD (  20.96  )
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

SGkgTWlraGFpbCwKCmNzaGFycGVyMjAwNUBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAxMCBNYXkg
MjAyMiAyMzowNzoyMyArMDMwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDMvMzAvMjAyMiAxMTow
OSBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIE1pa2hhaWwsCj4gPgo+ID4gY3NoYXJw
ZXIyMDA1QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDI5IE1hciAyMDIyIDEyOjIwOjE2ICswMDAw
Ogo+ID4gIAo+ID4+IFRoaXMgYWRkcyBhbiBNVEQgcGFydGl0aW9uIHBhcnNlciBmb3IgdGhlIFNl
cmNvbW0gcGFydGl0aW9uIHRhYmxlIHRoYXQKPiA+PiBpcyB1c2VkIGluIHNvbWUgQmVlbGluZSwg
TmV0Z2VhciBhbmQgU2VyY29tbSByb3V0ZXJzLgo+ID4+Cj4gPj4gVGhlIFNlcmNvbW0gcGFydGl0
aW9uIG1hcCB0YWJsZSBjb250YWlucyByZWFsIHBhcnRpdGlvbiBvZmZzZXRzLCB3aGljaAo+ID4+
IG1heSBkaWZmZXIgZnJvbSBkZXZpY2UgdG8gZGV2aWNlIGRlcGVuZGluZyBvbiB0aGUgbnVtYmVy
IGFuZCBsb2NhdGlvbiBvZgo+ID4+IGJhZCBibG9ja3Mgb24gTkFORC4KPiA+Pgo+ID4+IERldmlj
ZSB0cmVlIGV4YW1wbGU6Cj4gPj4gcGFydGl0aW9ucyB7Cj4gPj4gCWNvbXBhdGlibGUgPSAic2Vy
Y29tbSxzYy1wYXJ0aXRpb25zIiwgImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4+IAkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKPiA+PiAJI3NpemUtY2VsbHMgPSA8MT47Cj4gPj4KPiA+PiAJcGFydGl0aW9u
QDAgewo+ID4+IAkJbGFiZWwgPSAidS1ib290IjsKPiA+PiAJCXJlZyA9IDwweDAgMHgxMDAwMDA+
Owo+ID4+IAkJc2NwYXJ0LWlkID0gPDA+Owo+ID4+IAkJcmVhZC1vbmx5Owo+ID4+IAl9Owo+ID4+
IH07ICAKPiA+IFlvdSdsbCBuZWVkIGEgRFQgYmluZGluZyBwYXRjaCBhbmQgUm9iJ3MgYWNrISAg
Cj4gCj4gSSBob3BlIHRoYXQgSSBuZWFyIHRvIGZpbmlzaCB3aXRoIERUIGJpbmRpbmcuLi4KPiAK
PiBMaW5rOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDUxMDE2MjMxNC4yMDgx
MC0xLWNzaGFycGVyMjAwNUBnbWFpbC5jb20vCj4gCj4gTGluazoKPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyMjA1MTAxNjI0MDMuMjA4NjEtMS1jc2hhcnBlcjIwMDVAZ21haWwuY29t
Lwo+IAo+ID4+IFRoaXMgaXMgZXNzZW50aWFsbHkgdGhlIHNhbWUgY29kZSBhcyBwcm9wb3NlZCBi
eSBOT0dVQ0hJIEhpcm9zaGkKPiA+PiA8ZHJ2bGFib0BnbWFpbC5jb20+IGhlcmU6ICAKPiA+IEkg
d291bGQgY3JlZGl0IEhpcm9zaGkgd2l0aCBhIFN1Z2dlc3RlZC1ieSBhdCBsZWFzdCAgCj4gCj4g
SSByZWFkIHN1Ym1pdHRpbmcgcGF0Y2hlcyBydWxlcyBhZ2FpbiBhbmQgdGhvdWdodCB0aGF0IFNp
Z25lZC1vZmYtYnkgaXMKPiBzdWl0YWJsZSBmb3IgdGhpcyBjYXNlLiBJcyB0aGlzIG9rPwoKRWl0
aGVyIHlvdSB0YWtlIGhpcyB3b3JrIGFsbW9zdCBsaWtlIGl0IGlzIGFuZCBoZSBtdXN0IGJlIHRo
ZSBhdXRob3IKKmFuZCogdGhlIGZpcnN0IHNpZ25lZC1vZmYtYnkgbGluZSwgb3IgeW91IHRha2Ug
dGhlIGF1dGhvcnNoaXAgaWYgeW91CnRoaW5rIHlvdSBkaWQgZW5vdWdoIG1vZGlmaWNhdGlvbnMg
dG8gdGhlIGNvZGUgYW5kIGluIHRoaXMgY2FzZSB5b3UgY2FuCmVpdGhlciBjcmVkaXQgaGltIHdp
dGggYSBzdWdnZXN0ZWQtYnkgYmVmb3JlIHlvdXIgc2lnbmVkLW9mZiwgb3IgeW91CmNhbiBjcmVk
aXQgaGltIHdpdGggYSBjby1kZXZlbG9wZWQtYnkgKyBoaXMgc2lnbmVkLW9mZiBhbmQgdGhlbiB5
b3Vycy4KCj4gCj4gTGluazoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA1MTAx
NjI2NTUuMjEwMTEtMS1jc2hhcnBlcjIwMDVAZ21haWwuY29tLwo+IAo+ID4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVud3J0L29wZW53cnQvcHVsbC8xMzE4I2lzc3VlY29tbWVudC00MjA2MDczOTQg
IAo+ID4gQW5kIHVzZSBhIExpbms6IHRhZyBmb3IgdGhpcy4KPiA+ICAKPiBGaXhlZCwgdGhhbmtz
IQo+IAo+IExpbms6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNTEwMTYyNjU1
LjIxMDExLTEtY3NoYXJwZXIyMDA1QGdtYWlsLmNvbS8KPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXD
qGwgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
