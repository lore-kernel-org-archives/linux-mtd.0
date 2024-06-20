Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7B2C2BA18
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 06:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPvWCLzkDsJAe5UdEWCw+TvMypPCkRzmpJOeZiLlWz0=; b=Qjm5pKZpei98HZVjmFd7rgddQ9
	eGxQuxKc4GHNbQb4iibuxGLRdAG4fnOUu7okeQd+O3UoZnF5v3PEQ9NPPkqz+2iwbuIxKc5MaiP+k
	4xs5ob8eCSOGZaTFLFqQ9XaY51OWHolR0kbsqz8tq9dwrQLsejD/E1blwWPUtRIYrVrjN+uHv1Fmr
	uMrDHsjTlw5FQJ93gSTyaHPNTRYOVKsEfFyTox7j3uouksw3eD0wmnYDfpt6po8Uocn9bIIAnS6Ao
	iWglS2jk5RPq+Ns3u+Z6Gr1eWd8OGs/C968RhNTzThTfX2RWQryDnLY7tyuuS9lgWrX7B8SMlxqGP
	dXDLiY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKB4N-00000003lYF-1Sq7;
	Thu, 20 Jun 2024 06:14:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKB4K-00000003lXP-0mnL
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 06:14:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W4VTR1wwlzwTcQ;
	Thu, 20 Jun 2024 14:10:19 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F203140120;
	Thu, 20 Jun 2024 14:14:35 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 14:14:34 +0800
Subject: Re: [PATCH] ubifs: add check for crypto_shash_tfm_digest
To: Chen Ni <nichen@iscas.ac.cn>, <richard@nod.at>, <ebiggers@google.com>,
	<herbert@gondor.apana.org.au>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240620034533.569099-1-nichen@iscas.ac.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <12a768cb-8ced-0b59-59f3-b05833e41bf3@huawei.com>
Date: Thu, 20 Jun 2024 14:14:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240620034533.569099-1-nichen@iscas.ac.cn>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_231448_418603_7E72D186 
X-CRM114-Status: GOOD (  16.47  )
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

1NogMjAyNC82LzIwIDExOjQ1LCBDaGVuIE5pINC0tcA6Cj4gQWRkIGNoZWNrIGZvciB0aGUgcmV0
dXJuIHZhbHVlIG9mIGNyeXB0b19zaGFzaF90Zm1fZGlnZXN0KCkgYW5kIHJldHVybgo+IHRoZSBl
cnJvciBpZiBpdCBmYWlscyBpbiBvcmRlciB0byBjYXRjaCB0aGUgZXJyb3IuCj4gCj4gRml4ZXM6
IGY4MGRmMzg1MTI0NiAoInViaWZzOiB1c2UgY3J5cHRvX3NoYXNoX3RmbV9kaWdlc3QoKSIpCgpJ
IHRoaW5rIHRoZSBmaXggdGFnIHNob3VsZCAKODE3YWEwOTQ4NDJkZmMzYTZiOThjOTU4MmQ0YTY0
NzgyN2Y2NjIwMSgidWJpZnM6IHN1cHBvcnQgb2ZmbGluZSBzaWduZWQgCmltYWdlcyIpLCBvdGhl
cndpc2U6ClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29t
PgoKPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIE5pIDxuaWNoZW5AaXNjYXMuYWMuY24+Cj4gLS0tCj4g
ICBmcy91Ymlmcy9tYXN0ZXIuYyB8IDUgKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvbWFzdGVy
LmMgYi9mcy91Ymlmcy9tYXN0ZXIuYwo+IGluZGV4IDdhZGMzN2MxMGI2YS4uYTE0ODc2MGZhNDll
IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL21hc3Rlci5jCj4gKysrIGIvZnMvdWJpZnMvbWFzdGVy
LmMKPiBAQCAtNjcsMTAgKzY3LDEzIEBAIHN0YXRpYyBpbnQgbXN0X25vZGVfY2hlY2tfaGFzaChj
b25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKPiAgIHsKPiAgIAl1OCBjYWxjW1VCSUZTX01BWF9I
QVNIX0xFTl07Cj4gICAJY29uc3Qgdm9pZCAqbm9kZSA9IG1zdDsKPiArCWludCByZXQ7Cj4gICAK
PiAtCWNyeXB0b19zaGFzaF90Zm1fZGlnZXN0KGMtPmhhc2hfdGZtLCBub2RlICsgc2l6ZW9mKHN0
cnVjdCB1Ymlmc19jaCksCj4gKwlyZXQgPSBjcnlwdG9fc2hhc2hfdGZtX2RpZ2VzdChjLT5oYXNo
X3RmbSwgbm9kZSArIHNpemVvZihzdHJ1Y3QgdWJpZnNfY2gpLAo+ICAgCQkJCVVCSUZTX01TVF9O
T0RFX1NaIC0gc2l6ZW9mKHN0cnVjdCB1Ymlmc19jaCksCj4gICAJCQkJY2FsYyk7Cj4gKwlpZiAo
cmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gICAKPiAgIAlpZiAodWJpZnNfY2hlY2tfaGFzaChjLCBl
eHBlY3RlZCwgY2FsYykpCj4gICAJCXJldHVybiAtRVBFUk07Cj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
