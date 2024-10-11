Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1767ECFD35C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/EGPhYPdFihiZvQJIV3zFcyP90Wwq+4QfwthT9Z2Ks=; b=GWScWvziHlqtpqRSnFG3QXeq1J
	P0216d8LewRK7uwFd+I/iJVFs7gbgapFV6r1n860UELPMCrLmRIIPXZF6LXs0P+tIquQbdpVj6axr
	Gm5cW/gtU68gRO6pJ3E/Ha6sUWBq/OGxAcqvF1vZVS7uQIwcXy78B4fT30XfDY46fGFbmqEyOfpyx
	ryZ/RCp1MgV6FqWPzlL1fRXT2tBYRs2qDbIrm8XrkMoUL6//UIClrKrCoyOHt5t6T4HZWioU6y3EN
	OTl0cTxGMId2WFp9+2IyPoBi6sCde5GptN9kP8zgnYOHDc7igMxTG1uX7LUcV2FZ/8Wh3FE2jYuLP
	sSiA+uYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEOw-0000000GDk8-0QRp;
	Fri, 11 Oct 2024 12:05:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szENZ-0000000GDTg-2PeG
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:04:23 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XQ4xQ3cN9zpWk3;
	Fri, 11 Oct 2024 20:02:18 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D8578180105;
	Fri, 11 Oct 2024 20:04:17 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:04:17 +0800
Subject: Re: [PATCH v2 05/10] ubi: Expose max erase counter for data in sysfs
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
 <20241011092134.2909496-5-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <41d8ed89-8785-2af5-b2c2-bb18ed0bf861@huawei.com>
Date: Fri, 11 Oct 2024 20:04:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-5-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050422_513421_FC1462A3 
X-CRM114-Status: GOOD (  12.93  )
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

1NogMjAyNC8xMC8xMSAxNzoyMSwgUmlja2FyZCBBbmRlcnNzb24g0LS1wDoKPiBFeHBvc2UgbWF4
IGVyYXNlIGNvdW50ZXIgZm9yIGRhdGEgYXJlYSBpbiBzeXNmcy4gRGF0YSBhcmVhIGluY2x1ZGVz
Cj4gYWxsIGJsb2NrcyBleGNlcHQgZm9yIHRoZSBmYXN0bWFwIGFyZWEuCj4gCj4gVGhpcyB2YWx1
ZSBjYW4gYmUgdXNlZCBpbiBvcmRlciB0byBlc3RpbWF0ZSBsaWZlIGV4cGVjdGFuY3kgb2YgdGhl
Cj4gZmxhc2guCj4gCj4gU2lnbmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQu
YW5kZXJzc29uQGF4aXMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCA1
ICsrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpSZXZpZXdlZC1ieTog
WmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IGluZGV4
IGIyNTNkY2Y4NDljNy4uZjM2NDlhZmJjNzc3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3Vi
aS9idWlsZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBAQCAtMTM4LDYgKzEz
OCw4IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbWF4X2VjX2Zhc3RtYXAg
PQo+ICAgCV9fQVRUUihtYXhfZWNfZmFzdG1hcCwgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93
LCBOVUxMKTsKPiAgIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbWVhbl9lY19m
YXN0bWFwID0KPiAgIAlfX0FUVFIobWVhbl9lY19mYXN0bWFwLCBTX0lSVUdPLCBkZXZfYXR0cmli
dXRlX3Nob3csIE5VTEwpOwo+ICtzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X21h
eF9lY19kYXRhID0KPiArCV9fQVRUUihtYXhfZWNfZGF0YSwgU19JUlVHTywgZGV2X2F0dHJpYnV0
ZV9zaG93LCBOVUxMKTsKPiAgIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbWVh
bl9lY19kYXRhID0KPiAgIAlfX0FUVFIobWVhbl9lY19kYXRhLCBTX0lSVUdPLCBkZXZfYXR0cmli
dXRlX3Nob3csIE5VTEwpOwo+ICAgI2VuZGlmCj4gQEAgLTQ2NSw2ICs0NjcsOCBAQCBzdGF0aWMg
c3NpemVfdCBkZXZfYXR0cmlidXRlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ICAgCQlyZXQg
PSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tYXhfZWModWJpLCAwLCBVQklfRk1fTUFY
X1NUQVJUKSk7Cj4gICAJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X21lYW5fZWNfZmFzdG1hcCkKPiAg
IAkJcmV0ID0gc3ByaW50ZihidWYsICIlZFxuIiwgdWJpX2NhbGNfbWVhbl9lYyh1YmksIDAsIFVC
SV9GTV9NQVhfU1RBUlQpKTsKPiArCWVsc2UgaWYgKGF0dHIgPT0gJmRldl9tYXhfZWNfZGF0YSkK
PiArCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tYXhfZWModWJpLCBVQklf
Rk1fTUFYX1NUQVJULCB1YmktPnBlYl9jb3VudCkpOwo+ICAgCWVsc2UgaWYgKGF0dHIgPT0gJmRl
dl9tZWFuX2VjX2RhdGEpCj4gICAJCXJldCA9IHNwcmludGYoYnVmLCAiJWRcbiIsIHViaV9jYWxj
X21lYW5fZWModWJpLCBVQklfRk1fTUFYX1NUQVJULCB1YmktPnBlYl9jb3VudCkpOwo+ICAgI2Vu
ZGlmCj4gQEAgLTQ5OCw2ICs1MDIsNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqdWJpX2Rl
dl9hdHRyc1tdID0gewo+ICAgI2lmZGVmIENPTkZJR19NVERfVUJJX0ZBU1RNQVAKPiAgIAkmZGV2
X21heF9lY19mYXN0bWFwLmF0dHIsCj4gICAJJmRldl9tZWFuX2VjX2Zhc3RtYXAuYXR0ciwKPiAr
CSZkZXZfbWF4X2VjX2RhdGEuYXR0ciwKPiAgIAkmZGV2X21lYW5fZWNfZGF0YS5hdHRyLAo+ICAg
I2VuZGlmCj4gICAJJmRldl9yZXNlcnZlZF9mb3JfYmFkLmF0dHIsCj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
