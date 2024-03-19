Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D4CC54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U50ermN8nOKJzKVaIBUb1320mbOADBvShUbOUwUKYns=; b=z4/6SLdhEdqYOO
	R5FQyJF6RckZ6oJnJVIyKmiDjI19CTEg/ZvdTAU7pBQokgZXCcUqKgHLueztK6/gqnwNTPbbEeQqU
	egydSndu/d1uLZfSrXkE/+w/xbfal8pj1hVzZwCHsFmkTvLanPQSQHI7LPOci7BlZiYo6lMT1Tgca
	bjucV38jL2CTR77cS4343RWUaR4X4PJnkzJ/ZziHXtlsHJ3jR/mNxHbfFf2HVKUBOnDnJHBeTGxRB
	u2zB0tYt4YAZedc34FQmn+9TAw/5LtALt4DiYHVGw6kcxMuBeCnMQY1fH4VS13tjMnfJBJJ2tZ896
	R+qdv3lKUHAjaoYE26bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmWwI-0000000CKt4-0Xu9;
	Tue, 19 Mar 2024 10:43:26 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmWwE-0000000CKs3-3RmJ
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 10:43:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F47EFF806;
	Tue, 19 Mar 2024 10:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710845000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhgjBROAlzrbl8Iz37haY9BTjg5Buwc2hFjKtvnhtcc=;
	b=aw62y5jYBsNZs//0dVc32M2AHv8fVidEmf+i3fheCHEIJx+l72garengqb9wQPxxvge0uS
	VE1z2Uvk3XQ+zpGZ3kZRmlEcF2gQi8qaIHEHoP0tPkbrg5lU7cCRUv6FpWWtTgNlx9RZLN
	jYgkfm6VitcQVGUsHBURuBftG30xH1m7FpsZJCIyaNRh4azX6tOBPIvbWerzyJGifdMfn3
	cT6SKSiNc3zuqWsVbG98DNvftsROvNo72DOkhtyAKbjZYHxnlzppzEbEGm0KaCPOgIpSnW
	Bd5eBpsR/++29RJ5Swca7psPmkUhDGfKlbNXJlXk1OTCgxBzNH6m/PdevWZKhw==
Date: Tue, 19 Mar 2024 11:43:16 +0100
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
Message-ID: <20240319114316.4b977d93@xps-13>
In-Reply-To: <93b08226-3297-2161-cc7d-d33d839c32f0@quicinc.com>
References: <20240308091752.16136-1-quic_mdalam@quicinc.com>
	<20240308091752.16136-3-quic_mdalam@quicinc.com>
	<20240315124517.4a546ce9@xps-13>
	<93b08226-3297-2161-cc7d-d33d839c32f0@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_034323_599108_C33493C9 
X-CRM114-Status: GOOD (  19.85  )
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

SGksCgo+ID4+ICsvKioKPiA+PiArICogcWNvbV9vZmZzZXRfdG9fbmFuZGNfcmVnKCkgLSBHZXQg
dGhlIGFjdHVhbCBvZmZzZXQKPiA+PiArICogQHJlZ3M6IHBvaW50ZXIgdG8gbmFuZGNfcmVnIHN0
cnVjdHVyZQo+ID4+ICsgKiBAb2Zmc2V0OiByZWdpc3RlciBvZmZzZXQKPiA+PiArICoKPiA+PiAr
ICogVGhpcyBmdW5jdGlvbiB3aWxsIHJldXJuIHRoZSBhY3R1YWwgb2Zmc2V0IGZvciBxcGljIGNv
bnRyb2xsZXIgcmVnaXN0ZXIKPiA+PiArICovCj4gPj4gK19fbGUzMiAqcWNvbV9vZmZzZXRfdG9f
bmFuZGNfcmVnKHN0cnVjdCBuYW5kY19yZWdzICpyZWdzLCBpbnQgb2Zmc2V0KQo+ID4+ICt7Cj4g
Pj4gKwlzd2l0Y2ggKG9mZnNldCkgewo+ID4+ICsJY2FzZSBOQU5EX0ZMQVNIX0NNRDoKPiA+PiAr
CQlyZXR1cm4gJnJlZ3MtPmNtZDsKPiA+PiArCWNhc2UgTkFORF9BRERSMDoKPiA+PiArCQlyZXR1
cm4gJnJlZ3MtPmFkZHIwOwo+ID4+ICsJY2FzZSBOQU5EX0FERFIxOgo+ID4+ICsJCXJldHVybiAm
cmVncy0+YWRkcjE7Cj4gPj4gKwljYXNlIE5BTkRfRkxBU0hfQ0hJUF9TRUxFQ1Q6Cj4gPj4gKwkJ
cmV0dXJuICZyZWdzLT5jaGlwX3NlbDsKPiA+PiArCWNhc2UgTkFORF9FWEVDX0NNRDoKPiA+PiAr
CQlyZXR1cm4gJnJlZ3MtPmV4ZWM7Cj4gPj4gKwljYXNlIE5BTkRfRkxBU0hfU1RBVFVTOgo+ID4+
ICsJCXJldHVybiAmcmVncy0+Y2xyZmxhc2hzdGF0dXM7Cj4gPj4gKwljYXNlIE5BTkRfREVWMF9D
RkcwOgo+ID4+ICsJCXJldHVybiAmcmVncy0+Y2ZnMDsKPiA+PiArCWNhc2UgTkFORF9ERVYwX0NG
RzE6Cj4gPj4gKwkJcmV0dXJuICZyZWdzLT5jZmcxOwo+ID4+ICsJY2FzZSBOQU5EX0RFVjBfRUND
X0NGRzoKPiA+PiArCQlyZXR1cm4gJnJlZ3MtPmVjY19iY2hfY2ZnOwo+ID4+ICsJY2FzZSBOQU5E
X1JFQURfU1RBVFVTOgo+ID4+ICsJCXJldHVybiAmcmVncy0+Y2xycmVhZHN0YXR1czsKPiA+PiAr
CWNhc2UgTkFORF9ERVZfQ01EMToKPiA+PiArCQlyZXR1cm4gJnJlZ3MtPmNtZDE7Cj4gPj4gKwlj
YXNlIE5BTkRfREVWX0NNRDFfUkVTVE9SRToKPiA+PiArCQlyZXR1cm4gJnJlZ3MtPm9yaWdfY21k
MTsKPiA+PiArCWNhc2UgTkFORF9ERVZfQ01EX1ZMRDoKPiA+PiArCQlyZXR1cm4gJnJlZ3MtPnZs
ZDsKPiA+PiArCWNhc2UgTkFORF9ERVZfQ01EX1ZMRF9SRVNUT1JFOgo+ID4+ICsJCXJldHVybiAm
cmVncy0+b3JpZ192bGQ7Cj4gPj4gKwljYXNlIE5BTkRfRUJJMl9FQ0NfQlVGX0NGRzoKPiA+PiAr
CQlyZXR1cm4gJnJlZ3MtPmVjY19idWZfY2ZnOwo+ID4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJ
T05fMDoKPiA+PiArCQlyZXR1cm4gJnJlZ3MtPnJlYWRfbG9jYXRpb24wOwo+ID4+ICsJY2FzZSBO
QU5EX1JFQURfTE9DQVRJT05fMToKPiA+PiArCQlyZXR1cm4gJnJlZ3MtPnJlYWRfbG9jYXRpb24x
Owo+ID4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJT05fMjoKPiA+PiArCQlyZXR1cm4gJnJlZ3Mt
PnJlYWRfbG9jYXRpb24yOwo+ID4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJT05fMzoKPiA+PiAr
CQlyZXR1cm4gJnJlZ3MtPnJlYWRfbG9jYXRpb24zOwo+ID4+ICsJY2FzZSBOQU5EX1JFQURfTE9D
QVRJT05fTEFTVF9DV18wOgo+ID4+ICsJCXJldHVybiAmcmVncy0+cmVhZF9sb2NhdGlvbl9sYXN0
MDsKPiA+PiArCWNhc2UgTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfMToKPiA+PiArCQlyZXR1
cm4gJnJlZ3MtPnJlYWRfbG9jYXRpb25fbGFzdDE7Cj4gPj4gKwljYXNlIE5BTkRfUkVBRF9MT0NB
VElPTl9MQVNUX0NXXzI6Cj4gPj4gKwkJcmV0dXJuICZyZWdzLT5yZWFkX2xvY2F0aW9uX2xhc3Qy
Owo+ID4+ICsJY2FzZSBOQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV18zOgo+ID4+ICsJCXJldHVy
biAmcmVncy0+cmVhZF9sb2NhdGlvbl9sYXN0MzsgIAo+ID4gCj4gPiBXaHkgZG8geW91IG5lZWQg
dGhpcyBpbmRpcmVjdGlvbj8gIAo+IAo+IFRoaXMgaW5kaXJlY3Rpb24gSSBiZWxpZXZlIGlzIG5l
ZWRlZCBieSB0aGUgd3JpdGVfcmVnX2RtYSBmdW5jdGlvbiwKPiB3aGVyZWluIGEgYnVuY2ggb2Yg
cmVnaXN0ZXJzIGFyZSBtb2RpZmllZCBiYXNlZCBvbiBhIHN0YXJ0aW5nIHJlZ2lzdGVyLgo+IENh
biBJIGNoYW5nZSB0aGlzIGluIGEgc2VwYXJhdGUgY2xlYW51cCBzZXJpZXMgYXMgYSBmb2xsb3cg
dXAgdG8gdGhpcz8KCkkgdGhpbmsgaXQgd291bGQgYmUgY2xlYW5lciB0byBtYWtlIHRoZSBjaGFu
Z2VzIEkgcmVxdWVzdGVkIGZpcnN0IGFuZAp0aGVuIG1ha2UgYSBjb3B5LiBJIHVuZGVyc3RhbmQg
aXQgaXMgbW9yZSB3b3JrIG9uIHlvdXIgc2lkZSwgc28gaWYgeW91CnJlYWxseSBwcmVmZXIgeW91
IGNhbiAoMSkgbWFrZSB0aGUgY29weSBhbmQgdGhlbiAoMikgY2xlYW4gaXQgYWxsLiBCdXQKcGxl
YXNlIGRvIGl0IGFsbCBpbiB0aGlzIHNlcmllcy4KCj4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvbXRkL25hbmQtcXBpYy1jb21tb24uaCBiL2luY2x1ZGUvbGludXgvbXRkL25hbmQtcXBp
Yy1jb21tb24uaAo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi5hY2VkMTU4NjY2MjcKPiA+PiAtLS0gL2Rldi9udWxsCj4gPj4gKysrIGIvaW5jbHVkZS9s
aW51eC9tdGQvbmFuZC1xcGljLWNvbW1vbi5oCj4gPj4gQEAgLTAsMCArMSw0ODYgQEAKPiA+PiAr
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+PiArLyoKPiA+PiArICog
UUNPTSBRUElDIGNvbW1vbiBBUElzIGhlYWRlciBmaWxlCj4gPj4gKyAqCj4gPj4gKyAqIENvcHly
aWdodCAoYykgMjAyMyBRdWFsY29tbSBJbmMuCj4gPj4gKyAqIEF1dGhvcnM6ICAgICBNZCBzYWRy
ZSBBbGFtICAgICAgICAgICA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4gPj4gKyAqCQlTcmlj
aGFyYW4gUiAgICAgICAgICAgICA8cXVpY19zcmljaGFyYUBxdWljaW5jLmNvbT4KPiA+PiArICoJ
CVZhcmFkYXJhamFuIE5hcmF5YW5hbiAgIDxxdWljX3ZhcmFkYUBxdWljaW5jLmNvbT4KPiA+PiAr
ICoKPiA+PiArICovCj4gPj4gKyNpZm5kZWYgX19NVERfTkFORF9RUElDX0NPTU1PTl9IX18KPiA+
PiArI2RlZmluZSBfX01URF9OQU5EX1FQSUNfQ09NTU9OX0hfXwo+ID4+ICsKPiA+PiArI2luY2x1
ZGUgPGxpbnV4L2JpdG9wcy5oPgo+ID4+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gPj4gKyNp
bmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ID4+ICsjaW5jbHVkZSA8bGludXgvZG1hZW5naW5lLmg+
Cj4gPj4gKyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+ID4+ICsjaW5jbHVkZSA8bGlu
dXgvZG1hL3Fjb21fYWRtLmg+Cj4gPj4gKyNpbmNsdWRlIDxsaW51eC9kbWEvcWNvbV9iYW1fZG1h
Lmg+Cj4gPj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+PiArI2luY2x1ZGUgPGxpbnV4
L210ZC9wYXJ0aXRpb25zLmg+Cj4gPj4gKyNpbmNsdWRlIDxsaW51eC9tdGQvcmF3bmFuZC5oPiAg
Cj4gPiAKPiA+IFlvdSByZWFsbHkgbmVlZCB0aGlzPyAgCj4gWWVzICwgc2luY2Ugc29tZSBnZW5l
cmljIHN0cnVjdHVyZSB1c2VkIGhlcmUuCgpXaGljaCBvbmVzPyBJZiB0aGlzIGlzIGEgY29tbW9u
IGZpbGUsIHlvdSBwcm9iYWJseSBzaG91bGQgbm90LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
