Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4C4C54F30
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 02:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tm789ZAGTYH7CBLhoiQqC+aQf5HBrMtQWT4toEBHDg=; b=ZfXeEFORrv3ZSZ/H1NCUrPiWTC
	8S4NwkjUONPXxyCcr+oJDZBDBQvUmOkyXb2/2oI/SAFBhwXr4zPXiRraAZRd5Y8K6jDtC7d5Pq4n8
	qyiMvwW6N/bzyQAcZA3h5n+tZrempKw18Dtz4uzapCqYzF9iAxaOCiAVF4W/vrhxXSmhd3tzxvtWs
	8hn8RlkKNKe4E82ECH5bxYnnanxXjbXz3OVfCpkkomySzWSj8A4kPyKs6ggeF1/o3loIXZFhNTezv
	CuVzCAcJXCH7Mwj/okfd8oZVsQdmde2lTc7YjxoA4NKapvtbM/iYt5lMSiyH+d/KkGjsBr/xDDRHf
	zjnTvFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJNng-00000007ydi-2BmT;
	Mon, 26 May 2025 02:42:52 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJNnZ-00000007yco-2cy7
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 02:42:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4b5Klg4L4Qz2RTZ3;
	Mon, 26 May 2025 10:41:35 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 064A91A0188;
	Mon, 26 May 2025 10:42:34 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 May 2025 10:42:33 +0800
Subject: Re: [PATCH] ubi-utils: ubirsvol: resize volume using all available
 free space
To: <KAMenyaev@salutedevices.com>, <linux-mtd@lists.infradead.org>
CC: <sdfw_system_team@salutedevices.com>
References: <20250524172639.1294040-1-KAMenyaev@salutedevices.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9dce98b5-9504-67f3-fae9-32af50fac722@huawei.com>
Date: Mon, 26 May 2025 10:42:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250524172639.1294040-1-KAMenyaev@salutedevices.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_194245_831522_A8D82047 
X-CRM114-Status: GOOD (  13.68  )
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

1NogMjAyNS81LzI1IDE6MjYsIEtBTWVueWFldkBzYWx1dGVkZXZpY2VzLmNvbSDQtLXAOgo+IEZy
b206IEtvbnN0YW50aW4gTWVueWFldiA8S0FNZW55YWV2QHNhbHV0ZWRldmljZXMuY29tPgo+IAo+
IHVzZWZ1bCBpbiByZXNpemluZyBsYXN0IHViaSB2b2x1bWUsCj4gc29tZSBraW5kIG9mIGF1dG8t
cmVzaXplIHViaW5pemUgb3B0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtvbnN0YW50aW4gTWVu
eWFldiA8S0FNZW55YWV2QHNhbHV0ZWRldmljZXMuY29tPgo+IC0tLQo+ICAgdWJpLXV0aWxzL3Vi
aXJzdm9sLmMgfCA5ICsrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdWJpLXV0aWxzL3ViaXJzdm9sLmMg
Yi91YmktdXRpbHMvdWJpcnN2b2wuYwo+IGluZGV4IDczZDJmNjguLjU1ZjY3OTQgMTAwNjQ0Cj4g
LS0tIGEvdWJpLXV0aWxzL3ViaXJzdm9sLmMKPiArKysgYi91YmktdXRpbHMvdWJpcnN2b2wuYwo+
IEBAIC01Nyw4ICs1NywxMCBAQCBzdGF0aWMgY29uc3QgY2hhciBvcHRpb25zc3RyW10gPQo+ICAg
Ii1OLCAtLW5hbWU9PHZvbHVtZSBuYW1lPiAgIHZvbHVtZSBuYW1lIHRvIHJlc2l6ZVxuIgo+ICAg
Ii1zLCAtLXNpemU9PGJ5dGVzPiAgICAgICAgIHZvbHVtZSBzaXplIHZvbHVtZSBzaXplIGluIGJ5
dGVzLCBraWxvYnl0ZXMgKEtpQilcbiIKPiAgICIgICAgICAgICAgICAgICAgICAgICAgICAgICBv
ciBtZWdhYnl0ZXMgKE1pQilcbiIKPiArIiAgICAgICAgICAgICAgICAgICAgICAgICAgIHplcm8g
c2l6ZSBtZWFucyB1c2UgYWxsIGF2YWlsYWJsZSBmcmVlIGJ5dGVzXG4iCj4gICAiLVMsIC0tbGVi
cz08TEVCcyBjb3VudD4gICAgYWx0ZXJuYXRpdmUgd2F5IHRvIGdpdmUgdm9sdW1lIHNpemUgaW4g
bG9naWNhbFxuIgo+ICAgIiAgICAgICAgICAgICAgICAgICAgICAgICAgIGVyYXNlYmxvY2tzXG4i
Cj4gKyIgICAgICAgICAgICAgICAgICAgICAgICAgICB6ZXJvIHNpemUgbWVhbnMgdXNlIGFsbCBh
dmFpbGFibGUgZnJlZSBMRUJzXG4iCj4gICAiLWgsIC0/LCAtLWhlbHAgICAgICAgICAgICAgcHJp
bnQgaGVscCBtZXNzYWdlXG4iCj4gICAiLVYsIC0tdmVyc2lvbiAgICAgICAgICAgICAgcHJpbnQg
cHJvZ3JhbSB2ZXJzaW9uIjsKPiAgIAo+IEBAIC0xMTQsMTMgKzExNiwxMyBAQCBzdGF0aWMgaW50
IHBhcnNlX29wdChpbnQgYXJnYywgY2hhciAqIGNvbnN0IGFyZ3ZbXSkKPiAgIAkJc3dpdGNoIChr
ZXkpIHsKPiAgIAkJY2FzZSAncyc6Cj4gICAJCQlhcmdzLmJ5dGVzID0gdXRpbF9nZXRfYnl0ZXMo
b3B0YXJnKTsKPiAtCQkJaWYgKGFyZ3MuYnl0ZXMgPD0gMCkKPiArCQkJaWYgKGFyZ3MuYnl0ZXMg
PCAwKQo+ICAgCQkJCXJldHVybiBlcnJtc2coImJhZCB2b2x1bWUgc2l6ZTogXCIlc1wiIiwgb3B0
YXJnKTsKPiAgIAkJCWJyZWFrOwo+ICAgCj4gICAJCWNhc2UgJ1MnOgo+ICAgCQkJYXJncy5sZWJz
ID0gc2ltcGxlX3N0cnRvdWxsKG9wdGFyZywgJmVycm9yKTsKPiAtCQkJaWYgKGVycm9yIHx8IGFy
Z3MubGVicyA8PSAwKQo+ICsJCQlpZiAoZXJyb3IgfHwgYXJncy5sZWJzIDwgMCkKPiAgIAkJCQly
ZXR1cm4gZXJybXNnKCJiYWQgTEVCIGNvdW50OiBcIiVzXCIiLCBvcHRhcmcpOwo+ICAgCQkJYnJl
YWs7Cj4gICAKPiBAQCAtMjMzLDYgKzIzNSw5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICog
Y29uc3QgYXJndltdKQo+ICAgCWlmIChhcmdzLmxlYnMgIT0gLTEpCj4gICAJCWFyZ3MuYnl0ZXMg
PSAobG9uZyBsb25nKXZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzOwo+ICAgCj4gKwlpZiAo
YXJncy5sZWJzID09IDAgfHwgYXJncy5ieXRlcyA9PSAwKQo+ICsJCWFyZ3MuYnl0ZXMgPSB2b2xf
aW5mby5yc3ZkX2J5dGVzICsgZGV2X2luZm8uYXZhaWxfYnl0ZXM7Cj4gKwoKVGhlIGNvbmRpdGlv
biAnaWYgKGFyZ3MuYnl0ZXMgPT0gMCknIGlzIGVub3VnaC4gQW55d2F5CgpSZXZpZXdlZC1ieTog
WmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAgIAllcnIgPSB1YmlfcnN2
b2wobGlidWJpLCBhcmdzLm5vZGUsIGFyZ3Mudm9sX2lkLCBhcmdzLmJ5dGVzKTsKPiAgIAlpZiAo
ZXJyKSB7Cj4gICAJCXN5c19lcnJtc2coImNhbm5vdCBVQkkgcmVzaXplIHZvbHVtZSIpOwo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
