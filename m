Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9FCC25B08
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Aug 2022 06:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmI70yS+MbFL72VL/k8Moli83r3nvEMsFRGOoKC92MI=; b=ntHJ5boETgdmELA06uVNEmuOJw
	FWvMaKQUdObyJ5ZjDNYijZAmuRhXsvGOaZdapAWSGZN3czsc2IFmcelR6rGzBvmRRihdcQI17Gk7G
	Twj7YRfdQpcn3M9DZ/ychRCyzU5nevnAMY6qTruqJYMqU1PsLIoFC3QM5+y3Z9bIGHgzAZXoaeDxO
	vAb7gKe2UJT/7Yzg6gmgpGo8if+PWmDSEJ01vptoPdoHvoLrxNuIWLNOPF3c2f4HOVmI+z7yGAKia
	hRH/tc0i8GtH+TK0yQaM65Y5mIcHJ3MPXqbcmG76ZNdms4uGM2b5203xXNohfhWgAmjLOhwbVO6UP
	khZo8Wyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCF6-00BhrI-DK; Wed, 17 Aug 2022 06:09:28 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCF3-00Bhmo-33
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2022 06:09:27 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4M6yFM3R7wzlWJx;
	Wed, 17 Aug 2022 14:06:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 14:09:19 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 14:09:18 +0800
Subject: Re: [PATCH] mtd/ubi/block: Remove a semicolon
To: Li zeming <zeming@nfschina.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220817011406.3117-1-zeming@nfschina.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1c453512-6e88-9bc0-fa3a-ac6028fc8662@huawei.com>
Date: Wed, 17 Aug 2022 14:09:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20220817011406.3117-1-zeming@nfschina.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_230925_350960_AD10464A 
X-CRM114-Status: GOOD (  10.43  )
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

1NogMjAyMi84LzE3IDk6MTQsIExpIHplbWluZyDQtLXAOgpSZXZpZXdlZC1ieTogWmhpaGFvIENo
ZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCj4gUmVtb3ZlIHRoZSByZXBlYXRlZCAnOycg
ZnJvbSBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpIHplbWluZyA8emVtaW5nQG5mc2NoaW5h
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9ibG9jay5jIHwgMiArLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jIGIvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBpbmRl
eCA0Y2Y2N2EyYTBkMDQuLjRmYzdlNzU2ZDg4NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91
YmkvYmxvY2suYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gQEAgLTQwOSw3ICs0
MDksNyBAQCBpbnQgdWJpYmxvY2tfY3JlYXRlKHN0cnVjdCB1Ymlfdm9sdW1lX2luZm8gKnZpKQo+
ICAgCXJldCA9IGJsa19tcV9hbGxvY190YWdfc2V0KCZkZXYtPnRhZ19zZXQpOwo+ICAgCWlmIChy
ZXQpIHsKPiAgIAkJZGV2X2VycihkaXNrX3RvX2RldihkZXYtPmdkKSwgImJsa19tcV9hbGxvY190
YWdfc2V0IGZhaWxlZCIpOwo+IC0JCWdvdG8gb3V0X2ZyZWVfZGV2OzsKPiArCQlnb3RvIG91dF9m
cmVlX2RldjsKPiAgIAl9Cj4gICAKPiAgIAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
