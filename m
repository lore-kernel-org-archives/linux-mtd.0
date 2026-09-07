Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE28C79FA0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXTUAZIeiLf9qzJ+o/7HcOrLZ73JV8GmERi6DcjVwBM=; b=MWdNTCBLSqV0NbA0FzjO2SiCSU
	sqfqAZ06Wp05I6HCUVmf+YJx4Rgoyw2GzdtIU6aSzs7L1jTH64LtLQzUOyT3Z7wOCP59iyjwiIOmd
	WlJub115nYcGMwZGm1/nJMXG/qRxsHsTLAYDojJfoD9LIepWs2jg0uK0mohfJM7OZthwZcO9Gt5hd
	o95xouZFEw5Ev4xLnRwCiMHqBG6FXeHkLcTPCDnDM95en6arKbnW0cnOZhLZiv1EqodGepR/wQweZ
	YS5uB4SADsM0zsRbAdKekKtBxXFafUija0WmQpAH9VkCmaPHZw9yJSEyviEDOMQN8M/ZHqDnXmNr7
	aP32YOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T8o-000000063U9-1wvP;
	Mon, 07 Sep 2026 06:47:42 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T8l-000000063QC-1zNF
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 06:47:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fH2rWvrUYoJAcy+LEQqi2jnZ83+Fb9pIuufTdnEsnwo=;
	b=RnQKJ+IdQcQIGA+6kd7JcPPOeg2u5ZT0Sr0Ar5DVNSSSm79brsGdzS4bCwH6vVOzxXG6h4x2m
	TgN5lTU3dUSOvdmReB8ceyfA/Hx/PrU800oJBX+i9z3xG7SWbvx8BKzgCcoBUrhaXW/xStC7xcH
	I+oczq85Zt3EIke+HoqfeIs=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hdclj6BmbzpT0h;
	Mon,  7 Sep 2026 14:36:01 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 493462025F;
	Mon,  7 Sep 2026 14:47:31 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 7 Sep 2026 14:47:30 +0800
Subject: Re: [PATCH] mtd: ubi: fix typo "occured" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>, Richard Weinberger
	<richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh
 Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260907063111.19769-1-hemanth.selam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <de859d54-615f-8e64-79df-9d207cde6d1b@huawei.com>
Date: Mon, 7 Sep 2026 14:47:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260907063111.19769-1-hemanth.selam@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_234740_013532_1866AC41 
X-CRM114-Status: GOOD (  14.97  )
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

1NogMjAyNi85LzcgMTQ6MzEsIEhlbWFudGggU2VsYW0g0LS1wDoKPiBDb3JyZWN0ICJvY2N1cmVk
IiB0byAib2NjdXJyZWQiLCByZXBvcnRlZCBieSBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgdXNpbmcK
PiB0aGUgbWlzc3BlbGxpbmcgbGlzdCBpbiBzY3JpcHRzL3NwZWxsaW5nLnR4dC4gIE9ubHkgdG91
Y2hlcyBjb21tZW50cywgbm8KPiBjb2RlIGNoYW5nZXMuCj4gCj4gQXNzaXN0ZWQtYnk6IEN1cnNv
cjpjbGF1ZGUtb3B1cy01Cj4gU2lnbmVkLW9mZi1ieTogSGVtYW50aCBTZWxhbSA8aGVtYW50aC5z
ZWxhbUBnbWFpbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91Ymkvd2wuYyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAoKUmV2aWV3
ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3ViaS93bC5jIGIvZHJpdmVycy9tdGQvdWJpL3dsLmMKPiBpbmRleCA1
YTBkYjkyOGE5MGUuLjQ0MjM3ZGU1MjI1MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91Ymkv
d2wuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS93bC5jCj4gQEAgLTE0ODYsNyArMTQ4Niw3IEBA
IHN0YXRpYyBib29sIHNjcnViX3Bvc3NpYmxlKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVj
dCB1Ymlfd2xfZW50cnkgKmUpCj4gICAgKiBAcG51bTogdGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sg
dG8gc2NoZWR1bGUKPiAgICAqIEBmb3JjZTogZG9uJ3QgcmVhZCB0aGUgYmxvY2ssIGFzc3VtZSBi
aXRmbGlwcyBoYXBwZW5lZCBhbmQgdGFrZSBhY3Rpb24uCj4gICAgKgo+IC0gKiBUaGlzIGZ1bmN0
aW9uIHJlYWRzIHRoZSBnaXZlbiBlcmFzZWJsb2NrIGFuZCBjaGVja3MgaWYgYml0ZmxpcHMgb2Nj
dXJlZC4KPiArICogVGhpcyBmdW5jdGlvbiByZWFkcyB0aGUgZ2l2ZW4gZXJhc2VibG9jayBhbmQg
Y2hlY2tzIGlmIGJpdGZsaXBzIG9jY3VycmVkLgo+ICAgICogSW4gY2FzZSBvZiBiaXRmbGlwcywg
dGhlIGVyYXNlYmxvY2sgaXMgc2NoZWR1bGVkIGZvciBzY3J1YmJpbmcuCj4gICAgKiBJZiBzY3J1
YmJpbmcgaXMgZm9yY2VkIHdpdGggQGZvcmNlLCB0aGUgZXJhc2VibG9jayBpcyBub3QgcmVhZCwK
PiAgICAqIGJ1dCBzY2hlZHVsZWQgZm9yIHNjcnViYmluZyByaWdodCBhd2F5Lgo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
