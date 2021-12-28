Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600C1C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Dec 2021 07:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI/HpKYtCUj3KqyMRahcA3g4kx9h/jgsyaLkWvbWBeM=; b=syOlaRKsKbzQl4DieAiGEcaK/s
	T0AqXySosj3kGowrzJoZWuYiQmKtNTMozNihGhhBZwUly19hcPMJmPB4/yul8DQ6QLuQHEXQxylw8
	qtsdd662yTzjFQapf0p/mGfgRoQNAHICvt3CLXR2r+OJLv3rm7GM9po46LghibfKPPoFdUO+RkEpX
	06/g6pyDIfdscONIStbG0gPXzfPfeSu1TotDGO0cHCEiDJdc87IqRZ7rj/qnFuG559PSlk/PTw4kW
	loPm5/9PCB8Z28RYekmXLVROQqHMLcyaOPBEt8c+I8+LTMIY7OV/UDAMk4yoVVGls+aJTjC/d9s3W
	k3If2tLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n27Dh-000Ntb-ER; Tue, 28 Dec 2021 07:48:29 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n27Dc-000NsF-6d
 for linux-mtd@lists.infradead.org; Tue, 28 Dec 2021 07:48:26 +0000
Received: from kwepemi100003.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JNRTZ2K3mzbjgS;
 Tue, 28 Dec 2021 15:47:46 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100003.china.huawei.com (7.221.188.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 15:48:14 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 15:48:13 +0800
Subject: Re: [PATCH -next V3] ubi: fix race condition between ctrl_cdev_ioctl
 and ubi_cdev_ioctl
To: Richard Weinberger <richard@nod.at>, "libaokun (A)" <libaokun1@huawei.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, Hulk Robot
 <hulkci@huawei.com>
References: <20211105093022.1360601-1-libaokun1@huawei.com>
 <7e00eda5-3b35-6d3c-29fb-664b12cca6dd@huawei.com>
 <509065063.197038.1640293568550.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b8f6bbf3-cca4-9bfa-f70a-393f04edd21f@huawei.com>
Date: Tue, 28 Dec 2021 15:48:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <509065063.197038.1640293568550.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_234824_454021_F413AB26 
X-CRM114-Status: UNSURE (   8.36  )
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

5ZyoIDIwMjEvMTIvMjQgNTowNiwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCgoKPj4+IHViaV9nZXRfZGV2aWNlIGlzIHVzZWQgdG8g
cHJldmVudCBkZXZpY2VzIGZyb20gYmVpbmcgZGVsZXRlZCBkdXJpbmcKPj4+IHN5c2ZzIGV4ZWN1
dGlvbi4gSG93ZXZlciwgbm93IGtlcm5mcyBlbnN1cmVzIHRoYXQgZGV2aWNlcyB3aWxsIG5vdAo+
Pj4gYmUgZGVsZXRlZCBiZWZvcmUgYWxsIHJlZmVyZW5jZSBjb3VudGluZyBhcmUgcmVsZWFzZWQu
Cj4+PiBUaGUga2V5IHByb2Nlc3MgaXMgc2hvd24gaW4gdGhlIGZvbGxvd2luZyBzdGFjay4KPiAK
PiB1YmlfZ2V0X2RldmljZSgpIGluIGRldl9hdHRyaWJ1dGVfc2hvdygpIGlzIHVzZWQgdG8gZGV0
ZWN0IHdoZXRoZXIKPiB0aGUgdWJpIGRldmljZSBnb3QgZGV0YWNoZWQgd2hpbGUgdGhlIHN5c2Zz
IGZpbGUgaXMgb3Blbi4KPiAKPiBIbW0uIEkgdGhvdWdodCBmb3Igc3lzZnMgdGhpcyBpcyBub3Qg
dGhlIGNhc2Ugc2luY2Ugc3lzZnMgZG9lcyBub3QgaW1wbGVtZW50Cj4gYSByZWxlYXNlKCkgbWV0
aG9kLiBTbyBrZXJuZnNfZHJhaW5fb3Blbl9maWxlcygpIHdpbGwgcmV0dXJuIGVhcmx5Lgo+IEJ1
dCB0aGVyZSBpcyBhIGdvb2QgY2hhbmNlIHRoYXQgSSBkb24ndCBnb3QgYWxsIGtlcm5mcy9zeXNm
cyBkZXRhaWxzLgo+IAoKa2VybmZzX2RyYWluKCkgd2lsbCB3YWl0ICdyb290LT5kZWFjdGl2YXRl
X3dhaXRxJyBpZiAKYXRvbWljX3JlYWQoJmtuLT5hY3RpdmUpIG5vdCBlcXVhbHMgdG8gS05fREVB
Q1RJVkFURURfQklBUy4KClRoZSBVQkkgc2VxX3Nob3cgY2FsbGJhY2sgaXMgaW52b2tlZCB3aXRo
IGF2dGl2ZSBjbnQgdGFrZW46CnZmc19yZWFkCiAgIGtlcm5mc19mb3BfcmVhZF9pdGVyCiAgICAg
c2VxX3JlYWRfaXRlcgogICAgICAgbS0+b3AtPnN0YXJ0IChrZXJuZnNfc2VxX3N0YXJ0KSAgIC8v
IGtlcm5mc19nZXRfYWN0aXZlKG9mLT5rbikKICAgICAgIGtlcm5mc19zZXFfc2hvdwogICAgICAg
ICBkZXZfYXR0cmlidXRlX3Nob3cgW3ViaV0KICAgICAgIG0tPm9wLT5zdG9wIChrZXJuZnNfc2Vx
X3N0b3ApICAgICAvLyBrZXJuZnNfcHV0X2FjdGl2ZShvZi0+a24pCgpUaGUga2VybmZzX2RyYWlu
KCkgaXMgc3R1Y2sgYXQgd2FpdF9ldmVudCgpIHVudGlsIHN5c2ZzIHJlYWRpbmcgCmZpbmlzaGVk
LCBpbiBteSBsb2NhbCB0ZXN0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
