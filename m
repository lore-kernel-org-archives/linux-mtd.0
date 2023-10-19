Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC4ECDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 01:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0FJ8/kunwHW2XXK7QtGeYJOAzCsjlgcElXvaMW0zJQ=; b=IrpfAnI3KYVq+pBO3sJMfeFWqa
	qIPkfD14n3amyidlvMMOi9Bjt9hNlTpf32gQAW0BReDOJ1QNBY+INO9CGQwIU6Mh+NT4Gm0uJJXsl
	hp9DyMQ85kyGxuKpozbDTstCYyqA+jkBcuprO/O1koqsgVrVcLkXGjEwYjR4z50ZjNgLCnt3t2bob
	Z6ZIKTbiv8MkQ2VbOPzwS99vo9Yw/TzWPOBq/H2mJbaVKezG9id5OISUGW4G+aCxn9qUySqaD8qU2
	U8bmI4dRd7tkZb1So9A06QGzSXM4tRnEAXZD1W09Ix1+wBI7/qwceKLiUsbSAo8ZugXgdx7hRVpee
	Ypi8iThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHlD-00G3hu-0z;
	Thu, 19 Oct 2023 01:23:39 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHl4-00G3go-1M;
	Thu, 19 Oct 2023 01:23:36 +0000
Received: from kwepemm000014.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S9qd53xVFzRsMj;
	Thu, 19 Oct 2023 09:19:37 +0800 (CST)
Received: from [10.67.110.164] (10.67.110.164) by
 kwepemm000014.china.huawei.com (7.193.23.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 19 Oct 2023 09:23:18 +0800
Subject: Re: [PATCH] mtd: rawnand: meson: check return value of
 devm_kasprintf()
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <liang.yang@amlogic.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
References: <20231018092047.314860-1-yiyang13@huawei.com>
 <20231018141936.42b5ec6b@xps-13>
From: "yiyang (D)" <yiyang13@huawei.com>
Message-ID: <6b2016de-c278-c459-f0a8-e96b97ed52ef@huawei.com>
Date: Thu, 19 Oct 2023 09:23:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20231018141936.42b5ec6b@xps-13>
X-Originating-IP: [10.67.110.164]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000014.china.huawei.com (7.193.23.6)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_182330_659030_932DB085 
X-CRM114-Status: GOOD (  14.49  )
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

T24gMjAyMy8xMC8xOCAyMDoxOSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBZaSwKPiAKPiB5
aXlhbmcxM0BodWF3ZWkuY29tIHdyb3RlIG9uIFdlZCwgMTggT2N0IDIwMjMgMDk6MjA6NDcgKzAw
MDA6Cj4gCj4+IFRoZSBkZXZtX2thc3ByaW50ZigpIHJldHVybnMgYSBwb2ludGVyIHRvIGR5bmFt
aWNhbGx5IGFsbG9jYXRlZCBtZW1vcnkuCj4+IHRoYXQgd2lsbCByZXR1cm4gTlVMTCB3aGVuIGFs
bG9jYXRlIGZhaWxlZC4KPiAKPiBNYXkgSSBwcm9wb3NlIHJld29yZGluZyBvZiB0aGUgY29tbWl0
IGxvZz8KPiAiCj4gZGV2bV9rYXNwcmludGYoKSByZXR1cm5zIGEgcG9pbnRlciB0byBkeW5hbWlj
YWxseSBhbGxvY2F0ZWQgbWVtb3J5Cj4gd2hpY2ggY2FuIGJlIE5VTEwgdXBvbiBmYWlsdXJlLiBF
bnN1cmUgdGhlIGFsbG9jYXRpb24gd2FzIHN1Y2Nlc3NmdWwgYnkKPiBjaGVja2luZyB0aGUgcG9p
bnRlciB2YWxpZGl0eS4KPiAiCj4gClRoYW5rcyBmb3IgeW91ciBhZHZpY2UsIEknbGwgbWFrZSBj
aGFuZ2VzIGluIHYyIHBhdGNoLgoKPj4gRml4IGl0IGJ5IGNoZWNrIHJldHVybiB2YWx1ZSBvZiBk
ZXZtX2thc3ByaW50ZigpLgo+Pgo+PiBGaXhlczogMWU0ZDNiYTY2ODg4ICgibXRkOiByYXduYW5k
OiBtZXNvbjogZml4IHRoZSBjbG9jayIpCj4+IFNpZ25lZC1vZmYtYnk6IFlpIFlhbmcgPHlpeWFu
ZzEzQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25h
bmQuYyB8IDUgKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gaW5kZXggMzc4ZjI4Y2U2YTc0Li4yYzZhZTc4
MWJiMGMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gQEAgLTExMzQsNiAr
MTEzNCwxMSBAQCBzdGF0aWMgaW50IG1lc29uX25mY19jbGtfaW5pdChzdHJ1Y3QgbWVzb25fbmZj
ICpuZmMpCj4+ICAgCWluaXQubmFtZSA9IGRldm1fa2FzcHJpbnRmKG5mYy0+ZGV2LAo+PiAgIAkJ
CQkgICBHRlBfS0VSTkVMLCAiJXMjZGl2IiwKPj4gICAJCQkJICAgZGV2X25hbWUobmZjLT5kZXYp
KTsKPj4gKwlpZiAoaW5pdC5uYW1lKSB7Cj4+ICsJCWRldl9lcnIobmZjLT5kZXYsICJmYWlsZWQg
dG8gYWxsb2NhdGUgaW5pdC5uYW1lXG4iKTsKPiAKPiBObyBuZWVkIGZvciBlcnJvciBtZXNzYWdl
cyB1cG9uIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmVzLgo+IAo+PiArCQlyZXR1cm4gLUVOT01F
TTsKPj4gKwl9Cj4+ICsKPj4gICAJaW5pdC5vcHMgPSAmY2xrX2RpdmlkZXJfb3BzOwo+PiAgIAlu
ZmNfZGl2aWRlcl9wYXJlbnRfZGF0YVswXS5md19uYW1lID0gImRldmljZSI7Cj4+ICAgCWluaXQu
cGFyZW50X2RhdGEgPSBuZmNfZGl2aWRlcl9wYXJlbnRfZGF0YTsKPiAKPiBUaGVzZSBjb21tZW50
cyBhcmUgYWxzbyBhcHBsaWNhYmxlIHRvIHlvdXIgdHdvIG90aGVyIHBhdGNoZXMuCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKPiAuCj4gCgpUaGFua3MsCllpIHlhbmcKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
