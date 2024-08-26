Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECF4C5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C870ZXnyLGsmz3u9orwsShUe5VwMn+SzmwR5+a4tpo0=; b=Jf708TW3s+C97BV5yieMP4qNyG
	//FMyBIrzfOvcxzWRM3REjMkL9jZF4t7lPmYik8zHVlMnU0JcuFVS0yORlEiFRIys3lfFEiM136BP
	sCqCXRvgi/Y9qlLTMwL3dlD3QIuaHnkC1mn2v7u3dSnvfCeulQlxyKPYnq2eu5rOJnSsFEHAJncOU
	EpaLIuV3XEEFZv9noHdHXy6CgSlAwndqxK6K2uxc3kkUXmSIhSxYrXJJKqDpxEYLhF+Jy4Bk+HDbX
	M6UbPbnKjnYSHWVrK3buHs1nO1dB1OfzzGPMTJgSnzANvIb1+vzWr9LYsYYsYqzyZiRFvQACjCSCX
	S43lylag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siX3W-00000006wt9-0YvC;
	Mon, 26 Aug 2024 10:34:38 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siX3S-00000006wsA-3OJR
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 10:34:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Wsn7566sjz1xvwG;
	Mon, 26 Aug 2024 18:32:33 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 966DB1A0190;
	Mon, 26 Aug 2024 18:34:30 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 18:34:30 +0800
Subject: Re: [PATCH -next 1/2] ubifs: remove unused ioctl flags
 GETFLAGS/SETFLAGS
To: Hongbo Li <lihongbo22@huawei.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240826091700.2812779-1-lihongbo22@huawei.com>
 <20240826091700.2812779-2-lihongbo22@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <31952d6c-8605-0ffc-0ae4-b3b8382ee597@huawei.com>
Date: Mon, 26 Aug 2024 18:34:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240826091700.2812779-2-lihongbo22@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_033435_128583_813CBD5C 
X-CRM114-Status: GOOD (  11.79  )
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

1NogMjAyNC84LzI2IDE3OjE2LCBIb25nYm8gTGkg0LS1wDoKPiBJbiB0aGUgdWJpZnMsIHViaWZz
X2ZpbGVhdHRyX2dldCBhbmQgdWJpZnNfZmlsZWF0dHJfc2V0Cj4gaGF2ZSBiZWVuIGltcGxlbWVu
dGVkLCBHRVRGTEFHUyBhbmQgU0VURkxBR1MgaW9jdGwgYXJlIG5vdAo+IGhhbmRsZWQgaW4gZmls
ZXN5c3RlbSdzIG93biBpb2N0bCBoZWxwZXIuIEFkZGl0aW9uYWxseSwKPiB0aGVzZSBmbGFncycg
Y2FzZXMgYXJlIG5vdCBoYW5kbGVkIGluIHViaWZzJ3MgaW9jdGwgaGVscGVyLAo+IHNvIHdlIGNh
biByZW1vdmUgdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIb25nYm8gTGkgPGxpaG9uZ2JvMjJA
aHVhd2VpLmNvbT4KPiAtLS0KPiAgIGZzL3ViaWZzL2lvY3RsLmMgfCA2IC0tLS0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvaW9jdGwu
YyBiL2ZzL3ViaWZzL2lvY3RsLmMKPiBpbmRleCBkNzljYWJlMTkzYzMuLjJjOTkzNDljZjUzNyAx
MDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9pb2N0bC5jCj4gKysrIGIvZnMvdWJpZnMvaW9jdGwuYwo+
IEBAIC0yMTMsMTIgKzIxMyw2IEBAIGxvbmcgdWJpZnNfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUs
IHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ICAgbG9uZyB1Ymlmc19jb21w
YXRfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxv
bmcgYXJnKQo+ICAgewo+ICAgCXN3aXRjaCAoY21kKSB7Cj4gLQljYXNlIEZTX0lPQzMyX0dFVEZM
QUdTOgo+IC0JCWNtZCA9IEZTX0lPQ19HRVRGTEFHUzsKPiAtCQlicmVhazsKPiAtCWNhc2UgRlNf
SU9DMzJfU0VURkxBR1M6Cj4gLQkJY21kID0gRlNfSU9DX1NFVEZMQUdTOwo+IC0JCWJyZWFrOwo+
ICAgCWNhc2UgRlNfSU9DX1NFVF9FTkNSWVBUSU9OX1BPTElDWToKPiAgIAljYXNlIEZTX0lPQ19H
RVRfRU5DUllQVElPTl9QT0xJQ1k6Cj4gICAJY2FzZSBGU19JT0NfR0VUX0VOQ1JZUFRJT05fUE9M
SUNZX0VYOgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
