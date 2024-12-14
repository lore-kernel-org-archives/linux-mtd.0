Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C6CE7717F
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 03:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4s5P6haBvuL5gcb71j/S8njEuuEf0yVS+7nsMvwif8A=; b=rb8Wj+5wHcF07FyTD1XHC/qgqt
	csB7mJFgk679uSnhZr8Wk+KlI6ZxaiL/YNZR/pLVpHBnDIUZBz2u5JGzH4zyzOhl4Kw7rPF68L9ei
	pZRuGmJpGRgMnL30YzzSqCbjMbOMyIei+IHU4ZPh9HOupMg+LV9Jcmsb6XuvBPlg+ChfncbONvtgq
	AdGuHRNnnBrZ8A5X7Y3/LONhmC+uIhgPGAsVHjiqO1l7qifB8n5hoywALGVdepkiimmsZacWFiHUq
	vrGGOs4mXrRlf3NYxXJl2zA/bx/bhs5Am+zbfg5KNcmY5RjgVWm+rGwf1t+cIcLg5ML6FYXhXo96p
	6ABjpTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMIQP-00000005bXb-05yc;
	Sat, 14 Dec 2024 03:02:37 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMIQM-00000005bWw-1uPw
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 03:02:35 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Y99xJ1z6Qz20lW3
	for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 11:02:44 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BC5581402C4
	for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 11:02:26 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 14 Dec 2024 11:02:26 +0800
Subject: Re: [PATCH mtd-utils] lib: Fix integer overflow in in libiniparser.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241213135600.109810-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5a305ccb-82c4-ec62-8c00-b50a9ad2dd3c@huawei.com>
Date: Sat, 14 Dec 2024 11:02:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241213135600.109810-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_190234_641875_81332241 
X-CRM114-Status: GOOD (  13.53  )
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

1NogMjAyNC8xMi8xMyAyMTo1NiwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBQb3NzaWJsZSBpbnRlZ2VyIHVuZGVyZmxvdzogbGVmdCBvcGVy
YW5kIGlzIHRhaW50ZWQuCj4gQW4gaW50ZWdlciB1bmRlcmZsb3cgbWF5IG9jY3VyIGR1ZSB0byBh
cml0aG1ldGljIG9wZXJhdGlvbiAoc3VidHJhY3Rpb24pIGJldHdlZW4gdmFsdWVzCj4geyBbLTIx
NDc0ODM2NDgsIDIxNDc0ODM2NDddIH0gYW5kICcxJywgd2hlcmUgdGhlIGZpcnN0IHZhbHVlIGNv
bWVzIGZyb20gdGhlIGV4cHJlc3Npb24gJyhpbnQpc3RybGVuKGxpbmUpJwo+IAo+IENvcnJlY3Rp
b25zIGV4cGxhaW5lZDoKPiBNb2RpZmllZCBsb2dpYyB0b3NraXAgZW1wdHkgbGluZXMgaW1tZWRp
YXRlbHksIHJlZHVjaW5nIHVubmVjZXNzYXJ5IHByb2Nlc3NpbmcuLSBFbnN1cmVkIHNhZmV0eSBi
eSB2YWxpZGF0aW5nIGxlbiA+PSAwIGJlZm9yZSBhY2Nlc3NpbmcgbGluZVtsZW5dIHRvIGF2b2lk
IG91dC1vZi1ib3VuZHMgYWNjZXNzLgo+IAo+IFRyaWdnZXJzIGZvdW5kIGJ5IHN0YXRpYyBhbmFs
eXplciBTdmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYubW9y
eWFrb3ZAZ21haWwuY29tPgo+IAo+IC0tLQo+ICAgbGliL2xpYmluaXBhcnNlci5jIHwgMiArLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2xpYi9saWJpbmlwYXJzZXIuYyBiL2xpYi9saWJpbmlwYXJzZXIuYwo+IGluZGV4
IGE2ZGRjYzcuLjJmYWNiZGUgMTAwNjQ0Cj4gLS0tIGEvbGliL2xpYmluaXBhcnNlci5jCj4gKysr
IGIvbGliL2xpYmluaXBhcnNlci5jCj4gQEAgLTUyNCw3ICs1MjQsNyBAQCBkaWN0aW9uYXJ5ICog
aW5pcGFyc2VyX2xvYWQoY29uc3QgY2hhciAqIGluaW5hbWUpCj4gICAgICAgICAgIGxpbmVubysr
IDsKPiAgICAgICAgICAgbGVuID0gKGludClzdHJsZW4obGluZSktMTsKPiAgICAgICAgICAgLyog
U2FmZXR5IGNoZWNrIGFnYWluc3QgYnVmZmVyIG92ZXJmbG93cyAqLwo+IC0gICAgICAgIGlmIChs
aW5lW2xlbl0hPSdcbicpIHsKPiArICAgICAgICBpZiAobGVuIDwgMCB8fCBsaW5lW2xlbl0hPSdc
bicpIHsKCkhpIEFudG9uLCB5b3UgbW9kaWZpZWQgdGhlIHdyb25nIHBsYWNlLiBFeHByZXNzaW9u
ICdpZiAKKGxpbmVbbGVuXT09J1xcJyknIHNob3VsZCBiZSBjaGFuZ2VkLCBwbGVhc2Ugc2VlIGRl
dGFpbHMgaW4gCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC83ZGY3Njk3My00NmVk
LWQ0N2MtNzljNi0zNmJkOGNmNjI3ZThAaHVhd2VpLmNvbS9ULyN0Lgo+ICAgICAgICAgICAgICAg
ZnByaW50ZihzdGRlcnIsCj4gICAgICAgICAgICAgICAgICAgICAgICJpbmlwYXJzZXI6IGlucHV0
IGxpbmUgdG9vIGxvbmcgaW4gJXMgKCVkKVxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgaW5p
bmFtZSwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
