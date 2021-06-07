Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAECC47082
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 06:49:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 609B9611ED
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 06:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 609B9611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ju2ipoK4UYtOqAF+nvb4zVdhlSe4+GtDQDA4dDIE8GI=; b=k6YejHLRxlFlMf45ZKeQZkLwG/
	JFmKJDkrzqC63s3l8Vyp551cdILcJ0l7VwNtRGsaPw67Cv/NV9H0WQWRj/vb1xwoZNDQBev1N279V
	XH7nUcdXi41qSchpyQttWfAjjYoWglm70ibZ5/I0ulinTv3f0yGKswsjNFdDsUHNvTad4VNuYHLmK
	P/lIcF4LMFZcbGi0qMXSCyruatP5fIEOsPtiOoIlK8d6rfyjXKQTqd24GadaiMK4TA0EOYSYoRh6K
	fjdSr6wYbFSdracuH3lyj5tHT+HR/jsuk4nNz7/WQ6Mn1LLMwh1Ptj+rpB2eRl1kQQYk1YDR+qULZ
	boR8mrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq93L-001ntG-5p; Mon, 07 Jun 2021 06:48:03 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq93F-001nqG-Ej
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 06:48:01 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1576lqB9078633;
 Mon, 7 Jun 2021 01:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623048472;
 bh=/egmoX3I90I/Gz07AopX4CzQsPsjx31j/llTXwlpz7k=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=gjgnBH8tml4Bd6Gtid2iJiD+FAUlPT6zRZzAYE38nYEP3rKJ0Stc2zQukVBNMo+Fp
 1cT6DEgeohrgO5IvoAKRCT5o/pmAl9LdpfDX5n/WcPkB7rHoAnjdul8vhZr2wR5hzW
 8ur05ZF/VudvEuwvqDtbFTVfPip7gCRN/Xc1mRoE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1576lq6s056325
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Jun 2021 01:47:52 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 01:47:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 7 Jun 2021 01:47:52 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1576ln8D086300;
 Mon, 7 Jun 2021 01:47:50 -0500
Subject: Re: [PATCH v5 3/5] mtd: spi-nor: otp: return -EROFS if region is
 read-only
To: Michael Walle <michael@walle.cc>
CC: <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <p.yadav@ti.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
References: <20210604100252.9975-1-michael@walle.cc>
 <20210604100252.9975-4-michael@walle.cc>
 <c2b58dcc-5a60-792c-30ac-a3db327a85ed@microchip.com>
 <e117bc50b9f9e10549c25602b66cfe26@walle.cc>
 <1549db61-500a-e5df-9303-823b41457861@ti.com>
 <4ba7994b0cc8d436012a776ca14addca@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <3e46bc75-6ace-f7c0-1b14-aae812554ac9@ti.com>
Date: Mon, 7 Jun 2021 12:17:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4ba7994b0cc8d436012a776ca14addca@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_234757_643579_98280165 
X-CRM114-Status: GOOD (  21.26  )
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

CgpPbiA2LzcvMjEgMTE6MzggQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0gMjAyMS0wNi0w
NyAwNzo0Niwgc2NocmllYiBWaWduZXNoIFJhZ2hhdmVuZHJhOgo+PiBPbiA2LzQvMjEgNjo0NSBQ
TSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEFtIDIwMjEtMDYtMDQgMTU6MDcsIHNjaHJpZWIg
VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tOgo+Pj4+IE9uIDYvNC8yMSAxOjAyIFBNLCBNaWNo
YWVsIFdhbGxlIHdyb3RlOgo+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQo+Pj4+PiBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUKPj4+Pj4KPj4+Pj4gU1BJIE5PUiBmbGFzaGVzIHdpbGwganVzdCBpZ25vcmUgcHJvZ3Jh
bSBjb21tYW5kcyBpZiB0aGUgT1RQIHJlZ2lvbiBpcwo+Pj4+PiBsb2NrZWQuIFRodXMsIGEgdXNl
ciBtaWdodCBub3Qgbm90aWNlIHRoYXQgdGhlIGludGVuZGVkIHdyaXRlCj4+Pj4+IGRpZG4ndCBl
bmQKPj4+Pj4gdXAgaW4gdGhlIGZsYXNoLiBSZXR1cm4gLUVST0ZTIHRvIHRoZSB1c2VyIGluIHRo
aXMgY2FzZS4gRnJvbSB3aGF0Cj4+Pj4+IEkgY2FuCj4+Pj4+IHRlbGwsIGNoaXBzL2NmaV9jbWRz
ZXRfMDAwMS5jIGFsc28gcmV0dXJuIHRoaXMgZXJyb3IgY29kZS4KPj4+Pj4KPj4+Pj4gT25lIGNv
dWxkIG9wdGltaXplIHNwaV9ub3JfbXRkX290cF9yYW5nZV9pc19sb2NrZWQoKSB0byByZWFkIHRo
ZQo+Pj4+PiBzdGF0dXMKPj4+Pj4gcmVnaXN0ZXIgb25seSBvbmNlIGFuZCBub3QgZm9yIGV2ZXJ5
IE9UUCByZWdpb24sIGJ1dCBmb3IgdGhhdCB3ZSB3b3VsZAo+Pj4+PiBuZWVkIHNvbWUgbW9yZSBp
bnZhc2l2ZSBjaGFuZ2VzLiBHaXZlbiB0aGF0IHRoaXMgaXMKPj4+Pj4gb25lLXRpbWUtcHJvZ3Jh
bW1hYmxlIG1lbW9yeSBhbmQgdGhlIG5vcm1hbCBhY2Nlc3MgbW9kZSBpcyByZWFkaW5nLCB3ZQo+
Pj4+PiBqdXN0IGxpdmUgd2l0aCB0aGUgc21hbGwgb3ZlcmhlYWQuCj4+Pj4+Cj4+Pj4+IEZpeGVz
OiAwNjkwODlhY2Y4OGIgKCJtdGQ6IHNwaS1ub3I6IGFkZCBPVFAgc3VwcG9ydCIpCj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4+Pj4+IFJldmll
d2VkLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDC
oGRyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+Pj4+
Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3Ivb3RwLmMKPj4+Pj4gaW5kZXggMzg5OGVkNjdiYTFjLi4wNjNmOGZiNjg2NDkg
MTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMKPj4+Pj4gKysrIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYwo+Pj4+PiBAQCAtMjQ5LDYgKzI0OSwzMiBAQCBzdGF0
aWMgaW50IHNwaV9ub3JfbXRkX290cF9pbmZvKHN0cnVjdCBtdGRfaW5mbwo+Pj4+PiAqbXRkLCBz
aXplX3QgbGVuLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+PiDCoH0KPj4+
Pj4KPj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9tdGRfb3RwX3JhbmdlX2lzX2xvY2tlZChzdHJ1
Y3Qgc3BpX25vciAqbm9yLAo+Pj4+PiBsb2ZmX3Qgb2ZzLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzaXplX3QgbGVuKQo+Pj4+PiArewo+Pj4+PiArwqDCoMKgwqDCoMKgIGNvbnN0
IHN0cnVjdCBzcGlfbm9yX290cF9vcHMgKm9wcyA9IG5vci0+cGFyYW1zLT5vdHAub3BzOwo+Pj4+
PiArwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCByZWdpb247Cj4+Pj4+ICvCoMKgwqDCoMKgwqAg
aW50IGxvY2tlZDsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgwqDCoMKgIGlmICghbGVuKQo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+Pj4gKwo+Pj4+Cj4+Pj4g
WW91IHdvbid0IG5lZWQgdGhpcyBpZiB5b3UgcHV0IHBhdGNoIDQvNSBiZWZvcmUgdGhpcyBvbmUu
IFdpdGggdGhpczoKPj4+Cj4+PiBUaGlzIHBhdGNoIHdpbGwgZ2V0IGJhY2twb3J0ZWQgdG8gdGhl
IHN0YWJsZSBrZXJuZWxzLiBQYXRjaCA0IG9uIHRoZQo+Pj4gb3RoZXIgaGFuZCBkb2VzIG5vdC4K
Pj4+Cj4+Cj4+IEkgZG9uJ3Qgc2VlIHdoeSA0LzUgY2Fubm90IGJlIG1hcmtlZCBmb3IgYmFja3Bv
cnQgdG9vIGFzIGl0IG1ha2VzIDMvNQo+PiBtdWNoIGNsZWFuZXI/Cj4gCj4gV2hhdCBraW5kIG9m
IHByb2JsZW0gZG9lcyA0LzUgZml4PyBJIGNhbid0IHNlZSBob3cgdGhhdCBwYXRjaCB3b3VsZAo+
IGFwcGx5IHRvIGFueSBydWxlIGluIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdGFibGUta2VybmVs
LXJ1bGVzLnJzdC4KPiAKCkxvb2tpbmcgZnVydGhlciwgSSBkb24ndCBzZWUgdGhlIG5lZWQgZm9y
IDQvNSB0byBiZSBhIHNlcGFyYXRlIHBhdGNoLgpQYXRjaCA0LzUgaXMgc2ltcGxpZnlpbmcgc3Bp
X25vcl9tdGRfb3RwX3JhbmdlX2lzX2xvY2tlZCgpIGJ5IGVuc3VyaW5nCidsZW4nIHBhc3NlZCBp
cyBuZXZlciAwIHdoaWNoIGNhbiBiZSBkb25lIGluIDMvNSB3aGVuIGludHJvZHVjaW5nCnNwaV9u
b3JfbXRkX290cF9yYW5nZV9pc19sb2NrZWQoKS4KClNvIHdoeSBub3Qgc3F1YXNoZWQgaXQgaW50
byAzLzUuCgo+IEJ1dCBzdXJlLCBhZGRpbmcgdGhlIHNhbWUgRml4ZXM6IHRhZywgSSBjYW4gc3dh
cCB0aG9zZSB0d28uCj4gCj4gLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
