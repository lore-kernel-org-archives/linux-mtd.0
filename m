Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EDBC6FD1D
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Mar 2023 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6tqTbKE9F8weBC314IpA3aVPppNmtkpfDT2a9kWJt8=; b=e7imfpI/uENAqulvQEgzAPYHhb
	z6j/zX+HS3D+gVukRKHz/YYqv0pVx8laysQ2TzH45IRPUrwhMGt02nnYZubbGpqQIG8WRFItYjUKo
	RiSrXTkECdBK9J2f0TDyAtitbU6mpYKLF+dRjRHf29RwySNR+oRNZIm44zXkZxZjdKIm2q/82xfMH
	J1KuJrTgUPKE0gNZs+cu8WIP0zjegAd+UVUXTS8bEc44C9dVFGrgimS/GiXziwLPf0D8WkYYlRDDy
	6GIctDhzpPbbBa52Vtqw3bfnbfm3LxWg16/FJG8mlXjDNNidBbUtPLs/YiPGIpHcjldue0wCHKPMQ
	jMbb7oMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phnXN-00346A-0X;
	Thu, 30 Mar 2023 08:21:37 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phnXJ-00344n-1J
	for linux-mtd@lists.infradead.org;
	Thu, 30 Mar 2023 08:21:35 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PnGXh0Kf7zKx6m;
	Thu, 30 Mar 2023 16:19:00 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 16:21:23 +0800
Subject: Re: [PATCH] ubifs: Free memory for tmpfile name
To: =?UTF-8?Q?M=c3=a5rten_Lindahl?= <martenli@axis.com>,
	=?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>
References: <20230329-memleak-fix-v1-1-7133da56ea8f@axis.com>
 <cec30bcb-85d2-5de0-186b-6838ce94e3f7@huawei.com>
 <61344864-cfc1-0c57-bf3b-38e5a125d281@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6f00b571-bb94-e50b-9b9c-e08c7dcc0d50@huawei.com>
Date: Thu, 30 Mar 2023 16:21:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <61344864-cfc1-0c57-bf3b-38e5a125d281@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_012133_606781_1BADE35A 
X-CRM114-Status: GOOD (  17.29  )
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

SGkgTcOlcnRlbiwKPiBIaSBaaGloYW8hCj4gCj4gT24gMy8zMC8yMyAwNDoyNSwgWmhpaGFvIENo
ZW5nIHdyb3RlOgo+PiBIaSBNw6VydGVuLAo+Pj4gV2hlbiBvcGVuaW5nIGEgdWJpZnMgdG1wZmls
ZSBvbiBhbiBlbmNyeXB0ZWQgZGlyZWN0b3J5LCBmdW5jdGlvbgo+Pj4gZnNjcnlwdF9zZXR1cF9m
aWxlbmFtZSBhbGxvY2F0ZXMgbWVtb3J5IGZvciB0aGUgbmFtZSB0aGF0IGlzIHRvIGJlCj4+PiBz
dG9yZWQgaW4gdGhlIGRpcmVjdG9yeSBlbnRyeSwgYnV0IGFmdGVyIHRoZSBuYW1lIGhhcyBiZWVu
IGNvcGllZCB0byB0aGUKPj4+IGRpcmVjdG9yeSBlbnRyeSBpbm9kZSwgdGhlIG1lbW9yeSBpcyBu
b3QgZnJlZWQuCj4+Pgo+Pj4gV2hlbiBydW5uaW5nIGttZW1sZWFrIG9uIGl0IHdlIHNlZSB0aGF0
IGl0IGlzIHJlZ2lzdGVyZWQgYXMgYSBsZWFrLiBUaGUKPj4+IHJlcG9ydCBiZWxvdyBpcyB0cmln
Z2VyZWQgYnkgYSBzaW1wbGUgcHJvZ3JhbSAndG1wZmlsZScganVzdCBvcGVuaW5nIGEKPj4+IHRt
cGZpbGU6Cj4+Pgo+Pj4gwqDCoCB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjg4ODEwMTc4ZjM4
MCAoc2l6ZSAzMik6Cj4+PiDCoMKgwqDCoCBjb21tICJ0bXBmaWxlIiwgcGlkIDUwOSwgamlmZmll
cyA0Mjk0OTM0NzQ0IChhZ2UgMTUyNC43NDJzKQo+Pj4gwqDCoMKgwqAgYmFja3RyYWNlOgo+Pj4g
wqDCoMKgwqDCoMKgIF9fa21lbV9jYWNoZV9hbGxvY19ub2RlCj4+PiDCoMKgwqDCoMKgwqAgX19r
bWFsbG9jCj4+PiDCoMKgwqDCoMKgwqAgZnNjcnlwdF9zZXR1cF9maWxlbmFtZQo+Pj4gwqDCoMKg
wqDCoMKgIHViaWZzX3RtcGZpbGUKPj4+IMKgwqDCoMKgwqDCoCB2ZnNfdG1wZmlsZQo+Pj4gwqDC
oMKgwqDCoMKgIHBhdGhfb3BlbmF0Cj4+Pgo+Pj4gRnJlZSB0aGlzIG1lbW9yeSBhZnRlciBpdCBo
YXMgYmVlbiBjb3BpZWQgdG8gdGhlIGlub2RlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE3DpXJ0
ZW4gTGluZGFobCA8bWFydGVuLmxpbmRhaGxAYXhpcy5jb20+Cj4+PiAtLS0KPj4+IMKgIGZzL3Vi
aWZzL2Rpci5jIHwgMSArCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwo+Pj4gaW5k
ZXggMGYyOWNmMjAxMTM2Li4wODljYTY5MTAxMjQgMTAwNjQ0Cj4+PiAtLS0gYS9mcy91Ymlmcy9k
aXIuYwo+Pj4gKysrIGIvZnMvdWJpZnMvZGlyLmMKPj4+IEBAIC00OTEsNiArNDkxLDcgQEAgc3Rh
dGljIGludCB1Ymlmc190bXBmaWxlKHN0cnVjdCB1c2VyX25hbWVzcGFjZSAKPj4+ICptbnRfdXNl
cm5zLCBzdHJ1Y3QgaW5vZGUgKmRpciwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9j
YW5jZWw7Cj4+PiDCoMKgwqDCoMKgIHVubG9ja18yX2lub2RlcyhkaXIsIGlub2RlKTsKPj4+IMKg
ICvCoMKgwqAgZnNjcnlwdF9mcmVlX2ZpbGVuYW1lKCZubSk7Cj4+PiDCoMKgwqDCoMKgIHViaWZz
X3JlbGVhc2VfYnVkZ2V0KGMsICZyZXEpOwo+Pj4gwqAgwqDCoMKgwqDCoCByZXR1cm4gZmluaXNo
X29wZW5fc2ltcGxlKGZpbGUsIDApOwo+Pgo+PiBMb29rcyBnb29kLCBqdXN0IG9uZSBzbWFsbCBu
aXQuIEknZCBwcmVmZXIgdG8gYWRkIAo+PiBmc2NyeXB0X2ZyZWVfZmlsZW5hbWUoKSBhZnRlciB1
Ymlmc19yZWxlYXNlX2J1ZGdldCgpIGp1c3QgbGlrZSAKPj4gdWJpZnNfY3JlYXRlL2xpbmsgZG9l
cywgc28gdGhhdCB1YmlmcyBjYW4gZ2V0IHVudXNlZCBidWRnZXQgZWFybGllci4KPiBPSywgSSB3
aWxsIG1vdmUgaXQgYWZ0ZXIgdWJpZnNfcmVsZWFzZV9idWRnZXQuCj4+Cj4+IEFmdGVyIGxvb2tp
bmcgdGhyb3VnaCB0aGUgY29kZSwgSSBmb3VuZCBhbm90aGVyIHBsYWNlIGNyZWF0ZV93aGl0ZW91
dCAKPj4gaGFzIHRoZSBzYW1lIHByb2JsZW0oSW1wb3J0ZWQgaW4gMjc4ZDlhMjQzNjM1ZjI2YzA1
KCJ1YmlmczogUmVuYW1lIAo+PiB3aGl0ZW91dCBhdG9taWNhbGx5IikgYnkgbWUpLiBXb3VsZCB5
b3UgbWluZCBmaXhpbmcgdGhpcyBwb2ludCBqdXN0IGJ5IAo+PiByZW1vdmluZyB1bnVzZWQgJ25t
JyBpbiBjcmVhdGVfd2hpdGVvdXQoKT8KPiAKPiBJIHNlZSB3aGF0IHlvdSBtZWFuLiBBcyBJIHVu
ZGVyc3RhbmQgaXQgY2FsbGluZyBmc2NyeXB0X3NldHVwX2ZpbGVuYW1lIAo+IGlzIG5vdCBuZWVk
ZWQgaW4gY3JlYXRlX3doaXRlb3V0LiBJIHdvdWxkIHByZWZlciByZW1vdmluZyB0aG9zZSBsaW5l
cyBpbiAKPiBhIHNlcGFyYXRlIHBhdGNoIHNpbmNlIHRoYXQgbGVhayBpcyByZWxhdGVkIHRvIGRv
X3JlbmFtZSgpLiBJZiBpdCdzIE9LIAo+IHdpdGggeW91IEkgY2FuIG1ha2UgYSBwYXRjaCBmb3Ig
dGhhdC4gV291bGQgdGhhdCBiZSBPSz8KPiAKClllcy4gWW91IG1heSBzZW5kIGFub3RoZXIgcGF0
Y2ggdG8gZml4IGl0LiBUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
