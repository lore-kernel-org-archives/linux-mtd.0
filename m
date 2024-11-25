Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C686D58D4C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dS9ZJuiPnYg9838fffqTPsEJi0Pxj8vO1ZNnH3YEjM4=; b=OQbRMWJRHBXbN1Vgvdlq0h7Hrk
	WCWwZz9IGBmIAKlVTf/mQEEv53MnRu9kUDjX8tGbPkJ9OftT4OA1N6VZmNXR7sRRcUigdCkflx38a
	65Uy1d7+iMM9mXWWTN5t49g/KmgNd5LAlENfIBAs8JDgw1YJ4j4AaZgDedoQ2Hopg9yRTrmHQYaMO
	naFCR5H1ZEIvh6BcQYr4ucM0OY2bgLFyzLLgzHRpZ068KyoLiZsbpKYby8VvOgLgu5iBgfDgS61Zt
	hFyztXL8bmHeGaph2IJUgp5L0N15Td9xDHOxOjWg9wiJXu0bKguC5PKqdokiKg9mPSy2r8XJHkGwS
	+HTwIRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZMk-00000008ANX-3xjE;
	Mon, 25 Nov 2024 13:43:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZLq-00000008AGT-0MfZ
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 13:42:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XxmyM3kjKzWfQS;
	Mon, 25 Nov 2024 21:39:07 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 455F81800A7;
	Mon, 25 Nov 2024 21:41:53 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 25 Nov 2024 21:41:52 +0800
Subject: Re: [PATCH] mtd: ubi: Added a check for ubi_num
To: Denis Arefev <arefev@swemel.ru>, Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241125132354.16188-1-arefev@swemel.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <62854804-c692-0e18-94af-67efd86af61e@huawei.com>
Date: Mon, 25 Nov 2024 21:41:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241125132354.16188-1-arefev@swemel.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_054206_269472_59E662AA 
X-CRM114-Status: GOOD (  18.31  )
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

1NogMjAyNC8xMS8yNSAyMToyMywgRGVuaXMgQXJlZmV2INC0tcA6Cj4gQWRkZWQgYSBjaGVjayBm
b3IgdWJpX251bSBmb3IgbmVnYXRpdmUgbnVtYmVycwo+IElmIHRoZSB2YXJpYWJsZSB1YmlfbnVt
IHRha2VzIG5lZ2F0aXZlIHZhbHVlcyB0aGVuIHdlIGdldDoKPiAKPiBxZW11LXN5c3RlbS1hcm0g
Li4uIC1hcHBlbmQgInViaS5tdGQ9MCwwLDAsLTIyMjIyMzQ1IiAuLi4KPiBbICAgIDAuNzQ1MDY1
XSAgdWJpX2F0dGFjaF9tdGRfZGV2IGZyb20gdWJpX2luaXQrMHgxNzgvMHgyMTgKPiBbICAgIDAu
NzQ1MjMwXSAgdWJpX2luaXQgZnJvbSBkb19vbmVfaW5pdGNhbGwrMHg3MC8weDFhYwo+IFsgICAg
MC43NDUzNDRdICBkb19vbmVfaW5pdGNhbGwgZnJvbSBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDE5
OC8weDIyNAo+IFsgICAgMC43NDU0NzRdICBrZXJuZWxfaW5pdF9mcmVlYWJsZSBmcm9tIGtlcm5l
bF9pbml0KzB4MTgvMHgxMzQKPiBbICAgIDAuNzQ1NjAwXSAga2VybmVsX2luaXQgZnJvbSByZXRf
ZnJvbV9mb3JrKzB4MTQvMHgyOAo+IFsgICAgMC43NDU3MjddIEV4Y2VwdGlvbiBzdGFjaygweDkw
MDE1ZmIwIHRvIDB4OTAwMTVmZjgpCj4gCj4gRm91bmQgYnkgTGludXggVmVyaWZpY2F0aW9uIENl
bnRlciAobGludXh0ZXN0aW5nLm9yZykgd2l0aCBTVkFDRS4KPiAKPiBGaXhlczogODk3YTMxNmM5
ZTZmICgiVUJJOiBoYW5kbGUgYXR0YWNoIGlvY3RsIikKCkhpIERlbmlzLApJIHRoaW5rIHRoZSBw
cm9ibGVtIGlzIGltcG9ydGVkIGJ5IAo4M2ZmNTlhMDY2NjM3YTZjMjg4NDRiYmY0MzAwOTQ1OTQw
ODI0MGY0KCJVQkk6IHN1cHBvcnQgdWJpX251bSBvbiAKbXRkLnViaSBjb21tYW5kIGxpbmUiKS4K
PiBTaWduZWQtb2ZmLWJ5OiBEZW5pcyBBcmVmZXYgPGFyZWZldkBzd2VtZWwucnU+Cj4gLS0tCj4g
ICBkcml2ZXJzL210ZC91YmkvYnVpbGQuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91
YmkvYnVpbGQuYyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gaW5kZXggMzBiZTRlZDY4ZmFk
Li5kYWU1NjlmNDhiODcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiAr
KysgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IEBAIC05MjAsNyArOTIwLDcgQEAgaW50IHVi
aV9hdHRhY2hfbXRkX2RldihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHViaV9udW0sCj4gICAJ
CQlyZXR1cm4gLUVORklMRTsKPiAgIAkJfQo+ICAgCX0gZWxzZSB7Cj4gLQkJaWYgKHViaV9udW0g
Pj0gVUJJX01BWF9ERVZJQ0VTKQo+ICsJCWlmICh1YmlfbnVtIDwgVUJJX0RFVl9OVU1fQVVUTyB8
fCB1YmlfbnVtID49IFVCSV9NQVhfREVWSUNFUykKPiAgIAkJCXJldHVybiAtRUlOVkFMOwoKVGhl
IGlvY3RsKFVCSV9JT0NBVFQpIGFscmVhZHkgY2hlY2tzIHRoZSAndWJpX251bScsIHNvIEkgcHJl
ZmVyIHRvIGFkZCAKdGhlIG1pc3NpbmcgY2hlY2sgaW4gdWJpX210ZF9wYXJhbV9wYXJzZSgpLgo+
ICAgCj4gICAJCS8qIE1ha2Ugc3VyZSB1YmlfbnVtIGlzIG5vdCBidXN5ICovCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
