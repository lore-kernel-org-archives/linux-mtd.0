Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0A5C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Nov 2022 03:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdK7GGhGIu2oh9cArTHmNXM44R2o9YuMc+KTYJypCOE=; b=tFNFEmc9OX+oA13XRIUMcq7wFb
	9YKRTRzoWvYXoUoQ3rBIb9bfbG8BGnbfZE2CNIFBpI5AXp0c0mjwRyItI7AGlUH14/ZvwKiAS+XBn
	z1XMqQHyYyf3I0tOMGKZ1Egaf1AqF7vQ2ahwEyxrN4rsYeUYPila1D4IzamdEljAhnwTH6PX28EtJ
	cFfZMbz0/Hcsf9zI5g6QWzpiZVw7UvnL5WhjgmHjyZkVfz8qCcrueTuxqzjmU7i31cfpElX9CDEtF
	QVqD/FRP9nNJowAGGYcS/oi6U6BvTjk7Tdyxv5s5aKTw27VBAwUm1MI3b/5gI05nlhiJO3LhE/tmk
	+wXW1csQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oth3b-002pc6-MH; Sat, 12 Nov 2022 03:19:47 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oth3T-002pXy-7o
	for linux-mtd@lists.infradead.org; Sat, 12 Nov 2022 03:19:43 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N8LMF0sZzzJnbK;
	Sat, 12 Nov 2022 11:16:25 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 12 Nov 2022 11:19:29 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 12 Nov 2022 11:19:28 +0800
Subject: Re: [PATCH] mtd: ubi: fix possible null-ptr-deref in
 ubi_free_volume()
To: Yang Yingliang <yangyingliang@huawei.com>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
References: <20221111144812.2423577-1-yangyingliang@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <bafda67f-0698-2063-9376-aee58d2bd6bc@huawei.com>
Date: Sat, 12 Nov 2022 11:19:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221111144812.2423577-1-yangyingliang@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_191939_484303_CDED5E8F 
X-CRM114-Status: UNSURE (   8.60  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMi8xMS8xMSAyMjo0OCwgWWFuZyBZaW5nbGlhbmcg0LS1wDoKClsuLi5dCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3ViaS92bXQuYyBiL2RyaXZlcnMvbXRkL3ViaS92bXQuYwo+IGlu
ZGV4IDhmY2MwYmRmMDYzNS4uYzM3OWI4NzM5ZjUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L3ViaS92bXQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS92bXQuYwo+IEBAIC02MTQsOCArNjE0
LDE0IEBAIHZvaWQgdWJpX2ZyZWVfdm9sdW1lKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVj
dCB1Ymlfdm9sdW1lICp2b2wpCj4gICAJZGJnX2dlbigiZnJlZSB2b2x1bWUgJWQiLCB2b2wtPnZv
bF9pZCk7Cj4gICAKPiAgIAl1YmktPnZvbHVtZXNbdm9sLT52b2xfaWRdID0gTlVMTDsKPiAtCWNk
ZXZfZGVsKCZ2b2wtPmNkZXYpOwo+IC0JZGV2aWNlX3VucmVnaXN0ZXIoJnZvbC0+ZGV2KTsKPiAr
CWlmIChkZXZpY2VfaXNfcmVnaXN0ZXJlZCgmdm9sLT5kZXYpKSB7Cj4gKwkJY2Rldl9kZWwoJnZv
bC0+Y2Rldik7Cj4gKwkJZGV2aWNlX3VucmVnaXN0ZXIoJnZvbC0+ZGV2KTsKPiArCX0gZWxzZSBp
ZiAodm9sLT5kZXYua29iai5zdGF0ZV9pbml0aWFsaXplZCkgewo+ICsJCXB1dF9kZXZpY2UoJnZv
bC0+ZGV2KTsKPiArCX0gZWxzZSB7CgpGb2xsb3dpbmcgcHJvY2VzcyB3aWxsIHRyaWdnZXIgYSBt
ZW1sZWFrIGFmdGVyIHRoaXMgcGF0Y2ggYXBwbGllZC4KCnViaV9hdHRhY2gKICB1YmlfcmVhZF92
b2x1bWVfdGFibGUKICAgaW5pdF92b2x1bWVzCiAgICB1YmlfZmFzdG1hcF9pbml0X2NoZWNrbWFw
CiAgICAgdm9sLT5jaGVja21hcCA9IGJpdG1hcF96YWxsb2MobGViX2NvdW50LCBHRlBfS0VSTkVM
KTsgICAgLy8gYWxsb2MgCmJpdG1hcAogIHViaV9lYmFfaW5pdAogICB1YmlfZWJhX3JlcGxhY2Vf
dGFibGUKICAgIHZvbC0+ZWJhX3RibCA9IHRibCAgICAgICAgICAgICAgICAgICAgICAgICAgICAv
LyBhbGxvYyBlYmFfdGJsCgp1aWZfaW5pdAogIHViaV9hZGRfdm9sdW1lCiAgIGNkZXZfYWRkICAg
Ly8gZmFpbGVkCiAga2lsbF92b2x1bWVzCiAgIHViaV9mcmVlX3ZvbHVtZQogICAga2ZyZWUodm9s
KSAgICAgICAgICAgICAgICAgICAgIC8vIG1pc3MgZnJlZWluZyBlYmFfdGJsIGFuZCBiaXRtYXAK
PiArCQlrZnJlZSh2b2wpOwo+ICsJfQo+ICAgfQo+ICAgCj4gICAvKioKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
