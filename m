Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF54C2BD09
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BD5yz5IQFFUmmSZwl9Zz70nF6xudShfPpzAhEMcOUj8=; b=c5/5KngL7FHC9w
	2SkkDz2JTU2WZhRN7ZLOB2Mwb4Jqf4qrYiwPYkX8fULrXnYTr5Ae2VnhByVFb2gdvoub9SUwqfQps
	Syov1m2NeXir+CtiWcF/YviYw5uaoil8FqCkJAI7QbBA9yybLExc1GqTmZ9nanW9qtiLdzjWwMIUC
	mVAJ4zY8JYJjMn2cXoGqYOMWZoQRYABGaEXwEMMGxXPaL4OB5L55rXe+AxtCpPwt3cvRxkwVlD457
	+MB1+26OaRRgPZv0a42WuzMNs3aQD/GKX1YiAnxBRxR2ov4rmV1YtsZYFjpBf6zFiEBae+3w2G3YW
	kexzYRoi15hglAitV9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP047-0000000AJAC-2un1;
	Wed, 03 Jul 2024 13:30:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP045-0000000AJ9U-0tEx
	for linux-mtd@bombadil.infradead.org;
	Wed, 03 Jul 2024 13:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KuYVN4Yup26t0FDxzTiwdczojTASpTt96lSCjpJPu9E=; b=Z7L2Y3qknAaivB/Y5tnvFLFAUM
	B163Oc1Fag7M2tu8PkSrA52v6VCYRxzzWnkpfBrgJmAFFVgk2fR4YH2rmED40kGIOfqH5gwIo2r+w
	DVqUp9N0StxV+IRTf/owOaCFIaLy5PinFQeoOx2QXx31HuRa0LThw6C6A2UHzN34O+UwlAWJmdyyU
	oryPYsws73+KEzZS/b0MaRSCxJQhj6mSYyQxHk8L7G3bpeGWEC/KMc4Z3lY79gogvdmZ0jRXNl2H9
	imF8Ovt8+nahVowtYW9WAviXMqyWaH+FI5XJNH0KmVdd6Ic1tzSasuE/ds2CMdcBUQygb5XMwceUP
	JCc1vn2g==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP03w-0000000A0aD-3yhd
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 13:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 19E6FCE2986;
	Wed,  3 Jul 2024 13:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0A0C2BD10;
	Wed,  3 Jul 2024 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720013414;
	bh=NuS0lze8w6QLW4fVtoIyJUDw/MJGvL5U5EexN3ZTprk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gjhCO1d3ezXJwDvtRRP/7/nsF7jTaWIJx65me7saESC8r8oa+fT2FPjtCZByQxO44
	 fJm+Rae10+sZC0Di5ch48lLtU39PZOsC8bxzGewsb6vAduRRGCLnjSA2MyYyR6CPCS
	 yxbR4EDab+NZCo4UFbPpKBCntnFrm1mK9qg2PByQe0zSeZy1GBsVrmADSAtc/h7fNZ
	 1yA6bTXzq0ArocijLMLUSqTbCY0L3QFQHUkG+gYyW8Q1ybBOGacLEYolx+VxklvXct
	 V3JgJc3IxEueyfDyRrxbnH/jDl/bVVl2vz6A5G2RlS+I57qozDprSOzpp8dQ48KGYg
	 OUC4baOKXNzkA==
Message-ID: <a9c34972-a933-49f4-98e4-cbcc321022e2@kernel.org>
Date: Wed, 3 Jul 2024 23:30:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arch: m68k: Add definitions for flash NFC support
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Stefan Agner <stefan@agner.ch>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240627-upstream-nfc-mcf5441x-v2-0-312929d09ee5@yoseli.org>
 <20240627-upstream-nfc-mcf5441x-v2-1-312929d09ee5@yoseli.org>
 <20240628094511.75cc9c78@xps-13>
 <b974df45-daf5-4156-8532-cf9e2be8bdfa@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <b974df45-daf5-4156-8532-cf9e2be8bdfa@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_143024_931551_85FF0962 
X-CRM114-Status: GOOD (  20.49  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDMvNy8yNCAwMjo0NCwgSmVhbi1NaWNoZWwgSGF1dGJvaXMgd3JvdGU6Cj4gSGkgTWlxdWVs
LAo+IAo+IE9uIDI4LzA2LzIwMjQgMDk6NDUsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhpIEpl
YW4tTWljaGVsICYgR2VlcnQsCj4+Cj4+IGplYW5taWNoZWwuaGF1dGJvaXNAeW9zZWxpLm9yZyB3
cm90ZSBvbiBUaHUsIDI3IEp1biAyMDI0IDE4OjA1OjI4ICswMjAwOgo+Pgo+Pj4gQWRkIGEgZmV3
IGRlZmluaXRpb25zLCBhcyB0aGUgYmFzZSBhZGRyZXNzIGZvciB0aGUgTkZDIGZvciB0aGUgTTU0
NDF4Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFubWlj
aGVsLmhhdXRib2lzQHlvc2VsaS5vcmc+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvbTY4ay9pbmNsdWRl
L2FzbS9tNTQ0MXhzaW0uaCB8IDcgKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL202OGsvaW5jbHVkZS9hc20vbTU0
NDF4c2ltLmggYi9hcmNoL202OGsvaW5jbHVkZS9hc20vbTU0NDF4c2ltLmgKPj4+IGluZGV4IGY0
OGNmNjNiZDc4Mi4uZDRlZTFlYWI3YzRhIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9tNjhrL2luY2x1
ZGUvYXNtL201NDQxeHNpbS5oCj4+PiArKysgYi9hcmNoL202OGsvaW5jbHVkZS9hc20vbTU0NDF4
c2ltLmgKPj4+IEBAIC05OSw2ICs5OSw3IEBACj4+PiDCoCAjZGVmaW5lIE1DRklOVDJfUElUMcKg
wqDCoMKgwqDCoMKgIDE0Cj4+PiDCoCAjZGVmaW5lIE1DRklOVDJfUElUMsKgwqDCoMKgwqDCoMKg
IDE1Cj4+PiDCoCAjZGVmaW5lIE1DRklOVDJfUElUM8KgwqDCoMKgwqDCoMKgIDE2Cj4+PiArI2Rl
ZmluZSBNQ0ZJTlQyX05GQ8KgwqDCoMKgwqDCoMKgIDI1Cj4+PiDCoCAjZGVmaW5lIE1DRklOVDJf
UlRDwqDCoMKgwqDCoMKgwqAgMjYKPj4+IMKgIC8qCj4+PiBAQCAtMzMzLDQgKzMzNCwxMCBAQAo+
Pj4gwqAgI2RlZmluZSBNQ0ZfSVJRX0JPRkYxwqDCoMKgwqDCoMKgwqAgKE1DRklOVDFfVkVDQkFT
RSArIE1DRklOVDFfRkxFWENBTjFfQk9GRikKPj4+IMKgICNkZWZpbmUgTUNGX0lSUV9FUlIxwqDC
oMKgwqDCoMKgwqAgKE1DRklOVDFfVkVDQkFTRSArIE1DRklOVDFfRkxFWENBTjFfRVJSKQo+Pj4g
Ky8qCj4+PiArICogRmxhc2ggbW9kdWxlCj4+PiArICovCj4+PiArI2RlZmluZSBNQ0ZfTkZDX0JB
U0XCoMKgwqDCoMKgwqDCoCAweGZjMGZjMDAwCj4+PiArI2RlZmluZSBNQ0ZfTkZDX1NJWkXCoMKg
wqDCoMKgwqDCoCAoMHhmYzBmZmYzYiAtIDB4ZmMwZmMwMDApCj4+PiArI2RlZmluZSBNQ0ZfTkZD
X0lTUsKgwqDCoMKgwqDCoMKgIChNQ0ZJTlQyX1ZFQ0JBU0UgKyBNQ0ZJTlQyX05GQykKPj4KPj4g
SSdtIHNvcnJ5IGJ1dCB0aGlzIGZlZWxzIHJlYWxseSBiYWNrd2FyZHMuIFBsYXRmb3JtIGRhdGEg
YXMgQwo+PiBzdHJ1Y3R1cmVzIGFyZSBhbHJlYWR5IGxlZ2FjeSwgYnV0IGRlZmluaW5nIHRoZXNl
IGluZm9ybWF0aW9uIGluCj4+IHNvbWUgYXJjaCBoZWFkZXJzIGFuZCB1c2luZyB0aGVtIGRpcmVj
dGx5IGZyb20gZHJpdmVycyByZWFsbHkgc2VlbXMKPj4gZXZlbiAid3JvbmdlciIgdG8gbWUuIFdo
YXQncyB0aGUgbWlkL2xvbmcgdGVybSBwbGFuIGZvciB0aGlzPyBJZiB0aGUKPj4gcGxhdGZvcm1z
IGFyZSBzdGlsbCBpbiB1c2UgdG9kYXkgYW5kIG5lZWQgdG8gYmUgbWFpbnRhaW5lZCwgd2h5IG5v
dAo+PiBmaW5hbGx5IGVuYWJsaW5nIGRldmljZSB0cmVlIHN1cHBvcnQ/IEkga25vdyBpdCdzIGhh
cmRlciB0byBkbyB0aGFuIHRvCj4+IHNheSwgYnV0IEknZCBsaWtlIHNvbWUgcmVhbGx5IGdvb2Qg
ZXhwbGFuYXRpb24gb24gd2h5IHdlIHNob3VsZCBhY2NlcHQKPj4gdG8gZG8gdGhpcyBpbiAyMDI0
IGJlY2F1c2UgaXQgZmVlbHMgcmF0aGVyIGluYWRlcXVhdGUuCj4gCj4gVGhhbmtzIGZvciB5b3Vy
IHJldmlldyAhCj4gCj4gSSBhZ3JlZSB3aXRoIHlvdSBpdCBpcyBsZWdhY3kuIEkgdXNlIGEgbG90
IG9mIEFSTSBwbGF0Zm9ybXMgYW5kIGRldmljZS10cmVlIGlzIGluZGVlZCBncmVhdC4gVGhvdWdo
LCBzd2l0Y2hpbmcgdGhlIG02OGsgYXJjaGl0ZWN0dXJlIHRvIHVzZSB0aGlzIHNvdW5kcyByZWFs
bHkgdG91Z2guCj4gCj4gSSB3aWxsIG9idmlvdXNseSBsZXQgR2VlcnQgYW5kIG1heWJlIG90aGVy
cyBhbnN3ZXIsIGJ1dCBteSBmZWVsaW5nIGlzIGl0IGlzIG5vdCByZWFsbHkgd29ydGggaXQgdG8g
aW1wbGVtZW50IHRoZSBkdHMgb24gdGhvc2UgcGxhdGZvcm1zIGFyZSB0aGV5IGFyZSBub3QgdGhh
dCB1c2VkIChjb21wYXJlZCwgYWdhaW4sIHRvIEFSTSBmb3IgaW5zdGFuY2UpLgoKSXQgd291bGQg
YmUgbmljZSB0byB1c2UgZGV2aWNldHJlZXMgb24gQ29sZEZpcmUsIGJ1dCBJIGFtIG5vdCBhd2Fy
ZSBvZiBhbnlvbmUKY3VycmVudGx5IHdvcmtpbmcgb24gaXQuIFNvIEkgZG9uJ3QgdGhpbmsgd2Ug
d2lsbCBzZWUgaXQgYW55IHRpbWUgc29vbi4KU28gY3VycmVudGx5IGFsbCBzdXBwb3J0ZWQgQ29s
ZEZpcmUgcGVyaXBoZXJhbHMgYXJlICJsZWdhY3kiIGFuZCB1c2UgdGhlCm9sZCBwbGF0Zm9ybSBt
b2RlbC4KCgo+IEFGQUlLIHRoZSBwbGF0Zm9ybSBkYXRhIGlzIG5vdCBvZmZpY2lhbHkgY29uc2lk
ZXJlZCBkZXByZWNhdGVkID8gQXMgaXQgY29uY2VybnMgYSBmZXcgcGxhdGZvcm1zIG91dCB0aGVy
ZS4uLgoKQ2VydGFpbmx5IG5vdCBvZmZpY2lhbGx5IGRlcHJlY2F0ZWQuIG02OGsgaW4gYWxsIGl0
cyBmb3JtcyBpcyBjdXJyZW50bHkgd2VsbCBtYWludGFpbmVkCihpZiBub3QgbmVjZXNzYXJpbHkg
YSBsb3Qgb2YgbmV3IGRldmVsb3BtZW50KS4KClJlZ2FyZHMKR3JlZwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
