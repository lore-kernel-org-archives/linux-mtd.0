Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17564C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 10:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DC420449
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 10:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQCArdJh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9DC420449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHMXImLd+CVOUzxd3GfKm4mdg6WwkoHJWwSRmfWLarw=; b=TQCArdJhB5Ngvo
	elah/pqurHRkQFxbhsSrwkoOB93VG42HCt/McVPP0z2EsC2HFDE1XOQ6y6COInHlEG4rWijTTnn9I
	rEh86btC3Jr7fdvT/WRwS7xRBuniqBbkEsbx56zQLfQpoeCycRN8JxXPBPRNnntwPt3JYIxFrhIFt
	ZfmBAMmtsmhnrmN5z9tCipzN4RzaPQ/wBN2EZdECjXghHyaz8nXhlwoJcrG+7f8s9qpnUbt+Upojc
	wtm15yoknSW/g1a77HoreY5r4RM10eo/ua99T3UKJ3es1PsoPtGjcHQU3mAGgIyY0j5DRePNgEMIc
	n29RwKUfs0NzwZRcTVfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0kvM-000800-Ei; Mon, 04 Mar 2019 10:34:20 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kvJ-0007zP-2K
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 10:34:18 +0000
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 29E4224000C;
 Mon,  4 Mar 2019 10:34:12 +0000 (UTC)
Date: Mon, 4 Mar 2019 11:34:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 7/9] mtd: rawnand: ingenic: Add support for the JZ4740
Message-ID: <20190304113412.24b64e3d@xps13>
In-Reply-To: <20190209192305.4434-7-paul@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-7-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_023417_411513_7471736B 
X-CRM114-Status: GOOD (  27.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBT
YXQsICA5IEZlYiAyMDE5IDE2OjIzOjAzCi0wMzAwOgoKPiBBZGQgc3VwcG9ydCBmb3IgcHJvYmlu
ZyB0aGUgaW5nZW5pYy1uYW5kIGRyaXZlciBvbiB0aGUgSlo0NzQwIFNvQyBmcm9tCj4gSW5nZW5p
YywgYW5kIHRoZSBqejQ3NDAtZWNjIGRyaXZlciB0byBzdXBwb3J0IHRoZSBKWjQ3NDAtc3BlY2lm
aWMKPiBFQ0MgaGFyZHdhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1
bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gLS0tCj4gCj4gQ2hhbmdlczoKPiAKPiB2MjogTmV3IHBhdGNo
Cj4gCj4gdjM6IEFsc28gYWRkIHN1cHBvcnQgZm9yIHRoZSBoYXJkd2FyZSBFQ0Mgb2YgdGhlIEpa
NDc0MCBpbiB0aGlzIHBhdGNoCj4gCj4gdjQ6IC0gRml4IGZvcm1hdHRpbmcgaXNzdWVzCj4gICAg
IC0gQWRkIE1PRFVMRV8qIG1hY3Jvcwo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmlj
L0tjb25maWcgICAgICAgIHwgIDEwICsrCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMv
TWFrZWZpbGUgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2lu
Z2VuaWNfbmFuZC5jIHwgIDQ4ICsrKysrLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5p
Yy9qejQ3NDBfZWNjLmMgICB8IDE5NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgMjQ0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9qejQ3NDBfZWNjLmMK
PiAKClsuLi5dCgo+ICAJc3dpdGNoIChjaGlwLT5lY2MubW9kZSkgewo+ICAJY2FzZSBOQU5EX0VD
Q19IVzoKPiBAQCAtMjcwLDggKzI3OSw4IEBAIHN0YXRpYyBpbnQgaW5nZW5pY19uYW5kX2luaXRf
Y2hpcChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAJCXJldHVybiAtRU5PTUVNOwo+
ICAJbXRkLT5kZXYucGFyZW50ID0gZGV2Owo+ICAKPiAtCWNoaXAtPmxlZ2FjeS5JT19BRERSX1Ig
PSBjcy0+YmFzZSArIE9GRlNFVF9EQVRBOwo+IC0JY2hpcC0+bGVnYWN5LklPX0FERFJfVyA9IGNz
LT5iYXNlICsgT0ZGU0VUX0RBVEE7Cj4gKwljaGlwLT5sZWdhY3kuSU9fQUREUl9SID0gY3MtPmJh
c2UgKyBuZmMtPnNvY19pbmZvLT5kYXRhX29mZnNldDsKPiArCWNoaXAtPmxlZ2FjeS5JT19BRERS
X1cgPSBjcy0+YmFzZSArIG5mYy0+c29jX2luZm8tPmRhdGFfb2Zmc2V0Owo+ICAJY2hpcC0+bGVn
YWN5LmNoaXBfZGVsYXkgPSBSQl9ERUxBWV9VUzsKPiAgCWNoaXAtPm9wdGlvbnMgPSBOQU5EX05P
X1NVQlBBR0VfV1JJVEU7Cj4gIAljaGlwLT5sZWdhY3kuc2VsZWN0X2NoaXAgPSBpbmdlbmljX25h
bmRfc2VsZWN0X2NoaXA7CgpJIHRoaW5rIEJvcmlzIGFscmVhZHkgYXNrZWQgZm9yIGl0LCBidXQg
aXQgd291bGQgYmUgcmVhbGx5IGdyZWF0IHRoYXQKeW91IHVwZGF0ZSB0aGlzIGRyaXZlciB0byBu
b3QgdXNlIGFueSBsZWdhY3kgaW50ZXJmYWNlIGFueW1vcmUuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDc0MF9lY2MuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2luZ2VuaWMvano0NzQwX2VjYy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjgzYjQyODgxNzIwZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDc0MF9lY2MuYwo+IEBAIC0wLDAgKzEsMTk2IEBACj4g
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIEpaNDc0MCBF
Q0MgY29udHJvbGxlciBkcml2ZXIKPiArICoKPiArICogQ29weXJpZ2h0IChjKSAyMDE5IFBhdWwg
Q2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ICsgKgo+ICsgKiBiYXNlZCBvbiBqejQ3
NDAtbmFuZC5jCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgo+ICsjaW5j
bHVkZSA8bGludXgvZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgo+ICsj
aW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gKwo+ICsjaW5jbHVkZSAiaW5nZW5p
Y19lY2MuaCIKPiArCj4gKyNkZWZpbmUgSlpfUkVHX05BTkRfRUNDX0NUUkwJMHgwMAo+ICsjZGVm
aW5lIEpaX1JFR19OQU5EX0RBVEEJMHgwNAo+ICsjZGVmaW5lIEpaX1JFR19OQU5EX1BBUjAJMHgw
OAo+ICsjZGVmaW5lIEpaX1JFR19OQU5EX1BBUjEJMHgwQwo+ICsjZGVmaW5lIEpaX1JFR19OQU5E
X1BBUjIJMHgxMAo+ICsjZGVmaW5lIEpaX1JFR19OQU5EX0lSUV9TVEFUCTB4MTQKPiArI2RlZmlu
ZSBKWl9SRUdfTkFORF9JUlFfQ1RSTAkweDE4Cj4gKyNkZWZpbmUgSlpfUkVHX05BTkRfRVJSKHgp
CSgweDFDICsgKCh4KSA8PCAyKSkKPiArCj4gKyNkZWZpbmUgSlpfTkFORF9FQ0NfQ1RSTF9QQVJf
UkVBRFkJQklUKDQpCj4gKyNkZWZpbmUgSlpfTkFORF9FQ0NfQ1RSTF9FTkNPRElORwlCSVQoMykK
PiArI2RlZmluZSBKWl9OQU5EX0VDQ19DVFJMX1JTCQlCSVQoMikKPiArI2RlZmluZSBKWl9OQU5E
X0VDQ19DVFJMX1JFU0VUCQlCSVQoMSkKPiArI2RlZmluZSBKWl9OQU5EX0VDQ19DVFJMX0VOQUJM
RQkJQklUKDApCj4gKwo+ICsjZGVmaW5lIEpaX05BTkRfU1RBVFVTX0VSUl9DT1VOVAkoQklUKDMx
KSB8IEJJVCgzMCkgfCBCSVQoMjkpKQo+ICsjZGVmaW5lIEpaX05BTkRfU1RBVFVTX1BBRF9GSU5J
U0gJQklUKDQpCj4gKyNkZWZpbmUgSlpfTkFORF9TVEFUVVNfREVDX0ZJTklTSAlCSVQoMykKPiAr
I2RlZmluZSBKWl9OQU5EX1NUQVRVU19FTkNfRklOSVNICUJJVCgyKQo+ICsjZGVmaW5lIEpaX05B
TkRfU1RBVFVTX1VOQ09SX0VSUk9SCUJJVCgxKQo+ICsjZGVmaW5lIEpaX05BTkRfU1RBVFVTX0VS
Uk9SCQlCSVQoMCkKPiArCj4gK3N0YXRpYyBjb25zdCB1aW50OF90IGVtcHR5X2Jsb2NrX2VjY1td
ID0gewo+ICsJMHhjZCwgMHg5ZCwgMHg5MCwgMHg1OCwgMHhmNCwgMHg4YiwgMHhmZiwgMHhiNywg
MHg2Zgo+ICt9Owo+ICsKPiArc3RhdGljIHZvaWQgano0NzQwX2VjY19pbml0KHN0cnVjdCBpbmdl
bmljX2VjYyAqZWNjLCBib29sIGVuY29kZSkKPiArewo+ICsJdWludDMyX3QgcmVnOwo+ICsKPiAr
CS8qIENsZWFyIGludGVycnVwdCBzdGF0dXMgKi8KPiArCXdyaXRlbCgwLCBlY2MtPmJhc2UgKyBK
Wl9SRUdfTkFORF9JUlFfU1RBVCk7Cj4gKwo+ICsJLyogSW5pdGlhbGl6ZSBhbmQgZW5hYmxlIEVD
QyBoYXJkd2FyZSAqLwo+ICsJcmVnID0gcmVhZGwoZWNjLT5iYXNlICsgSlpfUkVHX05BTkRfRUND
X0NUUkwpOwo+ICsJcmVnIHw9IEpaX05BTkRfRUNDX0NUUkxfUkVTRVQ7Cj4gKwlyZWcgfD0gSlpf
TkFORF9FQ0NfQ1RSTF9FTkFCTEU7Cj4gKwlyZWcgfD0gSlpfTkFORF9FQ0NfQ1RSTF9SUzsKPiAr
CWlmIChlbmNvZGUpCj4gKwkJcmVnIHw9IEpaX05BTkRfRUNDX0NUUkxfRU5DT0RJTkc7Cj4gKwll
bHNlCj4gKwkJcmVnICY9IH5KWl9OQU5EX0VDQ19DVFJMX0VOQ09ESU5HOwo+ICsKPiArCXdyaXRl
bChyZWcsIGVjYy0+YmFzZSArIEpaX1JFR19OQU5EX0VDQ19DVFJMKTsKPiArfQo+ICsKPiArc3Rh
dGljIGludCBqejQ3NDBfZWNjX2NhbGN1bGF0ZShzdHJ1Y3QgaW5nZW5pY19lY2MgKmVjYywKPiAr
CQkJCXN0cnVjdCBpbmdlbmljX2VjY19wYXJhbXMgKnBhcmFtcywKPiArCQkJCWNvbnN0IHU4ICpi
dWYsIHU4ICplY2NfY29kZSkKPiArewo+ICsJdWludDMyX3QgcmVnLCBzdGF0dXM7Cj4gKwl1bnNp
Z25lZCBpbnQgdGltZW91dCA9IDEwMDA7Cj4gKwlpbnQgaTsKPiArCj4gKwlqejQ3NDBfZWNjX2lu
aXQoZWNjLCB0cnVlKTsKPiArCj4gKwlkbyB7Cj4gKwkJc3RhdHVzID0gcmVhZGwoZWNjLT5iYXNl
ICsgSlpfUkVHX05BTkRfSVJRX1NUQVQpOwo+ICsJfSB3aGlsZSAoIShzdGF0dXMgJiBKWl9OQU5E
X1NUQVRVU19FTkNfRklOSVNIKSAmJiAtLXRpbWVvdXQpOwo+ICsKPiArCWlmICh0aW1lb3V0ID09
IDApCj4gKwkJcmV0dXJuIC1FVElNRURPVVQ7Cj4gKwo+ICsJcmVnID0gcmVhZGwoZWNjLT5iYXNl
ICsgSlpfUkVHX05BTkRfRUNDX0NUUkwpOwo+ICsJcmVnICY9IH5KWl9OQU5EX0VDQ19DVFJMX0VO
QUJMRTsKPiArCXdyaXRlbChyZWcsIGVjYy0+YmFzZSArIEpaX1JFR19OQU5EX0VDQ19DVFJMKTsK
PiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgcGFyYW1zLT5ieXRlczsgKytpKQo+ICsJCWVjY19jb2Rl
W2ldID0gcmVhZGIoZWNjLT5iYXNlICsgSlpfUkVHX05BTkRfUEFSMCArIGkpOwo+ICsKPiArCS8q
IElmIHRoZSB3cml0dGVuIGRhdGEgaXMgY29tcGxldGVseSAweGZmLCB3ZSBhbHNvIHdhbnQgdG8g
d3JpdGUgMHhmZiBhcwo+ICsJICogZWNjLCBvdGhlcndpc2Ugd2Ugd2lsbCBnZXQgaW4gdHJvdWJs
ZSB3aGVuIGRvaW5nIHN1YnBhZ2Ugd3JpdGVzLgo+ICsJICovCgpDb21tZW50IGZvcm1hdHRpbmcK
CnMvZWNjL0VDQy8gaW4gcGxhaW4gRW5nbGlzaAoKPiArCWlmIChtZW1jbXAoZWNjX2NvZGUsIGVt
cHR5X2Jsb2NrX2VjYywgQVJSQVlfU0laRShlbXB0eV9ibG9ja19lY2MpKSA9PSAwKQo+ICsJCW1l
bXNldChlY2NfY29kZSwgMHhmZiwgQVJSQVlfU0laRShlbXB0eV9ibG9ja19lY2MpKTsKPiArCj4g
KwlyZXR1cm4gMDsKPiArfQo+ICsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
