Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF40EC25B4E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBQTOrHg6fp4pxtEqXtxsShqE9CYbOhSClmxdmDF3uk=; b=e+Xp/B8fAD0CJL
	KjHr7EYp99YUPDU6EkXS+Tz5G86xsPBW69klAbza5YwVTZWXhunAphgdLznoFhiCAsH/pWr+E7VnZ
	JbZ4oOVyzi4V+4D0hxGZUAb2HLEOkQj44Wj5rGKitO0xgh2AZyg5HVYvMsV0BUT5b/Gkm54wKWBkP
	roOtGt31KcrDWdUUDUGih9Vcmn3VeW1dIiV+irKLzC0HEGkAWGxZb3p4rmTD1Sz3v5wDLH8AuEuVJ
	Mqmtt4y8VwQq4lXI+htaOOcH3afHXloAGzh44tgyUJD9sq5+vc9GhImobDmRVGAuoOlNmBZIGjVpi
	xsHYhNQRHOyw/1Gag69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHF4-003NTq-QB; Tue, 24 Jan 2023 11:13:30 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHF1-003NRA-UU
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 11:13:29 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30OBD5h9029965;
	Tue, 24 Jan 2023 05:13:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674558785;
	bh=EVHvEUsUbr7V09O6nsqlAU52oeFWF1tJ7m0+wq6YHIc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=e7pq5l7goAGx2zt0lSUZkXfjUp6eZ9ZukRP7TAc0VzhyuM4wBydt7y7zT6gmILkSG
	 6pVd9Nv8m6ssdm+IvGTfzc+I6qjxFqzAMYzdpezFZXIvoNravJClhmlBwBWCw9jvwT
	 rv1D9Hk0AXWlXBuWVtJtGib8Kusj8yDUaCVxMX9w=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30OBD5N1001456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jan 2023 05:13:05 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 24
 Jan 2023 05:13:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 24 Jan 2023 05:13:05 -0600
Received: from [10.250.234.171] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30OBCxJu022065;
	Tue, 24 Jan 2023 05:12:59 -0600
Message-ID: <073bb72e-ed53-ef40-1860-c0957d88e0c6@ti.com>
Date: Tue, 24 Jan 2023 16:42:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Re: [PATCH 1/2] mtd: spi-nor: spansion: Consider reserved bits in
 CFR5 register
Content-Language: en-US
To: Pratyush Yadav <ptyadav@amazon.de>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>, <Takahiro.Kuwano@infineon.com>,
        <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>,
        <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <Bacem.Daassi@infineon.com>,
        <stable@vger.kernel.org>
References: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
 <20230110164703.83413-1-tudor.ambarus@linaro.org>
 <mafs0v8kxb9mb.fsf_-_@amazon.de>
 <e02d6aa5-2189-4afb-2521-6034feaa3460@ti.com>
 <mafs0tu0gfc1z.fsf_-_@amazon.de>
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <mafs0tu0gfc1z.fsf_-_@amazon.de>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_031328_170954_36F2C7A4 
X-CRM114-Status: GOOD (  24.22  )
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

CgpPbiAyNC8wMS8yMyAxNjoxMywgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4gT24gTW9uLCBKYW4g
MjMgMjAyMywgRGhydXZhIEdvbGUgd3JvdGU6Cj4KPj4gSGkgUHJhdHl1c2gsCj4+Cj4+IE9uIDIz
LzAxLzIzIDIwOjA3LCBQcmF0eXVzaCBZYWRhdiB3cm90ZToKPj4+ICtDYyBEaHJ1dmEKPj4gSSBo
YWQgYWxyZWFkeSByZXZpZXdlZCB0aGlzLCBidXQgbm93IEkgaGF2ZSBsb2NhbGx5IGFwcGxpZWQg
dGhlIHBhdGNoZXMsCj4+IHRvIGxpbnV4IG1hc3RlciBhbmQgYnVpbHQgYW5kIHRlc3RlZCAtIHNl
ZW1zIG9rYXksCj4+PiBIaSBUdWRvciwKPj4+Cj4+PiBPbiBUdWUsIEphbiAxMCAyMDIzLCBUdWRv
ciBBbWJhcnVzIHdyb3RlOgo+Pj4KPj4+PiBDRlI1WzZdIGlzIHJlc2VydmVkIGJpdCBhbmQgbXVz
dCBiZSBhbHdheXMgMS4gU2V0IGl0IHRvIGNvbXBseSB3aXRoIGZsYXNoCj4+Pj4gcmVxdWlyZW1l
bnRzLiBXaGlsZSBmaXhpbmcgU1BJTk9SX1JFR19DWVBSRVNTX0NGUjVWX09DVF9EVFJfe0VOLCBE
U30KPj4+PiBkZWZpbml0aW9uLCBzdG9wIHVzaW5nIG1hZ2ljIG51bWJlcnMgYW5kIGRlc2NyaWJl
IHRoZSBtaXNzaW5nIGJpdCBmaWVsZHMKPj4+PiBpbiBDRlI1IHJlZ2lzdGVyLiBUaGlzIGlzIHVz
ZWZ1bCBmb3IgYm90aCByZWFkYWJpbGl0eSBhbmQgZnV0dXJlIHBvc3NpYmxlCj4+Pj4gYWRkaXRp
b24gb2YgT2N0YWwgU1RSIG1vZGUgc3VwcG9ydC4KPj4+Pgo+Pj4+IEZpeGVzOiBjMzI2NmFmMTAx
ZjIgKCJtdGQ6IHNwaS1ub3I6IHNwYW5zaW9uOiBhZGQgc3VwcG9ydCBmb3IgQ3lwcmVzcyBTZW1w
ZXIgZmxhc2giKQo+Pj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+Pj4gUmVwb3J0ZWQt
Ynk6IFRha2FoaXJvIEt1d2FubyA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4+
Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYyB8IDkgKysrKysrKy0t
Cj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jCj4+Pj4gaW5kZXggYjYyMWNkZmQ1MDZmLi4wN2Zl
MGY2ZmRmZTMgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5j
Cj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jCj4+Pj4gQEAgLTIxLDgg
KzIxLDEzIEBACj4+Pj4gICNkZWZpbmUgU1BJTk9SX1JFR19DWVBSRVNTX0NGUjNWICAgICAgICAg
ICAgICAgMHgwMDgwMDAwNAo+Pj4+ICAjZGVmaW5lIFNQSU5PUl9SRUdfQ1lQUkVTU19DRlIzVl9Q
R1NaICAgICAgICAgIEJJVCg0KSAvKiBQYWdlIHNpemUuICovCj4+Pj4gICNkZWZpbmUgU1BJTk9S
X1JFR19DWVBSRVNTX0NGUjVWICAgICAgICAgICAgICAgMHgwMDgwMDAwNgo+Pj4+IC0jZGVmaW5l
IFNQSU5PUl9SRUdfQ1lQUkVTU19DRlI1Vl9PQ1RfRFRSX0VOICAgIDB4Mwo+Pj4+IC0jZGVmaW5l
IFNQSU5PUl9SRUdfQ1lQUkVTU19DRlI1Vl9PQ1RfRFRSX0RTICAgIDAKPj4+PiArI2RlZmluZSBT
UElOT1JfUkVHX0NZUFJFU1NfQ0ZSNV9CSVQ2ICAgICAgICAgICBCSVQoNikKPj4+IFBlcmhhcHMg
Y29tbWVudCBoZXJlIHRoYXQgdGhpcyBiaXQgaXMgcmVzZXJ2ZWQuIE90aGVyd2lzZSBpdCBpcyBu
b3QKPj4+IG9idmlvdXMgd2hhdCB0aGlzIGRvZXMgYW5kIHdoeSB3ZSBhcmUgc2V0dGluZyBpdCB3
aXRob3V0IGdvaW5nIHRocm91Z2gKPj4+IGdpdC1ibGFtZS4gTm8gbmVlZCBmb3IgYSByZS1yb2xs
LCBJIHRoaW5rIGl0IGlzIGZpbmUgaWYgeW91IGFkZCB0aGlzCj4+PiB3aGVuIGFwcGx5aW5nLgo+
Pj4KPj4+PiArI2RlZmluZSBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZSNV9ERFIgICAgICAgICAgICBC
SVQoMSkKPj4+PiArI2RlZmluZSBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZSNV9PUEkgICAgICAgICAg
ICBCSVQoMCkKPj4+PiArI2RlZmluZSBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZSNVZfT0NUX0RUUl9F
TiAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4gKyAgICAgICAoU1BJTk9SX1JFR19D
WVBSRVNTX0NGUjVfQklUNiB8IFNQSU5PUl9SRUdfQ1lQUkVTU19DRlI1X0REUiB8ICAgXAo+Pj4+
ICsgICAgICAgIFNQSU5PUl9SRUdfQ1lQUkVTU19DRlI1X09QSSkKPj4+PiArI2RlZmluZSBTUElO
T1JfUkVHX0NZUFJFU1NfQ0ZSNVZfT0NUX0RUUl9EUyAgICBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZS
NV9CSVQ2Cj4+PiBJIHdvdWxkIHNheSBkb24ndCBmaXggd2hhdCBpc24ndCBicm9rZW4uIEJ1dCBp
ZiB5b3UgZG8sIHRlc3QgaXQuIERvIHlvdQo+Pj4gb3IgVGFrYWhpcm8gaGF2ZSBhIEN5cHJlc3Mg
UzI4KiBmbGFzaCB0byB0ZXN0IHRoaXMgY2hhbmdlIG9uPyBJZiBubywKPj4+IHRoZW4gcGVyaGFw
cyBEaHJ1dmEgY2FuIGhlbHAgaGVyZSBzaW5jZSBUSSB1c2VzIHRoaXMgZmxhc2ggb24gYSBidW5j
aCBvZgo+Pj4gdGhlaXIgYm9hcmRzPwo+Pj4KPj4+IFRoZSBjaGFuZ2UgbG9va3MgZmluZSB0byBt
ZSB3aXRoIHRoZSBhYm92ZSBjb21tZW50IGFkZGVkLCBJIGp1c3Qgd291bGQKPj4+IGxpa2Ugc29t
ZW9uZSB0byB0ZXN0IGl0IG9uY2UuCj4+IFRlc3RlZCBPU1BJX1NfRlVOQ19ERF9SV19FUkFTRVNJ
WkVfVUJJRlMgZnJvbSBsdHAtZGR0IGFuZCB0ZXN0IHNlZW1lZCB0byBwYXNzIG9uIG15Cj4+IEFN
NjI1IFNLIEVWTSBoYXZpbmcgYW4gT1NQSSBOT1IgUzI4SFM1MTJUIEZsYXNoLgo+IFRoYW5rcy4K
Pgo+IEJUVywgb25lIGludGVyZXN0aW5nIGJpdCBhYm91dCB0aGlzIGluIGNhc2UgeW91IGRpZG4n
dCBrbm93IGFscmVhZHkuCj4gU2luY2UgdGhpcyBpcyBwbGF5aW5nIHdpdGggT2N0YWwgRFRSIGVu
YWJsZS9kaXNhYmxlLCB5b3UgbWlnaHQgYWxzbyB3YW50Cj4gdG8gZG91YmxlLWNoZWNrIHlvdSBh
cmUgYWN0dWFsbHkgdXNpbmcgT2N0YWwgRFRSIG1vZGUuIFRoaXMgY2FuIGJlIGRvbmUKPiBieSBs
b29raW5nIGF0IHRoZSBTUEkgTk9SIGRlYnVnZnMgZW50cnkgKHVzdWFsbHkgaW4KPiAvc3lzL2tl
cm5lbC9kZWJ1Zy9zcGktbm9yKS4gWW91IGNhbiAiY2F0IHBhcmFtcyIgYW5kIHNlZSB3aGF0IHBy
b3RvY29scwo+IGFyZSBiZWluZyB1c2VkLCBhbmQgbWFrZSBzdXJlIDhELThELThEIGlzIGJlaW5n
IHVzZWQuClllcywgSSBiZWxpZXZlIDhELThELThEIGlzIGJlaW5nIHVzZWQuCkhlcmUncyB0aGUg
b3V0cHV0OgouLi4Kcm9vdEBhbTYyeHgtZXZtOn4jIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9zcGkt
bm9yL3NwaTAuMC9wYXJhbXMKbmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgczI4aHM1MTJ0Cmlk
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMzQgNWIgMWEgMGYgMDMgOTAKc2l6ZcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgNjQuMCBNaUIKd3JpdGUgc2l6ZcKgwqDCoMKgwqAgMTYKcGFnZSBzaXpl
wqDCoMKgwqDCoMKgIDI1NgphZGRyZXNzIG5ieXRlc8KgIDQKZmxhZ3PCoMKgwqDCoMKgwqDCoMKg
wqDCoCA0Ql9PUENPREVTIHwgSEFTXzRCQUlUIHwgSEFTXzE2QklUX1NSIHwgSU9fTU9ERV9FTl9W
T0xBVElMRSB8IFNPRlRfUkVTRVQKCm9wY29kZXMKwqByZWFkwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MHhlZQrCoCBkdW1teSBjeWNsZXPCoCAyNArCoGVyYXNlwqDCoMKgwqDCoMKgwqDCoMKgIDB4ZDgK
wqBwcm9ncmFtwqDCoMKgwqDCoMKgwqAgMHgxMgrCoDhEIGV4dGVuc2lvbsKgwqAgcmVwZWF0Cgpw
cm90b2NvbHMKwqByZWFkwqDCoMKgwqDCoMKgwqDCoMKgwqAgOEQtOEQtOEQKwqB3cml0ZcKgwqDC
oMKgwqDCoMKgwqDCoCA4RC04RC04RArCoHJlZ2lzdGVywqDCoMKgwqDCoMKgIDhELThELThECgpl
cmFzZSBjb21tYW5kcwrCoDIxICg0LjAwIEtpQikgWzJdCsKgZGMgKDI1NiBLaUIpIFszXQrCoGM3
ICg2NC4wIE1pQikKCnNlY3RvciBtYXAKwqByZWdpb24gKGluIGhleCnCoMKgIHwgZXJhc2UgbWFz
ayB8IGZsYWdzCsKgLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tCsKg
MDAwMDAwMDAtMDAwMWZmZmYgfMKgwqDCoMKgIFvCoCAyIF0gfArCoDAwMDIwMDAwLTAwMDNmZmZm
IHzCoMKgwqDCoCBbwqDCoCAzXSB8IG92ZXJsYWlkCsKgMDAwNDAwMDAtMDNmZmZmZmYgfMKgwqDC
oMKgIFvCoMKgIDNdIHwKLi4uCgpBbHNvLCB0aGUgcmF3IHJlYWQgc3BlZWQgaXMgYWJvdXQgNDAg
TUJQUwpUaGUgZnJlcXVlbmN5IHdlIHNldCBmcm9tIERUIGlzIDI1IE1IeiwKYXNzdW1pbmcgMU1C
IGlzIHRyYW5zZmVyZWQgZXZlcnkgY3ljbGUncyByaXNpbmcgYW5kIGZhbGxpbmcgZWRnZSwKaWUu
IDI1KjIgPSA1MCBNQlBTIGlzIGlkZWFsIHNwZWVkLgoKPgo+IEFNNjI1IFNLIF9zaG91bGRfIGJl
IHVzaW5nIDhELThELThEIG1vZGUgYWxyZWFkeSwgYnV0IEkgdGhpbmsgaXQgaXMKPiB1c2VmdWwg
aWYgeW91IGtub3cgaG93IHRvIGNvbmZpcm0gdGhpcyBhc3N1bXB0aW9uIDotKQo+Cj4+PiBSZXZp
ZXdlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHB0eWFkYXZAYW1hem9uLmRlPgo+PiBGb3IgdGhpcyBz
ZXJpZXMsCj4+Cj4+IFRlc3RlZC1ieTogRGhydXZhIEdvbGUgPGQtZ29sZUB0aS5jb20+Cj4+Cj4+
Pj4gICNkZWZpbmUgU1BJTk9SX09QX0NZUFJFU1NfUkRfRkFTVCAgICAgICAgICAgICAgMHhlZQo+
Pj4+Cj4+Pj4gIC8qIEN5cHJlc3MgU1BJIE5PUiBmbGFzaCBvcGVyYXRpb25zLiAqLwoKLS0gCkJl
c3QgcmVnYXJkcywKRGhydXZhIEdvbGUKVGV4YXMgSW5zdHJ1bWVudHMgSW5jb3Jwb3JhdGVkCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
