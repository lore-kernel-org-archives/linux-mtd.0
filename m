Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACD0CF9C69
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 11:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2di72MP0i+R4k3MopVF/i68BX0C9kRxuEPjYfUxFCkQ=; b=Bn84s9nV1lxasclOoDLwE7guJm
	3qbVCL70BgTAjniM9R+NRzx2yM06fiuounF1NeQlBi4yNbmkIgiJS8dZkOAtC3bE79oSrFgiDyZtB
	/ghkyxdWKJAptvonSgJHN8yksz+Mw2tAWZlI3J/qYrtoqa8g5QFal6kl6/eZ5zJLORC0+r5SHojOP
	vV0JVt16F+vDl0pdJEZocUFsr2PCufCXlY5XC5pqr100KYYOwzHShnT1ZR7BEN85wQ6MRKloNAJE1
	ulcZqp1GRtzfQQAAe12u0Dtru3kad/oNY/tTnJQjFuJ+UZ0KcRtO6z8g+3LRNl5to8gfJFTlJuedw
	T6ns7WYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssgpZ-0000000H2Nz-1VgD;
	Mon, 23 Sep 2024 11:02:13 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssgpW-0000000H2MH-30V3
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 11:02:12 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XC0Mk3dKJz1HKWw;
	Mon, 23 Sep 2024 18:58:10 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id C99C61A016C;
	Mon, 23 Sep 2024 19:01:58 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 19:01:58 +0800
Subject: Re: [PATCH v1] jffs2: Correct some typos in comments
To: Shen Lichuan <shenlichuan@vivo.com>, <dwmw2@infradead.org>,
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<opensource.kernel@vivo.com>
References: <20240923083322.13383-1-shenlichuan@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ece4eab6-b8e6-603a-5c59-26c025d394bb@huawei.com>
Date: Mon, 23 Sep 2024 19:01:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240923083322.13383-1-shenlichuan@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_040211_028505_0229E22F 
X-CRM114-Status: GOOD (  16.00  )
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

1NogMjAyNC85LzIzIDE2OjMzLCBTaGVuIExpY2h1YW4g0LS1wDoKPiBGaXhlZCBzb21lIGNvbmZ1
c2luZyBzcGVsbGluZyBlcnJvcnMsIHRoZSBkZXRhaWxzIGFyZSBhcyBmb2xsb3dzOgo+IAo+IC1p
biB0aGUgY29kZSBjb21tZW50czoKPiAJd2F0aW5nCQktPiB3YWl0aW5nCj4gCXN1Y2NlZnVsbHkJ
LT4gc3VjY2Vzc2Z1bGx5Cj4gCj4gU2lnbmVkLW9mZi1ieTogU2hlbiBMaWNodWFuIDxzaGVubGlj
aHVhbkB2aXZvLmNvbT4KPiAtLS0KPiAgIGZzL2pmZnMyL2djLmMgICAgICAgIHwgMiArLQo+ICAg
ZnMvamZmczIvcmVhZGlub2RlLmMgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRpZmYgLS1naXQgYS9mcy9qZmZzMi9nYy5jIGIvZnMv
amZmczIvZ2MuYwo+IGluZGV4IDgyMjk0OWQwZWIwMC4uMWI4MzNiYmZmY2Y1IDEwMDY0NAo+IC0t
LSBhL2ZzL2pmZnMyL2djLmMKPiArKysgYi9mcy9qZmZzMi9nYy5jCj4gQEAgLTgyLDcgKzgyLDcg
QEAgc3RhdGljIHN0cnVjdCBqZmZzMl9lcmFzZWJsb2NrICpqZmZzMl9maW5kX2djX2Jsb2NrKHN0
cnVjdCBqZmZzMl9zYl9pbmZvICpjKQo+ICAgCj4gICAJCW5leHRsaXN0ID0gJmMtPmVyYXNhYmxl
X2xpc3Q7Cj4gICAJfSBlbHNlIGlmICghbGlzdF9lbXB0eSgmYy0+ZXJhc2FibGVfcGVuZGluZ193
YnVmX2xpc3QpKSB7Cj4gLQkJLyogVGhlcmUgYXJlIGJsb2NrcyBhcmUgd2F0aW5nIGZvciB0aGUg
d2J1ZiBzeW5jICovCj4gKwkJLyogVGhlcmUgYXJlIGJsb2NrcyBhcmUgd2FpdGluZyBmb3IgdGhl
IHdidWYgc3luYyAqLwo+ICAgCQlqZmZzMl9kYmcoMSwgIlN5bmNoaW5nIHdidWYgaW4gb3JkZXIg
dG8gcmV1c2UgZXJhc2FibGVfcGVuZGluZ193YnVmX2xpc3QgYmxvY2tzXG4iKTsKPiAgIAkJc3Bp
bl91bmxvY2soJmMtPmVyYXNlX2NvbXBsZXRpb25fbG9jayk7Cj4gICAJCWpmZnMyX2ZsdXNoX3di
dWZfcGFkKGMpOwo+IGRpZmYgLS1naXQgYS9mcy9qZmZzMi9yZWFkaW5vZGUuYyBiL2ZzL2pmZnMy
L3JlYWRpbm9kZS5jCj4gaW5kZXggMDNiNGY5OTYxNGJlLi5mOTg3Zjc4YTg5NGUgMTAwNjQ0Cj4g
LS0tIGEvZnMvamZmczIvcmVhZGlub2RlLmMKPiArKysgYi9mcy9qZmZzMi9yZWFkaW5vZGUuYwo+
IEBAIC03Miw3ICs3Miw3IEBAIHN0YXRpYyBpbnQgY2hlY2tfbm9kZV9kYXRhKHN0cnVjdCBqZmZz
Ml9zYl9pbmZvICpjLCBzdHJ1Y3QgamZmczJfdG1wX2Rub2RlX2luZm8KPiAgIAkJaWYgKGVyciAh
PSAtRU9QTk9UU1VQUCkKPiAgIAkJCUpGRlMyX1dBUk5JTkcoIk1URCBwb2ludCBmYWlsZWQ6IGVy
cm9yIGNvZGUgJWQuXG4iLCBlcnIpOwo+ICAgCX0gZWxzZQo+IC0JCXBvaW50ZWQgPSAxOyAvKiBz
dWNjZWZ1bGx5IHBvaW50ZWQgdG8gZGV2aWNlICovCj4gKwkJcG9pbnRlZCA9IDE7IC8qIHN1Y2Nl
c3NmdWxseSBwb2ludGVkIHRvIGRldmljZSAqLwo+ICAgI2VuZGlmCj4gICAKPiAgIAlpZiAoIXBv
aW50ZWQpIHsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
