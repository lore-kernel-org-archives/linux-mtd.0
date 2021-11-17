Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD3DC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 08:40:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FEF61544
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 08:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3FEF61544
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lsxT03uqZsKWxuwjeQHfWC1sUAl1Egjns53v1S+IHA=; b=b7sMQzihuj9i4hETCxloiUESy1
	MsatrwFpILpYQHh11Oa20Qxz1ys7PceYwf+QT3yK7NIPSio6q/TclifwM70p6v8n4HF6pikI6ue7T
	IOOgW97GHuI5Tu+148GJV4KCo10RTHKQDKFNts31cmTodl9uw8fnJKKkfkV9SAy8s1I/cwmuZHqXP
	8cvRUnPzRLYmAo5xoToVhdBqWab8aP5IYyTCeQSHUWUbiJ2ji57iJ/34nhl6c3kbuGAqo9ztraltr
	TcCcazidvhsBgLh4Neio0RtbKYGgbYzziexqS4QWrBOHkYho05g8TPHWNaqqZhSScObbpc7sA0oyO
	lR6RnT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGTm-003z1N-4W; Wed, 17 Nov 2021 08:39:42 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGTj-003yzN-20
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 08:39:40 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HvGWW3Wsdz1DJRF;
 Wed, 17 Nov 2021 16:37:11 +0800 (CST)
Received: from kwepemm600019.china.huawei.com (7.193.23.64) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 16:39:34 +0800
Received: from [10.174.177.210] (10.174.177.210) by
 kwepemm600019.china.huawei.com (7.193.23.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 17 Nov 2021 16:39:33 +0800
Subject: Re: [QUESTION] blk_mq_freeze_queue in elevator_init_mq
To: Bart Van Assche <bvanassche@acm.org>, <ming.lei@redhat.com>,
 <damien.lemoal@wdc.com>, <axboe@kernel.dk>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-block@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <yi.zhang@huawei.com>, <yebin10@huawei.com>, <houtao1@huawei.com>
References: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
 <59cb2cfd-3890-9fb4-9e77-a4b084d088e9@acm.org>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <03421fa2-fa48-3452-743b-d9cabefc58df@huawei.com>
Date: Wed, 17 Nov 2021 16:39:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <59cb2cfd-3890-9fb4-9e77-a4b084d088e9@acm.org>
Content-Language: en-US
X-Originating-IP: [10.174.177.210]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600019.china.huawei.com (7.193.23.64)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_003939_286706_CD53293F 
X-CRM114-Status: GOOD (  14.91  )
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

CgpPbiAyMDIxLzExLzE3IDEyOjExLCBCYXJ0IFZhbiBBc3NjaGUgd3JvdGU6Cj4gT24gMTEvMTYv
MjEgMTk6MzcsIHlhbmdlcmt1biB3cm90ZToKPj4gVGhpcyBjb21taXQgYWRkIGJsa19tcV9mcmVl
emVfcXVldWUgaW4gZWxldmF0b3JfaW5pdF9tcSB3aGljaCB0cnkgdG8KPj4gbWFrZSBzdXJlIG5v
IGluLWZsaWdodCByZXF1ZXN0IHdoaWxlIHdlIGdvIHRocm91Z2ggYmxrX21xX2luaXRfc2NoZWQu
Cj4+IEJ1dCBkb2VzIHRoZXJlIGFueSBkcml2ZXJzIGNhbiBsZWF2ZSBJTyBhbGl2ZSB3aGlsZSB3
ZSBnbyB0aHJvdWdoCj4+IGVsZXZhdG9yX2luaXRfbXHvvJ8gQW5kIGlmIG5vLCBtYXliZSB3ZSBj
YW4ganVzdCByZW1vdmUgdGhpcyBsb2dpY2FsIHRvCj4+IGZpeCB0aGUgcmVncmVzc2lvbi4uLgo+
IAo+IERvZXMgdGhpcyB1bnRlc3RlZCBwYXRjaCBoZWxwPyBQbGVhc2Ugbm90ZSB0aGF0IEknbSBu
b3QgcmVjb21tZW5kaW5nIHRvCj4gaW50ZWdyYXRlIHRoaXMgcGF0Y2ggaW4gdGhlIHVwc3RyZWFt
IGtlcm5lbCBidXQgaWYgaXQgaGVscHMgaXQgY2FuIGJlIGEKPiBidWlsZGluZyBibG9jayBvZiBh
IHNvbHV0aW9uLgo+IAo+IFRoYW5rcywKPiAKPiBCYXJ0Lgo+IAo+IGRpZmYgLS1naXQgYS9ibG9j
ay9ibGstbXEuYyBiL2Jsb2NrL2Jsay1tcS5jCj4gaW5kZXggM2FiMzRjNGYyMGRhLi5iODVkY2I3
MmE1NzkgMTAwNjQ0Cj4gLS0tIGEvYmxvY2svYmxrLW1xLmMKPiArKysgYi9ibG9jay9ibGstbXEu
Ywo+IEBAIC0xNjcsNiArMTY3LDcgQEAgdm9pZCBibGtfZnJlZXplX3F1ZXVlX3N0YXJ0KHN0cnVj
dCByZXF1ZXN0X3F1ZXVlICpxKQo+ICDCoMKgwqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmcS0+
bXFfZnJlZXplX2xvY2spOwo+ICDCoMKgwqDCoMKgwqDCoMKgIGlmIChxdWV1ZV9pc19tcShxKSkK
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJsa19tcV9ydW5faHdfcXVldWVzKHEsIGZhbHNl
KTsKPiArwqDCoMKgwqDCoMKgwqAgc3luY2hyb25pemVfcmN1X2V4cGVkaXRlZCgpOwo+ICDCoMKg
wqDCoCB9IGVsc2Ugewo+ICDCoMKgwqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmcS0+bXFfZnJl
ZXplX2xvY2spOwo+ICDCoMKgwqDCoCB9Cj4gLgoKU29ycnkgZm9yIHRoYXQgaXQncyBibGtfbXFf
cXVpZXNjZV9xdWV1ZSB3aGljaCBhY3R1YWxseSBpbnRyb2R1Y2UgdGhlIApSQ1UgZ2FwLi4uIEkg
aGF2ZSB0cnkgc3luY2hyb25pemVfcmN1X2V4cGVkaXRlZCBpbiBibGtfbXFfcXVpZXNjZV9xdWV1
ZSAKd2hpY2ggc2VlbXMgdXNlbGVzcy4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
