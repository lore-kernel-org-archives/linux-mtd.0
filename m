Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDFEC48BC4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 07:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5Pvw5FqByPyAy04YexnckD5KhKz5GPki69AFyjLiOI=; b=UtKFBVcTj0ZZ/E/tCczmO96Ruv
	8R89ljoWAJ9SzMeh7PBPtOGTY/e0FuPyVdoCKeAQWZ0zfDALlYmtbc89ioJ3sqyb/5re2wxPiHnW4
	6rz0lYG8M693OHZ7coz/H8Imhzn8jd5qtuzoWDs/AZonkjiaN3ipwhRrLG4USTqJB4zkjoukcbzkJ
	kYgKRgBvA7Dw1N6YjIodB1qCUjRdVJZhLCAXxduuAm4yHzMRj4mtPGGk6GwW38n4zs4iMAqjggiUw
	aai6157KjOJAQhsFM6G/uhJzrIECjHNtp7O12HI/iy4/sRQoxa8KlDEm9Lp/gF/NIWn/ALpDsI03N
	mHHEpUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdPjV-00000008GVw-17JQ;
	Fri, 23 Feb 2024 07:12:33 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdPj0-00000008GTP-3esd
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 07:12:11 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Th1Q33sgFz1vv2J;
	Fri, 23 Feb 2024 15:11:07 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D8A7140158;
	Fri, 23 Feb 2024 15:11:42 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 15:11:41 +0800
Subject: Re: ubi: why ubi wear leveling always pick highly worn-out free
 physical eraseblock as the mov_to target
To: Ryder Wang <rydercoding@hotmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>
References: <MEYP282MB3164FE84067710E5AC8D34A9BF7A2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <MEYP282MB3164D303B64CFF576D2FD741BF552@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c14e432f-a03d-782b-48f5-f77577e29e83@huawei.com>
Date: Fri, 23 Feb 2024 15:11:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB3164D303B64CFF576D2FD741BF552@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_231205_507485_D87A198D 
X-CRM114-Status: GOOD (  11.21  )
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

1NogMjAyNC8yLzIzIDExOjI3LCBSeWRlciBXYW5nINC0tcA6Cj4gUmVmZXIgdG8gdGhlIHViaSBz
b3VyY2UgY29kZToKPiB3ZWFyX2xldmVsaW5nX3dvcmtlcgo+ICAgIGUyID0gZ2V0X3BlYl9mb3Jf
d2wodWJpKQo+ICAgICAgZSA9IGZpbmRfd2xfZW50cnkodWJpLCAmdWJpLT5mcmVlLCBXTF9GUkVF
X01BWF9ESUZGKTsKPiAgICAgICAgCj4gVGhlIGZ1bmN0aW9uIGZpbmRfd2xfZW50cnkoKSBhbHdh
eXMgZmluZCB0aGUgIGhpZ2hseSB3b3JuLW91dCBmcmVlIHBoeXNpY2FsIGVyYXNlYmxvY2sgKGUy
KToKPiAxLiBJdCdzIGdvb2QgdG8gY2hlY2sgc3VjaCBQRUIgKGUyKSB0byBkZWNpZGUgd2hldGhl
ciB0aGUgZm9sbG93aW5nIHdlYXIgbGV2ZWxpbmcgcHJvY2VkdXJlIHNob3VsZCBiZSBjb250aW51
ZWQgYWNjb3JkaW5nIHRvIFVCSV9XTF9USFJFU0hPTEQuCj4gMi4gQnV0IHBlcnNvbmFsbHkgSSBj
YW4ndCB1bmRlcnN0YW5kIHdoeSBzdWNoIGhpZ2ggd29ybi1vdXQgZnJlZSBwaHlzaWNhbCBlcmFz
ZWJsb2NrIHNob3VsZCBhbHNvIGJlIHVzZWQgYXMgdGFyZ2V0IFBFQihtb3ZlX3RvKSB0byBzdG9y
ZSB0aGUgbW92ZV9mcm9tIGRhdGEgZm9yIHdlYXIgbGV2ZWxpbmcgcHVycG9zZS4gV2lsbCBpdCBi
ZSBtdWNoIG1vcmUgcmVhc29uYWJsZSB0byB1c2UgbG93IHdvcm4tb3V0IGZyZWUgcGh5c2ljYWwg
ZXJhc2VibG9jayAoZnJvbSB1YmktPmZyZWUgdHJlZSkgaW4gdGhpcyBjYXNlIGZvciBtb3JlIHBl
cmZlY3Qgd2VhciBsZXZlbGluZz8uCj4gCgpOb3JtYWxseSwgZTEgaXMgdGhlIHNtYWxsZXIgZWMg
Y291bnRlciBwaWNrZWQgZnJvbSB1YmktPnVzZWQsIGUyIGlzIApiaWdnZXIgZWMgY291bnRlciBw
aWNrZWQgZnJvbSB1YmktPmZyZWUsIHRoZSB3ZWFyLWxldmVsaW5nIHdvcmtlciAKZm9sbG93cyB0
aGF0IHJ1bGUgd2hpY2ggaXMgYmFzZWQgb24gdGhlIHJlYWxpemF0aW9uIG9mIGZyZWUgUEVCcyBm
ZXRjaGluZy4KRmlyc3QsIGxldCdzIHRhbGsgYWJvdXQgdGhlIHNpbXBsZXN0IGNhc2Ugd2l0aG91
dCBmYXN0bWFwLCBhc3N1bXB0IHRoYXQgCkNPTkZJR19NVERfVUJJX1dMX1RIUkVTSE9MRD0yLCB0
aGVyZSBhcmUgdG90YWwgMyBQRUJzLgpPbmx5IDEgRUIoZXJhc2UgYmxvY2spIGlzIHVzZWQsIHRo
ZW4gZnJlZSBpdCwgYW5kIHJlcGVhdCB0aGUgcHJvY2VzcyAKZm9ydmV2ZXIuIEFjY29yZGluZyB0
byB0aGUgaW1wbGVtZW50YXRpb24gaW4gCnViaV93bF9nZXRfcGViLT53bF9nZXRfd2xlLT5maW5k
X21lYW5fd2xfZW50cnksIHRoZSB1YmktPmZyZWUgdHJlZSB3aWxsIApjaGFuZ2UgbGlrZToKKDEs
MSwxKSAtPiAoMSwxLDIpIC0+ICgxLDIsMikgLT4gKDEsMiwzKSAtPiAoMSwzLDMpIC0+IC4uLiAt
PiAoMSw0LDUpIC0+IAooMiw0LDUpLCB3aGljaCBtZWFucyB0aGF0IHdlYXItbGV2ZWxpbmcgd29y
a2VyIGlzIG5vdCBuZWVkZWQsIGJlY2F1c2UgCmZpbmRfbWVhbl93bF9lbnRyeSBoYXMgbWFkZSBz
dXJlIHRoYXQgJ21heF9lYyAtIG1pbl9lYyA8PSAyICogCkNPTkZJR19NVERfVUJJX1dMX1RIUkVT
SE9MRCcuIFNpbWlsYXIsIHdoZW4gdGhlcmUgYXJlIG1vcmUgRUJzIGFyZSB1c2VkIAphbmQgZnJl
ZWQsIHRoZXJlIGlzIG5vIG5lZWQgdG8gdHJpZ2dlciB3ZWFyLWxldmVsaW5nIHdvcmsuCkhvd2V2
ZXIsIGlmIG9uZSBmcmVlIFBFQiBpcyB0YWtlbiBhbmQgbm90IGJlIGZyZWVkLCBvdGhlciBmcmVl
IFBFQnMgYXJlIAp0YWtlbiBhbmQgZnJlZWQsIGxpa2U6CnViaS0+dXNlZDogMQp1YmktPmZyZWU6
ICgxLCAxKSAtPiAoMSwgMikgLT4gLi4uICh4LCB5KQpBZnRlciBhIHdoaWxlLCBtaW4oeCx5KSAt
IDEgd2lsbCBiZSBncmVhdGVyIHRoYW4gCjIqQ09ORklHX01URF9VQklfV0xfVEhSRVNIT0xELiBU
aGVuLCB3ZWFyLWxldmVsaW5nIHNob3VsZCBzdGFydCB3b3JraW5nLCAKY29sZCBkYXRhIGFsd2F5
cyB0YWtlcyBjZXJ0YWluIFBFQiBmb3IgYSBsb25nIHRpbWUsIHdoaWNoIGNhdXNlcyBQRUJzIAp3
aXRoIHNtYWxsZXIgZWMgY291bnRlciBnYXRoZXIgaW4gdWJpLT51c2VkIGFuZCBQRUJzIHdpdGgg
YmlnZ2VyIGVjIApjb3VudGVyIGdhdGhlciBpbiB1YmktPmZyZWVkLgpJIHRoaW5rIHRoYXQncyB0
aGUgZXhwbGFpbmF0aW9ucyBvZiB0aGUgcnVsZSBob3cgdG8gcGljayBlMS9lMi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
