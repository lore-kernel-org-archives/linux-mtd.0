Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E130EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 07:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbAC/I3SAsXer002YLE9eL8OtyPwtnz8q1yYQEgAxsQ=; b=t4X8KDR9Rr26HN
	hPmg8BlffRlmaZK2hPHnQ29WYF2N+O3WUUwFIlgq7MajVHdhLCTjk8zjvHiYz13N6kxc73NBVr2Fl
	YwfVYhfOqMV0iXhRKfthvMUh66Z1rbTnx1Rf1hYtfQPRl6dFWNcHbkY1pFR7C/GJ81PCG7hqwlW6A
	djhM8b+drelDA3N7gEblcZY023eGSYVK08P9ToBY5ALq4JEpKmV3UZlPPQQIk1+uiCyyrbQ7O+LVI
	Lmm6n91WV7HqpqSwGRMAmDc0buVHId/N9oiG2vWbDjNvWDDb1619wHoCLxqErjD0IHehuukYpjfv2
	G0YG5QAjIc/KWF8p6Nvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIVn-003IFo-1B;
	Mon, 17 Jul 2023 07:19:15 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIVi-003IER-0x
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 07:19:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11CD01C0011;
	Mon, 17 Jul 2023 07:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689578345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLL869XY4nyFHcrIURsW6SKs/hqYvVTzwpz+lHMBaA0=;
	b=FD4oxS4gNSoicFEe81iKZGoKr6cxoHDiV/rv3wCK6zdJWQ/4gzWtQjybvgD/qrMq2EOcIA
	WsgeFUPdLOvAj8BSl7fCq9BLUzsKBWoBlhgki1iuuJIYfRGPDVhx5FTvjev7oxF2QGOpRH
	f/qz3exxM6/+SG6t6i6Si4eJARR79+tVRGx/VI+P/PO8nTnVJ6Okyg4Gg6yOGTAV2ZF/I2
	KJ93UmAd8wAI5qIhCIsAgRyExnvW4KXya7GKc8AhYv0NNlg+2k3DAGphP0N4QbJG97zW+e
	hErDSLw75sU3qXyQ9zu5gagjJvWRyDUFKjuZ1/7VVQDSH9ZMaovPiw6iIFvYqA==
Date: Mon, 17 Jul 2023 09:19:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, Alexander Shiyan <eagle.alexander923@gmail.com>,
 Domenico Punzo <dpunzo@micron.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
Message-ID: <20230717091900.52ed815a@xps-13>
In-Reply-To: <yw1x7cqzzr4d.fsf@mansr.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com>
	<20230716174917.3a9ca7a7@xps-13>
	<yw1x7cqzzr4d.fsf@mansr.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_001910_848102_49FDC257 
X-CRM114-Status: GOOD (  40.96  )
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

SGkgTcOlbnMgJiBBbGV4YW5kZXIsCgptYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBTdW4sIDE2IEp1
bCAyMDIzIDE4OjQ2OjI2ICswMTAwOgoKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiB3cml0ZXM6Cj4gCj4gPiBIZWxsbyBhbGwsCj4gPgo+ID4gU28gaGVyZSBpcyBh
IHN1bW1hcnkgb2YgdGhlIHNpdHVhdGlvbjoKPiA+IC0gd2UgaGF2ZSB0d28gYnVnIHJlcG9ydHMg
cmVnYXJkaW5nIHRoZSB1c2Ugb2Ygc2VxdWVudGlhbCBwYWdlIHJlYWRzCj4gPiAtIGJvdGggYXJl
IG9uIFRJIE9NQVAgcGxhdGZvcm1zOiBBTTMzWFggYW5kIEFNMzUxNy4gSSBiZWxpZXZlIGJvdGgg
YXJlCj4gPiAgIHVzaW5nIHRoZSBzYW1lIG9tYXAyLmMgZHJpdmVyCj4gPiAtIHRoZXkgdXNlIGEg
TWljcm9uIGFuZCBhIFNhbXN1bmcgTkFORCBjaGlwCj4gPgo+ID4gQWxsIHRoZXNlIGluZm9ybWF0
aW9uIGdpdmVzIG1lIHRoZSBoaW50IHRoYXQgaXQgaXMgcmVsYXRlZCB0byB0aGUKPiA+IGNvbnRy
b2xsZXIgZHJpdmVyIHdoaWNoIGRvZXMgc29tZXRoaW5nIHNpbGx5IGR1cmluZyB0aGUgZXhlY19v
cCBwaGFzZS4KPiA+Cj4gPiBBbGV4YW5kZXIgYW5kIE3DpW5zLCBjYW4geW91IHBsZWFzZSB0ZWxs
IG1lOgo+ID4gLSBBcmUgeW91IHVzaW5nIGEgZ3BpbyBmb3IgdGhlIHdhaXRyZHkgdGhpbmcgb3Ig
ZG8geW91IGxldmVyYWdlCj4gPiAgIG5hbmRfc29mdF93YWl0cmR5KCk/IElmIHlvdSBhcmUgdXNp
bmcgdGhlIGdwaW8sIGNhbiB5b3UgYm90aCB0cnkgd2l0aAo+ID4gICB0aGUgc29mdCBpbXBsZW1l
bnRhdGlvbiBhbmQgc2VlIGlmIGl0IGNoYW5nZXMgc29tZXRoaW5nPyAgCj4gCj4gVGhlcmUncyBu
byBncGlvIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNldHJlZSwgc28gSSBndWVzcyBpdCBtdXN0IGJl
IHVzaW5nCj4gbmFuZF9zb2Z0X3dhaXRyZHkoKS4KPiAKPiA+IC0gQXJlIHlvdSB1c2luZyBhbnkg
UE9MTCBvciBETUEgcHJlZmV0Y2ggbW9kZT8gQ2FuIHlvdSBwbGVhc2UgZm9yY2UgdGhlCj4gPiAg
IGRlZmF1bHQgaW4gYW5kIG91dCBoZWxwZXJzIGJ5IHVzaW5nIG9ubHkgb21hcF9uYW5kX2RhdGFf
aW4oKSBhbmQKPiA+ICAgb21hcF9uYW5kX2RhdGFfb3V0KCkgdG8gc2VlIGlmIGl0IGNoYW5nZXMg
c29tZXRoaW5nPyAgCj4gCj4gSXQgd2FzIHVzaW5nIHRoZSBkZWZhdWx0IFBSRUZFVENIX1BPTExF
RCBtb2RlLiAgU3dpdGNoaW5nIGl0IHRvIFBPTExFRAo+IChhbmQgdGh1cyBvbWFwX25hbmRfZGF0
YV9pbi9vdXQoKSkgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcuCj4gCj4gPiBJIGJlbGlldmUgdGhl
cmUgaXMgc29tZXRoaW5nIHdyb25nIGluIHRoZSB0aW1pbmdzLCB3aGlsZSBwcm9wZXJseQo+ID4g
aW1wbGVtZW50ZWQgaW4gdGhlb3J5IHRoZXJlIG1pZ2h0IGJlIHNvbWUgY2FzZXMgd2hlcmUgd2Ug
bWlzcyBhIGJhcnJpZXIKPiA+IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuIEkgd291bGQgbGlrZSB0
byB0cnkgdGhlIGZvbGxvd2luZyB0d28gaGFja3MsCj4gPiBhbmQgc2VlIGlmIHdlIGNhbiBmaW5k
IHdoYXQgaXMgdGhlIHRpbWluZyB0aGF0IGlzIG5vdCBvYnNlcnZlZCwgZGVzcGl0ZQo+ID4gdGhl
IGxhY2sgb2YgcHJvYmluZy4gVGhlIGZpcnN0IG9uZSBpcyBhIHJlYWwgaGFjaywgdGhlIHNlY29u
ZCBvbmUgbWlnaHQKPiA+IGFjdHVhbGx5IGxvb2sgbGlrZSBhIHJlYWwgZml4LiBQbGVhc2UgbGV0
IG1lIGtub3csIGJvdGggb2YgeW91LCBpZiB5b3UKPiA+IHNlZSBkaWZmZXJlbnQgYmVoYXZpb3Jz
Lgo+ID4KPiA+ICoqKiBIQUNLICMxICoqKgo+ID4KPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L29tYXAyLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMKPiA+IEBA
IC0yMTEzLDYgKzIxMTMsOSBAQCBzdGF0aWMgaW50IG9tYXBfbmFuZF9leGVjX2luc3RyKHN0cnVj
dCBuYW5kX2NoaXAgKmNoaXAsCj4gPiAgICAgICAgIGNhc2UgTkFORF9PUF9DTURfSU5TVFI6Cj4g
PiAgICAgICAgICAgICAgICAgaW93cml0ZTgoaW5zdHItPmN0eC5jbWQub3Bjb2RlLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgIGluZm8tPnJlZy5ncG1jX25hbmRfY29tbWFuZCk7Cj4gPiAr
ICAgICAgICAgICAgICAgaWYgKGluc3RyLT5jdHguY21kLm9wY29kZSA9PSBOQU5EX0NNRF9SRUFE
Q0FDSEVTRVEgfHwKPiA+ICsgICAgICAgICAgICAgICAgICAgaW5zdHItPmN0eC5jbWQub3Bjb2Rl
ID09IE5BTkRfQ01EX1JFQURDQUNIRUVORCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHVk
ZWxheSg1MCk7Cj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPgo+ID4gICAgICAgICBjYXNl
IE5BTkRfT1BfQUREUl9JTlNUUjoKPiA+Cj4gPiAqKiogSEFDSyAjMiAqKioKPiA+Cj4gPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9vbWFwMi5jCj4gPiBAQCAtMjE0Myw4ICsyMTQ2LDEwIEBAIHN0YXRpYyBpbnQgb21hcF9u
YW5kX2V4ZWNfaW5zdHIoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiA+ICAgICAgICAgICAgICAg
ICBicmVhazsKPiA+ICAgICAgICAgfQo+ID4KPiA+IC0gICAgICAgaWYgKGluc3RyLT5kZWxheV9u
cykKPiA+ICsgICAgICAgaWYgKGluc3RyLT5kZWxheV9ucykgewo+ID4gKyAgICAgICAgICAgICAg
IG1iKCk7Cj4gPiAgICAgICAgICAgICAgICAgbmRlbGF5KGluc3RyLT5kZWxheV9ucyk7Cj4gPiAr
ICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gIH0gIAo+IAo+IE5laXRoZXIg
b2YgdGhlc2UgaGVscC4KCkkgYW0gYWxzbyBwYXN0aW5nIEFsZXhhbmRlcidzIGFuc3dlciBoZXJl
OgoKPiBXZSBhcmUgdXNpbmcgR1BJTyBmb3Igd2FpdHJkeS4gSG93ZXZlciwgZXZlbiB3aGVuIHN3
aXRjaGluZyB0byBzb2Z0Cj4gaW1wbGVtZW50YXRpb24sCj4gdGhlIHN5c3RlbSBzdGlsbCBiZWhh
dmVzIGluY29ycmVjdGx5Lgo+IFdlIGFyZSB1c2luZyBwcmVmZXRjaC1kbWEgbW9kZSBmb3IgeGZl
ci4gQ2hhbmdpbmcgdG8gdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24KPiBkb2VzIG5vdCByZXN1
bHQgaW4gYW55IGltcHJvdmVtZW50cy4KPiAKPiBCb3RoIHBhdGNoZXMgZG9uJ3QgaGVscCA6KAoK
VGhhbmtzIGEgbG90IHRvIGJvdGggb2YgeW91IGZvciB0ZXN0aW5nLgoKU28sIEkgc2hvdWxkIGhh
dmUgZG9uZSB0aGF0IGVhcmxpZXIgYnV0LCBjb3VsZCB5b3UgcGxlYXNlIHNsb3cgdGhlCndob2xl
IG9wZXJhdGlvbiBkb3duLCBqdXN0IHRvIHNlZSBpZiB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcg
d2l0aCB0aGUKdGltaW5ncyBvciBpZiB3ZSBzaG91bGQgbG9vayBpbiBhbm90aGVyIGRpcmVjdGlv
bi4KCk1heWJlIHlvdSBjb3VsZCBhZGQgYSBib29sZWFuIHRvIGZsYWcgaWYgdGhlIGxhc3QgQ01E
IHdhcyBhClJFQURDQUNIRVNFUSwgUkVBRENBQ0hFU1RBUlQgb3IgUkVBRENBQ0hFRU5ELCBhbmQg
aWYgdGhlIGZsYWcgaXMKdHJ1ZSwgcGxlYXNlIGdldCB0aGUgamlmZmllcyBiZWZvcmUgYW5kIGFm
dGVyIGVhY2ggd2FpdHJkeSBhbmQKZGVsYXlfbnMuIEZpbmFsbHksIHBsZWFzZSBwcmludCB0aGUg
ZXhwZWN0ZWQgZGVsYXkgYW5kIHRoZSBhY3R1YWwgb25lCmFuZCBjb21wYXJlIHRvIHNlZSBpZiBz
b21ldGhpbmcgd2FzIHRvbyBmYXN0IGNvbXBhcmVkIHRvIHdoYXQgd2UKZXhwZWN0ZWQuCgpJbiBh
IHNlY29uZCB0ZXN0LCB5b3UgY291bGQgc2ltcGx5IGFkZCBhIHVkZWxheSg1MCk7IGF0IHRoZSBl
bmQgb2YKb21hcF9uYW5kX2V4ZWNfaW5zdHIoKS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
