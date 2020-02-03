Return-Path: <SRS0=yeSB=3X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31918C35247
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 17:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 001DB2087E
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 17:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xp9Ztu2i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tya9sOpH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 001DB2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzIfKF4R3Vba8Ypoc2Qc8vEXjxAva6rd7OHYPbPKxIo=; b=Xp9Ztu2iTYuPse
	DI6YVhBi4Z+QplQd47xGbY6LHorggFJfbATTpepBIuAtzvIIlPj1ZZm3edpuHllRlkC7t7NT/GVsZ
	x8ykEU9eNqG/Rq26+mLVguRc5n5gp6pmsBPKjNWqLyKpuGX/a0PoyfsMtPi2dKwKby/PWpWfopPaX
	teKF45B5ZeAVF5NkdYaMyREyMUxs6d5a6nszLmmkvy8BVXf0ESIM2zSQkn06a3kV5ZBTkpBJi/8NF
	idxIT3E8MQxqtEM+baw5iQnxRLVqkOiP2uQn9IIRyRbfBuCinSpR08gUQLfIL3lwa0CFMQecuRB6h
	5hoBoWfORHObTkgrAW5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyfZv-0007Sn-HA; Mon, 03 Feb 2020 17:32:07 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyfZt-0007S2-8L
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2020 17:32:07 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 013HVxik105062;
 Mon, 3 Feb 2020 11:31:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580751120;
 bh=f+hBt02ibpvSfr6ReBzptTjO24RT2MYEtIS6YLGYN50=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tya9sOpHqBLwEmjdX8so6ihRv3BNyMV/LWiOTaXwL2dkdzJTeDw9QLztgkbEsoFTy
 3Iny1aOX39qxGv66QrImc6ISR47467a6DtFLsNB9glGwFqr9UEuHBIxflmBBEVvpul
 7AaaIQSksg1HX0eL6r4ZqK0p66HDKCPqdfw6uP5w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 013HVxOM009298
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Feb 2020 11:31:59 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 3 Feb
 2020 11:31:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 3 Feb 2020 11:31:59 -0600
Received: from [10.250.132.93] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 013HVuM6107825;
 Mon, 3 Feb 2020 11:31:57 -0600
Subject: Re: [SPAM] Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection
 support
To: Michael Walle <michael@walle.cc>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <CGME20200122193640epcas1p2e8df0b73bdf6c6389709148702082aef@epcas1p2.samsung.com>
 <20200122193608.3859-1-michael@walle.cc>
 <0c4e70fcf58c93f9b7375d83b50028df225aed82.camel@samsung.com>
 <f4581c4cb231cc4c61b9a146dda5fada@walle.cc>
 <7843bb76c9c3854a4b9fa4b2b69d760e965bbb22.camel@samsung.com>
 <0882ce3e8cf9de25681b475f10154cef@walle.cc>
 <4fd7374e9362895b5c80d7bfe8a05c6552572243.camel@samsung.com>
 <2e02aaef6289f24f672f84eadb28f31a@walle.cc>
 <141fe5bf27542420292864bf2d574a8c94dc6867.camel@samsung.com>
 <687e49cb-96d0-464f-0bc2-4537780e9731@ti.com>
 <9966c63930b47103e78873fb82dc16f2@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <62b66868-5a18-4fc4-f18e-6b4c39fdb65d@ti.com>
Date: Mon, 3 Feb 2020 23:01:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <9966c63930b47103e78873fb82dc16f2@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_093205_420973_9FFD7941 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: js07.lee@gmail.com, linux-mtd@lists.infradead.org,
 tudor.ambarus@microchip.com, Jungseung Lee <js07.lee@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyLzMvMjAyMCA4OjA4IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjAt
MDItMDMgMTQ6NTYsIHNjaHJpZWIgVmlnbmVzaCBSYWdoYXZlbmRyYToKClsuLi5dCj4+Cj4+IEZs
YXNoIGRldmljZXMgaGF2ZSB2YXJpYWJsZSBzZWN0b3Igc2l6ZSwgNjRLQiwgMTI4S0Igb3IgMjU2
S0IuLi4gV2hpbGUKPj4gbWFwcGluZyBvZiBudW1iZXIgb2Ygc2VjdG9ycyBsb2NrZWQgdG8gQlAg
Yml0cyBpcyBkZXBlbmRlbnQgb24gcnVsZXMgMQo+PiB0byAzIHlvdSBtZW50aW9uZWQgYmVsb3cs
IHRoZSBzaXplIG9yIGFyZWEgb2YgZmxhc2ggcHJvdGVjdGVkIGRlcGVuZHMgb24KPj4gc2VjdG9y
IHNpemUuCj4gCj4gSXMgdGhlcmUgYW55IGZsYXNoIGRldmljZSB3aGljaCBoYXMgYW5vdGhlciBz
ZWN0b3Igc2l6ZSAhPSA2NEtpQiBmb3IgdGhlCj4gQlAgYml0cz8KCkkgY2Fubm90IHNlZW0gdG8g
ZmluZCBCUCBzY2hlbWUgZm9yIE1pY3JvbiBtdDM1eCBzZXJpZXMgYnV0IHRoZXkgYWxsIApoYXZl
IDEyOEtCIHNlY3RvcnMgd2l0aCA0IGJpdCBibG9jayBwcm90ZWN0aW9uIHNjaGVtZToKaHR0cHM6
Ly93d3cubWljcm9uLmNvbS8tL21lZGlhL2NsaWVudC9nbG9iYWwvZG9jdW1lbnRzL3Byb2R1Y3Rz
L2RhdGEtc2hlZXQvbm9yLWZsYXNoL3NlcmlhbC1ub3IvbXQzNXhfeGNjZWxhL2RpZS1yZXYtYS94
Y2NlbGFfZmxhc2hfbWVtb3J5X2RhdGFfc2hlZXRfYnJpZWYucGRmCgpBbm90aGVyIGV4YW1wbGUg
d291bGQgYmUgczI1Zmw1MTJzIHdpdGggMjU2S0Igc2VjdG9yIHdpdGggMyBiaXQgQlA6Cmh0dHBz
Oi8vd3d3LmN5cHJlc3MuY29tL2ZpbGUvMTc3OTcxL2Rvd25sb2FkCgo+IAo+PiBTbywgdGhlIGN1
cnJlbnQgZm9ybXVsYSBpbiBzcGktbm9yLmMgKGlnbm9yaW5nIFRCIGFuZCBvdGhlciBib2lsZXJw
bGF0ZSk6Cj4+Cj4+IHBvdyA9IGlsb2cyKG10ZC0+c2l6ZSkgLSBpbG9nMihsb2NrX2xlbik7Cj4+
IHZhbCA9IG1hc2sgLSAocG93IDw8IHNoaWZ0KTsKPj4KPj4gVGhpcyB3b3JrcyBvbmx5IGZvciBk
ZXZpY2VzIHdpdGggNjRLQiBzZWN0b3Igc2l6ZSBhcyA4TUIgZmxhc2ggd2l0aCA2NEtCCj4+IHNl
Y3RvciBzaXplIHdvdWxkIGhhdmUgMTI4IHNlY3RvcnMgKEJQMC0yID0+IDBiMTExID0+IDJeNyku
Cj4gCj4gSXQgYWxzbyBvbmx5IHdvcmtzIHdpdGggZmxhc2hlcyA+PSA0TWlCLiBTZWUgZml4IGJl
bG93LiBBbmQgSU1ITyB0aGlzIGlzCj4gZXhhY3RseQo+IHRoZSBzYW1lICJwcm9ibGVtIiB0aGUg
Zmxhc2hlcyB3aXRoIDQgQlAgYml0cyBoYXZlLgo+IAoKWWVzIGFncmVlLCBidXQgdGhhdCBwYXRj
aCBpcyBhc3N1bWVzIHNlY3RvciBzaXplIHRvIGJlIDY0S0IgYW5kIApvbmNlIGdlbmVyYWxpemVk
IHdvdWxkIG1vc3RseSBiZSBlcXVpdmFsZW50IHRvIGJlbG93IGZvcm11bGEuCgo+PiBBIG1vcmUg
Z2VuZXJpYyBmb3JtdWxhIHdvdWxkIGJlOgo+Pgo+PiBGaW5kIG4gd2hlcmUgMl4obiAtIDEpID0g
bGVuL3NlY3Rvci1zaXplCj4+IE9SIDJeIChuIC0gMSkgPSBsZW4gKiBuX3NlY3RvcnMgLyBtdGQt
PnNpemUKPj4KPj4gV2hpY2ggc29sdmVzIHRvOgo+Pgo+PiBwb3cgPSBpbG9nMihtdGQtPnNpemUp
IC0gaWxvZzIobG9ja19sZW4pOwo+PiB2YWwgPSBpbG9nMihub3ItPm5fc2VjdG9ycykgKyAxIC0g
cG93Owo+Pgo+PiBJIHNlZSB0aGlzIGlzIHdoYXQgSnVuZ3NldW5nIGhhcyB0cmllZCB0byBpbXBs
ZW1lbnQgaGVyZS7CoCBQbGVhc2UKPj4gY29ycmVjdCBtZSBpZiBJIGdvdCB0aGlzIHdyb25nLgo+
Pgo+PiBUaGlzLCBjb21iaW5lZCB3aXRoIHBvaW50ICgzKSBiZWxvdyBzaG91bGQgcHJvdmlkZSBh
IGdlbmVyaWMKPj4gaW1wbGVtZW50YXRpb24gdGhhdCBzaG91bGQgc3VwcG9ydCBhIHdpZGUgdmFy
aWV0eSBvZiBmbGFzaGVzLgo+Pgo+PiBPZiBjb3Vyc2UsIHRoZXJlIGFyZSBhbHdheXMgZXhjZXB0
aW9ucyBhbmQgdGhleSBuZWVkIHRvIGJlIGhhbmRsZWQgdXNpbmcKPj4gY3VzdG9tIGhvb2tzLgo+
Pgo+PiBJIGRvbid0IGhhdmUgdGhlIHBhdGNoIHRoYXQgeW91IHNoYXJlZCB3aXRoIEp1bmdzZXVu
Zy4gSSB3b3VsZCBncmVhdGx5Cj4+IGFwcHJlY2lhdGUsIGlmIHlvdSBhbmQgSnVuZ3NldW5nIGNv
dWxkIHdvcmsgb24gcGF0Y2ggd2l0aCBhYm92ZSBsb2dpYyBhcwo+PiB3ZWxsIGFzIGZpeGVzIHRv
IGhhbmRsZSBvdmVyZmxvdyBjYXNlPwo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW10ZC8yMDIwMDEyMzE3MDEzMC44Mjg5LTEtbWljaGFlbEB3YWxsZS5jYy8KPiAKPiBBcyBJIHNh
aWQsIHRoYXQgc2hvdWxkIHdvcmsgZm9yIGJvdGggMyBhbmQgNCBiaXRzLiBCdXQgYmUgYXdhcmUg
dGhhdCB0aGlzCj4gaXMgYW4gUkZDIGFuZCBJJ3ZlIGp1c3QgdGVzdGVkIGl0IGluIGluIHVzZXJz
cGFjZSwgbGlrZSB0aGUgY2FsY3VsYXRpb24KPiBvZiB0aGUgYml0cyBhbmQgdHJhbnNmZXJyZWQg
dGhhdCBpbnRvIHRoZSBkcml2ZXIuIFNvIG9uZSB3b3VsZCBhY3R1YWxseQo+IGhhdmUgdG8gdGVz
dCB0aGF0LiBCdXQgYXBwYXJlbnRseSBubyBvbmUgaGFkIGEgZXZlbiBhcHBsaWVkIGl0Lgo+IAoK
U29ycnksIEkgaGF2ZW4ndCBsb29rZWQgYXQgdGhhdCBwYXRjaC4gQnV0IEkgdGhpbmsgYmV0dGVy
IGFsdGVybmF0aXZlIHdvdWxkCmJlIGV4dGVuZCB0aGlzIHBhdGNoIHRvIHN1cHBvcnQgb3ZlcmZs
b3cgY2FzZS4KCldvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIHRlc3QgdGhpcyBwYXRjaCBvbiBmbGFz
aGVzIDwzMk1CaXQsIGlmIHlvdSBoYXZlCmFjY2VzcyB0bz8KClJlZ2FyZHMKVmlnbmVzaAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
