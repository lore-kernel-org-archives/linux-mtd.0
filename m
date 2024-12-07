Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE5BE77173
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 03:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IQiR4GAooKGbDLWrSS/l0M0HYe3KS7c3A2CRda7swI=; b=tAj7KaLReObpJUO2kQMYOVypyB
	LH1Y4kEvycqB7wpqmjQYRcjd+06JBNPut+9rKN2NHUqKr00lN5ApT645UTZWlP87XR5H4H9sQgkxj
	3xS6iY7HmZ45fn8NmEefoCsh0e1ihf1UygdrS/3MDITHJUREnHx/WQq2N4P33xkFuo25FxS2TAQgY
	mk6oRiNF+0BTZs+vr9PrpNQIIXIBKAWQdxUYusBE2bs4t2t5GpDAhJKtRrTE2Xrxn8NlVyK6txCv0
	xorZTEbGkxSzViERKpJd6YhKrUqz+mks4DsaeFqNjY1jsW82AG9rglCFxVzsB8tU6/iLZTto2K+Lp
	rdPN9pOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJl5c-00000003Ezh-1aU8;
	Sat, 07 Dec 2024 03:02:40 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJl5Y-00000003Ez9-2RJv
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 03:02:38 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y4tCS1Tqjz1kvLc;
	Sat,  7 Dec 2024 11:00:04 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 490271402C7;
	Sat,  7 Dec 2024 11:02:24 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Dec 2024 11:02:23 +0800
Subject: Re: [PATCH v3 1/2] ubi: Expose interface for detailed erase counters
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241206115127.2304701-1-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6c7dd4d4-89a7-346c-4f95-d77d99d9cccc@huawei.com>
Date: Sat, 7 Dec 2024 11:02:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241206115127.2304701-1-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_190236_948371_DA5A1900 
X-CRM114-Status: GOOD (  21.08  )
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

1NogMjAyNC8xMi82IDE5OjUxLCBSaWNrYXJkIEFuZGVyc3NvbiDQtLXAOgo+IFVzaW5nIHRoZSBp
b2N0bCBjb21tYW5kICdVQklfSU9DRUNORk8nIHVzZXIgc3BhY2UgY2FuIG9idGFpbgo+IGRldGFp
bGVkIGVyYXNlIGNvdW50ZXIgaW5mb3JtYXRpb24gb2YgYWxsIGJsb2NrcyBvZiBhIGRldmljZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBSaWNrYXJkIEFuZGVyc3NvbiA8cmlja2FyZC5hbmRlcnNzb25A
YXhpcy5jb20+Cj4gLS0tCj4gICBpbmNsdWRlL3VhcGkvbXRkL3ViaS11c2VyLmggfCAzMyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNl
cnRpb25zKCspCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL210ZC91YmktdXNlci5oIGIvaW5j
bHVkZS91YXBpL210ZC91YmktdXNlci5oCj4gaW5kZXggZTE1NzE2MDMxNzVlLi5hYTg3MmE0MWZm
YjkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL210ZC91YmktdXNlci5oCj4gKysrIGIvaW5j
bHVkZS91YXBpL210ZC91YmktdXNlci5oCj4gQEAgLTE3NSw2ICsxNzUsOCBAQAo+ICAgI2RlZmlu
ZSBVQklfSU9DUlBFQiBfSU9XKFVCSV9JT0NfTUFHSUMsIDQsIF9fczMyKQo+ICAgLyogRm9yY2Ug
c2NydWJiaW5nIG9uIHRoZSBzcGVjaWZpZWQgUEVCICovCj4gICAjZGVmaW5lIFVCSV9JT0NTUEVC
IF9JT1coVUJJX0lPQ19NQUdJQywgNSwgX19zMzIpCj4gKy8qIFJlYWQgZGV0YWlsZWQgZGV2aWNl
IGVyYXNlIGNvdW50ZXIgaW5mb3JtYXRpb24gKi8KPiArI2RlZmluZSBVQklfSU9DRUNORk8gX0lP
V1IoVUJJX0lPQ19NQUdJQywgNiwgc3RydWN0IHViaV9lY2luZm9fcmVxKQo+ICAgCj4gICAvKiBp
b2N0bCBjb21tYW5kcyBvZiB0aGUgVUJJIGNvbnRyb2wgY2hhcmFjdGVyIGRldmljZSAqLwo+ICAg
Cj4gQEAgLTQxMiw2ICs0MTQsMzcgQEAgc3RydWN0IHViaV9ybnZvbF9yZXEgewo+ICAgCX0gZW50
c1tVQklfTUFYX1JOVk9MXTsKPiAgIH0gX19wYWNrZWQ7Cj4gICAKPiArLyoqCj4gKyAqIHN0cnVj
dCB1YmlfZWNpbmZvX3JlcSAtIGEgZGF0YSBzdHJ1Y3R1cmUgdXNlZCBmb3IgcmVxdWVzdGluZyBh
bmQgcmVjZWl2aW5nCj4gKyAqIGVyYXNlIGJsb2NrIGNvdW50ZXIgaW5mb3JtYXRpb24gZnJvbSBh
IFVCSSBkZXZpY2UuCj4gKyAqCj4gKyAqIEBzdGFydDogaW5kZXggb2YgZmlyc3QgcGh5c2ljYWwg
ZXJhc2UgYmxvY2sgdG8gcmVhZCAoaW4pCj4gKyAqIEBsZW5ndGg6IG51bWJlciBvZiBlcmFzZSBj
b3VudGVycyB0byByZWFkIChpbikKPiArICogQHJlYWRfbGVuZ3RoOiBudW1iZXIgb2YgZXJhc2Ug
Y291bnRlcnMgdGhhdCB3YXMgYWN0dWFsbHkgcmVhZCAob3V0KQo+ICsgKiBAcGFkZGluZzogcmVz
ZXJ2ZWQgZm9yIGZ1dHVyZSwgbm90IHVzZWQsIGhhcyB0byBiZSB6ZXJvZWQKPiArICogQGVyYXNl
X2NvdW50ZXJzOiBhcnJheSBvZiBlcmFzZSBjb3VudGVyIHZhbHVlcyAob3V0KQo+ICsgKgo+ICsg
KiBUaGlzIHN0cnVjdHVyZSBpcyB1c2VkIHRvIHJldHJpZXZlIGVyYXNlIGNvdW50ZXIgaW5mb3Jt
YXRpb24gZm9yIGEgc3BlY2lmaWVkCj4gKyAqIHJhbmdlIG9mIFBFQnMgb24gYSBVQkkgZGV2aWNl
Lgo+ICsgKiBFcmFzZSBjb3VudGVycyBhcmUgcmVhZCBmcm9tIEBzdGFydCBhbmQgYXR0ZW1wdHMg
dG8gcmVhZCBAbGVuZ3RoIG51bWJlciBvZgo+ICsgKiBlcmFzZSBjb3VudGVycy4KPiArICogVGhl
IHJldHJpZXZlZCB2YWx1ZXMgYXJlIHN0b3JlZCBpbiB0aGUgQGVyYXNlX2NvdW50ZXJzIGFycmF5
LiBJdCBpcyB0aGUKPiArICogcmVzcG9uc2liaWxpdHkgb2YgdGhlIGNhbGxlciB0byBhbGxvY2F0
ZSBlbm91Z2ggbWVtb3J5IGZvciBzdG9yaW5nIEBsZW5ndGgKPiArICogZWxlbWVudHMgaW4gdGhl
IEBlcmFzZV9jb3VudGVycyBhcnJheS4KPiArICogSWYgYSBibG9jayBpcyBiYWQgb3IgaWYgdGhl
IGVyYXNlIGNvdW50ZXIgaXMgdW5rbm93biB0aGUgY29ycmVzcG9uZGluZyB2YWx1ZQo+ICsgKiBp
biB0aGUgYXJyYXkgd2lsbCBiZSBzZXQgdG8gLTEuCj4gKyAqIFRoZSBAcmVhZF9sZW5ndGggZmll
bGQgd2lsbCBpbmRpY2F0ZSB0aGUgbnVtYmVyIG9mIGVyYXNlIGNvdW50ZXJzIGFjdHVhbGx5Cj4g
KyAqIHJlYWQuIFR5cGljYWxseSBAcmVhZF9sZW5ndGggd2lsbCBiZSBsaW1pdGVkIGR1ZSB0byBt
ZW1vcnkgb3IgdGhlIG51bWJlciBvZgo+ICsgKiBQRUJzIG9uIHRoZSBVQkkgZGV2aWNlLgo+ICsg
Ki8KPiArc3RydWN0IHViaV9lY2luZm9fcmVxIHsKPiArCV9fczMyIHN0YXJ0Owo+ICsJX19zMzIg
bGVuZ3RoOwo+ICsJX19zMzIgcmVhZF9sZW5ndGg7Cj4gKwlfX3M4ICBwYWRkaW5nWzE2XTsKPiAr
CV9fczMyIGVyYXNlX2NvdW50ZXJzW107Cj4gK30gIF9fcGFja2VkOwo+ICsKPiAgIC8qKgo+ICAg
ICogc3RydWN0IHViaV9sZWJfY2hhbmdlX3JlcSAtIGEgZGF0YSBzdHJ1Y3R1cmUgdXNlZCBpbiBh
dG9taWMgTEVCIGNoYW5nZQo+ICAgICogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlcXVl
c3RzLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
