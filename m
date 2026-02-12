Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44133EDF020
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 03:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QY3WbOiTJ4VcwTdr7qOrMF0AF9l2PekL+ZzspKQniSs=; b=2tmie9BAEbwZQD/7CpenZpZS5T
	IlI2eC+QjABp5WH5UetLpIrl0SHQLIj7eFiwZE74xrOhZRBWhuWAWLsOs16Od4g9w4oXjKjvkqQFR
	adA/eVF+4A4uinJwb4S2vzWoUIGY7CSdZeTTpDK9VutPUAelSQUEK4GJZbLnzppJ2ReuJN3sup4y6
	tdXu6/L8S8M3CVe2JHYJImpMEmM3gp/vWN2TRd0ddY7nTrjoD1L8Lh/8TpOPXyUUNHShk+J49g7dr
	edBzhaUFlZZxEuav3Ramda0LAg1NxJwL6kEU3g9bkPrvcQqjArVtkKubIDH/vsUwBkPIuXyzD8l1S
	VF8SNTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNBb-00000001XXU-0R1A;
	Thu, 12 Feb 2026 03:16:11 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNBY-00000001XVt-1BrD
	for linux-mtd@lists.infradead.org;
	Thu, 12 Feb 2026 03:16:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+gqK1yOcyrucD509c0NtbF1xPrLpwBnTBJBl7Jfkq+U=;
	b=PjwQHRgVFI5sa5kQ9YWN0MEaUVdka55U3bERd/1p+tvdLA0vfTRpJu73tN56RB2BR7jeq/kjk
	dMA0FgSmfCA4JErZjU8kvPh+Jsnp+Uv6t5PGf7gKEifakUtq0ImyYY9HmCuo9uIP4rC1SOQxOR+
	PWa/NhHgBBvS+057lkNHxvE=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fBL196zB7z1T4Fj;
	Thu, 12 Feb 2026 11:11:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E77F40561;
	Thu, 12 Feb 2026 11:15:59 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 12 Feb 2026 11:15:57 +0800
Subject: Re: [PATCH] ubiattach: fix wording in usage example
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>,
	<david.oberhollenzer@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>
References: <20260212013542.22699-1-rahimi.mhmmd@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <41f7b452-5d9d-5bca-62db-8b997ce3ed1f@huawei.com>
Date: Thu, 12 Feb 2026 11:15:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260212013542.22699-1-rahimi.mhmmd@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191608_798739_9516CAC5 
X-CRM114-Status: GOOD (  15.36  )
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

1NogMjAyNi8yLzEyIDk6MzUsIE1vaGFtbWFkIFJhaGltaSDQtLXAOgo+IFRoZSB1c2FnZSBleGFt
cGxlIDQgZGVzY3JpYmluZyByZXNlcnZlZCBlcmFzZWJsb2NrcyBoYWQgYXdrd2FyZCBhbmQKPiBz
bGlnaHRseSBpbmNvcnJlY3QgcGhyYXNpbmcgKCJpcyB0b3RhbCBmbGFzaCBjaGlwIGVyYXNlYmxv
Y2tzIGNvdW50IikuCj4gUmV3b3JkIGl0IGZvciBjbGFyaXR5IGFuZCByZWFkYWJpbGl0eSB3aXRo
b3V0IGNoYW5naW5nIHRoZSBtZWFuaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1vaGFtbWFkIFJh
aGltaSA8cmFoaW1pLm1obW1kQGdtYWlsLmNvbT4KPiAtLS0KPiAgIHViaS11dGlscy91YmlhdHRh
Y2guYyB8IDYgKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL3ViaS11dGlscy91YmlhdHRhY2guYyBiL3ViaS11dGls
cy91YmlhdHRhY2guYwo+IGluZGV4IGU3NThkYWIuLjExZTE3MWIgMTAwNjQ0Cj4gLS0tIGEvdWJp
LXV0aWxzL3ViaWF0dGFjaC5jCj4gKysrIGIvdWJpLXV0aWxzL3ViaWF0dGFjaC5jCj4gQEAgLTky
LDkgKzkyLDkgQEAgc3RhdGljIGNvbnN0IGNoYXIgdXNhZ2VbXSA9Cj4gICAiICAgICAgICAgICBh
bmQgY3JlYXRlIFVCSSBkZXZpY2UgbnVtYmVyIDMgKHViaTMpXG4iCj4gICAiRXhhbXBsZSA0OiAi
IFBST0dSQU1fTkFNRSAiIC1tIDEgLWIgMjUgLSBhdHRhY2ggL2Rldi9tdGQxIHRvIFVCSSBhbmQg
cmVzZXJ2ZVxuIgo+ICAgIiAgICAgICAgICAgMjUqQy8xMDI0IGVyYXNlYmxvY2tzIGZvciBiYWQg
YmxvY2sgaGFuZGxpbmcsIHdoZXJlIEMgaXMgdGhlIGZsYXNoXG4iCj4gLSIgICAgICAgICAgIGlz
IHRvdGFsIGZsYXNoIGNoaXAgZXJhc2VibG9ja3MgY291bnQsIHRoYXQgaXMgZmxhc2ggY2hpcCBz
aXplIGluXG4iCj4gLSIgICAgICAgICAgIGVyYXNlYmxvY2tzIChpbmNsdWRpbmcgYmFkIGVyYXNl
YmxvY2tzKS4gRS5nLiwgaWYgdGhlIGZsYXNoIGNoaXBcbiIKPiAtIiAgICAgICAgICAgaGFzIDQw
OTYgUEVCcywgMTAwIHdpbGwgYmUgcmVzZXJ2ZWQuIjsKPiArIiAgICAgICAgICAgY2hpcCB0b3Rh
bCBlcmFzZWJsb2NrcyBjb3VudCwgdGhhdCBpcyBmbGFzaCBjaGlwIHNpemUgaW4gZXJhc2VibG9j
a3NcbiIKPiArIiAgICAgICAgICAgKGluY2x1ZGluZyBiYWQgZXJhc2VibG9ja3MpLiBFLmcuLCBp
ZiB0aGUgZmxhc2ggY2hpcCBoYXMgNDA5NiBQRUJzLFxuIgo+ICsiICAgICAgICAgICAxMDAgd2ls
bCBiZSByZXNlcnZlZC4iOwo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9wdGlvbiBsb25n
X29wdGlvbnNbXSA9IHsKPiAgIAl7IC5uYW1lID0gImRldm4iLCAgICAgICAgICAgIC5oYXNfYXJn
ID0gMSwgLmZsYWcgPSBOVUxMLCAudmFsID0gJ2QnIH0sCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
