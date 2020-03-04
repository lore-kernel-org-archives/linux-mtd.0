Return-Path: <SRS0=wBEz=4V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9BCC3F2CD
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 08:37:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46D11206D5
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 08:37:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u3ES7RKR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46D11206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WtRxSqXmM5OpQx/X0PdnC+Kp6MEHBxi+YXrxCfvdrHk=; b=u3ES7RKR/DN6yTYw6xgNcTfqp
	p4MeQMZenPkJoh8LwlJNNQmdTP9NoMaQ4khWbWaTUf62KDD4B6ViKYPJTOlGZGm9QvB+MEi0YNZPo
	WIrknwrxnSa+SKENsc4xOafUNrtfEW8qaXsFL8ZZicaoSiYb/R5M1Fvf/qfxJbcrsGpqM86ATy5CX
	zd29KjRO5TdODWt4LaZzNLWsAYfC3WDDlRYZwSMe8qbQWyDYAZ/QmKWk6HzeKhNk/xZ1WZp/JiX5k
	Xp26Fn8gUwqpO0FAUwUszq94ZfiOGbc0K6QrvsQj9e1XgkDYfc102WJfhaEDBPbQ2dAqXzIBf1ozn
	/P9vCC7Pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9PWN-0008MA-RF; Wed, 04 Mar 2020 08:36:51 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9PWJ-0008Kj-I9
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2020 08:36:50 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5AF0EFC1828AA8A1E2FF;
 Wed,  4 Mar 2020 16:36:38 +0800 (CST)
Received: from [127.0.0.1] (10.74.219.194) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Mar 2020
 16:36:31 +0800
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
To: Jungseung Lee <js07.lee@samsung.com>, Jungseung Lee <js07.lee@gmail.com>, 
 <Tudor.Ambarus@microchip.com>
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e@epcas1p3.samsung.com>
 <20200113055907.9029-2-js07.lee@samsung.com>
 <3703036.Ns4Yp6NO8s@localhost.localdomain>
 <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
 <7932da1d-77d8-04a4-4ee1-8ab88ec97f97@hisilicon.com>
 <c54cc6e145237b8b04eb96bc133e4c77378b8ae7.camel@samsung.com>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <cac6fa64-2213-6f4b-1670-a7b439c77ee4@hisilicon.com>
Date: Wed, 4 Mar 2020 16:36:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <c54cc6e145237b8b04eb96bc133e4c77378b8ae7.camel@samsung.com>
X-Originating-IP: [10.74.219.194]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_003647_774263_C77F10BA 
X-CRM114-Status: GOOD (  22.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: John Garry <john.garry@huawei.com>, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, Linuxarm <linuxarm@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgrlnKggMjAyMC8zLzQgMTM6MjAsIEp1bmdzZXVuZyBMZWUg5YaZ6YGTOgo+IEhpLAo+Cj4g
MjAyMC0wMi0xMSAo7ZmUKSwgMTU6NTIgKzA4MDAsIGNoZW54aWFuZyAoTSk6Cj4+IEhpIEp1bmdz
ZXVuZyBMZWUsCj4+Cj4+IOWcqCAyMDIwLzEvMTcgMjM6MDYsIEp1bmdzZXVuZyBMZWUg5YaZ6YGT
Ogo+Pj4gSGksIFR1ZG9yLAo+Pj4KPj4+IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDc6NDkgUE0g
PFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4KPj4+IHdyb3RlOgo+Pj4+IEhpLCBKdW5nc2V1
bmcsCj4+Pj4KPj4+PiBUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcy4KPj4+Pgo+Pj4+IE9uIE1v
bmRheSwgSmFudWFyeSAxMywgMjAyMCA3OjU5OjA2IEFNIEVFVCBKdW5nc2V1bmcgTGVlIHdyb3Rl
Ogo+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzCj4+Pj4+IHlvdSBrbm93IHRoZQo+Pj4+PiBjb250ZW50IGlzIHNhZmUKPj4+
Pj4KPj4+Pj4gQ3VycmVudGx5LCB3ZSBhcmUgc3VwcG9ydGluZyBibG9jayBwcm90ZWN0aW9uIG9u
bHkgZm9yCj4+Pj4+IGZsYXNoIGNoaXBzIHdpdGggMyBibG9jayBwcm90ZWN0aW9uIGJpdHMgaW4g
dGhlIFNSIHJlZ2lzdGVyLgo+Pj4+PiBUaGlzIHBhdGNoIGVuYWJsZXMgYmxvY2sgcHJvdGVjdGlv
biBzdXBwb3J0IGZvciBzb21lIGZsYXNoIHdpdGgKPj4+Pj4gNCBibG9jayBwcm90ZWN0aW9uIGJp
dHMoYnAwLTMpLgo+Pj4+IFNvbWU/IElzbid0IHRoaXMgZ2VuZXJpYyBmb3IgYWxsIHRoZSBmbGFz
aGVzIHRoYXQgc3VwcG9ydCBCUDAtMz8KPj4+Pgo+Pj4gVGhpcyBvbmUgd291bGQgYmUgYSBnZW5l
cmljIHNvbHV0aW9uIHRvIHN1cHBvcnQgQlAwLTMgb24gU3RhdHVzCj4+PiBSZWdpc3Rlci4KPj4+
PiAgRnJvbSBteSBzdHVkeSwgdGhpcyBjb3ZlcnMgYWxsIHRoZSBmbGFzaGVzIGxpc3RlZCBvbiBz
cGktbm9yLmMKPj4+PiB0aGF0Cj4+PiBoYXZlIEJQMC0zIGJpdCBvbiBTUi4KPj4+IEl0IGxvb2tz
IGxpa2UgSSBoYXZlIHRvIGNoYW5nZSB0aGlzIGRlc2NyaXB0aW9uLgo+Pj4KPj4+IE5vdGUgdGhh
dCBpdCBpcyBOT1QgZm9yIHNvbWUgZmxhc2hlcyB0aGF0IGhhdmUgQlAwLTMgaW4gYW5vdGhlcgo+
Pj4gcmVnaXN0ZXIuCj4+PiBBcyB5b3Uga25vdywganVzdCBsaWtlIFNQSV9OT1JfSEFTX1RCIGRp
ZC4KPj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1bmdzZXVuZyBMZWUgPGpzMDcubGVlQHNhbXN1
bmcuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gdjMgOgo+Pj4+PiAgICAgRml4IHdyb25nIG9mcyBjYWxj
dWxhdGlvbiBvbiB2MiBwYXRjaAo+Pj4+PiB2MiA6Cj4+Pj4+ICAgICBBZGQgc2FtcGxlIHRhYmxl
IHBvcnRpb24gYWJvdXQgNGJpdCBibG9jayBwcm90ZWN0aW9uIG9uIHRoZQo+Pj4+PiBjb21tZW50
Cj4+Pj4+ICAgICBUcml2aWFsIGNvZGluZyBzdHlsZSBjaGFuZ2UKPj4+Pj4KPj4+Pj4gICAgZHJp
dmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAxMjcKPj4+Pj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLQo+Pj4+PiAgICBpbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmggICB8
ICAgOCArKysKPj4+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKSwgMTYg
ZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9y
L3NwaS1ub3IuYyBiL2RyaXZlcnMvbXRkL3NwaS0KPj4+Pj4gbm9yL3NwaS1ub3IuYwo+Pj4+PiBp
bmRleCBlM2RhNmE4NjU0YTguLjdlOGFmNmM0ZmRmYSAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMKPj4+Pj4gQEAgLTIzOCw2ICsyMzgsMTQgQEAgc3RydWN0IGZsYXNoX2luZm8gewo+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBzdGF0dXMg
cmVnaXN0ZXIuCj4+Pj4+IE11c3QgYmUgdXNlZAo+Pj4+PiB3aXRoICogU1BJX05PUl9IQVNfVEIu
Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+Pj4+
PiArI2RlZmluZSBTUElfTk9SX0hBU19CUDMgICAgICAgICAgICAgICAgQklUKDE3KSAvKgo+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICogRmxhc2ggU1IgaGFz
IDQgYml0Cj4+Pj4+IGZpZWxkcyAoQlAwLTMpCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKiBmb3IgYmxvY2sKPj4+Pj4gcHJvdGVjdGlvbi4KPj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+Pj4+PiArI2RlZmluZSBT
UElfTk9SX0JQM19TUl9CSVQ2ICAgIEJJVCgxOCkgLyoKPj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAqIEJQMyBpcyBiaXQgNiBvZgo+Pj4+PiBzdGF0dXMgcmVn
aXN0ZXIuCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBN
dXN0IGJlIHVzZWQgd2l0aAo+Pj4+IEFyZSB3ZSBzYWZlIHRvIHJlcGxhY2UgU1BJX05PUl9UQl9T
Ul9CSVQ2IGFuZCBTUElfTk9SX0JQM19TUl9CSVQ2Cj4+Pj4gd2l0aCBhCj4+Pj4gU1BJX05PUl9T
Ul9UQl9CSVQ2X0JQM19CSVQ1PyBPciBtYXliZSB3aXRoIGEKPj4+PiBTUElfTk9SX1NSX0JQM19C
SVQ2X1RCX0JJVDUsIGhvdwo+Pj4+IGlzIG1vcmUgY29udmVuaWVudD8KPj4+Pgo+Pj4gTGV0J3Mg
dGhpbmsgYWJvdXQgc29tZSBmbGFzaCBpbiB3aGljaCBCUDAtMyBleGlzdHMgaW4gdGhlIHN0YXR1
cwo+Pj4gcmVnaXN0ZXIgYnV0IFRCIGV4aXN0cyBpbiBhbm90aGVyIHJlZ2lzdGVyLgo+Pj4gZm9y
IGV4YW1wbGUsIG14MjV1MTI4MzVmLgo+Pj4gSSBoYXZlbid0IHRlc3RlZCB5ZXQsIGJ1dCBhY2Nv
cmRpbmcgdG8gdGhlIGRhdGFzaGVldCwgSSB0aGluayB0aGlzCj4+PiBwYXRjaCBjYW4gc3VwcG9y
dCA0Yml0IGJsb2NrIHByb3RlY3Rpb24gZm9yIHRoZSBmbGFzaC4KPj4+Cj4+PiBJbiBvcmRlciB0
byBlbWJyYWNlIHRoZSBjYXNlLCBob3cgYWJvdXQgbGV0dGluZyB0aGVtIGFzIEl0IGlzLgo+Pj4g
SXMgdGhlcmUgYW55IHN1Z2dlc3Rpb24/Cj4+IEluIG15IGJvYXJkKGhpc2lsaWNvbiBEMDYpIHRo
ZXJlIGlzICBhIG14MjV1MTI4MzVmIEZsYXNoLCBhbmQgaQo+PiBlbmFibGUKPj4gU1BJX05PUl9I
QVNfTE9DSyBhbmQgU1BJX05PUl9IQVNfQlAzIHdoaWNoIGlzIG5vdCBlbmFibGVkIGluIHNwaS0K
Pj4gbm9yLmMsCj4+IGZpbmQgaXQgc2VlbXMgbm90IHdvcms6Cj4+Cj4+IEV1bGVyOn4gIyBscyAv
ZGV2L210ZDAKPj4gL2Rldi9tdGQwCj4+IEV1bGVyOn4gIyAuL2ZsYXNoX2xvY2sgLWkgL2Rldi9t
dGQwCj4+IERldmljZTogL2Rldi9tdGQwCj4+IFN0YXJ0OiAwCj4+IExlbjogMHgxMDAwMDAwCj4+
IExvY2sgc3RhdHVzOiB1bmxvY2tlZAo+PiBSZXR1cm4gY29kZTogMAo+PiBFdWxlcjp+ICMKPj4g
RXVsZXI6fiAjIC4vZmxhc2hfbG9jayAvZGV2L210ZDAKPj4gZmxhc2hfbG9jazogZXJyb3IhOiBj
b3VsZCBub3QgbG9jayBkZXZpY2U6IC9kZXYvbXRkMAo+Pgo+PiAgICAgICAgICAgICAgIGVycm9y
IDUgKElucHV0L291dHB1dCBlcnJvcikKPj4gRXVsZXI6fiAjIC4vZmxhc2hfbG9jayAtaSAvZGV2
L210ZDAKPj4gRGV2aWNlOiAvZGV2L210ZDAKPj4gU3RhcnQ6IDAKPj4gTGVuOiAweDEwMDAwMDAK
Pj4gTG9jayBzdGF0dXM6IGxvY2tlZAo+PiBSZXR1cm4gY29kZTogMQo+PiBFdWxlcjp+ICMKPj4K
Pj4gSSBmaW5kIHRoYXQgaW4gZnVuY3Rpb24gc3BpX25vcl93cml0ZV9zcl9hbmRfY2hlY2soKSwg
aWYgc3BpX25vciBoYXMKPj4gMTZiaXQgU1IsIHNwaV9ub3Jfd3JpdGVfMTZiaXRfc3JfYW5kX2No
ZWNrKCkgd2lsbCBiZSBjYWxsZWQsIGlmIG5vdAo+PiBzcGlfbm9yX3dyaXRlX3NyMV9hbmRfY2hl
Y2soKSB3aWxsIGJlIGNhbGxlZC4KPj4gRm9yIG14MjV1MTI4MzVmLCBpdCBqdXN0IGhhcyA4Yml0
IFNSLCBidXQgU05PUl9GX0hBU18xNkJJVF9TUiBpcyBzZXQKPj4gYXMKPj4gZGVmYXVsdCwgc28g
aXQgY2F1c2VzIGFib3ZlIGlzc3VlOwo+PiBFdmVuIGhhY2sgdGhlIGNvZGUgdG8gbm90IHNldCBm
bGFnIFNOT1JfRl9IQVNfMTZCSVRfU1IsIGl0IHNlZW1zCj4+IHRoYXQKPj4gbG9jayBpcyBzdGls
bCBub3QgdmFsaWRlZCBhcyBQcm9ncmFtL0VyYXNlIHN0aWxsIHN1Y2Nlc3MgZXZlbiBpZiBpdAo+
PiBpcwo+PiBsb2NrZWQ6Cj4+Cj4gQ291bGQgeW91IGR1bXAgc3IgcmVnaXN0ZXIgdmFsdWU/Cj4g
QnV0IGlmIHlvdSBhcmUgdXNpbmcgb2xkIGtlcm5lbCBvciB0aGUgZmxhc2ggZG9lc24ndCBoYXZl
IEZTUiBlcnJvcgo+IGJpdHMsIGVyYXNlL3Byb2dyYW0gb3BlcmF0aW9uIGZhaWx1cmUgY291bGRu
J3QgYmUgZGV0ZWN0ZWQuCj4KPiByZWZlciB0aGlzIG9uZS4KPgo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQv
P2g9djUuNi1yYzQmaWQ9MjBjY2I5OTNmMjliZDZhZDE3Njk5ZGQwYjM0OWRiMDg2ZTNjYTcxOQoK
VGhlIGtlcm5lbCBpIHVzZWQgaXMgNS41LXJjNCwgYW5kIGl0IGluY2x1ZGVzIHRoZSBhYm92ZSBw
YXRjaC4KSSBhbHNvIGNoZWNrZWQgdGhlIGRhdGFzaGVldCBvZiBteDI1dTEyODM1ZiBmbGFzaCwg
YW5kIGl0IGRvZXNuJ3QgaGF2ZSAKRlNSIHJlZ2lzdGVyLCBidXQgaXQgaGFzIG90aGVyIHJlZ2lz
dGVyIFNDVVIoU2VjdXJpdHkgUmVpZ3N0ZXIsIApiaXQ2JmJpdDUgYXJlCkVfRkFJTC9QX0ZBSUwg
d2hpY2ggaSB0aGluayB0aGUgZnVuY3Rpb24gb2YgdGhlbSBhcmUgbGlrZSB0aGUgYml0NSZiaXQ0
IApvZiBGU1IgcmVnaXN0ZXIpIC4KCgo+Cj4gSSBhbSBwbGFubmluZyB0byBwb3N0IG5ldyBwYXRj
aCBmb3IgNGJpdCBCbG9jayBwcm90ZWN0aW9uIHNvb24uIEkgd291bGQKPiBhcHByZWNpYXRlIGl0
IGlmIHlvdSBjaGVjayB0aGVyZSB0b28uCgpJdCdzIG15IHBsZWFzdXJlIHRvIGNoZWNrIGl0LgoK
Pgo+IFRoYW5rcywKPgo+PiBFdWxlcjp+ICMgLi9mbGFzaF9sb2NrIC1pIC9kZXYvbXRkMAo+PiBE
ZXZpY2U6IC9kZXYvbXRkMAo+PiBTdGFydDogMAo+PiBMZW46IDB4MTAwMDAwMAo+PiBMb2NrIHN0
YXR1czogdW5sb2NrZWQKPj4gUmV0dXJuIGNvZGU6IDAKPj4gRXVsZXI6fiAjCj4+IEV1bGVyOn4g
IyAuL210ZF9kZWJ1ZyBlcmFzZSAvZGV2L210ZDAgMHhlNDAwMDAgNDA5Ngo+PiBFcmFzZWQgNDA5
NiBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMGU0MDAwMCBpbiBmbGFzaAo+PiBFdWxlcjp+ICMKPj4g
RXVsZXI6fiAjIC4vZmxhc2hfbG9jayAvZGV2L210ZDAKPj4gRXVsZXI6fiAjCj4+IEV1bGVyOn4g
IyAuL2ZsYXNoX2xvY2sgLWkgL2Rldi9tdGQwCj4+IERldmljZTogL2Rldi9tdGQwCj4+IFN0YXJ0
OiAwCj4+IExlbjogMHgxMDAwMDAwCj4+IExvY2sgc3RhdHVzOiBsb2NrZWQKPj4gUmV0dXJuIGNv
ZGU6IDEKPj4gRXVsZXI6fiAjCj4+IEV1bGVyOn4gIyAuL210ZF9kZWJ1ZyBlcmFzZSAvZGV2L210
ZDAgMHhlNDAwMDAgNDA5Ngo+PiBFcmFzZWQgNDA5NiBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMGU0
MDAwMCBpbiBmbGFzaAo+PiBFdWxlcjp+ICMgLi9mbGFzaF9sb2NrIC1pIC9kZXYvbXRkMAo+PiBE
ZXZpY2U6IC9kZXYvbXRkMAo+PiBTdGFydDogMAo+PiBMZW46IDB4MTAwMDAwMAo+PiBMb2NrIHN0
YXR1czogbG9ja2VkCj4+IFJldHVybiBjb2RlOiAxCj4+IEV1bGVyOn4gIwo+PiBFdWxlcjp+ICMK
Pj4KPj4KPj4gVGhhbmtzLAo+PiBjaGVueGlhbmcKPj4KPj4KPj4+PiBDaGVlcnMsCj4+Pj4gdGEK
Pj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+PiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPj4+Cj4gaHR0cHM6
Ly9wcm90ZWN0Mi5maXJlZXllLmNvbS91cmw/az04MWY1MmJhYy1kYzIxOTZlOC04MWY0YTBlMy0w
Y2M0N2EzMTM4MWEtY2ZlZmYyZmI3NDkyNjFhZSZ1PWh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+Pj4gLgo+Pj4KPj4KPj4KPgo+IC4KPgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
