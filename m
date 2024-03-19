Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861F4C54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBNra4hykRAgpBWLoGDVb+jDc6A+OjzUAdQ5P1ixE/U=; b=U1E87/9nkKjV0X
	aRWuPXNHJCWO9rh91DFLGPjWJpX++EQ/AyJMcT3V5ThXGYIkkAOFknqHLnoHTjILU1Argn0uuLZnV
	o7z2t3jdp3jXOIKEacUOuWNBUBxcEzVqU8jFnw5BzeXGP/86qHvzr6RRXQ6K0byIJZeOqXrLkh6Vf
	+f4KINOtc6fcfcEzTKBjqlOK9qCdDSGjnJZzPBEPMkLuskoeE9m+Xk37o2ccHdgionF3rqIaLlCUF
	O5sYzw95VsRyH9/bT1YKsGJy4453Q8TbXiQD8CDKQT4aOLT8Vqq6MwKg4+exi2pZ8JvHQhkYBvB7X
	wYAISvbLP8bqAAmOw8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZDi-0000000CjZq-3sfN;
	Tue, 19 Mar 2024 13:09:34 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZDe-0000000CjXo-36uC
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 13:09:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 397FFE0002;
	Tue, 19 Mar 2024 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710853767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/nxcDTUYi1MXeFeU8TRWO7c9qe7Uu/RNWXFdRywHJE=;
	b=AkyV0dCrSMZ5ix+ksfm7ahaR5LV1hr425kHRYfiYFD9E4NRgvOqZ2YXS8+33sUjznAkmU1
	p6C4vkY5NnTysIenRqOuW4YRr+eUrDnKE3CRgRrB/buDV18fY8aHGe94NNW6iqBzCJEOTX
	+krpiYxIwbS3gIHDHyOm+1FG3QXx+zwTKK8Aq8tUXDCVV+iqOGBxDAZWCRzUzjIgqoxYiI
	zkxE6+GygI5phLXHzRMx79MTdpqJEFnbxubGKrzfRSbA7gzhtZ5w3Vi5FEIeGf8nDlAEwe
	5RXvhLmnu5XJ+Riwypshhyt/72W2Vu6loM1/m6s2z78BsKfkjqTVwIAt+4Jeow==
Date: Tue, 19 Mar 2024 14:09:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
 <broonie@kernel.org>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <richard@nod.at>, <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
 <neil.armstrong@linaro.org>, <daniel@makrotopia.org>, <arnd@arndb.de>,
 <chris.packham@alliedtelesis.co.nz>, <christophe.kerello@foss.st.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <quic_srichara@quicinc.com>,
 <quic_varada@quicinc.com>
Subject: Re: [PATCH v4 2/5] drivers: mtd: nand: Add qpic_common API file
Message-ID: <20240319140924.167f3063@xps-13>
In-Reply-To: <756ccc79-0077-5c23-73e3-bbb82fbfa8b0@quicinc.com>
References: <20240308091752.16136-1-quic_mdalam@quicinc.com>
	<20240308091752.16136-3-quic_mdalam@quicinc.com>
	<20240315124517.4a546ce9@xps-13>
	<93b08226-3297-2161-cc7d-d33d839c32f0@quicinc.com>
	<20240319114316.4b977d93@xps-13>
	<756ccc79-0077-5c23-73e3-bbb82fbfa8b0@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_060931_135028_2D641614 
X-CRM114-Status: GOOD (  24.86  )
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

SGksCgpxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBUdWUsIDE5IE1hciAyMDI0IDE3
OjQ2OjA1ICswNTMwOgoKPiBPbiAzLzE5LzIwMjQgNDoxMyBQTSwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IEhpLAo+ID4gICAKPiA+Pj4+ICsvKioKPiA+Pj4+ICsgKiBxY29tX29mZnNldF90b19u
YW5kY19yZWcoKSAtIEdldCB0aGUgYWN0dWFsIG9mZnNldAo+ID4+Pj4gKyAqIEByZWdzOiBwb2lu
dGVyIHRvIG5hbmRjX3JlZyBzdHJ1Y3R1cmUKPiA+Pj4+ICsgKiBAb2Zmc2V0OiByZWdpc3RlciBv
ZmZzZXQKPiA+Pj4+ICsgKgo+ID4+Pj4gKyAqIFRoaXMgZnVuY3Rpb24gd2lsbCByZXVybiB0aGUg
YWN0dWFsIG9mZnNldCBmb3IgcXBpYyBjb250cm9sbGVyIHJlZ2lzdGVyCj4gPj4+PiArICovCj4g
Pj4+PiArX19sZTMyICpxY29tX29mZnNldF90b19uYW5kY19yZWcoc3RydWN0IG5hbmRjX3JlZ3Mg
KnJlZ3MsIGludCBvZmZzZXQpCj4gPj4+PiArewo+ID4+Pj4gKwlzd2l0Y2ggKG9mZnNldCkgewo+
ID4+Pj4gKwljYXNlIE5BTkRfRkxBU0hfQ01EOgo+ID4+Pj4gKwkJcmV0dXJuICZyZWdzLT5jbWQ7
Cj4gPj4+PiArCWNhc2UgTkFORF9BRERSMDoKPiA+Pj4+ICsJCXJldHVybiAmcmVncy0+YWRkcjA7
Cj4gPj4+PiArCWNhc2UgTkFORF9BRERSMToKPiA+Pj4+ICsJCXJldHVybiAmcmVncy0+YWRkcjE7
Cj4gPj4+PiArCWNhc2UgTkFORF9GTEFTSF9DSElQX1NFTEVDVDoKPiA+Pj4+ICsJCXJldHVybiAm
cmVncy0+Y2hpcF9zZWw7Cj4gPj4+PiArCWNhc2UgTkFORF9FWEVDX0NNRDoKPiA+Pj4+ICsJCXJl
dHVybiAmcmVncy0+ZXhlYzsKPiA+Pj4+ICsJY2FzZSBOQU5EX0ZMQVNIX1NUQVRVUzoKPiA+Pj4+
ICsJCXJldHVybiAmcmVncy0+Y2xyZmxhc2hzdGF0dXM7Cj4gPj4+PiArCWNhc2UgTkFORF9ERVYw
X0NGRzA6Cj4gPj4+PiArCQlyZXR1cm4gJnJlZ3MtPmNmZzA7Cj4gPj4+PiArCWNhc2UgTkFORF9E
RVYwX0NGRzE6Cj4gPj4+PiArCQlyZXR1cm4gJnJlZ3MtPmNmZzE7Cj4gPj4+PiArCWNhc2UgTkFO
RF9ERVYwX0VDQ19DRkc6Cj4gPj4+PiArCQlyZXR1cm4gJnJlZ3MtPmVjY19iY2hfY2ZnOwo+ID4+
Pj4gKwljYXNlIE5BTkRfUkVBRF9TVEFUVVM6Cj4gPj4+PiArCQlyZXR1cm4gJnJlZ3MtPmNscnJl
YWRzdGF0dXM7Cj4gPj4+PiArCWNhc2UgTkFORF9ERVZfQ01EMToKPiA+Pj4+ICsJCXJldHVybiAm
cmVncy0+Y21kMTsKPiA+Pj4+ICsJY2FzZSBOQU5EX0RFVl9DTUQxX1JFU1RPUkU6Cj4gPj4+PiAr
CQlyZXR1cm4gJnJlZ3MtPm9yaWdfY21kMTsKPiA+Pj4+ICsJY2FzZSBOQU5EX0RFVl9DTURfVkxE
Ogo+ID4+Pj4gKwkJcmV0dXJuICZyZWdzLT52bGQ7Cj4gPj4+PiArCWNhc2UgTkFORF9ERVZfQ01E
X1ZMRF9SRVNUT1JFOgo+ID4+Pj4gKwkJcmV0dXJuICZyZWdzLT5vcmlnX3ZsZDsKPiA+Pj4+ICsJ
Y2FzZSBOQU5EX0VCSTJfRUNDX0JVRl9DRkc6Cj4gPj4+PiArCQlyZXR1cm4gJnJlZ3MtPmVjY19i
dWZfY2ZnOwo+ID4+Pj4gKwljYXNlIE5BTkRfUkVBRF9MT0NBVElPTl8wOgo+ID4+Pj4gKwkJcmV0
dXJuICZyZWdzLT5yZWFkX2xvY2F0aW9uMDsKPiA+Pj4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJ
T05fMToKPiA+Pj4+ICsJCXJldHVybiAmcmVncy0+cmVhZF9sb2NhdGlvbjE7Cj4gPj4+PiArCWNh
c2UgTkFORF9SRUFEX0xPQ0FUSU9OXzI6Cj4gPj4+PiArCQlyZXR1cm4gJnJlZ3MtPnJlYWRfbG9j
YXRpb24yOwo+ID4+Pj4gKwljYXNlIE5BTkRfUkVBRF9MT0NBVElPTl8zOgo+ID4+Pj4gKwkJcmV0
dXJuICZyZWdzLT5yZWFkX2xvY2F0aW9uMzsKPiA+Pj4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJ
T05fTEFTVF9DV18wOgo+ID4+Pj4gKwkJcmV0dXJuICZyZWdzLT5yZWFkX2xvY2F0aW9uX2xhc3Qw
Owo+ID4+Pj4gKwljYXNlIE5BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXXzE6Cj4gPj4+PiArCQly
ZXR1cm4gJnJlZ3MtPnJlYWRfbG9jYXRpb25fbGFzdDE7Cj4gPj4+PiArCWNhc2UgTkFORF9SRUFE
X0xPQ0FUSU9OX0xBU1RfQ1dfMjoKPiA+Pj4+ICsJCXJldHVybiAmcmVncy0+cmVhZF9sb2NhdGlv
bl9sYXN0MjsKPiA+Pj4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18zOgo+ID4+
Pj4gKwkJcmV0dXJuICZyZWdzLT5yZWFkX2xvY2F0aW9uX2xhc3QzOyAgCj4gPj4+Cj4gPj4+IFdo
eSBkbyB5b3UgbmVlZCB0aGlzIGluZGlyZWN0aW9uPyAgCj4gPj4KPiA+PiBUaGlzIGluZGlyZWN0
aW9uIEkgYmVsaWV2ZSBpcyBuZWVkZWQgYnkgdGhlIHdyaXRlX3JlZ19kbWEgZnVuY3Rpb24sCj4g
Pj4gd2hlcmVpbiBhIGJ1bmNoIG9mIHJlZ2lzdGVycyBhcmUgbW9kaWZpZWQgYmFzZWQgb24gYSBz
dGFydGluZyByZWdpc3Rlci4KPiA+PiBDYW4gSSBjaGFuZ2UgdGhpcyBpbiBhIHNlcGFyYXRlIGNs
ZWFudXAgc2VyaWVzIGFzIGEgZm9sbG93IHVwIHRvIHRoaXM/ICAKPiA+IAo+ID4gSSB0aGluayBp
dCB3b3VsZCBiZSBjbGVhbmVyIHRvIG1ha2UgdGhlIGNoYW5nZXMgSSByZXF1ZXN0ZWQgZmlyc3Qg
YW5kCj4gPiB0aGVuIG1ha2UgYSBjb3B5LiBJIHVuZGVyc3RhbmQgaXQgaXMgbW9yZSB3b3JrIG9u
IHlvdXIgc2lkZSwgc28gaWYgeW91Cj4gPiByZWFsbHkgcHJlZmVyIHlvdSBjYW4gKDEpIG1ha2Ug
dGhlIGNvcHkgYW5kIHRoZW4gKDIpIGNsZWFuIGl0IGFsbC4gQnV0Cj4gPiBwbGVhc2UgZG8gaXQg
YWxsIGluIHRoaXMgc2VyaWVzLiAgCj4gT2sKPiA+ICAgCj4gPj4+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9tdGQvbmFuZC1xcGljLWNvbW1vbi5oIGIvaW5jbHVkZS9saW51eC9tdGQvbmFu
ZC1xcGljLWNvbW1vbi5oCj4gPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+Pj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5hY2VkMTU4NjY2MjcKPiA+Pj4+IC0tLSAvZGV2L251bGwKPiA+Pj4+ICsr
KyBiL2luY2x1ZGUvbGludXgvbXRkL25hbmQtcXBpYy1jb21tb24uaAo+ID4+Pj4gQEAgLTAsMCAr
MSw0ODYgQEAKPiA+Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+
ID4+Pj4gKy8qCj4gPj4+PiArICogUUNPTSBRUElDIGNvbW1vbiBBUElzIGhlYWRlciBmaWxlCj4g
Pj4+PiArICoKPiA+Pj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjMgUXVhbGNvbW0gSW5jLgo+ID4+
Pj4gKyAqIEF1dGhvcnM6ICAgICBNZCBzYWRyZSBBbGFtICAgICAgICAgICA8cXVpY19tZGFsYW1A
cXVpY2luYy5jb20+Cj4gPj4+PiArICoJCVNyaWNoYXJhbiBSICAgICAgICAgICAgIDxxdWljX3Ny
aWNoYXJhQHF1aWNpbmMuY29tPgo+ID4+Pj4gKyAqCQlWYXJhZGFyYWphbiBOYXJheWFuYW4gICA8
cXVpY192YXJhZGFAcXVpY2luYy5jb20+Cj4gPj4+PiArICoKPiA+Pj4+ICsgKi8KPiA+Pj4+ICsj
aWZuZGVmIF9fTVREX05BTkRfUVBJQ19DT01NT05fSF9fCj4gPj4+PiArI2RlZmluZSBfX01URF9O
QU5EX1FQSUNfQ09NTU9OX0hfXwo+ID4+Pj4gKwo+ID4+Pj4gKyNpbmNsdWRlIDxsaW51eC9iaXRv
cHMuaD4KPiA+Pj4+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gPj4+PiArI2luY2x1ZGUgPGxp
bnV4L2RlbGF5Lmg+Cj4gPj4+PiArI2luY2x1ZGUgPGxpbnV4L2RtYWVuZ2luZS5oPgo+ID4+Pj4g
KyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+ID4+Pj4gKyNpbmNsdWRlIDxsaW51eC9k
bWEvcWNvbV9hZG0uaD4KPiA+Pj4+ICsjaW5jbHVkZSA8bGludXgvZG1hL3Fjb21fYmFtX2RtYS5o
Pgo+ID4+Pj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+Pj4+ICsjaW5jbHVkZSA8bGlu
dXgvbXRkL3BhcnRpdGlvbnMuaD4KPiA+Pj4+ICsjaW5jbHVkZSA8bGludXgvbXRkL3Jhd25hbmQu
aD4gIAo+ID4+Pgo+ID4+PiBZb3UgcmVhbGx5IG5lZWQgdGhpcz8gIAo+ID4+IFllcyAsIHNpbmNl
IHNvbWUgZ2VuZXJpYyBzdHJ1Y3R1cmUgdXNlZCBoZXJlLiAgCj4gPiAKPiA+IFdoaWNoIG9uZXM/
IElmIHRoaXMgaXMgYSBjb21tb24gZmlsZSwgeW91IHByb2JhYmx5IHNob3VsZCBub3QuICAKPiAg
IFNpbmNlIHdlIGFyZSB1c2luZyB0aGlzIHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciB7IH0K
PiAgIGZvciBib3RoIFNQSSBuYW5kIGFzIHdlbGwgYXMgcmF3IG5hbmQuIEluIHRoaXMgd2UgYXJl
IGhhdmluZyB0aGlzCj4gICBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyIGNvbnRyb2xsZXIgbWVtYmVy
LgoKTWF5YmUgd2Ugc2hvdWxkIG5vdCBleHBvc2UgcWNvbV9uYW5kX2NvbnRyb2xsZXIgYXQgYWxs
IGFuZCBqdXN0IHNoYXJlCnRoZSBtaW5pbXVtIGJpdHMgd2hpY2ggYXJlIHJlYWxseSBjb21tb24u
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
