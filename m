Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A40C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 10:36:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45664604AC
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 10:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45664604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVnTWeGRsNQ5dNJKAfru4s1fZWDXIX0WH7HbWBectDI=; b=GKvvfXaFO4GNJpjbxKCSTXQ0NE
	VIN1Foa7GzlGMlylg4l0pX6XqSxD16y+Y6y5qKPW+SF1+jwXuFD8D+iWZ2R8SOUAFcsP0nJOl2qb1
	jGk95aZluhhVRoilB2RvBBoTzjjS8GciF+gYwZQzEgPdF1/bj8dH5GilzV3VzKKkXBBm7Q/EHPGoE
	IkZEHgiljh8zYeAevj1PVlMQIAA0IwDtgIZejx6VF+53EnFSaQ+smSR8utITdqvW2HbrgofEfRvEs
	18qcMiwzOOsdtMTklwBOk30PPCwWXoPeccPGZfRjwZ5f/rBeR0+x7/EwTAUTF7BTpjTcHz1NYNF5E
	ZIkBFWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFwS3-0029BK-JO; Tue, 17 Aug 2021 10:36:11 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFwS0-0029Ad-8I
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 10:36:09 +0000
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
 by mail.ispras.ru (Postfix) with ESMTPSA id 7AB0E40A2BD5;
 Tue, 17 Aug 2021 10:36:03 +0000 (UTC)
Subject: Re: [PATCH] mtd: rawnand: mxic: Enable and prepare clocks in probe
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Kirill Shilimanov <kirill.shilimanov@huawei.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>
References: <20210812113800.12466-1-novikov@ispras.ru>
 <CAHp75VcgqZEHBTXpNApGfRkhgjpCvbgj+yxUZbbO+=0DOvZLQg@mail.gmail.com>
 <20210816100114.384f01b9@xps13>
From: Evgeny Novikov <novikov@ispras.ru>
Message-ID: <246f2094-e294-73f8-8a5f-3467e987f788@ispras.ru>
Date: Tue, 17 Aug 2021 13:36:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210816100114.384f01b9@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_033608_513648_2584DDF8 
X-CRM114-Status: GOOD (  24.34  )
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

SGkgTWlxdWVsLAoKT24gMTYuMDguMjAyMSAxMTowMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBBbmR5LAo+Cj4gQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3
cm90ZSBvbiBUaHUsIDEyIEF1ZyAyMDIxCj4gMTU6MTM6MTAgKzAzMDA6Cj4KPj4gT24gVGh1cnNk
YXksIEF1Z3VzdCAxMiwgMjAyMSwgRXZnZW55IE5vdmlrb3YgPG5vdmlrb3ZAaXNwcmFzLnJ1PiB3
cm90ZToKPj4KPj4+IEl0IHNlZW1zIHRoYXQgbXhpY19uZmNfcHJvYmUoKSBtaXNzZWQgaW52b2Nh
dGlvbiBvZgo+Pj4gbXhpY19uZmNfY2xrX2VuYWJsZSgpLiBUaGUgcGF0Y2ggZml4ZWQgdGhhdC4g
SW4gYWRkaXRpb24sIGVycm9yIGhhbmRsaW5nCj4+PiB3YXMgcmVmaW5lZCBhcHByb3ByaWF0ZWx5
Lgo+Pgo+PiBOQUsuIFVudGlsIHlvdSBwcm92aWRlIGEgZGVlcGVyIGFuYWx5c2lzLCBsaWtlIGhv
dyB0aGlzIHdvcmtzIGJlZm9yZSB5b3VyCj4+IGNoYW5nZS4KPj4KPj4KPj4gUGxlYXNlLCBkb27i
gJl0IGJsaW5kbHkgZ2VuZXJhdGUgcGF0Y2hlcywgdGhpcyBjYW4gZXZlbiB5b3VyIGJvdCBkbywg
anVzdAo+PiB0aGluayBhYm91dCBlYWNoIGNoYW5nZSBhbmQgcHJlZmVyYWJsZSB0ZXN0IG9uIHRo
ZSByZWFsIGhhcmR3YXJlLgo+Pgo+PiBUaGUgYWJvdmUgaXMgdG8gYWxsIHlvdXIgbG92ZWx5IGNv
bnRyaWJ1dGlvbnMuCj4+Cj4+Cj4+PiBGb3VuZCBieSBMaW51eCBEcml2ZXIgVmVyaWZpY2F0aW9u
IHByb2plY3QgKGxpbnV4dGVzdGluZy5vcmcpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEV2Z2Vu
eSBOb3Zpa292IDxub3Zpa292QGlzcHJhcy5ydT4KPj4+IENvLWRldmVsb3BlZC1ieTogS2lyaWxs
IFNoaWxpbWFub3YgPGtpcmlsbC5zaGlsaW1hbm92QGh1YXdlaS5jb20+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBLaXJpbGwgU2hpbGltYW5vdiA8a2lyaWxsLnNoaWxpbWFub3ZAaHVhd2VpLmNvbT4KPj4+
IC0tLQo+Pj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9teGljX25hbmQuYyB8IDE2ICsrKysrKysr
KysrKy0tLS0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L214aWNfbmFu
ZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhpY18KPj4+IG5hbmQuYwo+Pj4gaW5kZXggZGEx
MDcwOTkzOTk0Li4zN2U3NWJmNjBlZTUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9teGljX25hbmQuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXhpY19uYW5k
LmMKPj4+IEBAIC01MDksOSArNTA5LDE1IEBAIHN0YXRpYyBpbnQgbXhpY19uZmNfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZQo+Pj4gKnBkZXYpCj4+PiAgICAgICAgICBpZiAoSVNfRVJSKG5m
Yy0+c2VuZF9kbHlfY2xrKSkKPj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobmZj
LT5zZW5kX2RseV9jbGspOwo+Pj4KPj4+ICsgICAgICAgZXJyID0gbXhpY19uZmNfY2xrX2VuYWJs
ZShuZmMpOwo+Pj4gKyAgICAgICBpZiAoZXJyKQo+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiBl
cnI7Cj4gQXMgQW5keSBzYWlkLCB0aGlzIGlzIG5vdCBuZWVkZWQuCj4KPj4+ICsKPj4+ICAgICAg
ICAgIG5mYy0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsK
Pj4+IC0gICAgICAgaWYgKElTX0VSUihuZmMtPnJlZ3MpKQo+Pj4gLSAgICAgICAgICAgICAgIHJl
dHVybiBQVFJfRVJSKG5mYy0+cmVncyk7Cj4+PiArICAgICAgIGlmIChJU19FUlIobmZjLT5yZWdz
KSkgewo+Pj4gKyAgICAgICAgICAgICAgIGVyciA9IFBUUl9FUlIobmZjLT5yZWdzKTsKPj4+ICsg
ICAgICAgICAgICAgICBnb3RvIGZhaWw7Cj4+PiArICAgICAgIH0KPj4+Cj4+PiAgICAgICAgICBu
YW5kX2NoaXAgPSAmbmZjLT5jaGlwOwo+Pj4gICAgICAgICAgbXRkID0gbmFuZF90b19tdGQobmFu
ZF9jaGlwKTsKPj4+IEBAIC01MjcsOCArNTMzLDEwIEBAIHN0YXRpYyBpbnQgbXhpY19uZmNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+Pj4gKnBkZXYpCj4+PiAgICAgICAgICBuYW5kX2No
aXAtPmNvbnRyb2xsZXIgPSAmbmZjLT5jb250cm9sbGVyOwo+Pj4KPj4+ICAgICAgICAgIGlycSA9
IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4+PiAtICAgICAgIGlmIChpcnEgPCAwKQo+Pj4g
LSAgICAgICAgICAgICAgIHJldHVybiBpcnE7Cj4+PiArICAgICAgIGlmIChpcnEgPCAwKSB7Cj4+
PiArICAgICAgICAgICAgICAgZXJyID0gaXJxOwo+Pj4gKyAgICAgICAgICAgICAgIGdvdG8gZmFp
bDsKPiBIb3dldmVyIHNvbWUgcmV3b3JraW5nIGlzIG5lZWRlZCBpbiB0aGUgZXJyb3IgcGF0aC4K
Pgo+IFRoYXQgZ290byBzdGF0ZW1lbnQgc2hvdWxkIGJlIHJlbmFtZWQgYW5kIGRldm1fcmVxdWVz
dF9pcnEoKSBzaG91bGQgbm90Cj4ganVtcCB0byBpdC4KPgoKV2Ugc3RpbGwgbmVlZCBzb21lIGhl
bHAgYW5kIGNsYXJpZmljYXRpb24gZnJvbSB0aG9zZSB3aG8gYXJlIHZlcnkgCmZhbWlsaWFyIHdp
dGggdGhpcyBzb3J0IG9mIGRyaXZlcnMgb3IvYW5kIGNhbiB0ZXN0IHRoaXMgcGFydGljdWxhciAK
ZHJpdmVyLiBteGljX25mY19jbGtfZW5hYmxlKCkgaXMgdGhlIGNvbXBsZW1lbnRhcnkgZnVuY3Rp
b24gZm9yIApteGljX25mY19jbGtfZGlzYWJsZSgpLiBObyBvdGhlciBmdW5jdGlvbnMgaW52b2tl
IApjbGtfcHJlcGFyZV9lbmFibGUoKS9jbGtfZGlzYWJsZV91bnByZXBhcmUoKSBpbiB0aGUgZHJp
dmVyLiBVbmxpa2VseSAKc29tZWJvZHkgaW4gaXRzIGVudmlyb25tZW50IGRvZXMgdGhhdCBzaW5j
ZSBkcml2ZXIgc3BlY2lmaWMgY2xvY2tzIGFyZSAKZGVhbHQgd2l0aC4gQXQgdGhlIG1vbWVudCB0
aGUgZHJpdmVyIGludm9rZXMgbXhpY19uZmNfY2xrX2Rpc2FibGUoKSBvbiAKZXJyb3IgaGFuZGxp
bmcgcGF0aHMgaW4gcHJvYmUsIGluIHJlbW92ZSBhbmQgaW4gbXhpY19uZmNfc2V0X2ZyZXEoKS4g
Cm14aWNfbmZjX2Nsa19lbmFibGUoKSBpcyBjYWxsZWQganVzdCBieSBteGljX25mY19zZXRfZnJl
cSgpIHRoYXQgCm1vcmVvdmVyIGRvZXMgdGhpcyBhZnRlciBjYWxsaW5nIG14aWNfbmZjX2Nsa19k
aXNhYmxlKCkgZmlyc3QuIFNvLCB3ZSAKZGlkIG5vdCBmaW5kIGFueSBwbGFjZSBpbiB0aGUgZHJp
dmVyIHRoYXQgaW52b2tlcyBteGljX25mY19jbGtfZW5hYmxlKCkgCnByaW9yIHRvIG14aWNfbmZj
X2Nsa19kaXNhYmxlKCkuIEJhc2luZyBvbiB0aGlzIHdlIGFkZGVkIApteGljX25mY19jbGtfZW5h
YmxlKCkganVzdCBhZnRlciBnZXR0aW5nIGNsb2Nrcy4gQXMgSSBleHBsYWluZWQgaW4gdGhlIApw
cmV2aW91cyBsYXJnZSBlLW1haWwsIHdlIG1heSBiZSB3cm9uZyBpbiBvdXIgdW5kZXJzdGFuZGlu
ZyBvZiB0aGUgCmRyaXZlciBlbnZpcm9ubWVudCBvci9hbmQgYXQgc3BlY2lmaWNhdGlvbiBvZiBy
ZXF1aXJlbWVudHMgYmVpbmcgCmNoZWNrZWQuIEl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSB3aWxs
IHBvaW50IG91dCBvbiBvdXIgbWlzdGFrZXMuCgpCZXN0IHJlZ2FyZHMsCkV2Z2VueSBOb3Zpa292
Cj4+PiArICAgICAgIH0KPj4+Cj4+PiAgICAgICAgICBteGljX25mY19od19pbml0KG5mYyk7Cj4+
Pgo+Pj4gLS0KPj4+IDIuMjYuMgo+Pj4KPj4+ICAgCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
