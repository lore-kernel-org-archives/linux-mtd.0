Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162C5C28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 03:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3wqurN4c614SCzyx11+rlC3Q1iD49A6WFDduUHyOg0=; b=f6fLGaSJG+IZh4doasLlvaviXO
	siQMKiF188tBCX7e1JltJ36z9bawmsylZzdb0979a027Vm9ARUQPTG2wUznQBB7ybORF8aTt+Wvdl
	5yTmG4S8O2nNRZkGwoU36v4vIYTmuQajSlC/2qcMOs7eA6vyITOFXF+sRxQ0y5OSTy6BoNWChXmkB
	/Qb9OQkU1MzvrOVL3/RYeKwtktpTq7qO3GdV8dBUwcK5Tbcd3jU/CkCm668x0+AnejZ/6wx2QXoXM
	xsp2F0alybb15XqhzVSBdmwy2qaV4CcoLtuLZYD8hBm0mxXASz1+eCbi0FFm3A4mB50BhGCo6+YV5
	TT06JP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttIc0-0000000FmTU-2lLL;
	Sat, 15 Mar 2025 03:55:00 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttIbx-0000000FmSl-1QDb
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 03:54:59 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZF6hD1qVlz2RTJX;
	Sat, 15 Mar 2025 11:50:20 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 499811402E1;
	Sat, 15 Mar 2025 11:54:45 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 15 Mar 2025 11:54:44 +0800
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto Mailing List
	<linux-crypto@vger.kernel.org>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	<linux-pm@vger.kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
	<netdev@vger.kernel.org>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <023a23b0-d9fd-6d4d-d5a2-207e47419645@huawei.com>
Date: Sat, 15 Mar 2025 11:54:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_205457_678151_14FB2002 
X-CRM114-Status: GOOD (  17.76  )
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

1NogMjAyNS8zLzE0IDIwOjIyLCBIZXJiZXJ0IFh1INC0tcA6Cj4gUmVwbGFjZSB0aGUgbGVnYWN5
IGNyeXB0byBjb21wcmVzc2lvbiBpbnRlcmZhY2Ugd2l0aCB0aGUgbmV3IGFjb21wCj4gaW50ZXJm
YWNlLgo+IAo+IFJlbW92ZSB0aGUgY29tcHJlc3Npb24gbXV0ZXhlcyBhbmQgdGhlIG92ZXJhbGxv
Y2F0aW9uIGZvciBtZW1vcnkKPiAodGhlIG9mZmVuZGVyIExaTyBoYXMgYmVlbiBmaXhlZCkuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1
Pgo+IC0tLQo+ICAgZnMvdWJpZnMvY29tcHJlc3MuYyB8IDExNiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAgZnMvdWJpZnMvam91cm5hbC5jICB8ICAgMiAr
LQo+ICAgZnMvdWJpZnMvdWJpZnMuaCAgICB8ICAxNSArLS0tLS0KPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgNzcgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Zz
L3ViaWZzL2NvbXByZXNzLmMgYi9mcy91Ymlmcy9jb21wcmVzcy5jCj4gaW5kZXggMGI0OGNiYWI4
YTNkLi45MDQ2ZTc5Njg3NmQgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvY29tcHJlc3MuYwo+ICsr
KyBiL2ZzL3ViaWZzL2NvbXByZXNzLmMKPiBAQCAtMTUsNyArMTUsNyBAQAo+ICAgICogZGVjb21w
cmVzc2lvbi4KPiAgICAqLwo+ICAgCj4gLSNpbmNsdWRlIDxsaW51eC9jcnlwdG8uaD4KPiArI2lu
Y2x1ZGUgPGNyeXB0by9hY29tcHJlc3MuaD4KPiAgICNpbmNsdWRlICJ1Ymlmcy5oIgo+ICAgCj4g
ICAvKiBGYWtlIGRlc2NyaXB0aW9uIG9iamVjdCBmb3IgdGhlICJub25lIiBjb21wcmVzc29yICov
Cj4gQEAgLTI2LDExICsyNiw4IEBAIHN0YXRpYyBzdHJ1Y3QgdWJpZnNfY29tcHJlc3NvciBub25l
X2NvbXByID0gewo+ICAgfTsKPiAgIAo+ICAgI2lmZGVmIENPTkZJR19VQklGU19GU19MWk8KPiAt
c3RhdGljIERFRklORV9NVVRFWChsem9fbXV0ZXgpOwo+IC0KPiAgIHN0YXRpYyBzdHJ1Y3QgdWJp
ZnNfY29tcHJlc3NvciBsem9fY29tcHIgPSB7Cj4gICAJLmNvbXByX3R5cGUgPSBVQklGU19DT01Q
Ul9MWk8sCj4gLQkuY29tcF9tdXRleCA9ICZsem9fbXV0ZXgsCj4gICAJLm5hbWUgPSAibHpvIiwK
PiAgIAkuY2FwaV9uYW1lID0gImx6byIsCj4gICB9Owo+IEBAIC00MiwxMyArMzksOCBAQCBzdGF0
aWMgc3RydWN0IHViaWZzX2NvbXByZXNzb3IgbHpvX2NvbXByID0gewo+ICAgI2VuZGlmCj4gICAK
PiAgICNpZmRlZiBDT05GSUdfVUJJRlNfRlNfWkxJQgo+IC1zdGF0aWMgREVGSU5FX01VVEVYKGRl
ZmxhdGVfbXV0ZXgpOwo+IC1zdGF0aWMgREVGSU5FX01VVEVYKGluZmxhdGVfbXV0ZXgpOwo+IC0K
PiAgIHN0YXRpYyBzdHJ1Y3QgdWJpZnNfY29tcHJlc3NvciB6bGliX2NvbXByID0gewo+ICAgCS5j
b21wcl90eXBlID0gVUJJRlNfQ09NUFJfWkxJQiwKPiAtCS5jb21wX211dGV4ID0gJmRlZmxhdGVf
bXV0ZXgsCj4gLQkuZGVjb21wX211dGV4ID0gJmluZmxhdGVfbXV0ZXgsCj4gICAJLm5hbWUgPSAi
emxpYiIsCj4gICAJLmNhcGlfbmFtZSA9ICJkZWZsYXRlIiwKPiAgIH07Cj4gQEAgLTYwLDEzICs1
Miw4IEBAIHN0YXRpYyBzdHJ1Y3QgdWJpZnNfY29tcHJlc3NvciB6bGliX2NvbXByID0gewo+ICAg
I2VuZGlmCj4gICAKPiAgICNpZmRlZiBDT05GSUdfVUJJRlNfRlNfWlNURAo+IC1zdGF0aWMgREVG
SU5FX01VVEVYKHpzdGRfZW5jX211dGV4KTsKPiAtc3RhdGljIERFRklORV9NVVRFWCh6c3RkX2Rl
Y19tdXRleCk7Cj4gLQo+ICAgc3RhdGljIHN0cnVjdCB1Ymlmc19jb21wcmVzc29yIHpzdGRfY29t
cHIgPSB7Cj4gICAJLmNvbXByX3R5cGUgPSBVQklGU19DT01QUl9aU1RELAo+IC0JLmNvbXBfbXV0
ZXggPSAmenN0ZF9lbmNfbXV0ZXgsCj4gLQkuZGVjb21wX211dGV4ID0gJnpzdGRfZGVjX211dGV4
LAo+ICAgCS5uYW1lID0gInpzdGQiLAo+ICAgCS5jYXBpX25hbWUgPSAienN0ZCIsCj4gICB9Owo+
IEBAIC04MCw2ICs2Nyw0MCBAQCBzdGF0aWMgc3RydWN0IHViaWZzX2NvbXByZXNzb3IgenN0ZF9j
b21wciA9IHsKPiAgIC8qIEFsbCBVQklGUyBjb21wcmVzc29ycyAqLwo+ICAgc3RydWN0IHViaWZz
X2NvbXByZXNzb3IgKnViaWZzX2NvbXByZXNzb3JzW1VCSUZTX0NPTVBSX1RZUEVTX0NOVF07Cj4g
ICAKPiArc3RhdGljIGludCB1Ymlmc19jb21wcmVzc19yZXEoY29uc3Qgc3RydWN0IHViaWZzX2lu
Zm8gKmMsCj4gKwkJCSAgICAgIHN0cnVjdCBhY29tcF9yZXEgKnJlcSwKPiArCQkJICAgICAgdm9p
ZCAqb3V0X2J1ZiwgaW50ICpvdXRfbGVuKQo+ICt7Cj4gKwlzdHJ1Y3QgY3J5cHRvX3dhaXQgd2Fp
dDsKPiArCWludCBpbl9sZW4gPSByZXEtPnNsZW47Cj4gKwlpbnQgZXJyOwo+ICsKPiArCWNyeXB0
b19pbml0X3dhaXQoJndhaXQpOwo+ICsJYWNvbXBfcmVxdWVzdF9zZXRfY2FsbGJhY2socmVxLCBD
UllQVE9fVEZNX1JFUV9NQVlfQkFDS0xPRywKPiArCQkJCSAgIGNyeXB0b19yZXFfZG9uZSwgJndh
aXQpOwo+ICsJYWNvbXBfcmVxdWVzdF9zZXRfZHN0X2RtYShyZXEsIG91dF9idWYsICpvdXRfbGVu
KTsKPiArCWVyciA9IGNyeXB0b19hY29tcF9jb21wcmVzcyhyZXEpOwo+ICsJZXJyID0gY3J5cHRv
X3dhaXRfcmVxKGVyciwgJndhaXQpOwo+ICsJKm91dF9sZW4gPSByZXEtPmRsZW47Cj4gKwo+ICsJ
aWYgKHVubGlrZWx5KGVycikpIHsKPiArCQl1Ymlmc193YXJuKGMsICJjYW5ub3QgY29tcHJlc3Mg
JWQgYnl0ZXMsIGNvbXByZXNzb3IgJXMsIGVycm9yICVkLCBsZWF2ZSBkYXRhIHVuY29tcHJlc3Nl
ZCIsCj4gKwkJCSAgIGluX2xlbiwKPiArCQkJICAgY3J5cHRvX2Fjb21wX2FsZ19uYW1lKGNyeXB0
b19hY29tcF9yZXF0Zm0ocmVxKSksCgpXZSBnZXQgY2FwaV9uYW1lIGJ5ICdjcnlwdG9fYWNvbXBf
YWxnX25hbWUoY3J5cHRvX2Fjb21wX3JlcXRmbShyZXEpKScsIApub3QgY29tcHItPm5hbWUuCgpU
aGVyZSBhcmUgY29uZmxpY3RzIGluIHBhdGNoIDIgb24gdGhlIGxhdGVzdCBtYWlubGluZSB2ZXJz
aW9uLCBjYW4geW91IApyZWJhc2UgdGhpcyBzZXJpZXMgc28gSSBjYW4gZG8gc29tZSB0ZXN0cyBm
b3IgVUJJRlMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
