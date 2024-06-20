Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D15EC2BA18
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9ebG0KgfK+z/oSaTRHyW9bJpTiPi+ZEh3hKktd5aPw=; b=aPWB7QIYIlta3hYbUnD5T3Ee3M
	oAc+lGKvMhFjcdLYfCqvn3nk+CUAYLgN5S8TifiAdGIHiU489KiBz+F7ORZfikqdNsaZIVdQU1a8V
	JOt3mJGyZh0rZum8u6BwAT26LXXawvMOPK1Krw0one13I0qCRScZzyEYxDhzwK3jt2oYtP2fSGPlj
	hIdjhE/DZozQR6HZ7JuDa2uSZMCmotaoPH6/DBtckzsTxAnwIS23SvBuF32Kq8aOWYVEi2QgT+tDB
	TsXu5qaJCQM+Zjiert9Fl0fw0fVCO/g95XhSESCb7ZCZJxzm+ZkLme8snetPHhpioCAaO+JKJAqSJ
	K4vp2hsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDAU-000000049hs-0w5G;
	Thu, 20 Jun 2024 08:29:18 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDAQ-000000049gy-3aqf
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 08:29:16 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4W4YTS6WvNzPrgn;
	Thu, 20 Jun 2024 16:25:32 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id A32D3140134;
	Thu, 20 Jun 2024 16:29:06 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:29:05 +0800
Subject: Re: [PATCH v2] ubifs: add check for crypto_shash_tfm_digest
To: Chen Ni <nichen@iscas.ac.cn>, <richard@nod.at>, <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240620081926.1135571-1-nichen@iscas.ac.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <829bbfb2-ea9d-9b77-27ed-1c57643e75d4@huawei.com>
Date: Thu, 20 Jun 2024 16:29:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240620081926.1135571-1-nichen@iscas.ac.cn>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_012915_108771_20C0A4A3 
X-CRM114-Status: GOOD (  15.42  )
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

1NogMjAyNC82LzIwIDE2OjE5LCBDaGVuIE5pINC0tcA6Cj4gQWRkIGNoZWNrIGZvciB0aGUgcmV0
dXJuIHZhbHVlIG9mIGNyeXB0b19zaGFzaF90Zm1fZGlnZXN0KCkgYW5kIHJldHVybgo+IHRoZSBl
cnJvciBpZiBpdCBmYWlscyBpbiBvcmRlciB0byBjYXRjaCB0aGUgZXJyb3IuCj4gCj4gRml4ZXM6
IDgxN2FhMDk0ODQyZCAoInViaWZzOiBzdXBwb3J0IG9mZmxpbmUgc2lnbmVkIGltYWdlcyIpCj4g
U2lnbmVkLW9mZi1ieTogQ2hlbiBOaSA8bmljaGVuQGlzY2FzLmFjLmNuPgo+IC0tLQo+IENoYW5n
ZWxvZzoKPiAKPiB2MSAtPiB2MjoKPiAKPiAxLiBVcGRhdGUgZml4IHRhZy4KPiAtLS0KPiAgIGZz
L3ViaWZzL21hc3Rlci5jIHwgNSArKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL21hc3Rlci5jIGIvZnMv
dWJpZnMvbWFzdGVyLmMKPiBpbmRleCA3YWRjMzdjMTBiNmEuLmExNDg3NjBmYTQ5ZSAxMDA2NDQK
PiAtLS0gYS9mcy91Ymlmcy9tYXN0ZXIuYwo+ICsrKyBiL2ZzL3ViaWZzL21hc3Rlci5jCj4gQEAg
LTY3LDEwICs2NywxMyBAQCBzdGF0aWMgaW50IG1zdF9ub2RlX2NoZWNrX2hhc2goY29uc3Qgc3Ry
dWN0IHViaWZzX2luZm8gKmMsCj4gICB7Cj4gICAJdTggY2FsY1tVQklGU19NQVhfSEFTSF9MRU5d
Owo+ICAgCWNvbnN0IHZvaWQgKm5vZGUgPSBtc3Q7Cj4gKwlpbnQgcmV0Owo+ICAgCj4gLQljcnlw
dG9fc2hhc2hfdGZtX2RpZ2VzdChjLT5oYXNoX3RmbSwgbm9kZSArIHNpemVvZihzdHJ1Y3QgdWJp
ZnNfY2gpLAo+ICsJcmV0ID0gY3J5cHRvX3NoYXNoX3RmbV9kaWdlc3QoYy0+aGFzaF90Zm0sIG5v
ZGUgKyBzaXplb2Yoc3RydWN0IHViaWZzX2NoKSwKPiAgIAkJCQlVQklGU19NU1RfTk9ERV9TWiAt
IHNpemVvZihzdHJ1Y3QgdWJpZnNfY2gpLAo+ICAgCQkJCWNhbGMpOwo+ICsJaWYgKHJldCkKPiAr
CQlyZXR1cm4gcmV0Owo+ICAgCj4gICAJaWYgKHViaWZzX2NoZWNrX2hhc2goYywgZXhwZWN0ZWQs
IGNhbGMpKQo+ICAgCQlyZXR1cm4gLUVQRVJNOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
