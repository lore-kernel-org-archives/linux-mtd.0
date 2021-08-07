Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A975C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 03:00:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17FDD61078
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 03:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17FDD61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0K1Yu192cCAkHmF6oQxq0nphEvHVr6SOd56NhTKNCMA=; b=k35/zlFFXNppWnS+mO3XRQp3OU
	vakSYQ/YliIm92B9mAXjWQRqUh/4Q+ZMtQE3Oq/+XBztZ/iqYEYrABj+aEjOSMqam3sU1agF2yr0T
	XRDhnYujoDK2bMJ+4et7X7KQj2ek6nFRG4VyGYmW6Re0bwdGSHVAHhYp4jMAkEpqoxj+t/+5PKG4f
	nxSUCNF8EyQBo9HCp0+bLSAGpE1uobkUWeKIIae0sIUjFVzgg7VeRb6p3fkBosyBzW0ZSOlGPSdX2
	+dkzxhVcS313QyfjrgiOP3qMaUGgi5bXyChxPrr6QKz01JRsyjD/qslq+YcH6T/wq3LGAVGtaFEqu
	az0gcB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCCYk-00E2a7-G5; Sat, 07 Aug 2021 02:59:38 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCCYh-00E2ZW-QG
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 02:59:37 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GhRms4kq1zZyLV;
 Sat,  7 Aug 2021 10:55:57 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sat, 7 Aug 2021 10:59:33 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 dggema761-chm.china.huawei.com (10.1.198.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 7 Aug 2021 10:59:32 +0800
Subject: Re: [PATCH 2/2] mtd: mtdconcat: Remove concat_{read|write}_oob
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yukuai3@huawei.com>
References: <20210731023243.3977104-1-chengzhihao1@huawei.com>
 <20210731023243.3977104-3-chengzhihao1@huawei.com>
 <20210806212655.16e4d03d@xps13>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <83cb21c4-0140-40d5-e0f8-7f2a7e781a5f@huawei.com>
Date: Sat, 7 Aug 2021 10:59:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210806212655.16e4d03d@xps13>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_195936_085852_4B0842C6 
X-CRM114-Status: UNSURE (   9.24  )
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

5ZyoIDIwMjEvOC83IDM6MjYsIE1pcXVlbCBSYXluYWwg5YaZ6YGTOgpIaSBNaXF1ZWwsCj4+ICAg
c3RhdGljIGludCBjb25jYXRfZXJhc2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFz
ZV9pbmZvICppbnN0cikKPj4gICB7Cj4+ICAgCXN0cnVjdCBtdGRfY29uY2F0ICpjb25jYXQgPSBD
T05DQVQobXRkKTsKPj4gQEAgLTY4NCwxMCArNTgwLDYgQEAgc3RydWN0IG10ZF9pbmZvICptdGRf
Y29uY2F0X2NyZWF0ZShzdHJ1Y3QgbXRkX2luZm8gKnN1YmRldltdLAkvKiBzdWJkZXZpY2VzIHRv
IGMKPj4gICAJc3ViZGV2X21hc3RlciA9IG10ZF9nZXRfbWFzdGVyKHN1YmRldlswXSk7Cj4+ICAg
CWlmIChzdWJkZXZfbWFzdGVyLT5fd3JpdGV2KQo+PiAgIAkJY29uY2F0LT5tdGQuX3dyaXRldiA9
IGNvbmNhdF93cml0ZXY7Cj4+IC0JaWYgKHN1YmRldl9tYXN0ZXItPl9yZWFkX29vYikKPj4gLQkJ
Y29uY2F0LT5tdGQuX3JlYWRfb29iID0gY29uY2F0X3JlYWRfb29iOwo+PiAtCWlmIChzdWJkZXZf
bWFzdGVyLT5fd3JpdGVfb29iKQo+PiAtCQljb25jYXQtPm10ZC5fd3JpdGVfb29iID0gY29uY2F0
X3dyaXRlX29vYjsKPiBBY3R1YWxseSBJIGFtIG5vdCBzdXJlIF9yZWFkfHdyaXRlX29vYigpIGlz
IHRoZSByaWdodCBjYWxsYmFjayB0bwo+IHJlbW92ZS4KPgo+IFJpY2hhcmQsIHdoYXQgaXMgeW91
ciBpbnB1dCBvbiB0aGlzPyBTaGFsbCB3ZSByZW1vdmUgX3JlYWR8d3JpdGUoKQo+IGluc3RlYWQ/
IEkgZG9uJ3QgcmVtZW1iZXIgdGhlIGV4YWN0IHJhdGlvbmFsZSBiZWhpbmQgdGhlc2UgdHdvIGhl
bHBlcnMuCgpPaCwgSSBndWVzcyBJIG1hZGUgYSBtaXN0YWtlLiBJdCBsb29rcyBsaWtlIHRoYXQg
cmVzZXJ2aW5nIF97cmVhZHx3cml0ZX1fb29iIGlzIGEgYmV0dGVyIG1ldGhvZCBpbiBteSBsaW1p
dGVkIGtub3dsZWRnZSB0byBuYW5kIGRyaXZlci4gRm9yIGV4YW1wbGUsIG5hbmRfZG9fcmVhZF9v
b2IoKSBiZWhhdmVzIGRpZmZlcmVudCBmcm9tIG5hbmRfZG9fcmVhZF9vcHMoKSwgYW5kIGNhbGxp
bmcgd2hpY2ggZnVuY3Rpb24gaXMgZGVjaWRlZCBieSBtdGRfb29iX29wcy5kYXRhYnVmLgpDYWxs
YmFjayBfcmVhZF9vb2JzKCkgY2FuIHN1cHBvcnQgYm90aCBmdW5jdGlvbnMsIGJ1dCBjYWxsYmFj
ayBfcmVhZCgpIGRvbid0IHN1cHBvcnQgbmFuZF9kb19yZWFkX29vYigpLiBTbyBtdGRfcmVhZF9v
b2JzKCkgY292ZXJzIG10ZF9yZWFkKCk/CklzIG15IHVuZGVyc3RhbmQgcmlnaHQ/CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
