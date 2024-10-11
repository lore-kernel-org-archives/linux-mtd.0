Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D490BCFD36B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh2WB3Q5aEcMXvtahkobJBuybZxB5N+TyNvBuTNHRsU=; b=oKmxI8GrkT3YE0qMOmtauJPvi2
	kAikDL5UgzS2zh5N4OUkthgb/w0Qov7g6krLyKpEfDLoCAu/uYruh4jLXC5Lf8ENEbfzEbI080/Qm
	+fjlaOWUaTGTwW9YdAJOl1PhFX9VxSaWwGoVpizNHWvz8hkkdgU/JjM1I8EX4+IPDQAHqb+LxTMF7
	WZsb97RY2KLsLOwu5UnDKocBN+lqod2jOJkZtrM4pl//HMcWseiHWdxJABB9UXsrqykhSsVRb/jP4
	liddI9YZsKQHkLIa4nddxe2fSuQmukC3QG7ArpkJ6cA76jvkTdD+EdozeQ1LB4ZegsKOIGtU5/YdQ
	fvHufUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szENU-0000000GDS0-09bA;
	Fri, 11 Oct 2024 12:04:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szENQ-0000000GDPr-1nbE
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:04:13 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XQ4xB1927zpVDS;
	Fri, 11 Oct 2024 20:02:06 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 85DA6180064;
	Fri, 11 Oct 2024 20:04:05 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:04:04 +0800
Subject: Re: [PATCH v2 04/10] ubi: Expose mean erase counter for data in sysfs
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
 <20241011092134.2909496-4-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6fad01e9-9b93-ed79-183a-fb2011c9ec97@huawei.com>
Date: Fri, 11 Oct 2024 20:04:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-4-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050412_757573_96345F37 
X-CRM114-Status: GOOD (  13.35  )
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

1NogMjAyNC8xMC8xMSAxNzoyMSwgUmlja2FyZCBBbmRlcnNzb24g0LS1wDoKPiBFeHBvc2UgbWVh
biBlcmFzZSBjb3VudGVyIGZvciBkYXRhIGFyZWEgaW4gc3lzZnMuIERhdGEgYXJlYSBpbmNsdWRl
cwo+IGFsbCBibG9ja3MgZXhjZXB0IGZvciB0aGUgZmFzdG1hcCBhcmVhLgo+IAo+IFRoaXMgdmFs
dWUgY2FuIGJlIHVzZWQgaW4gb3JkZXIgdG8gZXN0aW1hdGUgbGlmZSBleHBlY3RhbmN5IG9mIHRo
ZQo+IGZsYXNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2thcmQgQW5kZXJzc29uIDxyaWNrYXJk
LmFuZGVyc3NvbkBheGlzLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwg
NSArKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6
IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBpbmRl
eCBmNWEzYTNmN2Q0OTAuLmIyNTNkY2Y4NDljNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91
YmkvYnVpbGQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gQEAgLTEzOCw2ICsx
MzgsOCBAQCBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X21heF9lY19mYXN0bWFw
ID0KPiAgIAlfX0FUVFIobWF4X2VjX2Zhc3RtYXAsIFNfSVJVR08sIGRldl9hdHRyaWJ1dGVfc2hv
dywgTlVMTCk7Cj4gICBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgZGV2X21lYW5fZWNf
ZmFzdG1hcCA9Cj4gICAJX19BVFRSKG1lYW5fZWNfZmFzdG1hcCwgU19JUlVHTywgZGV2X2F0dHJp
YnV0ZV9zaG93LCBOVUxMKTsKPiArc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9t
ZWFuX2VjX2RhdGEgPQo+ICsJX19BVFRSKG1lYW5fZWNfZGF0YSwgU19JUlVHTywgZGV2X2F0dHJp
YnV0ZV9zaG93LCBOVUxMKTsKPiAgICNlbmRpZgo+ICAgc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0
cmlidXRlIGRldl9yZXNlcnZlZF9mb3JfYmFkID0KPiAgIAlfX0FUVFIocmVzZXJ2ZWRfZm9yX2Jh
ZCwgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93LCBOVUxMKTsKPiBAQCAtNDYzLDYgKzQ2NSw4
IEBAIHN0YXRpYyBzc2l6ZV90IGRldl9hdHRyaWJ1dGVfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4gICAJCXJldCA9IHNwcmludGYoYnVmLCAiJWRcbiIsIHViaV9jYWxjX21heF9lYyh1YmksIDAs
IFVCSV9GTV9NQVhfU1RBUlQpKTsKPiAgIAllbHNlIGlmIChhdHRyID09ICZkZXZfbWVhbl9lY19m
YXN0bWFwKQo+ICAgCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tZWFuX2Vj
KHViaSwgMCwgVUJJX0ZNX01BWF9TVEFSVCkpOwo+ICsJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X21l
YW5fZWNfZGF0YSkKPiArCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tZWFu
X2VjKHViaSwgVUJJX0ZNX01BWF9TVEFSVCwgdWJpLT5wZWJfY291bnQpKTsKPiAgICNlbmRpZgo+
ICAgCWVsc2UgaWYgKGF0dHIgPT0gJmRldl9yZXNlcnZlZF9mb3JfYmFkKQo+ICAgCQlyZXQgPSBz
cHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmktPmJlYl9yc3ZkX3BlYnMpOwo+IEBAIC00OTQsNiArNDk4
LDcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKnViaV9kZXZfYXR0cnNbXSA9IHsKPiAgICNp
ZmRlZiBDT05GSUdfTVREX1VCSV9GQVNUTUFQCj4gICAJJmRldl9tYXhfZWNfZmFzdG1hcC5hdHRy
LAo+ICAgCSZkZXZfbWVhbl9lY19mYXN0bWFwLmF0dHIsCj4gKwkmZGV2X21lYW5fZWNfZGF0YS5h
dHRyLAo+ICAgI2VuZGlmCj4gICAJJmRldl9yZXNlcnZlZF9mb3JfYmFkLmF0dHIsCj4gICAJJmRl
dl9iYWRfcGViX2NvdW50LmF0dHIsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
