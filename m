Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D337CCD187
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Oct 2025 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exNwEf/f9xDogErkrAzobyLQ+//MS0GYMDqxyleu8Sk=; b=w5JQ8CLCeFWH2D
	97DB1GXGDUzbMcUWCvJ8fJLkvWx114ikUJMhMkAdtgRr7+JNRPtIBA5XdbKqjRLwEgfDTVGTIwipe
	W7LOyIHeKXmnsJdTF+l6pcWSTJSrAuCmfydf3AHx+tYCRvVgCCITp6NTR00MGo7T5GG7CIxHrFE68
	pOz6hQdXmA1438C8ukAMRo9gqMKyzvPMlcIvY2h4WmYJcDuAt3erRzAFV4gEByjSz0l6JhDDGoEGX
	O+Si7NjA0K1ZkJ2w8J+g+RBEtOk6Wd+mAxqtkYDzwBw+7pwHdUpNzBagoGbU7CTtNiUDhDE+EBJjN
	ZOnwWWOVpD3xjrmOq4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ynJ-0000000BWtN-04Co;
	Sun, 12 Oct 2025 16:19:37 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ynF-0000000BWrh-18rL
	for linux-mtd@lists.infradead.org;
	Sun, 12 Oct 2025 16:19:34 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cl5K56BwWz9sNw;
	Sun, 12 Oct 2025 18:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760285961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TTVGhi4rnwPwUOPPSMOjl9iwr7lLgw+vjjgrWUfzcVI=;
	b=niWnhV19nCimFJfERMg6CA5bJ7FO6qUylXCnF2Q0j8Y282rut9SrP/lYvFtJQndqNCJgZM
	WZVVRU5JntIwTftZMYzziK+rYR5zhKECeorAhLTRH7W2QcF9pwLaW9pPApfpNtkYr90xst
	8/SoUd9Iv6RmuPWkQ5TkY6KsE1v4SfNluMcyazna0CFP/4HQUg1n7skZJcq9W0yoIDr0aN
	f69bX5v9KIyRmLk8oJSpWEscrQLm0tYWG+zfLkcfa+yryUholzpFMKdugM1qazzbcEmULi
	MB2RFWCBfnvGFNKFoBo1Ikk6zmDtPt2tfMKQekLv3fD6vVE7PhrGIKp5Y9YMvg==
Message-ID: <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
Date: Sun, 12 Oct 2025 18:19:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
X-MBO-RS-ID: fcbea66f86f54376f84
X-MBO-RS-META: 6ff8nrurfn4sqzkrxa4joi8fhgofw6dq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_091933_452792_C4B5E4AC 
X-CRM114-Status: GOOD (  20.24  )
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

T24gMTAvOC8yNSA4OjIwIEFNLCBUdWRvciBBbWJhcnVzIHdyb3RlOgoKSGVsbG8gVHVkb3IsCgo+
PiBzb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCj4gCj4gVGhhdCdzIG9rYXkuCgpUaGFuayB5b3UK
ClsuLi5dCgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMKPj4+PiBpbmRleCBkNmM5MjU5NWY2YmMu
LmQ0NDZkMTIzNzFlMSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5z
aW9uLmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMKPj4+PiBAQCAt
NzU3LDYgKzc1NywzMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBzIHMyNWZz
X3Nfbm9yX2ZpeHVwcyA9IHsKPj4+PiAgwqDCoMKgwqDCoCAucG9zdF9iZnB0ID0gczI1ZnNfc19u
b3JfcG9zdF9iZnB0X2ZpeHVwcywKPj4+PiAgwqAgfTsKPj4+PiAgwqAgK3N0YXRpYyBpbnQgczI1
ZnM1MTJzX25vcl9wb3N0X3NtcHRfZml4dXBzKHN0cnVjdCBzcGlfbm9yICpub3IsIHU4ICpzbXB0
KQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCAvKgo+Pj4+ICvCoMKgwqDCoCAqIFRoZSBTMjVGUzUxMlMg
Y2hpcCBkYXRhc2hlZXQgcmV2Lk8gVGFibGUgNzEgb24gcGFnZSAxNTMKPj4+PiArwqDCoMKgwqAg
KiBKRURFQyBTZWN0b3IgTWFwIFBhcmFtZXRlciBEd29yZC02IENvbmZpZy4gRGV0ZWN0LTMgZG9l
cwo+Pj4+ICvCoMKgwqDCoCAqIHVzZSBDUjNOViBiaXQgMSB0byBkaXNjZXJuIDY0a2lCLzI1Nmtp
QiB1bmlmb3JtIHNlY3RvcnMKPj4+PiArwqDCoMKgwqAgKiBkZXZpY2UgY29uZmlndXJhdGlvbiwg
aG93ZXZlciBhY2NvcmRpbmcgdG8gc2VjdGlvbiA3LjUuNS4xCj4+Pj4gK8KgwqDCoMKgICogQ29u
ZmlndXJhdGlvbiBSZWdpc3RlciAzIE5vbi12b2xhdGlsZSAoQ1IzTlYpIHBhZ2UgNjEsIHRoZQo+
Pj4+ICvCoMKgwqDCoCAqIENSM05WIGJpdCAxIGlzIFJGVSBSZXNlcnZlZCBmb3IgRnV0dXJlIFVz
ZSwgYW5kIGlzIHNldCB0bwo+Pj4+ICvCoMKgwqDCoCAqIDAgb24gbmV3bHkgbWFudWZhY3R1cmVk
IGRldmljZXMsIHdoaWNoIG1lYW5zIDY0a2lCIHNlY3RvcnMuCj4+Pj4gK8KgwqDCoMKgICogU2lu
Y2UgdGhlIGRldmljZSBkb2VzIG5vdCBzdXBwb3J0IDY0a2lCIHVuaWZvcm0gc2VjdG9ycyBpbgo+
Pj4+ICvCoMKgwqDCoCAqIGFueSBjb25maWd1cmF0aW9uLCBwYXJzaW5nIFNNUFQgdGFibGUgY2Fu
bm90IGZpbmQgYSB2YWxpZAo+Pj4+ICvCoMKgwqDCoCAqIHNlY3RvciBtYXAgZW50cnkgYW5kIGZh
aWxzLiBGaXggdGhpcyB1cCBieSBzZXR0aW5nIFNNUFQKPj4+PiArwqDCoMKgwqAgKiBjb25maWd1
cmF0aW9uIGluZGV4IGJpdCAwLCB3aGljaCBpcyBwb3B1bGF0ZWQgZXhhY3RseSBieQo+Pj4+ICvC
oMKgwqDCoCAqIHRoZSBDUjNOViBiaXQgMSBiZWluZyAxLgo+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+
ICvCoMKgwqAgKnNtcHQgfD0gQklUKDApOwo+Pj4KPj4+IFBsZWFzZSBoZWxwIG1lIHVuZGVyc3Rh
bmQgdGhpcy4gTWF5YmUgYSBsaW5rIHRvIHlvdXIgcmV2aXNpb24gb2YKPj4+IGRhdGFzaGVldCB3
b3VsZCBoZWxwIG1lLgo+Pgo+PiBodHRwczovL3d3dy5pbmZpbmVvbi5jb20vYXNzZXRzL3Jvdy9w
dWJsaWMvZG9jdW1lbnRzLzEwLzQ5L2luZmluZW9uLXMyNWZzNTEycy01MTItbWItMS1kYXRhc2hl
ZXQtZW4ucGRmCj4+Cj4+IFNNUFQgdmFsdWVzOgo+Pgo+PiBpPTAgc21wdFtpXT0wOGZmNjVmYwo+
PiBpPTEgc21wdFtpXT0wMDAwMDAwNAo+PiBpPTIgc21wdFtpXT0wNGZmNjVmYwo+PiBpPTMgc21w
dFtpXT0wMDAwMDAwMgo+PiBpPTQgc21wdFtpXT0wMmZmNjVmZAo+PiBpPTUgc21wdFtpXT0wMDAw
MDAwNAo+PiBpPTYgc21wdFtpXT1mZjAyMDFmZQo+PiBpPTcgc21wdFtpXT0wMDAwN2ZmMQo+PiBp
PTggc21wdFtpXT0wMDAzN2ZmNAo+PiBpPTkgc21wdFtpXT0wM2ZiZmZmNAo+PiBpPTEwIHNtcHRb
aV09ZmYwMjAzZmUKPj4gaT0xMSBzbXB0W2ldPTAzZmJmZmY0Cj4+IGk9MTIgc21wdFtpXT0wMDAz
N2ZmNAo+PiBpPTEzIHNtcHRbaV09MDAwMDdmZjEKPj4gaT0xNCBzbXB0W2ldPWZmMDAwNWZmCj4+
IGk9MTUgc21wdFtpXT0wM2ZmZmZmNAo+Pgo+IAo+IHRoYW5rcyEKPiAKPj4+IEluIHRoZSBmbGFz
aCBkYXRhc2hlZXRzIHRoYXQgSSBzZWUsIHRoZXJlIHNoYWxsCj4+PiBiZSBhICJTZWN0b3IgTWFw
IFBhcmFtZXRlciBUYWJsZSBOb3RlcyIgd2hlcmUgYSAiU2VjdG9yIE1hcCBQYXJhbWV0ZXIiCj4+
PiB0YWJsZSBpcyBkZXNjcmliZWQgc2hvd2luZyBhbiBJbmRleCBWYWx1ZSBjb25zdHJ1Y3RlZCBi
eSB0aGUgQ1J4TlZbeV0KPj4+IHJldHVybiB2YWx1ZXMuIFRoYXQgaW5kZXggdmFsdWUgaXMgdGhl
IG1hcF9pZCBpbiB0aGUgY29kZS4KPj4+Cj4+PiBCeSByZWFkaW5nIHlvdXIgZGVzY3JpcHRpb24g
SSB1bmRlcnN0YW5kIENSM05WWzFdIGhhcyB2YWx1ZSB6ZXJvIGFzIGl0Cj4+PiBpcyBtYXJrZWQg
YXMgUkZVLCBidXQgYXQgdGhlIHNhbWUgdGltZSB0aGF0IGJpdCBpcyBleHBlY3RlZCBpbiBTTVBU
IHRvCj4+PiBhbHdheXMgaGF2ZSB2YWx1ZSAxLiBUaGF0J3Mgd2h5IGRhdGFzaGVldHMgbGlrZSB0
aGlzIG9uZSBbMV0gaW4gdGhlaXIKPj4+ICJUYWJsZSA3MC4gU2VjdG9yIE1hcCBQYXJhbWV0ZXIi
IGRvIG5vdCBkZXNjcmliZSBDUjNOVlsxXSBhdCBhbGwsIGFuZAo+Pj4gZGVmaW5lIHRoZSBpbmRl
eCB2YWx1ZSBhcyBDUjNOVlszXSA8PCAyIHwgQ1IxTlZbMl0gPDwgMSB8IDEuCj4+Cj4+IFdoZXJl
IGRvZXMgdGhpcyBsYXN0IHBhcnQgImRlZmluZSB0aGUgaW5kZXggdmFsdWUgYXMgQ1IzTlZbM10g
PDwgMiB8IENSMU5WWzJdIDw8IDEgfCAxIiBjb21lIGZyb20gPwo+IAo+IEluIHlvdXIgZGF0YXNo
ZWV0IGZsYXZvciwgZnJvbSAiVGFibGUgNzAgU2VjdG9yIG1hcCBwYXJhbWV0ZXIiLCBwYWdlIDE1
MiwKPiAiSW5kZXggVmFsdWUiIGNvbHVtbi4gSSBkZWR1Y2VkIHRoZSBmb3JtdWxhIGJ5IHVzaW5n
IHRoZSBDUjNOVlszXSBhbmQKPiBDUjFOVlsyXSB2YWx1ZXMuIFRoZSBkYXRhc2hlZXQgc2F5czoK
PiAKPiAiV2hlbiBtb3JlIHRoYW4gb25lIGNvbmZpZ3VyYXRpb24gYml0IG11c3QgYmUgcmVhZCwg
YWxsIHRoZSBiaXRzIGFyZQo+IGNvbmNhdGVuYXRlZCBpbnRvIGFuIGluZGV4IHZhbHVlIHRoYXQg
aXMgdXNlZCB0byBzZWxlY3QgdGhlIGN1cnJlbnQgYWRkcmVzcyBtYXAuIgo+IAo+IGFuZCB0aGF0
IHRoZSAidGhlIGZvbGxvd2luZyBNU2IgdG8gTFNiIG9yZGVyIHRvIGZvcm0gdGhlIGNvbmZpZ3Vy
YXRpb24gbWFwCj4gaW5kZXggdmFsdWU6Cj4g4oCiIENSM05WWzNdIOKAlCAwID0gSHlicmlkIEFy
Y2hpdGVjdHVyZSwgMSA9IFVuaWZvcm0gQXJjaGl0ZWN0dXJlCj4g4oCiIENSMU5WWzJdIOKAlCAw
ID0gNCBLQiBwYXJhbWV0ZXIgc2VjdG9ycyBhdCBib3R0b20sIDEgPSA0IEtCIHNlY3RvcnMgYXQg
dG9wCj4gIgo+IAo+IFRoZSAiSW5kZXggVmFsdWUiIHNoYWxsIGJlIHRoZSBtYXBfaWQgdGhhdCB5
b3UgcGFzc2VkIGluIHRoZSBjb2RlOgo+IHNwaV9ub3JfcG9zdF9zbXB0X2ZpeHVwcyhub3IsICZt
YXBfaWQpOwo+IAo+IENhbiB5b3UgcGxlYXNlIHByaW50IHRoZSBtYXBfaWQgdmFsdWUgdGhhdCB5
b3Ugb2J0YWluIHdpdGhvdXQgdXBkYXRpbmcgaXQ/CgoweDQKCj4gTGV0J3MgYWxzbyBwcmludCB0
aGUgdmFsdWVzIG9mIENSM05WIGFuZCBDUjFOVi4KCkJvdGggMHgwIGFuZCAweDAgLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
