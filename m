Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C40C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 10:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB57420857
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 10:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Slc7wYJ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB57420857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gof8bJQWhP3OqFRcfYAsoFiMPPXDHbesIm5nEOeEbPw=; b=Slc7wYJ+5Y71xx
	vPw9RF+rQ9rzcXyfJizThfOD0zXnvfdtp901QHzKLTMztY19V9R5SSv0mp8NpIXNIjaSfTQvkpyDS
	AWk7DB5lSdND1pRCqZVaEo3Sv6JvNvVG5kxpZFM+2v5PimppmPbTfX/LfMzy5ej5dcNnY6MddDSXM
	T9hLTs/gPn05W8iDlJmqCfuTF2A/Zrn+y8lGd+nmXGy0T0E9VOq3UTHR0qq+XX36ZTcvlvPq+mTAo
	A0FoW+Z6X9NQR27qpSquC5HsgYCUG5RUPZWx6S/sTx+q40nST5/q4yGSzqd8P6jZHEOvTQsya2Ywi
	m4FTYupiHXEoUDVMqmVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gonLo-0000ho-KK; Wed, 30 Jan 2019 10:44:12 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gonLd-0000Yh-4Z; Wed, 30 Jan 2019 10:44:02 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E9EA93847E5B6917DBE8;
 Wed, 30 Jan 2019 18:43:56 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.96) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.408.0; Wed, 30 Jan 2019
 18:43:55 +0800
Subject: Re: [PATCH -next] mtd: rawnand: stm32_fmc2: Make some functions static
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20190130100908.19532-1-yuehaibing@huawei.com>
 <20190130113428.37570a55@xps13>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <17220216-4b18-be33-78e2-5cfc517aed27@huawei.com>
Date: Wed, 30 Jan 2019 18:43:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190130113428.37570a55@xps13>
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_024401_533630_C10EFB0A 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: christophe.kerello@st.com, alexandre.torgue@st.com, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, mcoquelin.stm32@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAxOS8xLzMwIDE4OjM0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFl1ZSwKPiAKPiBZ
dWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IHdyb3RlIG9uIFdlZCwgMzAgSmFuIDIw
MTkgMTg6MDk6MDgKPiArMDgwMDoKPiAKPj4gRml4ZXMgdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2Fy
bmluZzoKPj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmM6MTIyODo2OiB3
YXJuaW5nOiBzeW1ib2wgJ3N0bTMyX2ZtYzJfcmVhZF9kYXRhJyB3YXMgbm90IGRlY2xhcmVkLiBT
aG91bGQgaXQgYmUgc3RhdGljPwo+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25h
bmQuYzoxMjc1OjY6IHdhcm5pbmc6IHN5bWJvbCAnc3RtMzJfZm1jMl93cml0ZV9kYXRhJyB3YXMg
bm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+PiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9zdG0zMl9mbWMyX25hbmQuYzoxNzA3OjMyOiB3YXJuaW5nOiBzeW1ib2wgJ3N0bTMyX2ZtYzJf
bmFuZF9vb2JsYXlvdXRfb3BzJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGlj
Pwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+
Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCAxMCAr
KysrKy0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9u
YW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+PiBpbmRleCBl
MDU3MjgyLi45OTljYTZhIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0z
Ml9mbWMyX25hbmQuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25h
bmQuYwo+PiBAQCAtMTIyNSw4ICsxMjI1LDggQEAgc3RhdGljIGlycXJldHVybl90IHN0bTMyX2Zt
YzJfaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4+
ICB9Cj4+ICAKPj4gLXZvaWQgc3RtMzJfZm1jMl9yZWFkX2RhdGEoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwgdm9pZCAqYnVmLAo+PiAtCQkJICB1bnNpZ25lZCBpbnQgbGVuLCBib29sIGZvcmNlXzhi
aXQpCj4+ICtzdGF0aWMgdm9pZCBzdG0zMl9mbWMyX3JlYWRfZGF0YShzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCB2b2lkICpidWYsCj4+ICsJCQkJIHVuc2lnbmVkIGludCBsZW4sIGJvb2wgZm9yY2Vf
OGJpdCkKPj4gIHsKPj4gIAlzdHJ1Y3Qgc3RtMzJfZm1jMl9uZmMgKmZtYzIgPSB0b19zdG0zMl9u
ZmMoY2hpcC0+Y29udHJvbGxlcik7Cj4+ICAJdm9pZCBfX2lvbWVtICppb19hZGRyX3IgPSBmbWMy
LT5kYXRhX2Jhc2VbZm1jMi0+Y3Nfc2VsXTsKPj4gQEAgLTEyNzIsOCArMTI3Miw4IEBAIHZvaWQg
c3RtMzJfZm1jMl9yZWFkX2RhdGEoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdm9pZCAqYnVmLAo+
PiAgCQlzdG0zMl9mbWMyX3NldF9idXN3aWR0aF8xNihmbWMyLCB0cnVlKTsKPj4gIH0KPj4gIAo+
PiAtdm9pZCBzdG0zMl9mbWMyX3dyaXRlX2RhdGEoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29u
c3Qgdm9pZCAqYnVmLAo+PiAtCQkJICAgdW5zaWduZWQgaW50IGxlbiwgYm9vbCBmb3JjZV84Yml0
KQo+PiArc3RhdGljIHZvaWQgc3RtMzJfZm1jMl93cml0ZV9kYXRhKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsIGNvbnN0IHZvaWQgKmJ1ZiwKPj4gKwkJCQkgIHVuc2lnbmVkIGludCBsZW4sIGJvb2wg
Zm9yY2VfOGJpdCkKPj4gIHsKPj4gIAlzdHJ1Y3Qgc3RtMzJfZm1jMl9uZmMgKmZtYzIgPSB0b19z
dG0zMl9uZmMoY2hpcC0+Y29udHJvbGxlcik7Cj4+ICAJdm9pZCBfX2lvbWVtICppb19hZGRyX3cg
PSBmbWMyLT5kYXRhX2Jhc2VbZm1jMi0+Y3Nfc2VsXTsKPj4gQEAgLTE3MDQsNyArMTcwNCw3IEBA
IHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uYW5kX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBpbnQgc2VjdGlvbiwKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gIAo+PiAtY29uc3Qg
c3RydWN0IG10ZF9vb2JsYXlvdXRfb3BzIHN0bTMyX2ZtYzJfbmFuZF9vb2JsYXlvdXRfb3BzID0g
ewo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGRfb29ibGF5b3V0X29wcyBzdG0zMl9mbWMyX25h
bmRfb29ibGF5b3V0X29wcyA9IHsKPj4gIAkuZWNjID0gc3RtMzJfZm1jMl9uYW5kX29vYmxheW91
dF9lY2MsCj4+ICAJLmZyZWUgPSBzdG0zMl9mbWMyX25hbmRfb29ibGF5b3V0X2ZyZWUsCj4+ICB9
Owo+IAo+IFRoaXMgaXMgbmFuZC9uZXh0IG1hdGVyaWFsLCBzbyBpZiB5b3UgZG9uJ3QgbWluZCBJ
IHdvdWxkIGxpa2UgdG8gc3F1YXNoCj4gdGhpcyBmaXggaW50byB0aGUgb3JpZ2luYWwgY29tbWl0
IGluc2VydGluZyB0aGUgZHJpdmVyLgoKU3VyZSwgb2sKCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXD
qGwKPiAKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
