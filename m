Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1F7C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 06:14:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7EAC217D7
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 06:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJI1vumC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G4gTunPO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7EAC217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uCqZQYyrpE/UJaxZY2mbV4bF/FBRs/GOLFCwOWhq/4=; b=JJI1vumCzTlWfo
	9PSVmrYEQHeza7GJAo0LeYO+PZECC0zSZvjVySxrey3QZNSK+4rZhDhD46r1zPilnZqjHUIF/+aKt
	FCEvPdq0p0sDogSMom0F0F3ANVdV+PQeMEu+iU0JJrLtDmNYgVQGTKpFjaBo4Snf+KaupTxgqXjE8
	A6dKRpjX3mNgmZXfHdr14j/EiIElqNA5RrowmHWB/Lz9ldO5AY1ePZWQAk0bmNYGb6sNkhLFn9oUG
	/zt43erJSDzcLuxgqNyXi2wm5jdWVDHtjLGbFN8UJhQ63ExUUeLG240ESbkduyv5qRsdqU6o9YK7t
	w+mhrST9esydFR8H4dyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCI7f-0000NV-6x; Fri, 05 Apr 2019 06:14:43 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCI7b-0000Fz-Lu
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 06:14:41 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x356ES2T115697;
 Fri, 5 Apr 2019 01:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1554444868;
 bh=LTj1LetO+c5ltGBCKoLceIiy8U7vi1ZyaaYq75+Q6bg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=G4gTunPOk0Dk47B3adUXlQ0wNxriMaTO8uEnb8yKXFg1rN5WpLYSJ1xclfBR+08ZV
 xAUkfVuxIGBdDL51wc7uL+RJWajWGgbPZA63baNoLQ9WtGhoqTbQM9ZWV9OcZkM5+W
 Q2c0mpLx72qAyn9ORYg40YYUSdHmYJVtfeex4myY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x356ES3E091615
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 5 Apr 2019 01:14:28 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Apr
 2019 01:14:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Apr 2019 01:14:28 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x356EOtc109639;
 Fri, 5 Apr 2019 01:14:25 -0500
Subject: Re: [LINUX PATCH v2 3/3] spi: spi-mem: Add support for Zynq QSPI
 controller
To: Naga Sureshkumar Relli <nagasure@xilinx.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
References: <1554105553-20207-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <c8f73eab-99eb-ddbc-9776-ea6b3a3ecf0f@ti.com>
 <MWHPR02MB2623EDDF4207C7CA8F97B5D4AF510@MWHPR02MB2623.namprd02.prod.outlook.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1fd37417-eaa6-834e-8b0b-a2519cfc4979@ti.com>
Date: Fri, 5 Apr 2019 11:45:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <MWHPR02MB2623EDDF4207C7CA8F97B5D4AF510@MWHPR02MB2623.namprd02.prod.outlook.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_231439_844874_AD93562E 
X-CRM114-Status: GOOD (  17.51  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 Michal Simek <michals@xilinx.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwNS8wNC8xOSAxMDo1NSBBTSwgTmFnYSBTdXJlc2hrdW1hciBSZWxsaSB3cm90ZToKPiBI
aSBWaWduZXNoLAo+IAo+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPiAKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGku
Y29tPgo+PiBTZW50OiBGcmlkYXksIEFwcmlsIDUsIDIwMTkgMTA6MTQgQU0KPj4gVG86IE5hZ2Eg
U3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlQHhpbGlueC5jb20+OyBicm9vbmllQGtlcm5lbC5v
cmc7Cj4+IGJicmV6aWxsb25Aa2VybmVsLm9yZwo+PiBDYzogbGludXgtc3BpQHZnZXIua2VybmVs
Lm9yZzsgZHdtdzJAaW5mcmFkZWFkLm9yZzsgbWFyZWsudmFzdXRAZ21haWwuY29tOwo+PiByaWNo
YXJkQG5vZC5hdDsgbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IE1pY2hhbCBTaW1lawo+PiA8bWljaGFsc0B4aWxpbnguY29tPjsgbmFn
YXN1cmVzaDEyQGdtYWlsLmNvbQo+PiBTdWJqZWN0OiBSZTogW0xJTlVYIFBBVENIIHYyIDMvM10g
c3BpOiBzcGktbWVtOiBBZGQgc3VwcG9ydCBmb3IgWnlucSBRU1BJIGNvbnRyb2xsZXIKPj4KPj4K
Pj4KPj4gT24gMDEvMDQvMTkgMToyOSBQTSwgTmFnYSBTdXJlc2hrdW1hciBSZWxsaSB3cm90ZToK
Pj4+ICsvKioKPj4+ICsgKiB6eW5xX3FzcGlfY29uZmlnX29wIC0gQ29uZmlndXJlIFFTUEkgY29u
dHJvbGxlciBmb3Igc3BlY2lmaWVkIHRyYW5zZmVyCj4+PiArICogQHhxc3BpOglQb2ludGVyIHRv
IHRoZSB6eW5xX3FzcGkgc3RydWN0dXJlCj4+PiArICogQHFzcGk6CVBvaW50ZXIgdG8gdGhlIHNw
aV9kZXZpY2Ugc3RydWN0dXJlCj4+PiArICoKPj4+ICsgKiBTZXRzIHRoZSBvcGVyYXRpb25hbCBt
b2RlIG9mIFFTUEkgY29udHJvbGxlciBmb3IgdGhlIG5leHQgUVNQSQo+Pj4gK3RyYW5zZmVyIGFu
ZAo+Pj4gKyAqIHNldHMgdGhlIHJlcXVlc3RlZCBjbG9jayBmcmVxdWVuY3kuCj4+PiArICoKPj4+
ICsgKiBSZXR1cm46CTAgb24gc3VjY2VzcyBhbmQgLUVJTlZBTCBvbiBpbnZhbGlkIGlucHV0IHBh
cmFtZXRlcgo+Pj4gKyAqCj4+PiArICogTm90ZTogSWYgdGhlIHJlcXVlc3RlZCBmcmVxdWVuY3kg
aXMgbm90IGFuIGV4YWN0IG1hdGNoIHdpdGggd2hhdAo+Pj4gK2NhbiBiZQo+Pj4gKyAqIG9idGFp
bmVkIHVzaW5nIHRoZSBwcmVzY2FsYXIgdmFsdWUsIHRoZSBkcml2ZXIgc2V0cyB0aGUgY2xvY2sK
Pj4+ICtmcmVxdWVuY3kgd2hpY2gKPj4+ICsgKiBpcyBsb3dlciB0aGFuIHRoZSByZXF1ZXN0ZWQg
ZnJlcXVlbmN5IChtYXhpbXVtIGxvd2VyKSBmb3IgdGhlCj4+PiArdHJhbnNmZXIuIElmCj4+PiAr
ICogdGhlIHJlcXVlc3RlZCBmcmVxdWVuY3kgaXMgaGlnaGVyIG9yIGxvd2VyIHRoYW4gdGhhdCBp
cyBzdXBwb3J0ZWQKPj4+ICtieSB0aGUgUVNQSQo+Pj4gKyAqIGNvbnRyb2xsZXIgdGhlIGRyaXZl
ciB3aWxsIHNldCB0aGUgaGlnaGVzdCBvciBsb3dlc3QgZnJlcXVlbmN5Cj4+PiArc3VwcG9ydGVk
IGJ5Cj4+PiArICogY29udHJvbGxlci4KPj4+ICsgKi8KPj4+ICtzdGF0aWMgaW50IHp5bnFfcXNw
aV9jb25maWdfb3Aoc3RydWN0IHp5bnFfcXNwaSAqeHFzcGksIHN0cnVjdAo+Pj4gK3NwaV9kZXZp
Y2UgKnNwaSkgewo+Pj4gKwl1MzIgY29uZmlnX3JlZywgYmF1ZF9yYXRlX3ZhbCA9IDA7Cj4+PiAr
Cj4+PiArCS8qCj4+PiArCSAqIFNldCB0aGUgY2xvY2sgZnJlcXVlbmN5Cj4+PiArCSAqIFRoZSBi
YXVkIHJhdGUgZGl2aXNvciBpcyBub3QgYSBkaXJlY3QgbWFwcGluZyB0byB0aGUgdmFsdWUgd3Jp
dHRlbgo+Pj4gKwkgKiBpbnRvIHRoZSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIChjb25maWdfcmVn
WzU6M10pCj4+PiArCSAqIGkuZS4gMDAwIC0gZGl2aWRlIGJ5IDIKPj4+ICsJICogICAgICAwMDEg
LSBkaXZpZGUgYnkgNAo+Pj4gKwkgKiAgICAgIC0tLS0tLS0tLS0tLS0tLS0KPj4+ICsJICogICAg
ICAxMTEgLSBkaXZpZGUgYnkgMjU2Cj4+PiArCSAqLwo+Pj4gKwl3aGlsZSAoKGJhdWRfcmF0ZV92
YWwgPCBaWU5RX1FTUElfQkFVRF9ESVZfTUFYKSAgJiYKPj4+ICsJICAgICAgIChjbGtfZ2V0X3Jh
dGUoeHFzcGktPnJlZmNsaykgLyAoMiA8PCBiYXVkX3JhdGVfdmFsKSkgPgo+Pj4gKwkJc3BpLT5t
YXhfc3BlZWRfaHopCj4+PiArCQliYXVkX3JhdGVfdmFsKys7Cj4+PiArCj4+Cj4+IEluc3RlYWQg
dXNlIERJVl9ST1VORF9VUCwgc29tZXRoaW5nIGxpa2UgYmVsb3cgc2hvdWxkIHdvcmsodW50ZXN0
ZWQpOgo+Pgo+PiAJdW5zaWduZWQgbG9uZyByZWZjbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZSh4cXNw
aS0+cmVmY2xrKTsKPj4gCXUzMiBiYXVkX3JhdGVfdmFsID0gRElWX1JPVU5EX1VQKHJlZmNsa19y
YXRlLCBzcGktPm1heF9zcGVlZF9oeikgLSAxOwo+PgoKT29wcywgc29ycnksIEkgaGFkIG1lYW50
CgoJdTMyIGJhdWRfcmF0ZV92YWwgPSBESVZfUk9VTkRfVVAocmVmY2xrX3JhdGUsIDIgKiBzcGkt
Pm1heF9zcGVlZF9oeikgLSAxOwoKQnV0IHBsZWFzZSBpZ25vcmUgbXkgY29tbWVudCwgSSBzZWUg
dGhhdCBkaXYgdmFsdWVzIGdvZXMgYnkgcG93ZXIgb2YgMiBhbmQgbm90IG11bHRpcGxlIG9mIDIK
ClJlZ2FyZHMKVmlnbmVzaAoKPiBUaGlzIGlzIG5vdCBqdXN0IGRpcmVjdCBjYWxjdWxhdGlvbi4K
PiBpLmUuIGZvciBleGFtcGxlCj4gcmVmY2xrX3JhdGUgPSAyMDBNSHogYW5kIG1heF9zcGVlZF9o
eCA9IDEwME1Iei4KPiB0aGVuIERJVl9ST1VORF9VUCBnaXZlcyBhIHZhbHVlIG9mIDIuCj4gQnV0
IHdyaXRpbmcgYSB2YWx1ZSBvZiAyIHRvIGNvbmZpZyByZWdpc3RlcnMgbWVhbnMsIGRpdmlkZSBi
eSA4LiBCdXQgd2Ugc2hvdWxkIHdyaXRlIGRpdmlkZSBieSAyICh2YWx1ZSBvZiB6ZXJvKS4KPiBU
aGF04oCZcyB3aHkgd2UgaW1wbGVtZW50ZWQgdGhlIGFib3ZlIGNhbGN1bGF0aW9uLgo+IAo+IDAw
MDogZGl2aWRlIGJ5IDIuCj4gMDAxOiBkaXZpZGUgYnkgNAo+IDAxMDogZGl2aWRlIGJ5IDgKPiAw
MTE6IGRpdmlkZSBieSAxNgo+IDEwMDogZGl2aWRlIGJ5IDMyCj4gMTAxOiBkaXZpZGUgYnkgNjQK
PiAxMTA6IGRpdmlkZSBieSAxMjgKPiAxMTE6IGRpdmlkZSBieSAyNTYKPiAKCgoKLS0gClJlZ2Fy
ZHMKVmlnbmVzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
