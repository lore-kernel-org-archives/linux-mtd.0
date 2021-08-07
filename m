Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C432C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 02:17:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07B861167
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 02:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B07B861167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ug96klmcOEH+m4TRcATW+IY2p+KI8WBPjKKXDpY4WvE=; b=pNj/HbJC23t/3OGuRd9eAgIskB
	iF93t+6K/mqkYMv1nlYHZLQiTf9WGVQLUU7WBbkBNBzE4WAywoVDpQ6+gub1xQwy6EwnQEVpdT+GQ
	vu4epvCKeeaxjbs0m0urV8K394/oZd3iV5kpJ1+ZF0fRzng7prRm+RqgVW+hpX8zZYAJ6tFFdL6VA
	2X7OY4LpPaOZ4EnQ7j93bMnbZDZqTWIQskAwYAtFgIJ69pz1VgiaYivKaW1LVtMWMI7a0MBKajWPA
	nR2WSlrp8CNJFZGxEL8IH4m9jFcRDJI5zGcI7SOSkvWn1riagiyjw7fTEQiQZbDUT0n8pBZ9BnNvu
	RVfaY6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCBsb-00E1HP-Ic; Sat, 07 Aug 2021 02:16:05 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCBsY-00E1Gm-Jm
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 02:16:04 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GhQpM61nXzZyJr;
 Sat,  7 Aug 2021 10:12:11 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sat, 7 Aug 2021 10:15:47 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 dggema761-chm.china.huawei.com (10.1.198.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 7 Aug 2021 10:15:46 +0800
Subject: Re: [PATCH 1/2] mtd: mtdconcat: Judge callback function existence
 getting from master for each partition
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yukuai3@huawei.com>
References: <20210731023243.3977104-1-chengzhihao1@huawei.com>
 <20210731023243.3977104-2-chengzhihao1@huawei.com>
 <20210806212857.240e0c1f@xps13>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <27c67e42-f275-fc50-64e5-d80233130f7e@huawei.com>
Date: Sat, 7 Aug 2021 10:15:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210806212857.240e0c1f@xps13>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_191602_868438_894BB62A 
X-CRM114-Status: UNSURE (   9.66  )
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

5ZyoIDIwMjEvOC83IDM6MjgsIE1pcXVlbCBSYXluYWwg5YaZ6YGTOgpIaSBNaXF1ZWwsCj4gSGkg
WmhpaGFvLAo+Cj4gWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGUg
b24gU2F0LCAzMSBKdWwgMjAyMQo+IDEwOjMyOjQyICswODAwOgo+IEBAIC03MjEsMTQgKzcyNCwx
NSBAQCBzdHJ1Y3QgbXRkX2luZm8gKm10ZF9jb25jYXRfY3JlYXRlKHN0cnVjdCBtdGRfaW5mbyAq
c3ViZGV2W10sCS8qIHN1YmRldmljZXMgdG8gYwo+ICAgCQkJCSAgICBzdWJkZXZbaV0tPmZsYWdz
ICYgTVREX1dSSVRFQUJMRTsKPiAgIAkJfQo+ICAgCj4gKwkJc3ViZGV2X21hc3RlciA9IG10ZF9n
ZXRfbWFzdGVyKHN1YmRldltpXSk7Cj4gICAJCWNvbmNhdC0+bXRkLnNpemUgKz0gc3ViZGV2W2ld
LT5zaXplOwo+ICAgCQljb25jYXQtPm10ZC5lY2Nfc3RhdHMuYmFkYmxvY2tzICs9Cj4gICAJCQlz
dWJkZXZbaV0tPmVjY19zdGF0cy5iYWRibG9ja3M7Cj4gICAJCWlmIChjb25jYXQtPm10ZC53cml0
ZXNpemUgICAhPSAgc3ViZGV2W2ldLT53cml0ZXNpemUgfHwKPiAgIAkJICAgIGNvbmNhdC0+bXRk
LnN1YnBhZ2Vfc2Z0ICE9IHN1YmRldltpXS0+c3VicGFnZV9zZnQgfHwKPiAgIAkJICAgIGNvbmNh
dC0+bXRkLm9vYnNpemUgICAgIT0gIHN1YmRldltpXS0+b29ic2l6ZSB8fAo+IC0JCSAgICAhY29u
Y2F0LT5tdGQuX3JlYWRfb29iICAhPSAhc3ViZGV2W2ldLT5fcmVhZF9vb2IgfHwKPiAtCQkgICAg
IWNvbmNhdC0+bXRkLl93cml0ZV9vb2IgIT0gIXN1YmRldltpXS0+X3dyaXRlX29vYikgewo+ICsJ
CSAgICAhY29uY2F0LT5tdGQuX3JlYWRfb29iICAhPSAhc3ViZGV2X21hc3Rlci0+X3JlYWRfb29i
IHx8Cj4gKwkJICAgICFjb25jYXQtPm10ZC5fd3JpdGVfb29iICE9ICFzdWJkZXZfbWFzdGVyLT5f
d3JpdGVfb29iKSB7Cj4gRG8geW91IHJlYWxseSBuZWVkIHRoaXMgY2hhbmdlPwoKSSB0aGluayBi
b3RoICIhY29uY2F0LT5tdGQuX3JlYWRfb29iICE9ICFzdWJkZXZbaV0tPl9yZWFkX29vYiIgYW5k
IAoiIWNvbmNhdC0+bXRkLl93cml0ZV9vb2IgIT0gIXN1YmRldltpXS0+X3dyaXRlX29vYiIgbmVl
ZCB0byBiZSBtb2RpZmllZCAKb3RoZXJ3aXNlIGNvbmNhdGVuYXRpbmcgZ29lcyBmYWlsdXJlLgoK
SSB0aG91Z2h0IHRoZXJlIGV4aXN0cyB0d28gcHJvYmxlbXM6CgogwqAgMS4gV3JvbmcgY2FsbGJh
Y2sgZmV0Y2hpbmcgaW4gbXRkIHBhcnRpdGlvbiBkZXZpY2UKCiDCoCAyLiBXYXJuaW5nIGZvciBl
eGlzdGVuY2Ugb2YgX3JlYWQgYW5kIF9yZWFkX29vYiBhdCB0aGUgc2FtZSB0aW1lCgpzbyBJIHNv
bHZlZCB0aGVtIGluIHR3byBzdGVwcyB0byBtYWtlIGhpc3RvcnkgY29tbWl0IGxvZ3MgYSBiaXQg
Y2xlYXIuCgpUaG91Z2ggdGhlc2UgdHdvIHBhdGNoZXMgY2FuIGJlIGNvbWJpbmVkIHRvIG9uZS4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
