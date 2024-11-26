Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1598AD5A6DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2024 05:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5S80GPA2RdYkFGzPRo+UCppTo0ET8ev4n5hd/u0Zhw=; b=VELDPuyw3n0BW33DEcG004rUP8
	M+8oXh4OOh+3FDSvE8jt/zIMaoEDY0e4nTNYwUBMCfaezTThbC21trFDL0re7zwrzwa3m2CQSymaw
	jHdhlwSBTfJ6diVP6fWQOXvpRUTzZqhGSQ1aw462E9ItVUrH/s3PSWGxRDNruXnlkWiCPFOtPyTcO
	yPaHkVXNwkcZovr7YG3CTbJFgk3w7VqcLkjPk/j5ZpxhRq/DC4qbaVmw2UqoqjYZbSj17T0H0AjIF
	Gh2hIrGnefhCy/Lo3fW/8QBtIBtyZkRw2SGVjuShTO6DlGi3ldN4bt8DJeRsLvsmTAdOthCyK+++J
	z/GOjs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFnq4-00000009ebd-2ILq;
	Tue, 26 Nov 2024 05:10:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFnq0-00000009eZP-0zl2
	for linux-mtd@lists.infradead.org;
	Tue, 26 Nov 2024 05:10:13 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xy9ZN0K0NzqSpk;
	Tue, 26 Nov 2024 13:08:12 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3EEB3180087;
	Tue, 26 Nov 2024 13:10:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 26 Nov 2024 13:10:01 +0800
Subject: Re: [PATCH 1/2] ubi: Expose interface for detailed erase counters
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241125134820.560648-1-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5cda9495-cea9-389a-3d29-7f75af45976b@huawei.com>
Date: Tue, 26 Nov 2024 13:09:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241125134820.560648-1-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_211012_445080_F34B8980 
X-CRM114-Status: GOOD (  19.87  )
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

1NogMjAyNC8xMS8yNSAyMTo0OCwgUmlja2FyZCBBbmRlcnNzb24g0LS1wDoKPiBVc2luZyB0aGUg
aW9jdGwgY29tbWFuZCAnVUJJX0lPQ0VDTkZPJyB1c2VyIHNwYWNlIGNhbiBvYnRhaW4KPiBkZXRh
aWxlZCBlcmFzZSBjb3VudGVyIGluZm9ybWF0aW9uIG9mIGFsbCBibG9ja3Mgb2YgYSBkZXZpY2Uu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29u
QGF4aXMuY29tPgo+IC0tLQo+ICAgaW5jbHVkZS91YXBpL210ZC91YmktdXNlci5oIHwgMjUgKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL210ZC91YmktdXNlci5oIGIvaW5jbHVk
ZS91YXBpL210ZC91YmktdXNlci5oCj4gaW5kZXggZTE1NzE2MDMxNzVlLi42Njc2ODBlNDRlZDQg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL210ZC91YmktdXNlci5oCj4gKysrIGIvaW5jbHVk
ZS91YXBpL210ZC91YmktdXNlci5oCj4gQEAgLTE3NSw2ICsxNzUsOCBAQAo+ICAgI2RlZmluZSBV
QklfSU9DUlBFQiBfSU9XKFVCSV9JT0NfTUFHSUMsIDQsIF9fczMyKQo+ICAgLyogRm9yY2Ugc2Ny
dWJiaW5nIG9uIHRoZSBzcGVjaWZpZWQgUEVCICovCj4gICAjZGVmaW5lIFVCSV9JT0NTUEVCIF9J
T1coVUJJX0lPQ19NQUdJQywgNSwgX19zMzIpCj4gKy8qIFJlYWQgZGV0YWlsZWQgZGV2aWNlIGVy
YXNlIGNvdW50ZXIgaW5mb3JtYXRpb24gKi8KPiArI2RlZmluZSBVQklfSU9DRUNORk8gX0lPV1Io
VUJJX0lPQ19NQUdJQywgNiwgc3RydWN0IHViaV9lY2luZm9fcmVxKQo+ICAgCj4gICAvKiBpb2N0
bCBjb21tYW5kcyBvZiB0aGUgVUJJIGNvbnRyb2wgY2hhcmFjdGVyIGRldmljZSAqLwo+ICAgCj4g
QEAgLTQ3MCw0ICs0NzIsMjcgQEAgc3RydWN0IHViaV9ibGtjcmVhdGVfcmVxIHsKPiAgIAlfX3M4
ICBwYWRkaW5nWzEyOF07Cj4gICB9ICBfX3BhY2tlZDsKPiAgIAo+ICsvKioKPiArICogc3RydWN0
IHViaV9lY2luZm9fcmVxIC0gYSBkYXRhIHN0cnVjdHVyZSB1c2VkIGluIFVCSSBkZXZpY2UgZXJh
c2UgY291bnQKPiArICogaW5mb3JtYXRpb24gcmVxdWVzdHMgYW5kIHJlc3BvbnNlcy4KPiArICoK
PiArICogQHN0YXJ0X2VjX3JlcTogZmlyc3QgZXJhc2UgY291bnRlciBibG9jayBpbiByYW5nZSB0
byByZWFkCj4gKyAqIEBlbmRfZWNfcmVxOiBsYXN0IGVyYXNlIGNvdW50ZXIgYmxvY2sgaW4gdGhl
IGhhbGYtb3BlbiByYW5nZQo+ICsgKiBAZW5kX2VjX3JlczogbGFzdCBlcmFzZSBjb3VudGVyIGJs
b2NrIHRoYXQgd2FzIGFjdHVhbGx5IHJlYWQKPiArICogQGVyYXNlX2NvdW50ZXJzOiBhcnJheSBv
ZiBlcmFzZSBjb3VudGVyIHZhbHVlcwo+ICsgKiBAcGFkZGluZzogcmVzZXJ2ZWQgZm9yIGZ1dHVy
ZSwgbm90IHVzZWQsIGhhcyB0byBiZSB6ZXJvZWQKPiArICoKPiArICogRXJhc2UgY291bnRlcnMg
YXJlIHJlYWQgaW4gcmFuZ2UgQHN0YXJ0X2VjX3JlcSB0byBAZW5kX2VjX3JlcS4gUmFuZ2UgaXMg
aGFsZi1vcGVuCj4gKyAqIGkuZSBlcmFzZSBjb3VudGVyIG9mIGVuZF9lY19yZXEgaXMgbm90IGFj
dHVhbGx5IGluY2x1ZGVkLgo+ICsgKiBUaGUgcmVhZCBlcmFzZSBjb3VudGVycyBhcmUgcGxhY2Vk
IGluIEBlcmFzZV9jb3VudGVycy4gSWYgYSBibG9jayBpcyBiYWQgb3IgaWYgdGhlCj4gKyAqIGVy
YXNlIGNvdW50ZXIgaXMgdW5rbm93biB0aGUgdmFsdWUgb2YgdGhlIGJsb2NrIHdpbGwgYmUgc2V0
IHRvIC0xLgo+ICsgKi8KPiArc3RydWN0IHViaV9lY2luZm9fcmVxIHsKPiArCV9fczMyIHN0YXJ0
X2VjX3JlcTsKPiArCV9fczMyIGVuZF9lY19yZXE7Cj4gKwlfX3MzMiBlbmRfZWNfcmVzOwo+ICsJ
X19zMzIgZXJhc2VfY291bnRlcnNbMTAwMF07Cj4gKwlfX3M4ICBwYWRkaW5nWzg0XTsKPiArfSAg
X19wYWNrZWQ7Cj4gKwoKSGkgUmlja2FyZCwgcGxlYXNlIG1vdmUgdGhlIGRlZmluaXRpb24gb2Yg
J3ViaV9lY2luZm9fcmVxJyBiZXR3ZWVuIAondWJpX3Judm9sX3JlcScgYW5kICd1YmlfbGViX2No
YW5nZV9yZXEnLiBUaGUgbGFzdCBwYXJ0IGluIAonaW5jbHVkZS91YXBpL210ZC91YmktdXNlci5o
JyBkZWZpbmVzIGFsbCBzdHJ1Y3R1cmVzIGZvciB0aGUgdWJpIHZvbHVtZSAKaW9jdGwuCj4gICAj
ZW5kaWYgLyogX19VQklfVVNFUl9IX18gKi8KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
