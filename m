Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB02C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 12:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4ygy2X6c7OF7NF2INPqlgUKiL+DBPl+Lg6Swb/fRtE=; b=qTkW7Lvx2k8JXYPoWglNfhnbff
	bPfL1Bhvzyy5sQLmYL+hX87m5PiHshkN0MDQir3cyoRiGl44TqwpBRW6HMcRfLXYO6PStzOydLVtt
	8/Jrobnqeq6iIeHVN3Tb/cDEspGvtJauLoca++PurSybSJSxCiWfJPCVyxCckYX92dbI9gtQN4xhU
	N+qN5QsTU3PufdhSigtNjgMZR6jNmV8RuSmVExIoCd1rd67DyRUJgFEOZy1jbyyT+voqsA0STLonK
	Ik6GCFXvmyjJxjr3ekqzbwmdr1hD2gxzBP71U5j1VhTci1UlTPiQIn0warsdp1oEm9UDWNY6xeLqM
	Dl/2YHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYRC-000lfa-Eh; Mon, 14 Nov 2022 12:19:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYR9-000lbU-3b
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 12:19:41 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N9pJP0kw5zHw0j;
	Mon, 14 Nov 2022 20:19:01 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 20:19:30 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 20:19:29 +0800
Subject: Re: [PATCH v3] mtd: ubi: fix possible null-ptr-deref in
 ubi_free_volume()
To: Yang Yingliang <yangyingliang@huawei.com>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
References: <20221114102624.2131033-1-yangyingliang@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c7a8ee29-ae27-7426-1084-5adc38aa005d@huawei.com>
Date: Mon, 14 Nov 2022 20:19:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221114102624.2131033-1-yangyingliang@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_041939_513892_7B304E45 
X-CRM114-Status: GOOD (  19.80  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMi8xMS8xNCAxODoyNiwgWWFuZyBZaW5nbGlhbmcg0LS1wDoKClJldmlld2VkLWJ5OiBa
aGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBJdCB3aWxsbCBjYXVzZSBu
dWxsLXB0ci1kZXJlZiBpbiB0aGUgZm9sbG93aW5nIGNhc2U6Cj4gCj4gdWlmX2luaXQoKQo+ICAg
IHViaV9hZGRfdm9sdW1lKCkKPiAgICAgIGNkZXZfYWRkKCkgLT4gaWYgaXQgZmFpbHMsIGNhbGwg
a2lsbF92b2x1bWVzKCkKPiAgICAgIGRldmljZV9yZWdpc3RlcigpCj4gCj4ga2lsbF92b2x1bWVz
KCkgLT4gaWYgdWJpX2FkZF92b2x1bWUoKSBmYWlscyBjYWxsIHRoaXMgZnVuY3Rpb24KPiAgICB1
YmlfZnJlZV92b2x1bWUoKQo+ICAgICAgY2Rldl9kZWwoKQo+ICAgICAgZGV2aWNlX3VucmVnaXN0
ZXIoKSAtPiB0cnlpbmcgdG8gZGVsZXRlIGEgbm90IGFkZGVkIGRldmljZSwKPiAJCQkgICBpdCBj
YXVzZXMgbnVsbC1wdHItZGVyZWYKPiAKPiBTbyBpbiB1YmlfZnJlZV92b2x1bWUoKSwgaXQgZGVs
ZXRlIGRldmljZXMgd2hldGhlciB0aGV5IGFyZSBhZGRlZAo+IG9yIG5vdCwgaXQgd2lsbCBjYXVz
ZXMgbnVsbC1wdHItZGVyZWYuCj4gCj4gSGFuZGxlIHRoZSBlcnJvciBjYXNlIHdobGllIGNhbGxp
bmcgdWJpX2FkZF92b2x1bWUoKSB0byBmaXggdGhpcwo+IHByb2JsZW0uIElmIGFkZCB2b2x1bWUg
ZmFpbHMsIHNldCB0aGUgY29ycmVzcG9uZGluZyB2b2wgdG8gbnVsbCwKPiBzbyBpdCBjYW4gbm90
IGJlIGFjY2Vzc2VkIGluIGtpbGxfdm9sdW1lcygpIGFuZCByZWxlYXNlIHRoZQo+IHJlc291cmNl
IGluIHViaV9hZGRfdm9sdW1lKCkgZXJyb3IgcGF0aC4KPiAKPiBGaXhlczogODAxYzEzNWNlNzNk
ICgiVUJJOiBVbnNvcnRlZCBCbG9jayBJbWFnZXMiKQo+IFN1Z2dlc3RlZC1ieTogWmhpaGFvIENo
ZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFlpbmds
aWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tPgo+IC0tLQo+IHYyIC0+IHYzOgo+ICAgIEhh
bmRsZSB0aGUgZXJyb3IgY2FzZSB3aGxpZSBjYWxsaW5nIHViaV9hZGRfdm9sdW1lKCkuCj4gCj4g
djEgLT4gdjI6Cj4gICAgUmVwbGFjZSBrZnJlZSgpIHdpdGggdm9sX3JlbGVhc2UoKSB0byBhdm9p
ZCBtZW1vcnkgbGVhaywgaWYgZGV2aWNlIGlzIG5vdCBpbml0YWxpemVkLgo+IC0tLQo+ICAgZHJp
dmVycy9tdGQvdWJpL2J1aWxkLmMgfCAgMSArCj4gICBkcml2ZXJzL210ZC91Ymkvdm10LmMgICB8
IDEyICsrKysrKy0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIv
ZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBpbmRleCBhOTAxZjhlZGZhNDEuLjQ5OTBjOTllZWI1
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL3ViaS9idWlsZC5jCj4gQEAgLTQ2OCw2ICs0NjgsNyBAQCBzdGF0aWMgaW50IHVpZl9pbml0
KHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCj4gICAJCQllcnIgPSB1YmlfYWRkX3ZvbHVtZSh1Ymks
IHViaS0+dm9sdW1lc1tpXSk7Cj4gICAJCQlpZiAoZXJyKSB7Cj4gICAJCQkJdWJpX2Vycih1Ymks
ICJjYW5ub3QgYWRkIHZvbHVtZSAlZCIsIGkpOwo+ICsJCQkJdWJpLT52b2x1bWVzW2ldID0gTlVM
TDsKPiAgIAkJCQlnb3RvIG91dF92b2x1bWVzOwo+ICAgCQkJfQo+ICAgCQl9Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3ViaS92bXQuYyBiL2RyaXZlcnMvbXRkL3ViaS92bXQuYwo+IGluZGV4
IDhmY2MwYmRmMDYzNS4uYzY2M2FkMTRjNTAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3Vi
aS92bXQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS92bXQuYwo+IEBAIC01ODAsNiArNTgwLDcg
QEAgaW50IHViaV9hZGRfdm9sdW1lKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1Ymlf
dm9sdW1lICp2b2wpCj4gICAJaWYgKGVycikgewo+ICAgCQl1YmlfZXJyKHViaSwgImNhbm5vdCBh
ZGQgY2hhcmFjdGVyIGRldmljZSBmb3Igdm9sdW1lICVkLCBlcnJvciAlZCIsCj4gICAJCQl2b2xf
aWQsIGVycik7Cj4gKwkJdm9sX3JlbGVhc2UoJnZvbC0+ZGV2KTsKPiAgIAkJcmV0dXJuIGVycjsK
PiAgIAl9Cj4gICAKPiBAQCAtNTkwLDE1ICs1OTEsMTQgQEAgaW50IHViaV9hZGRfdm9sdW1lKHN0
cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1Ymlfdm9sdW1lICp2b2wpCj4gICAJdm9sLT5k
ZXYuZ3JvdXBzID0gdm9sdW1lX2Rldl9ncm91cHM7Cj4gICAJZGV2X3NldF9uYW1lKCZ2b2wtPmRl
diwgIiVzXyVkIiwgdWJpLT51YmlfbmFtZSwgdm9sLT52b2xfaWQpOwo+ICAgCWVyciA9IGRldmlj
ZV9yZWdpc3Rlcigmdm9sLT5kZXYpOwo+IC0JaWYgKGVycikKPiAtCQlnb3RvIG91dF9jZGV2Owo+
ICsJaWYgKGVycikgewo+ICsJCWNkZXZfZGVsKCZ2b2wtPmNkZXYpOwo+ICsJCXB1dF9kZXZpY2Uo
JnZvbC0+ZGV2KTsKPiArCQlyZXR1cm4gZXJyOwo+ICsJfQo+ICAgCj4gICAJc2VsZl9jaGVja192
b2x1bWVzKHViaSk7Cj4gICAJcmV0dXJuIGVycjsKPiAtCj4gLW91dF9jZGV2Ogo+IC0JY2Rldl9k
ZWwoJnZvbC0+Y2Rldik7Cj4gLQlyZXR1cm4gZXJyOwo+ICAgfQo+ICAgCj4gICAvKioKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
