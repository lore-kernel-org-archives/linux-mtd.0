Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91E8C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 07:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIRB2pz3UwA7ZGwxkFTdNc/bd5OSgvoK2xTewE+7FK0=; b=yFmICjEqGXeVWI
	IROULtjKChbKsGCDlL+JOO8nbFxnV7eVZhomb5pa9XJ7oQZIelU0JQLJbDCqgs0vjwloCBp0dyrHj
	ul0ezX30Dzu8Ys+UdFOzplHVM936ms+zPCESkZ4nK8tX0+LRRpPE68tIPZPhVg7PXzwMYTqIwu2lN
	Rl9Of7Jbkv+5kL3uWRAntT0lFhsaSf2U4JNe9MQ24vIAkjCniKJGtiOuwUFGxMCinf6+a4MWLSrKO
	LZfOWw20ZzFTcFithzm79Iio8SpFZMaMaQdW4rEc5Uy4u/YkwHIxOn6OlzjvdiUiUgCKcWGy5AEVv
	LDHxi9ErPkm2Sxl5g+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrDyW-0002Vy-4v; Wed, 18 May 2022 07:20:04 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrDyA-0002NZ-0v; Wed, 18 May 2022 07:19:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6451EE0012;
 Wed, 18 May 2022 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652858378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrV4EE5DZngLdpWzfnsjRVj4sFbo3FeybVGcaLDnamw=;
 b=R51haHGNtqEyGZqQurIqU9U9tAyVLT/rwEMi6j7UDk1/sBtUAfRQNH3lwwR2L9YzdlqNgj
 rrk/kaGh2pGDOdR5WxTF4B5HO3zQmTIS9Z4Ht8fgGIz3jQVplHxryyvYEa1d8HDRXTq4tR
 7lwdKxzWExAr4HDakWNHP2K7+cCSvriuKrPX1PGpwEFf5lzKEUB5yZNxiSskFPcNAshi/t
 OflFVWulaf+lZ2SAMm4IsRfwLcBmXb9oKkHFogwQ8PRxoR1z2H6GmaVOZlEPjUdopONeCH
 lG8o8WmCGPWhjlsF5xL4jPrLYH/NMz8U79+TUzDcS1tqrCoUVPkaASIv+hjYzw==
Date: Wed, 18 May 2022 09:19:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Michael
 Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [RFC PATCH 3/6] mtd: spi-nor: core: run calibration when
 initialization is done
Message-ID: <20220518091931.279c5398@xps-13>
In-Reply-To: <20220518060640.os5fp5rez4ie7qc4@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-4-p.yadav@ti.com>
 <20220517160226.4107f282@xps-13>
 <20220518060640.os5fp5rez4ie7qc4@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_001942_701393_3F86B339 
X-CRM114-Status: GOOD (  32.65  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBXZWQsIDE4IE1heSAyMDIyIDEx
OjM3OjA1ICswNTMwOgoKPiArQ2VkcmljCj4gCj4gT24gMTcvMDUvMjIgMDQ6MDJQTSwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPiA+IEhpIFByYXR5dXNoLAo+ID4gCj4gPiBwLnlhZGF2QHRpLmNvbSB3
cm90ZSBvbiBGcmksIDEyIE1hciAyMDIxIDAwOjQyOjEzICswNTMwOgo+ID4gICAKPiA+ID4gT25j
ZSB0aGUgZmxhc2ggaXMgaW5pdGlhbGl6ZWQgdGVsbCB0aGUgY29udHJvbGxlciBpdCBjYW4gcnVu
Cj4gPiA+IGNhbGlicmF0aW9uIHByb2NlZHVyZXMgaWYgbmVlZGVkLiBUaGlzIGNhbiBiZSB1c2Vm
dWwgd2hlbiBjYWxpYnJhdGlvbiBpcwo+ID4gPiBuZWVkZWQgdG8gcnVuIGF0IGhpZ2hlciBjbG9j
ayBzcGVlZHMuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cC55
YWRhdkB0aS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMg
fCAxMiArKysrKysrKysrLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+ID4gaW5kZXggODg4
ODhkZjAwOWYwLi5lMGNiY2FmMWJlODkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gPiA+
IEBAIC0zNjUwLDYgKzM2NTAsNyBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcHJvYmUoc3RydWN0IHNw
aV9tZW0gKnNwaW1lbSkKPiA+ID4gIAkgKiBjaGVja2luZyB3aGF0J3MgcmVhbGx5IHN1cHBvcnRl
ZCB1c2luZyBzcGlfbWVtX3N1cHBvcnRzX29wKCkuCj4gPiA+ICAJICovCj4gPiA+ICAJY29uc3Qg
c3RydWN0IHNwaV9ub3JfaHdjYXBzIGh3Y2FwcyA9IHsgLm1hc2sgPSBTTk9SX0hXQ0FQU19BTEwg
fTsKPiA+ID4gKwlzdHJ1Y3Qgc3BpX21lbV9vcCBvcDsKPiA+ID4gIAljaGFyICpmbGFzaF9uYW1l
Owo+ID4gPiAgCWludCByZXQ7Cj4gPiA+ICAKPiA+ID4gQEAgLTM3MDksOCArMzcxMCwxNSBAQCBz
dGF0aWMgaW50IHNwaV9ub3JfcHJvYmUoc3RydWN0IHNwaV9tZW0gKnNwaW1lbSkKPiA+ID4gIAlp
ZiAocmV0KQo+ID4gPiAgCQlyZXR1cm4gcmV0Owo+ID4gPiAgCj4gPiA+IC0JcmV0dXJuIG10ZF9k
ZXZpY2VfcmVnaXN0ZXIoJm5vci0+bXRkLCBkYXRhID8gZGF0YS0+cGFydHMgOiBOVUxMLAo+ID4g
PiAtCQkJCSAgIGRhdGEgPyBkYXRhLT5ucl9wYXJ0cyA6IDApOwo+ID4gPiArCXJldCA9IG10ZF9k
ZXZpY2VfcmVnaXN0ZXIoJm5vci0+bXRkLCBkYXRhID8gZGF0YS0+cGFydHMgOiBOVUxMLAo+ID4g
PiArCQkJCSAgZGF0YSA/IGRhdGEtPm5yX3BhcnRzIDogMCk7Cj4gPiA+ICsJaWYgKHJldCkKPiA+
ID4gKwkJcmV0dXJuIHJldDsKPiA+ID4gKwo+ID4gPiArCW9wID0gc3BpX25vcl9zcGltZW1fZ2V0
X3JlYWRfb3Aobm9yKTsgIAo+ID4gCj4gPiBJc24ndCB0aGlzIHRvbyBzcGVjaWZpYz8gSSByZWFs
bHkgZG9uJ3Qga25vdyBtdWNoIGFib3V0IHNwaS1ub3JzLCBidXQgSQo+ID4gZmluZCBvZGQgdG8g
aGF2ZSB0aGlzIG9wIGJlaW5nIGNyZWF0ZWQgaGVyZSwgd2h5IG5vdCBtb3ZpbmcgdGhpcyBpbnRv
Cj4gPiB0aGUgX2RvX2NhbGlicmF0aW9uKCkgaGVscGVyPyAgCj4gCj4gTWF5YmUgdGhlIG5hbWlu
ZyBjb25mdXNlZCB5b3UgYnV0IHRoaXMgaXMgYSBmdW5jdGlvbiBpbiB0aGUgU1BJIE5PUiAKPiBj
b3JlLCBub3QgaW4gU1BJIE1FTS4gU1BJIE5PUiBzdXBwb3J0cyBib3RoIFNQSSBNRU0gYmFzZWQg
Y29udHJvbGxlcnMgCj4gYW5kICJsZWdhY3kiIGNvbnRyb2xsZXJzLCBzbyB0aGUgY29udmVudGlv
biBpcyB0byBhZGQgdGhlICJzcGltZW0iIAo+IHByZWZpeCBiZWZvcmUgU1BJIE1FTSBzcGVjaWZp
YyBmdW5jdGlvbnMuIFNvIEkgZG9uJ3QgZ2V0IHRoZSBjb21tZW50IAo+IGFib3V0IGl0IGJlaW5n
IHRvbyBzcGVjaWZpYy4gSXQgaXMgdG9vIHNwZWNpZmljIHRvIHdoYXQ/CgpNbWggcmlnaHQsIGl0
J3MgZmluZSB0aGVuLgoKPiAKPiBBbmQgaG93IGNhbiBzcGlfbWVtX2RvX2NhbGlicmF0aW9uKCkg
a25vdyB3aGF0IG9wIHRoZSBmbGFzaCB1c2VzIHRvIHJlYWQgCj4gZGF0YT8gU1BJIE5PUiBvciBT
UEkgTkFORCB3b3VsZCBrbm93IGl0LCBidXQgbm90IFNQSSBNRU0uIFRoYXQgaXMgd2h5IHdlIAo+
IHBhc3MgaW4gdGhhdCBpbmZvcm1hdGlvbiB0byBzcGlfbWVtX2RvX2NhbGlicmF0aW9uKCkuCgpC
dXQgaGVyZSB0aGUgb3AgaXMgInNwaS1ub3Igd2lkZSIsIEkgd291bGQgaGF2ZSBleHBlY3RlZCBh
CnBlci1kZXZpY2Ugb3AuIEJ1dCB0aGF0IGlzIG5vdCBhIGJpZyBkZWFsLCB0aGF0IGlzIHNvbWV0
aGluZyB0aGF0IGNhbgphbHNvIGJlIHVwZGF0ZWQgbGF0ZXIgaWYgbmVlZGVkIEkgZ3Vlc3MuCgpP
bmUgbGFzdCBxdWVzdGlvbiwgaXMgdGhlcmUgc29tZXRoaW5nIHRoYXQgbXRkX2RldmljZV9yZWdp
c3RlcigpIGRvZXMKdGhhdCBpcyByZWFsbHkgbmVlZGVkIGZvciB0aGUgY2FsaWJyYXRpb24gdG8g
d29yaz8gT3RoZXJ3aXNlIEkgd291bGQKcmF0aGVyIHByZWZlciB0byBoYXZlIHRoYXQgY2FsaWJy
YXRpb24gaGFwcGVuaW5nIGJlZm9yZSB0aGUgdXNlciBnZXRzCmFjY2VzcyB0byB0aGUgZGV2aWNl
LgoKPiAKPiA+ICAgCj4gPiA+ICsJc3BpX21lbV9kb19jYWxpYnJhdGlvbihub3ItPnNwaW1lbSwg
Jm9wKTsgIAo+ID4gCj4gPiBBIHdhcm5pbmcvaW5mbyB1cG9uIGNhbGlicmF0aW9uIGVycm9yIChu
b3Qgb24gdGhlIGFic2VuY2Ugb2YgdGhlIGhvb2spCj4gPiB3b3VsZCBiZSBuaWNlPyAgCj4gCj4g
WWVzLCBhZ3JlZWQuCj4gCj4gPiAgIAo+ID4gPiArCj4gPiA+ICsJcmV0dXJuIDA7Cj4gPiA+ICB9
Cj4gPiA+ICAKPiA+ID4gIHN0YXRpYyBpbnQgc3BpX25vcl9yZW1vdmUoc3RydWN0IHNwaV9tZW0g
KnNwaW1lbSkgIAo+ID4gCj4gPiBPdGhlcndpc2UgSSBsaWtlIHRoZSBvdmVyYWxsIGlkZWEuICAK
PiAKPiBUaGFua3MgZm9yIHJldmlld2luZy4KPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOo
bCAgCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
