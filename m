Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BITCOIN_SPAM_02,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C89FC43215
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 10:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E73C205ED
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 10:31:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bw4ts+N1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E73C205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Ro1C1lO/oOanCVNUMBJdB3sKkIEi4CPd9ArLkTeiew=; b=Bw4ts+N1631kDJurtqGbmTFRg
	SJZKbtA8tiqKIq0IUjXoR86Dy+WzeAb1WRlzFvyF6YCID51pfHHosCTiZHeg4rgKWyW1E3Oau4KdO
	Do9edRXwrvrfP4Y1E/NxFPtvGJd18wvBgaqOKcpw2Z0qisiH1KCpsS1YvowPyCJVVfYxjD2idXjJG
	uLhRMRVUXOT/tLfCb9Gigs/XR7Ybs33OKyWhZ/r+t1xDYT5VXC52tVYVgf7D2ZRnYYFxjNIfeBjs7
	4SN+dyq9lmhQExMOtCtKoMCJBwQs0ZvYOh9Re2mtsWAJAFpanxYWplvqzweUwsnoovnBH3HW0cOOQ
	WZMgchZDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic5Sk-0006Ic-Ql; Tue, 03 Dec 2019 10:31:22 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic5Sg-0006I4-Qd
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 10:31:20 +0000
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 9ABF1EA3AB9FD939BC1D;
 Tue,  3 Dec 2019 10:31:10 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 3 Dec 2019 10:31:10 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 10:31:10 +0000
Subject: Re: flash_lock issue for n25q 128mb spi nor part
To: <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
Date: Tue, 3 Dec 2019 10:31:09 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_023119_011861_52B5150B 
X-CRM114-Status: GOOD (  23.00  )
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
Cc: broonie@kernel.org, chenxiang66@hisilicon.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDMvMTIvMjAxOSAwOTo0NSwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgo+
IEhpLCBKb2huLAoKSGkgVHVkb3IsCgpUaGFua3MgZm9yIGdldHRpbmcgYmFjayB0byBtZS4KCj4g
Cj4gT24gMTIvMi8xOSA3OjI4IFBNLCBKb2huIEdhcnJ5IHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gSGkgZ3V5cywKPj4KPj4gSSBhbSB0ZXN0aW5nIHRo
ZSBmb2xsb3dpbmcgZHJpdmVyIG9uIHRvcCBvZiBMaW51cycgbWFzdGVyIGJyYW5jaCB3aXRoIGEK
Pj4gbjI1cTEyOGExMSBwYXJ0Ogo+IAo+IEkgdW5kZXJzdGFuZCB0aGUgeW91IGVuYWJsZWQgbG9j
a2luZyBzdXBwb3J0IGZvciB0aGlzIGZsYXNoIG9uIHlvdXIgc2lkZSwKPiBiZWNhdXNlIGluIG1h
aW5saW5lIGl0IGlzIG5vdCB5ZXQgdGhlcmUuCj4gCj4gQmUgYXdhcmUgdGhhdCB0aGlzIGZsYXNo
IGhhcyBCUDMgc3VwcG9ydCwgYW5kIGluIG1haW5saW5lIHdlIHN1cHBvcnQgZm9yIG5vdwo+IGp1
c3QgQlAwLUJQMiwgc28ganVzdCBhIHBhcnRpYWwgbG9jayBjYW4gYmUgYWNoaWV2ZWQsIGFuZCBp
dCBkZXBlbmRzIG9uIHdoYXQgeW91Cj4gdHJpZWQgdG8gbG9jay4gSXQgd2lsbCBiZSBoZWxwZnVs
IHRvIHRlbGwgaG93IHlvdSBlbmFibGVkIHRoZSBsb2NraW5nIGFuZCB3aGF0Cj4gY29tbWFuZHMg
ZGlkIHlvdSB1c2UuCgpTbyBJIGFtIHNpbXBseSB1c2luZyBmbGFzaF9sb2NrIC1sIC9kZXYvbXRk
MCwgd2hpY2ggd2lsbCB0cnkgdG8gbG9jayB0aGUgCndob2xlIGRldmljZS4gTm93IEkgc2VlIHdo
YXQgeW91J3JlIHNheWluZyBhYm91dCBCUDMgYW5kIGhvdyBjb21wbGV0ZSAKbG9ja2luZyBpcyBu
b3QgYXZhaWxhYmxlLgoKPiAKPj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRk
LzE1NzI4ODYyOTctNDU0MDAtMy1naXQtc2VuZC1lbWFpbC1qb2huLmdhcnJ5QGh1YXdlaS5jb20v
Cj4+Cj4+IEkgYW0gZmluZGluZyBmbGFzaCBsb2NrIGlzIG5vdCB3b3JraW5nLiBFdmVuIGFmdGVy
IGEg4oCcc3VjY2Vzc2Z1bOKAnSBsb2NrLAo+PiBmbGFzaF9sb2NrIGlzIHJlcG9ydGluZyBmbGFz
aCBpcyB1bmxvY2tlZC4gQW5kIEkgY2FuIHN0aWxsIHdyaXRlIHRvIHRoZQo+PiBmbGFzaC4KPj4K
Pj4gSSBmaW5kIHRoYXQgc2luY2UgMzlkMWUzMzQwYzczICgibXRkOiBzcGktbm9yOiBGaXggY2xl
YXJpbmcgb2YgUUUgYml0IG9uCj4+IGxvY2soKS91bmxvY2soKSIpLCB3ZSdyZSB1c2luZyBhIDE2
YiBTUiBmb3IgdGhpcyBwYXJ0IGluIHRoZSBkcml2ZXIsIGJ1dAo+PiB0aGlzIHBhcnQgb25seSBo
YXMgYSA4YiBTUi4KPj4KPj4gVGhpcyBoYWNrIGZpeGVzIHRoZSBwcm9ibGVtIGZvciBtZToKPj4K
Pj4gQCAtNDY5MSw3ICs0NjkxLDcgQEAgc3RhdGljIHZvaWQgc3BpX25vcl9pbmZvX2luaXRfcGFy
YW1zKHN0cnVjdCBzcGlfbm9yCj4+ICpub3IpCj4+IHBhcmFtcy0+c2V0XzRieXRlID0gc3BhbnNp
b25fc2V0XzRieXRlOwo+PiBwYXJhbXMtPnNldHVwID0gc3BpX25vcl9kZWZhdWx0X3NldHVwOwo+
PiAvKiBEZWZhdWx0IHRvIDE2LWJpdCBXcml0ZSBTdGF0dXMgKDAxaCkgQ29tbWFuZCAqLwo+PiAt
IG5vci0+ZmxhZ3MgfD0gU05PUl9GX0hBU18xNkJJVF9TUjsKPj4gKy8vIG5vci0+ZmxhZ3MgfD0g
U05PUl9GX0hBU18xNkJJVF9TUjsKPiAKPiBUaGlzIG1lYW5zIHRoYXQgYmZwdCBpcyBub3QgcGFy
c2VkLiBZb3UgY2FuIGNvbmZpcm0gdGhpcyBieSBydW5uaW5nIHdpdGggdGhlCj4gcGF0Y2ggZnJv
bSBiZWxvdy4KPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwo+IGluZGV4IGY0YWZlMTIzZTlkYy4uNzM1
Y2Q1MjAyNTk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCj4g
KysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPiBAQCAtMzU0NSw4ICszNTQ1LDEx
IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9wYXJzZV9iZnB0KHN0cnVjdCBzcGlfbm9yICpub3IsCj4g
ICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+IAo+ICAgICAgICAgIC8qIEZpeCBlbmRpYW5u
ZXNzIG9mIHRoZSBCRlBUIERXT1JEcy4gKi8KPiAtICAgICAgIGZvciAoaSA9IDA7IGkgPCBCRlBU
X0RXT1JEX01BWDsgaSsrKQo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IEJGUFRfRFdPUkRfTUFY
OyBpKyspIHsKPiAgICAgICAgICAgICAgICAgIGJmcHQuZHdvcmRzW2ldID0gbGUzMl90b19jcHUo
YmZwdC5kd29yZHNbaV0pOwo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKG5vci0+ZGV2LCAiYmZw
dC5kd29yZHNbJWRdID0gJTA4eFxuIiwgaSwKPiArICAgICAgICAgICAgICAgICAgICAgICBiZnB0
LmR3b3Jkc1tpXSk7Cj4gKyAgICAgICB9Cj4gCj4gICAgICAgICAgLyogTnVtYmVyIG9mIGFkZHJl
c3MgYnl0ZXMuICovCj4gICAgICAgICAgc3dpdGNoIChiZnB0LmR3b3Jkc1tCRlBUX0RXT1JEKDEp
XSAmIEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfTUFTSykgewo+IEBAIC0zNjQ5LDYgKzM2NTIs
OSBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcGFyc2VfYmZwdChzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+
ICAgICAgICAgIHBhcmFtcy0+cGFnZV9zaXplID4+PSBCRlBUX0RXT1JEMTFfUEFHRV9TSVpFX1NI
SUZUOwo+ICAgICAgICAgIHBhcmFtcy0+cGFnZV9zaXplID0gMVUgPDwgcGFyYW1zLT5wYWdlX3Np
emU7Cj4gCj4gKyAgICAgICBkZXZfZXJyKG5vci0+ZGV2LCAiYmZwdC5kd29yZHNbQkZQVF9EV09S
RCgxNSldICYgQkZQVF9EV09SRDE1X1FFUl9NQVNLID0KPiAlMDh4XG4iLAo+ICsgICAgICAgICAg
ICAgICBiZnB0LmR3b3Jkc1tCRlBUX0RXT1JEKDE1KV0gJiBCRlBUX0RXT1JEMTVfUUVSX01BU0sp
Owo+ICsKPiAgICAgICAgICAvKiBRdWFkIEVuYWJsZSBSZXF1aXJlbWVudHMuICovCj4gICAgICAg
ICAgc3dpdGNoIChiZnB0LmR3b3Jkc1tCRlBUX0RXT1JEKDE1KV0gJiBCRlBUX0RXT1JEMTVfUUVS
X01BU0spIHsKPiAgICAgICAgICBjYXNlIEJGUFRfRFdPUkQxNV9RRVJfTk9ORToKPiAKCmpvaG5A
dWJ1bnR1On4kIGRtZXNnIHwgZ3JlcCBzcGkKWyAgIDE0LjkzNTc0MF0gc3BpLW5vciBzcGktUFJQ
MDAwMTowMDogYmZwdC5kd29yZHNbMF0gPSBmZmY5MjBlNQpbICAgMTQuOTQxNDgwXSBzcGktbm9y
IHNwaS1QUlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1sxXSA9IDA3ZmZmZmZmClsgICAxNC45NDcyMTVd
IHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IGJmcHQuZHdvcmRzWzJdID0gNmIyN2ViMjkKWyAgIDE0
Ljk1Mjk0OV0gc3BpLW5vciBzcGktUFJQMDAwMTowMDogYmZwdC5kd29yZHNbM10gPSBiYjI3M2Iy
NwpbICAgMTQuOTU4NjgzXSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1s0XSA9
IGZmZmZmZmZmClsgICAxNC45NjQ0MTddIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IGJmcHQuZHdv
cmRzWzVdID0gYmIyN2ZmZmYKWyAgIDE0Ljk3MDE1MF0gc3BpLW5vciBzcGktUFJQMDAwMTowMDog
YmZwdC5kd29yZHNbNl0gPSBlYjI5ZmZmZgpbICAgMTQuOTc1ODg0XSBzcGktbm9yIHNwaS1QUlAw
MDAxOjAwOiBiZnB0LmR3b3Jkc1s3XSA9IGQ4MTAyMDBjClsgICAxNC45ODE2MThdIHNwaS1ub3Ig
c3BpLVBSUDAwMDE6MDA6IGJmcHQuZHdvcmRzWzhdID0gMDAwMDUyMGYKWyAgIDE0Ljk4NzM1MV0g
c3BpLW5vciBzcGktUFJQMDAwMTowMDogYmZwdC5kd29yZHNbOV0gPSAwMDk5NGEyNApbICAgMTQu
OTkzMDg1XSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1sxMF0gPSBjOTAzOGU4
YgpbICAgMTQuOTk4OTA2XSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1sxMV0g
PSAzODI3MDFhYwpbICAgMTUuMDA0NzI2XSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBiZnB0LmR3
b3Jkc1sxMl0gPSA3NTdhNzU3YQpbICAgMTUuMDEwNTQ3XSBzcGktbm9yIHNwaS1QUlAwMDAxOjAw
OiBiZnB0LmR3b3Jkc1sxM10gPSA1Y2Q1YmRmYgpbICAgMTUuMDE2MzY3XSBzcGktbm9yIHNwaS1Q
UlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1sxNF0gPSBmZjgyMGY0YQpbICAgMTUuMDIyMTg3XSBzcGkt
bm9yIHNwaS1QUlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1sxNV0gPSAwMDAwM2Q4MQoKVGhhbmtzLApK
b2huCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
