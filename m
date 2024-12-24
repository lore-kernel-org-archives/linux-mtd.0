Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3438E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95ov9t6BX2PqTvKOZtWBEz3j/60Hm1TeIK7Na/OOKQY=; b=Gmf/J8gV7PPfxOSJm3AgEUCFC/
	pdUShVzWYMxZDQUdUuQZ6UePsNY1zedMA+MecErhgbk0tRVidFP9dkkTWDo8jS0pm6jETyLg4g3JG
	ob536GZk0Sv50qH5TeBQch9exXnpUnTtsnHPfd9dOmhSFoe6QhrHRnslp5sraUyPOfLiQqvzA5b5M
	ajO+LISdRpSskYF/0yCtl/Cz/7rHCFTW7XRdpRtWdDqgmSdtsmgj4kjXfrmTzp0Ts/YuD643S/x0h
	Zm8h5DWFbs/WALTA8n427Nc7wSY/6qfi3At51td6YsUvqNKUbPAjaU9urtPxtUMVkUspt2M+EjCj4
	FyhlS00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0XF-0000000BWLq-3ikV;
	Tue, 24 Dec 2024 08:45:01 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0XC-0000000BWKl-22Y4
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 08:45:00 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YHT2l2mJzz1JG6n;
	Tue, 24 Dec 2024 16:44:15 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F24A1A0190;
	Tue, 24 Dec 2024 16:44:44 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Dec 2024 16:44:43 +0800
Subject: Re: [PATCH] ubifs: skip dumping tnc tree when zroot is null
To: pangliyuan <pangliyuan1@huawei.com>, <richard@nod.at>,
	<Artem.Bityutskiy@nokia.com>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangfangpeng1@huawei.com>
References: <20241224081823.15417-1-pangliyuan1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c929d4b4-44b8-810f-2014-98cd1ea0d392@huawei.com>
Date: Tue, 24 Dec 2024 16:44:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241224081823.15417-1-pangliyuan1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_004458_689952_EFFFC1FB 
X-CRM114-Status: GOOD (  11.87  )
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

1NogMjAyNC8xMi8yNCAxNjoxOCwgcGFuZ2xpeXVhbiDQtLXAOgo+IENsZWFyaW5nIHNsYWIgY2Fj
aGUgd2lsbCBmcmVlIGFsbCB6bm9kZSBpbiBtZW1vcnkgYW5kIG1ha2UKPiBjLT56cm9vdC56bm9k
ZSA9IE5VTEwsIHRoZW4gZHVtcGluZyB0bmMgdHJlZSB3aWxsIGFjY2Vzcwo+IGMtPnpyb290Lnpu
b2RlIHdoaWNoIGNhdXNlIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZS4KPiAKPiBMaW5rOiBodHRw
czovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxOTYyNCNjMAo+IEZpeGVz
OiAxZTUxNzY0YTNjMmEgKCJVQklGUzogYWRkIG5ldyBmbGFzaCBmaWxlIHN5c3RlbSIpCj4gU2ln
bmVkLW9mZi1ieTogcGFuZ2xpeXVhbiA8cGFuZ2xpeXVhbjFAaHVhd2VpLmNvbT4KPiAtLS0KPiAg
IGZzL3ViaWZzL2RlYnVnLmMgfCAyMiArKysrKysrKysrKysrLS0tLS0tLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5
OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRpZmYgLS1naXQgYS9m
cy91Ymlmcy9kZWJ1Zy5jIGIvZnMvdWJpZnMvZGVidWcuYwo+IGluZGV4IDVjYzY5YmVhYTYyZS4u
MTBhODZjMDJhOGIzIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2RlYnVnLmMKPiArKysgYi9mcy91
Ymlmcy9kZWJ1Zy5jCj4gQEAgLTk0NiwxNiArOTQ2LDIwIEBAIHZvaWQgdWJpZnNfZHVtcF90bmMo
c3RydWN0IHViaWZzX2luZm8gKmMpCj4gICAKPiAgIAlwcl9lcnIoIlxuIik7Cj4gICAJcHJfZXJy
KCIocGlkICVkKSBzdGFydCBkdW1waW5nIFROQyB0cmVlXG4iLCBjdXJyZW50LT5waWQpOwo+IC0J
em5vZGUgPSB1Ymlmc190bmNfbGV2ZWxvcmRlcl9uZXh0KGMsIGMtPnpyb290Lnpub2RlLCBOVUxM
KTsKPiAtCWxldmVsID0gem5vZGUtPmxldmVsOwo+IC0JcHJfZXJyKCI9PSBMZXZlbCAlZCA9PVxu
IiwgbGV2ZWwpOwo+IC0Jd2hpbGUgKHpub2RlKSB7Cj4gLQkJaWYgKGxldmVsICE9IHpub2RlLT5s
ZXZlbCkgewo+IC0JCQlsZXZlbCA9IHpub2RlLT5sZXZlbDsKPiAtCQkJcHJfZXJyKCI9PSBMZXZl
bCAlZCA9PVxuIiwgbGV2ZWwpOwo+ICsJaWYgKGMtPnpyb290Lnpub2RlKSB7Cj4gKwkJem5vZGUg
PSB1Ymlmc190bmNfbGV2ZWxvcmRlcl9uZXh0KGMsIGMtPnpyb290Lnpub2RlLCBOVUxMKTsKPiAr
CQlsZXZlbCA9IHpub2RlLT5sZXZlbDsKPiArCQlwcl9lcnIoIj09IExldmVsICVkID09XG4iLCBs
ZXZlbCk7Cj4gKwkJd2hpbGUgKHpub2RlKSB7Cj4gKwkJCWlmIChsZXZlbCAhPSB6bm9kZS0+bGV2
ZWwpIHsKPiArCQkJCWxldmVsID0gem5vZGUtPmxldmVsOwo+ICsJCQkJcHJfZXJyKCI9PSBMZXZl
bCAlZCA9PVxuIiwgbGV2ZWwpOwo+ICsJCQl9Cj4gKwkJCXViaWZzX2R1bXBfem5vZGUoYywgem5v
ZGUpOwo+ICsJCQl6bm9kZSA9IHViaWZzX3RuY19sZXZlbG9yZGVyX25leHQoYywgYy0+enJvb3Qu
em5vZGUsIHpub2RlKTsKPiAgIAkJfQo+IC0JCXViaWZzX2R1bXBfem5vZGUoYywgem5vZGUpOwo+
IC0JCXpub2RlID0gdWJpZnNfdG5jX2xldmVsb3JkZXJfbmV4dChjLCBjLT56cm9vdC56bm9kZSwg
em5vZGUpOwo+ICsJfSBlbHNlIHsKPiArCQlwcl9lcnIoImVtcHR5IFROQyB0cmVlIGluIG1lbW9y
eVxuIik7Cj4gICAJfQo+ICAgCXByX2VycigiKHBpZCAlZCkgZmluaXNoIGR1bXBpbmcgVE5DIHRy
ZWVcbiIsIGN1cnJlbnQtPnBpZCk7Cj4gICB9Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
