Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AA3C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 11:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaLXWTeV8/ODpmkkgoP3LcDhAdcuKCeeL4b7x3p7fSA=; b=oSQy8O+wUXVnD8
	122jUNHKx1P4FgOxARaIovvydmSmyam5gDKhYDxAMkwynZYeljrT6SZg0sgZRRyYpiL37zHwMaGD5
	iM50GNoVc7/uziggtCTBt5BSvO8g1frS+7xokCQSuOMOa9cD+OliLog6kixb/dayhWm8biQGrDKNX
	c+QjSpSf6cnboCr5gDbIBL+KCzqopOgliUyXLVsXxfGNjoUiuXhSS4NIramEGZAou8Pkv6nbMzVag
	6WyJTaIU4zCElBOQkQXl9K0fyOAPsZKvc1p/v0Dw1zvXNzMPKZYiU2C7F0YDi3RA7iw7hs1Uh0s9D
	VDGCgP7D785NEkTbus+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYyn-00FUHW-2A;
	Fri, 08 Dec 2023 11:25:13 +0000
Received: from forward501c.mail.yandex.net ([178.154.239.209])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYyi-00FUGn-2Y
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 11:25:12 +0000
Received: from mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:6111:0:640:fa53:0])
	by forward501c.mail.yandex.net (Yandex) with ESMTP id ACD5460B5D;
	Fri,  8 Dec 2023 14:24:57 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id qOcdk5dOquQ0-Kw9vcsYY;
	Fri, 08 Dec 2023 14:24:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1702034696; bh=dovtLz24oQKf7XZ4iAe8YtYbcL2wQcZRDAQKkvZh2bI=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=buOQDShPsf99FeUMkdsEwKAXRZ7NprOWTx1S/cRn8vCdKWqqtTcddyBKi2jXxQ/Ti
	 gU9d27ySTzTXXHPcrydYYemWfKQOl+hNnKpTuqVsuDllrBwrUHnQ313ihpOL7PpPmW
	 icdZunOVSnwG/0uF0TLTF8IzzSD85+KYW4NtxUZg=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.iva.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <6bc0cf7ea58fae2e6a3765f673a777788d465984.camel@maquefel.me>
Subject: Re: [PATCH v5 19/39] mtd: rawnand: add support for ts72xx
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Jean
 Delvare <jdelvare@suse.de>, Christophe Kerello
 <christophe.kerello@foss.st.com>,  Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Alexander
 Sverdlin <alexander.sverdlin@gmail.com>
Date: Fri, 08 Dec 2023 14:24:52 +0300
In-Reply-To: <ZV3y-IJ7JSD3fJeI@smile.fi.intel.com>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
	 <20231122-ep93xx-v5-19-d59a76d5df29@maquefel.me>
	 <ZV3y-IJ7JSD3fJeI@smile.fi.intel.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_032509_952444_42EDFBCC 
X-CRM114-Status: GOOD (  18.57  )
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

SGVsbG8gQW5keSEKCk9uIFdlZCwgMjAyMy0xMS0yMiBhdCAxNDoyNCArMDIwMCwgQW5keSBTaGV2
Y2hlbmtvIHdyb3RlOgo+IE9uIFdlZCwgTm92IDIyLCAyMDIzIGF0IDExOjU5OjU3QU0gKzAzMDAs
IE5pa2l0YSBTaHViaW4gd3JvdGU6Cj4gPiBUZWNobm9sb2dpYyBTeXN0ZW1zIGhhcyBpdCdzIG93
biBuYW5kIGNvbnRyb2xsZXIgaW1wbGVtZW50YXRpb24gaW4KPiA+IENQTEQuCj4gCj4gLi4uCj4g
Cj4gPiArc3RhdGljIGludCB0czcyeHhfbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoHN3aXRjaCAoY2hpcC0+ZWNjLmVuZ2lu
ZV90eXBlKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NP
RlQ6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGNoaXAtPmVjYy5hbGdv
ID09IE5BTkRfRUNDX0FMR09fVU5LTk9XTikKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgY2hpcC0+ZWNjLmFsZ28gPSBOQU5EX0VDQ19BTEdPX0hBTU1J
Tkc7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2hpcC0+ZWNjLmFsZ28gPSBO
QU5EX0VDQ19BTEdPX0hBTU1JTkc7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
YnJlYWs7Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIE5BTkRfRUNDX0VOR0lORV9UWVBFX09OX0hP
U1Q6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4g
Cj4gPiArwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGJyZWFrOwo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDC
oMKgcmV0dXJuIDA7Cj4gCj4gTW92ZSB0aGlzIHRvIGRlZmF1bHQuCj4gCj4gPiArfQo+IAo+IC4u
Lgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBp
bnN0ci0+Y3R4LmFkZHIubmFkZHJzOyBpKyspCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlvd3JpdGU4KGluc3RyLT5jdHguYWRkci5hZGRyc1tpXSwg
ZGF0YS0KPiA+ID5iYXNlKTsKPiAKPiBpb3dyaXRlOF9yZXAoKSA/Cj4gCj4gPiArwqDCoMKgwqDC
oMKgwqBjYXNlIE5BTkRfT1BfREFUQV9JTl9JTlNUUjoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpb3JlYWQ4X3JlcChkYXRhLT5iYXNlLCBpbnN0ci0+Y3R4LmRhdGEuYnVmLmlu
LAo+ID4gaW5zdHItPmN0eC5kYXRhLmxlbik7Cj4gCj4gSGVoZSwgeW91IGFyZSBldmVuIHVzaW5n
IGl0Li4uCj4gCj4gLi4uCj4gCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoaW5zdHItPmRlbGF5X25z
KQo+IAo+IFdoYXQgd2lsbCBoYXBwZW4gaWYgeW91IGRyb3AgdGhpcyBjaGVjaz8KPiAKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBuZGVsYXkoaW5zdHItPmRlbGF5X25zKTsKCk5v
IGlkZWEhIEkgd2FzIGFza2VkIHRvIGtlZXAgaXQgYnkgTWlxdWVsOgoKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC84YmJlNjZhMjNlYjVjOGEyNDA0YjcyZDc1NGIxYmNiNmY0ZDIzODY3LmNh
bWVsQG1hcXVlZmVsLm1lL1QvCgpCdXQgaXQgbG9va3Mgc29tZSBvbmUgY2FuIGF0IGxlYXN0IHN0
aWxsIGRvIHNvbWUgY2FsY3VsYXRpb24gbGlrZToKCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVkZS9saW51eC9kZWxheS5oI0w1MAoKQXQgd29yc3Qg
dHJ5IHRvIGRpdmlkZSBzb21ldGhpbmcuCgpEbyB5b3UgdGhpbmsgbmRlbGF5KGluc3RyLT5kZWxh
eV9ucykgaXMgc2FmZSBlbm91Z2ggPwoKCj4gCj4gLi4uCj4gCj4gPiArwqDCoMKgwqDCoMKgwqBp
bnQgcmV0Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gbXRkX2RldmljZV91bnJlZ2lz
dGVyKG5hbmRfdG9fbXRkKGNoaXApKTsKPiA+ICvCoMKgwqDCoMKgwqDCoFdBUk5fT04ocmV0KTsK
PiAKPiBJcyB0aGlzIGEgcmVxdWlyZW1lbnQgYnkgTVREIHRvIGhhdmUgcmV0dXJuIHZhbHVlIGJl
aW5nIGNoZWNrZWQ/Cj4gCgpBc3dlcmVkIGJ5IE1pcXVlbC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
