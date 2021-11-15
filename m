Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DEFC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:28:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DF3E61C14
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DF3E61C14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EI+bm1fATS4iL2gN1MEi7Sf6nffqoR/znlpMi07fSp8=; b=Nn4mwSvaLO//+ivCJbjPb26OvY
	lNNHHrBy3xMlfcSn5L53Kq/ZLbqoWzdr+xjsWdVd/0qM8MLLat4YkgS7MVFDhgiAFjMVrWoG4vF6M
	ZrmSjQmY6vywrEYW0VP1Dg/Hx/7xREayH6GnsqEhebIlsM45pTzQiLiotxzAzKzPwhUMYverJ4Fxo
	eyLmztOmB3Q49BAyjRbKu9Oudax51sikdhTDH4OiZfnHbqFeP4qinIsmNDwOHECYewwU4xEx85nZA
	ZRWUnqd90VbWXlkh3y0aL4BgskApArYvNmGyw94lSgk4Vh5d0pW3nOGvAkJtc+OrNo6u8G1R08uyA
	GtL/U0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYH9-00EvIj-9M; Mon, 15 Nov 2021 09:27:43 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmXti-00EpAQ-7S
 for linux-mtd@lists.infradead.org; Mon, 15 Nov 2021 09:03:32 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ht37y6Mr3zZd4V;
 Mon, 15 Nov 2021 17:01:02 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 15 Nov 2021 17:03:22 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 15 Nov 2021 17:03:21 +0800
Subject: Re: [PATCH v3 04/12] ubifs: Add missing iput if do_tmpfile() failed
 in rename whiteout
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211112121758.2208727-1-chengzhihao1@huawei.com>
 <20211112121758.2208727-5-chengzhihao1@huawei.com>
 <20211115082446.GC25697@pengutronix.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <66c6cee0-75df-3305-7ad2-a5a3da006321@huawei.com>
Date: Mon, 15 Nov 2021 17:03:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20211115082446.GC25697@pengutronix.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_010330_503107_C740BAF4 
X-CRM114-Status: GOOD (  12.33  )
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

1NogMjAyMS8xMS8xNSAxNjoyNCwgU2FzY2hhIEhhdWVyINC0tcA6CkhpLCBTYXNjaGEKPiBPbiBG
cmksIE5vdiAxMiwgMjAyMSBhdCAwODoxNzo1MFBNICswODAwLCBaaGloYW8gQ2hlbmcgd3JvdGU6
Cj4+IHdoaXRlb3V0IGlub2RlIHNob3VsZCBiZSBwdXQgd2hlbiBkb190bXBmaWxlKCkgZmFpbGVk
IGlmIGlub2RlIGhhcyBiZWVuCj4+IGluaXRpYWxpemVkLiBPdGhlcndpc2Ugd2Ugd2lsbCBnZXQg
Zm9sbG93aW5nIHdhcm5pbmcgZHVyaW5nIHVtb3VudDoKPj4gICAgVUJJRlMgZXJyb3IgKHViaTA6
MCBwaWQgMTQ5NCk6IHViaWZzX2Fzc2VydF9mYWlsZWQgW3ViaWZzXTogVUJJRlMKPj4gICAgYXNz
ZXJ0IGZhaWxlZDogYy0+YmkuZGRfZ3Jvd3RoID09IDAsIGluIGZzL3ViaWZzL3N1cGVyLmM6MTkz
MAo+PiAgICBWRlM6IEJ1c3kgaW5vZGVzIGFmdGVyIHVubW91bnQgb2YgdWJpZnMuIFNlbGYtZGVz
dHJ1Y3QgaW4gNSBzZWNvbmRzLgo+Pgo+PiBGaXhlczogOWUwYTFmZmY4ZGI1NmVhICgidWJpZnM6
IEltcGxlbWVudCBSRU5BTUVfV0hJVEVPVVQiKQo+PiBTaWduZWQtb2ZmLWJ5OiBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gICBmcy91Ymlmcy9kaXIuYyB8
IDIgKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9mcy91Ymlmcy9kaXIuYyBiL2ZzL3ViaWZzL2Rpci5jCj4+IGluZGV4IDI3MzVhZDFhZmZl
ZC4uNjUwM2U2ODU3ZjZlIDEwMDY0NAo+PiAtLS0gYS9mcy91Ymlmcy9kaXIuYwo+PiArKysgYi9m
cy91Ymlmcy9kaXIuYwo+PiBAQCAtMTMzNCw2ICsxMzM0LDggQEAgc3RhdGljIGludCBkb19yZW5h
bWUoc3RydWN0IGlub2RlICpvbGRfZGlyLCBzdHJ1Y3QgZGVudHJ5ICpvbGRfZGVudHJ5LAo+PiAg
IAo+PiAgIAkJZXJyID0gZG9fdG1wZmlsZShvbGRfZGlyLCBvbGRfZGVudHJ5LCBTX0lGQ0hSIHwg
V0hJVEVPVVRfTU9ERSwgJndoaXRlb3V0KTsKPj4gICAJCWlmIChlcnIpIHsKPj4gKwkJCWlmICh3
aGl0ZW91dCkKPj4gKwkJCQlpcHV0KHdoaXRlb3V0KTsKPiBTaG91bGQgdGhpcyByYXRoZXIgYmUg
ZG9uZSBpbiBkb190bXBmaWxlKCkgZGlyZWN0bHk/ClllcywgSSBzaG91bGQgaGF2ZSBkb25lIGl0
LiBBbHRob3VnaCBuZXh0IHBhdGNoIHJlY29uc3RydWN0cyBkb19yZW5hbWUoKSAKd2hpY2ggbWFr
ZXMgdGhpcyB1Z2x5IGp1ZGdlbWVudCBkaXNhcHBlcmVkLiBJIHdpbGwgZml4IGl0IGFsb25nIHdp
dGggCm90aGVyIHN1Z2dlc3Rpb25zIGZyb20gb3RoZXIgcGF0Y2hlcyBpbiBuZXh0IGl0ZXJhdGlv
bi4gVGhhbmtzLgo+IFNhc2NoYQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
