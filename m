Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2976FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 13:02:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00B860C41
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 13:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F00B860C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Kl/sBTKK8M5FUjz+4qtTq7EsW7LEdp1Ajt9k3auHmQ=; b=V/jA40sBiuMThiqNVEEoTGq6++
	7yyCtvzZG9wIohgZkuq89Rb/SUXQ7Oj+dSFpFm92OXa5oB0slHLW5xmI9BymdxHAMZwKG2ZkwdN2P
	HpL6FYocahefiEujaSLgG4BOG7D7skFEg1hTuwUj4O/lkmNomwaKf2ZdnXXCAPkCpM0q/gq9jvvFY
	E76uuOl6yYvriIMJ0rcB3/yUPXBn3UgcE1q6sDryDytUJmSIEuytWMOK+pHMlCmLdZYnCUOldMStG
	pNldrA2azjOjlWahULBVRqsUvjBWtbhoQoba0ByB3Fp6TICmBi6Fp87f3GwYH7RCz21+o3FLJ3Oav
	7Gd/rVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhtQQ-001jDR-NC; Tue, 02 Nov 2021 13:02:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhtQN-001j7g-0y
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 13:02:01 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hk95T6YfLz90h1;
 Tue,  2 Nov 2021 21:01:33 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 2 Nov 2021 21:01:42 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 2 Nov 2021 21:01:41 +0800
Subject: Re: [PATCH -next] ubi: fix race between ctrl_cdev_ioctl and
 ubi_cdev_ioctl
To: Baokun Li <libaokun1@huawei.com>, <richard@nod.at>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patchwork@huawei.com>, <yukuai3@huawei.com>, Hulk Robot
 <hulkci@huawei.com>
References: <20211101013739.236430-1-libaokun1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <decf845d-ce14-cfb7-9500-73f271b7a38e@huawei.com>
Date: Tue, 2 Nov 2021 21:01:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20211101013739.236430-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_060159_730653_FEC0051D 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjEvMTEvMSA5OjM3LCBCYW9rdW4gTGkg5YaZ6YGTOgpIaSwgQmFva3VuCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMK
PiBpbmRleCBhN2UzZWI5YmVmYjYuLjcwOGIxYjk2ZGUwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC91YmkvYnVpbGQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gQEAgLTQ2
Nyw2ICs0NjcsNyBAQCBzdGF0aWMgaW50IHVpZl9pbml0KHN0cnVjdCB1YmlfZGV2aWNlICp1Ymkp
Cj4gICAJaWYgKGVycikKPiAgIAkJZ290byBvdXRfdW5yZWc7Cj4gICAKPiArCXNwaW5fbG9jaygm
dWJpLT52b2x1bWVzX2xvY2spOwo+ICAgCWZvciAoaSA9IDA7IGkgPCB1YmktPnZ0Ymxfc2xvdHM7
IGkrKykKPiAgIAkJaWYgKHViaS0+dm9sdW1lc1tpXSkgewo+ICAgCQkJZXJyID0gdWJpX2FkZF92
b2x1bWUodWJpLCB1YmktPnZvbHVtZXNbaV0pOwo+IEBAIC00NzUsMTEgKzQ3NiwxMyBAQCBzdGF0
aWMgaW50IHVpZl9pbml0KHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCj4gICAJCQkJZ290byBvdXRf
dm9sdW1lczsKPiAgIAkJCX0KPiAgIAkJfQo+ICsJc3Bpbl91bmxvY2soJnViaS0+dm9sdW1lc19s
b2NrKTsKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAgCj4gICBvdXRfdm9sdW1lczoKPiAgIAlraWxs
X3ZvbHVtZXModWJpKTsKPiArCXNwaW5fdW5sb2NrKCZ1YmktPnZvbHVtZXNfbG9jayk7Cj4gICAJ
Y2Rldl9kZXZpY2VfZGVsKCZ1YmktPmNkZXYsICZ1YmktPmRldik7Cj4gICBvdXRfdW5yZWc6Cj4g
ICAJdW5yZWdpc3Rlcl9jaHJkZXZfcmVnaW9uKHViaS0+Y2Rldi5kZXYsIHViaS0+dnRibF9zbG90
cyArIDEpOwoKVGhlcmUgc3RpbGwgZXhpc3Qgb25lIHBsYWNlIHRoYXQgdWJpX2F0dGFjaF9tdGRf
ZGV2KCkgbWF5IHJhY2Ugd2l0aCAKdWJpX3JlbW92ZV92b2x1bWUoKToKCnViaS0+Ymd0X3RocmVh
ZCA9IGt0aHJlYWRfY3JlYXRlKHViaV90aHJlYWQsIHViaSwgIiVzIiwgdWJpLT5iZ3RfbmFtZSkK
CiDCoMKgwqAgZ290byBvdXRfZGVidWdmczsKCi4uLgoKb3V0X2RlYnVnZnM6CgogwqDCoMKgIHVi
aV9kZWJ1Z2ZzX2V4aXRfZGV2KHViaSk7CgpvdXRfdWlmOgoKIMKgwqAgdWlmX2Nsb3NlKHViaSk7
wqDCoMKgwqDCoCAvLyBBbm90aGVyIHByb2Nlc3MgZG9lcyBpb2N0bCB0byByZW1vdmUgdm9sdW1l
LCAKd2hpY2ggbWF5IGNhdXNlIHZvbHVtZSBkb3VibGUgZnJlZS4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
