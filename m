Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1EFC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 08:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71C7611AF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 08:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C71C7611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLUWWbrIz5wTTtt8JxZ4425nuRmiaJm5If0MX5Iigio=; b=kKWUryG/2ZuTTq3tiICLiHs17B
	/DtZcFj6hE9lX5Sq8zPZwTyd8dw7EmdBAByyZHHqFT5TWNquY0qR31pYGx1nvW2fYn5liF+cqB5S/
	iUbgm60uszPOJ5MQVQPHjHyCJjrSCXcqOZd17GLWXW4NmB+D+mAFPWvgiSx9uEWfpcp4oclJOJvRm
	fptWGumFY/WoVeb5XO9PUhhe1bETWqtrgpkVrdf1L/El3qbLSZDgxYzyd3r3+CJhTsRRoHjIAg3gp
	unPIgP/83iMVJZBmnVqUGr+ctcPe62Pm/O/d/gKwJFfO9ZWvqPq2IJegzp957xo5jmoRDtudIm0hm
	fKEmt5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGSD-003yar-Pu; Wed, 17 Nov 2021 08:38:05 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGS9-003yYJ-JQ
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 08:38:03 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HvGTh1M9WzZcwp;
 Wed, 17 Nov 2021 16:35:36 +0800 (CST)
Received: from kwepemm600019.china.huawei.com (7.193.23.64) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 16:37:59 +0800
Received: from [10.174.177.210] (10.174.177.210) by
 kwepemm600019.china.huawei.com (7.193.23.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 17 Nov 2021 16:37:58 +0800
Subject: Re: [QUESTION] blk_mq_freeze_queue in elevator_init_mq
To: Ming Lei <ming.lei@redhat.com>
CC: <damien.lemoal@wdc.com>, <axboe@kernel.dk>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-block@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <yi.zhang@huawei.com>, <yebin10@huawei.com>, 
 <houtao1@huawei.com>
References: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
 <YZS4FYxtxYAXjtFJ@T590>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <774e0e26-9d2b-660f-196a-ea6651e2d845@huawei.com>
Date: Wed, 17 Nov 2021 16:37:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YZS4FYxtxYAXjtFJ@T590>
Content-Language: en-US
X-Originating-IP: [10.174.177.210]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600019.china.huawei.com (7.193.23.64)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_003801_840232_12746EC7 
X-CRM114-Status: GOOD (  19.87  )
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

CgpPbiAyMDIxLzExLzE3IDE2OjA2LCBNaW5nIExlaSB3cm90ZToKPiBPbiBXZWQsIE5vdiAxNywg
MjAyMSBhdCAxMTozNzoxM0FNICswODAwLCB5YW5nZXJrdW4gd3JvdGU6Cj4+IE5vd2RheXMgd2Ug
bWVldCB0aGUgYm9vdCByZWdyZXNzaW9uIHdoaWxlIGVuYWJsZSBsb3RzIG9mIG10ZGJsb2NrCj4g
Cj4gV2hhdCBpcyB5b3VyIGJvb3QgcmVncmVzc2lvbj8gQW55IGRtZXNnIGxvZz8KPiAKPj4gY29t
cGFyZSB3aXRoIDQuNC4gVGhlIG1haW4gcmVhc29uIHdhcyB0aGF0IHRoZSBibGtfbXFfZnJlZXpl
X3F1ZXVlIGluCj4+IGVsZXZhdG9yX2luaXRfbXEgd2lsbCB3YWl0IGEgUkNVIGdhcCB3aGljaCB3
YW50IHRvIG1ha2Ugc3VyZSBubyBJTyB3aWxsCj4+IGhhcHBlbiB3aGlsZSBibGtfbXFfaW5pdF9z
Y2hlZC4KPiAKPiBUaGVyZSBpc24ndCBSQ1UgZ3JhY2UgcGVyaW9kIGltcGxpZWQgaW4gdGhlIGJs
a19tcV9mcmVlemVfcXVldWUoKSBjYWxsZWQKPiBmcm9tIGVsZXZhdG9yX2luaXRfbXEoKSwgYmVj
YXVzZSB0aGUgLnFfdXNhZ2VfY291bnRlciB3b3JrcyBhdCBhdG9taWMgbW9kZQo+IGF0IHRoYXQg
dGltZS4KCkVtbS4uLiBJdCdzIG15IGZhdWx0LiBXaGljaCBhZGQgdGhlIFJDVSBpcyBibGtfbXFf
cXVpZXNjZV9xdWV1ZS4uLgoKPiAKPj4KPj4gT3RoZXIgbW9kdWxlIGxpa2UgbG9vcCBtZWV0cyB0
aGlzIHByb2JsZW0gdG9vIGFuZCBoYXMgYmVlbiBmaXggd2l0aAo+IAo+IEFnYWluLCB3aGF0IGlz
IHRoZSBwcm9ibGVtPwo+IAo+PiBmb2xsb3cgcGF0Y2hlczoKPj4KPj4gICAyMTEyZjVjMTMzMGEg
bG9vcDogU2VsZWN0IEkvTyBzY2hlZHVsZXIgJ25vbmUnIGZyb20gaW5zaWRlIGFkZF9kaXNrKCkK
Pj4gICA5MGI3MTk4MDAxZjIgYmxrLW1xOiBJbnRyb2R1Y2UgdGhlIEJMS19NUV9GX05PX1NDSEVE
X0JZX0RFRkFVTFQgZmxhZwo+Pgo+PiBUaGV5IGNoYW5nZSB0aGUgZGVmYXVsdCBJTyBzY2hlZHVs
ZXIgZm9yIGxvb3AgdG8gJ25vbmUnLiBTbyBubyBuZWVkIHRvCj4+IGNhbGwgYmxrX21xX2ZyZWV6
ZV9xdWV1ZSBhbmQgYmxrX21xX2luaXRfc2NoZWQuIEJ1dCBpdCBzZWVtcyBub3QKPj4gYXBwcm9w
cmlhdGUgZm9yIG10ZGJsb2Nrcy4gTXRkYmxvY2tzIGNhbiB1c2UgJ21xLWRlYWRsaW5lJyB0byBo
ZWxwCj4+IG9wdGltaXplIHRoZSByYW5kb20gd3JpdGUgd2l0aCB0aGUgaGVscCBvZiBtdGRibG9j
aydzIGNhY2hlLiBPbmNlIGNoYW5nZQo+PiB0byAnbm9uZScsIHdlIG1heSBtZWV0IHRoZSByZWdy
ZXNzaW9uIGZvciByYW5kb20gd3JpdGUuCj4+Cj4+IGNvbW1pdCA3MzdlYjc4ZTgyZDUyZDM1ZGYx
NjZkMjlhZjMyYmY2MTk5MmRlNzFkCj4+IEF1dGhvcjogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5s
ZW1vYWxAd2RjLmNvbT4KPj4gRGF0ZTogICBUaHUgU2VwIDUgMTg6NTE6MzMgMjAxOSArMDkwMAo+
Pgo+PiAgICAgIGJsb2NrOiBEZWxheSBkZWZhdWx0IGVsZXZhdG9yIGluaXRpYWxpemF0aW9uCj4+
Cj4+ICAgICAgLi4uCj4+Cj4+ICAgICAgQWRkaXRpb25hbGx5LCB0byBtYWtlIHN1cmUgdGhhdCB0
aGUgZWxldmF0b3IgaW5pdGlhbGl6YXRpb24gaXMgbmV2ZXIKPj4gICAgICBkb25lIHdoaWxlIHJl
cXVlc3RzIGFyZSBpbi1mbGlnaHQgKHRoZXJlIHNob3VsZCBiZSBub25lIHdoZW4gdGhlIGRldmlj
ZQo+PiAgICAgIGRyaXZlciBjYWxscyBkZXZpY2VfYWRkX2Rpc2soKSksIGZyZWV6ZSBhbmQgcXVp
ZXNjZSB0aGUgZGV2aWNlIHJlcXVlc3QKPj4gICAgICBxdWV1ZSBiZWZvcmUgY2FsbGluZyBibGtf
bXFfaW5pdF9zY2hlZCgpIGluIGVsZXZhdG9yX2luaXRfbXEoKS4KPj4gICAgICAuLi4KPj4KPj4g
VGhpcyBjb21taXQgYWRkIGJsa19tcV9mcmVlemVfcXVldWUgaW4gZWxldmF0b3JfaW5pdF9tcSB3
aGljaCB0cnkgdG8KPj4gbWFrZSBzdXJlIG5vIGluLWZsaWdodCByZXF1ZXN0IHdoaWxlIHdlIGdv
IHRocm91Z2ggYmxrX21xX2luaXRfc2NoZWQuCj4+IEJ1dCBkb2VzIHRoZXJlIGFueSBkcml2ZXJz
IGNhbiBsZWF2ZSBJTyBhbGl2ZSB3aGlsZSB3ZSBnbyB0aHJvdWdoCj4+IGVsZXZhdG9yX2luaXRf
bXHvvJ8gQW5kIGlmIG5vLCBtYXliZSB3ZSBjYW4ganVzdCByZW1vdmUgdGhpcyBsb2dpY2FsIHRv
Cj4+IGZpeCB0aGUgcmVncmVzc2lvbi4uLgo+IAo+IFNDU0kgc2hvdWxkIGhhdmUgcGFzc3Rocm91
Z2ggcmVxdWVzdHMgYXQgdGhhdCBtb21lbnQuCj4gCj4gCj4gCj4gVGhhbmtzLAo+IE1pbmcKPiAK
PiAuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
