Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C95C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 09:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxPaS8WI8SozdbH7TNDDe10KAGkfx0d1eso7t8jrOE8=; b=AV2cIPo5UTmRI0sxlqQgtA9L8d
	N16Vq/pW8inRJ4fvUuJKs+imL0gAtrsLTj2bWaCQCgXQo+QxfMNaRZfr9qwCMaPW9RfUzlmDOSwng
	SSmLU2XQwnEk7EpmaswOIDWKmRE4zPQxJxEFYIavwBT+PXYdiKM/57mSx8DTDCM6UtNpqiJs4EPYG
	LOVgfa+3ERiwEOqjGpD3rkmYE/HLAtrQ2kr1JsWmBiig7nakScjwg5//TJx6OZ6YjxjSZswywe9Po
	KPh40+XUy1NL6WdWzQGN+p1c/QC5J08Izw3bNx4P1/ffXxxKkKWWKTTPTPOfb0WSMEgl3BJ4MwLGV
	kX6VR+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ololW-006vNk-6X; Fri, 21 Oct 2022 09:56:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ololS-006vM7-8d
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 09:56:32 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mv09R6B5NzmVJg;
	Fri, 21 Oct 2022 17:51:39 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:56:21 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:56:20 +0800
Subject: Re: [PATCH 00/11] fix memory leak while kset_register() fails
To: Luben Tuikov <luben.tuikov@amd.com>, Greg KH <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
	<linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
	<ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
	<amd-gfx@lists.freedesktop.org>, <rafael@kernel.org>, <somlo@cmu.edu>,
	<mst@redhat.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
	<hsiangkao@linux.alibaba.com>, <huangjianan@oppo.com>, <mark@fasheh.com>,
	<jlbec@evilplan.org>, <joseph.qi@linux.alibaba.com>,
	<akpm@linux-foundation.org>, <alexander.deucher@amd.com>, <richard@nod.at>,
	<liushixin2@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
 <f1210e20-d167-26c4-7aba-490d8fb7241e@huawei.com>
 <78f84006-955f-6209-1cae-024e4f199b97@amd.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <9ee10048-f3fe-533b-5f00-8e5dd176808e@huawei.com>
Date: Fri, 21 Oct 2022 17:56:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <78f84006-955f-6209-1cae-024e4f199b97@amd.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_025630_672776_6C6A6103 
X-CRM114-Status: GOOD (  23.45  )
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

Ck9uIDIwMjIvMTAvMjEgMTc6MDgsIEx1YmVuIFR1aWtvdiB3cm90ZToKPiBPbiAyMDIyLTEwLTIx
IDA0OjU5LCBZYW5nIFlpbmdsaWFuZyB3cm90ZToKPj4gT24gMjAyMi8xMC8yMSAxNjozNiwgR3Jl
ZyBLSCB3cm90ZToKPj4+IE9uIEZyaSwgT2N0IDIxLCAyMDIyIGF0IDA0OjI0OjIzUE0gKzA4MDAs
IFlhbmcgWWluZ2xpYW5nIHdyb3RlOgo+Pj4+IE9uIDIwMjIvMTAvMjEgMTM6MzcsIEdyZWcgS0gg
d3JvdGU6Cj4+Pj4+IE9uIEZyaSwgT2N0IDIxLCAyMDIyIGF0IDAxOjI5OjMxQU0gLTA0MDAsIEx1
YmVuIFR1aWtvdiB3cm90ZToKPj4+Pj4+IE9uIDIwMjItMTAtMjAgMjI6MjAsIFlhbmcgWWluZ2xp
YW5nIHdyb3RlOgo+Pj4+Pj4+IFRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIGxpbms6Cj4+Pj4+Pj4g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGbGttbCUyRjBkYjQ4NmViLTY5MjctOTI3ZS0zNjI5
LTk1OGY4ZjIxMTE5NCU0MGh1YXdlaS5jb20lMkZUJTJGJmFtcDtkYXRhPTA1JTdDMDElN0NsdWJl
bi50dWlrb3YlNDBhbWQuY29tJTdDNzRhYTliNTcxOTJiNDA2ZWYyNzQwOGRhYjM0MjlkYjQlN0Mz
ZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM4MDE5Mzk1OTc5ODY4
MTAzJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lW
Mmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0MmYW1w
O3NkYXRhPVJjSzA1Y1htMUo1JTJCdFljTE8yU01HN2s2c2pleW1RemRCek1DREpTemZkRSUzRCZh
bXA7cmVzZXJ2ZWQ9MAo+Pj4+Pj4gVGhlIHZlcnkgZmlyc3QgZGlzY3Vzc2lvbiBvbiB0aGlzIHdh
cyBoZXJlOgo+Pj4+Pj4KPj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnd3dy5zcGluaWNzLm5ldCUyRmxpc3RzJTJG
ZHJpLWRldmVsJTJGbXNnMzY4MDc3Lmh0bWwmYW1wO2RhdGE9MDUlN0MwMSU3Q2x1YmVuLnR1aWtv
diU0MGFtZC5jb20lN0M3NGFhOWI1NzE5MmI0MDZlZjI3NDA4ZGFiMzQyOWRiNCU3QzNkZDg5NjFm
ZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzgwMTkzOTU5Nzk4NjgxMDMlN0NV
bmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklp
TENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9
c0haNmtmTEY4SHhyTlhWNiUyRlZqZ2RIJTJCbVFNNFQzWnYwVSUyRkF3ZGRUOTdjRSUzRCZhbXA7
cmVzZXJ2ZWQ9MAo+Pj4+Pj4KPj4+Pj4+IFBsZWFzZSB1c2UgdGhpcyBsaW5rLCBhbmQgbm90IHRo
ZSB0aGF0IG9uZSB1cCB0aGVyZSB5b3Ugd2hpY2ggcXVvdGVkIGFib3ZlLAo+Pj4+Pj4gYW5kIHdo
b3NlIGNvbW1pdCBkZXNjcmlwdGlvbiBpcyB0YWtlbiB2ZXJiYXRpbSBmcm9tIHRoZSB0aGlzIGxp
bmsuCj4+Pj4+Pgo+Pj4+Pj4+IGtzZXRfcmVnaXN0ZXIoKSBpcyBjdXJyZW50bHkgdXNlZCBpbiBz
b21lIHBsYWNlcyB3aXRob3V0IGNhbGxpbmcKPj4+Pj4+PiBrc2V0X3B1dCgpIGluIGVycm9yIHBh
dGgsIGJlY2F1c2UgdGhlIGNhbGxlcnMgdGhpbmsgaXQgc2hvdWxkIGJlCj4+Pj4+Pj4ga3NldCBp
bnRlcm5hbCB0aGluZyB0byBkbywgYnV0IHRoZSBkcml2ZXIgY29yZSBjYW4gbm90IGtub3cgd2hh
dAo+Pj4+Pj4+IGNhbGxlciBkb2luZyB3aXRoIHRoYXQgbWVtb3J5IGF0IHRpbWVzLiBUaGUgbWVt
b3J5IGNvdWxkIGJlIGZyZWVkCj4+Pj4+Pj4gYm90aCBpbiBrc2V0X3B1dCgpIGFuZCBlcnJvciBw
YXRoIG9mIGNhbGxlciwgaWYgaXQgaXMgY2FsbGVkIGluCj4+Pj4+Pj4ga3NldF9yZWdpc3Rlcigp
Lgo+Pj4+Pj4gQXMgSSBleHBsYWluZWQgaW4gdGhlIGxpbmsgYWJvdmUsIHRoZSByZWFzb24gdGhl
cmUncwo+Pj4+Pj4gYSBtZW1vcnkgbGVhayBpcyB0aGF0IG9uZSBjYW5ub3QgY2FsbCBrc2V0X3Jl
Z2lzdGVyKCkgd2l0aG91dAo+Pj4+Pj4gdGhlIGtzZXQtPmtvYmoubmFtZSBiZWluZyBzZXQtLWtv
YmpfYWRkX2ludGVybmFsKCkgcmV0dXJucyAtRUlOVkFMLAo+Pj4+Pj4gaW4gdGhpcyBjYXNlLCBp
LmUuIGtzZXRfcmVnaXN0ZXIoKSBmYWlscyB3aXRoIC1FSU5WQUwuCj4+Pj4+Pgo+Pj4+Pj4gVGh1
cywgdGhlIG1vc3QgY29tbW9uIHVzYWdlIGlzIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pj4+Pgo+
Pj4+Pj4gCWtvYmpfc2V0X25hbWUoJmtzZXQtPmtvYmosIGZvcm1hdCwgLi4uKTsKPj4+Pj4+IAlr
c2V0LT5rb2JqLmtzZXQgPSBwYXJlbnRfa3NldDsKPj4+Pj4+IAlrc2V0LT5rb2JqLmt0eXBlID0g
a3R5cGU7Cj4+Pj4+PiAJcmVzID0ga3NldF9yZWdpc3Rlcihrc2V0KTsKPj4+Pj4+Cj4+Pj4+PiBT
bywgd2hhdCBpcyBiZWluZyBsZWFrZWQsIGlzIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGluIGtvYmpf
c2V0X25hbWUoKSwKPj4+Pj4+IGJ5IHRoZSBjb21tb24gaWRpb20gc2hvd24gYWJvdmUuIFRoaXMg
bmVlZHMgdG8gYmUgbWVudGlvbmVkIGluCj4+Pj4+PiB0aGUgZG9jdW1lbnRhdGlvbiwgYXQgbGVh
c3QsIGluIGNhc2UsIGluIHRoZSBmdXR1cmUgdGhpcyBpcyBhYnNvbHZlZAo+Pj4+Pj4gaW4ga3Nl
dF9yZWdpc3RlcigpIHJlZGVzaWduLCBldGMuCj4+Pj4+IEJhc2VkIG9uIHRoaXMsIGNhbiBrc2V0
X3JlZ2lzdGVyKCkganVzdCBjbGVhbiB1cCBmcm9tIGl0c2VsZiB3aGVuIGFuCj4+Pj4+IGVycm9y
IGhhcHBlbnM/ICBJZGVhbGx5IHRoYXQgd291bGQgYmUgdGhlIGNhc2UsIGFzIHRoZSBvZGRzIG9m
IGEga3NldAo+Pj4+PiBiZWluZyBlbWJlZGRlZCBpbiBhIGxhcmdlciBzdHJ1Y3R1cmUgaXMgcHJv
YmFibHkgc2xpbSwgYnV0IHdlIHdvdWxkIGhhdmUKPj4+Pj4gdG8gc2VhcmNoIHRoZSB0cmVlIHRv
IG1ha2Ugc3VyZS4KPj4+PiBJIGhhdmUgc2VhcmNoIHRoZSB3aG9sZSB0cmVlLCB0aGUga3NldCB1
c2VkIGluIGJ1c19yZWdpc3RlcigpIC0gcGF0Y2ggIzMsCj4+Pj4ga3NldF9jcmVhdGVfYW5kX2Fk
ZCgpIC0gcGF0Y2ggIzQKPj4+PiBfX2NsYXNzX3JlZ2lzdGVyKCkgLSBwYXRjaCAjNSzCoCBmd19j
ZmdfYnVpbGRfc3ltbGluaygpIC0gcGF0Y2ggIzYgYW5kCj4+Pj4gYW1kZ3B1X2Rpc2NvdmVyeS5j
IC0gcGF0Y2ggIzEwCj4+Pj4gaXMgZW1iZWRkZWQgaW4gYSBsYXJnZXIgc3RydWN0dXJlLiBJbiB0
aGVzZSBjYXNlcywgd2UgY2FuIG5vdCBjYWxsCj4+Pj4ga3NldF9wdXQoKSBpbiBlcnJvciBwYXRo
IGluIGtzZXRfcmVnaXN0ZXIoKQo+Pj4gWWVzIHlvdSBjYW4gYXMgdGhlIGtvYmplY3QgaW4gdGhl
IGtzZXQgc2hvdWxkIE5PVCBiZSBjb250cm9saW5nIHRoZQo+Pj4gbGlmZXNwYW4gb2YgdGhvc2Ug
bGFyZ2VyIG9iamVjdHMuCj4+Pgo+Pj4gSWYgaXQgaXMsIHBsZWFzZSBwb2ludCBvdXQgdGhlIGNh
bGwgY2hhaW4gaGVyZSBhcyBJIGRvbid0IHRoaW5rIHRoYXQKPj4+IHNob3VsZCBiZSBwb3NzaWJs
ZS4KPj4+Cj4+PiBOb3RlIGFsbCBvZiB0aGlzIGlzIGEgbWVzcyBiZWNhdXNlIHRoZSBrb2JqZWN0
IG5hbWUgc3R1ZmYgd2FzIGFkZGVkIG11Y2gKPj4+IGxhdGVyLCBhZnRlciB0aGUgZHJpdmVyIG1v
ZGVsIGhhZCBiZWVuIGNyZWF0ZWQgYW5kIHJ1bm5pbmcgZm9yIGEgd2hpbGUuCj4+PiBXZSBtaXNz
ZWQgdGhpcyBlcnJvciBwYXRoIHdoZW4gYWRkaW5nIHRoZSBkeW5hbWljIGtvYmplY3QgbmFtZSBs
b2dpYywKPj4+IHRoYW5rIGZvciBsb29raW5nIGludG8gdGhpcy4KPj4+Cj4+PiBJZiB5b3UgY291
bGQgdGVzdCB0aGUgcGF0Y2ggcG9zdGVkIHdpdGggeW91ciBlcnJvciBpbmplY3Rpb24gc3lzdGVt
cywKPj4+IHRoYXQgY291bGQgbWFrZSB0aGlzIGFsbCBtdWNoIHNpbXBsZXIgdG8gc29sdmUuCj4+
IFRoZSBwYXRjaCBwb3N0ZWQgYnkgTHViZW4gd2lsbCBjYXVzZSBkb3VibGUgZnJlZSBpbiBzb21l
IGNhc2VzLgo+IFllcywgSSBmaWd1cmVkIHRoaXMgb3V0IGluIHRoZSBvdGhlciBlbWFpbCBhbmQg
cG9zdGVkIHRoZSBzY2VuYXJpbyBHcmVnCj4gd2FzIGFza2luZyBhYm91dC4KPgo+IEJ1dCBJIGJl
bGlldmUgdGhlIHF1ZXN0aW9uIHN0aWxsIHN0YW5kcyBpZiB3ZSBjYW4gZG8ga3NldF9wdXQoKQo+
IGFmdGVyIGEgKmZhaWxlZCoga3NldF9yZWdpc3RlcigpLCBuYW1lbHkgaWYgbW9yZSBpcyBiZWlu
ZyBkb25lIHRoYW4KPiBuZWNlc3NhcnksIHdoaWNoIGlzIGp1c3QgdG8gZnJlZSB0aGUgbWVtb3J5
IGFsbG9jYXRlZCBieQo+IGtvYmplY3Rfc2V0X25hbWUoKS4KVGhlIG5hbWUgbWVtb3J5IGlzIGFs
bG9jYXRlZCBpbiBrb2JqZWN0X3NldF9uYW1lKCkgaW4gY2FsbGVyLMKgIGFuZCBJIAp0aGluayBj
YWxsZXIKZnJlZSB0aGUgbWVtb3J5IHRoYXQgaXQgYWxsb2NhdGVkIGlzIHJlYXNvbmFibGUsIGl0
J3Mgd2VpcmQgdGhhdCBzb21lIApjYWxsZXJzIGFsbG9jYXRlCnNvbWUgbWVtb3J5IGFuZCB1c2Ug
ZnVuY3Rpb24gKGtzZXRfcmVnaXN0ZXIpIGZhaWxlZCwgdGhlbiBpdCBmcmVlIHRoZSAKbWVtb3J5
IGFsbG9jYXRlZAppbiBjYWxsZXJzLMKgIEkgdGhpbmsgdXNlIGtzZXRfcHV0KCkva2ZyZWVfY29u
c3QobmFtZSkgaW4gY2FsbGVyIHNlZW1zIAptb3JlIHJlYXNvbmFibGUuCgpUaGFua3MsCllhbmcK
Pgo+IFJlZ2FyZHMsCj4gTHViZW4KPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
