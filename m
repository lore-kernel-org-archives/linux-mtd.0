Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A398C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:47:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4766D61041
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4766D61041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AMODkP0Ut2gbqifkh6ZeOJAKSyJYI4hha/adi2KZJ8=; b=m4AaQyi+KTw3a5W7S0ALZNGKjF
	xVeAek4PJQAinzodT5IQwDhSruUTV+B9poey5QsJ4RC4AxJSm9Ul/VioV84lWI7DSkVd9M3QKFbK1
	Z6K/PCJE9EkBrF59G3l0vKO8ccuD+8s+eDinf8K0xMMtWvGgEhUeUyscQqDgIx1Vlcqu3zqsynj1Q
	Rolaq06FEJEhOms3EcBO5krxWF3o72vbktfk5GknLiAyjoIBbzUUOtMGlq4FiiB7BGZhBp7oLUoFB
	EfrIB8xDPUFdAwJPrcrURD21UczUz9+BH1R/GEeM0GN2S0srHeKj5YylDV3VbWBBF9ZaydKQ+JUzC
	FfqQXt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYZi-00EzpK-4i; Mon, 15 Nov 2021 09:46:54 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYAX-00EtfH-HZ
 for linux-mtd@lists.infradead.org; Mon, 15 Nov 2021 09:20:55 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ht3Xr2wWKz8vQt;
 Mon, 15 Nov 2021 17:19:08 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 15 Nov 2021 17:20:45 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 15 Nov 2021 17:20:44 +0800
Subject: Re: [PATCH v3 04/12] ubifs: Add missing iput if do_tmpfile() failed
 in rename whiteout
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211112121758.2208727-1-chengzhihao1@huawei.com>
 <20211112121758.2208727-5-chengzhihao1@huawei.com>
 <20211115082446.GC25697@pengutronix.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7f521d7d-e269-6668-3e71-fd8ad1f3c080@huawei.com>
Date: Mon, 15 Nov 2021 17:20:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20211115082446.GC25697@pengutronix.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012053_798610_352AD528 
X-CRM114-Status: UNSURE (   8.55  )
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

1NogMjAyMS8xMS8xNSAxNjoyNCwgU2FzY2hhIEhhdWVyINC0tcA6CkhpIFNhc2NoYSwKPj4gZGlm
ZiAtLWdpdCBhL2ZzL3ViaWZzL2Rpci5jIGIvZnMvdWJpZnMvZGlyLmMKPj4gaW5kZXggMjczNWFk
MWFmZmVkLi42NTAzZTY4NTdmNmUgMTAwNjQ0Cj4+IC0tLSBhL2ZzL3ViaWZzL2Rpci5jCj4+ICsr
KyBiL2ZzL3ViaWZzL2Rpci5jCj4+IEBAIC0xMzM0LDYgKzEzMzQsOCBAQCBzdGF0aWMgaW50IGRv
X3JlbmFtZShzdHJ1Y3QgaW5vZGUgKm9sZF9kaXIsIHN0cnVjdCBkZW50cnkgKm9sZF9kZW50cnks
Cj4+ICAgCj4+ICAgCQllcnIgPSBkb190bXBmaWxlKG9sZF9kaXIsIG9sZF9kZW50cnksIFNfSUZD
SFIgfCBXSElURU9VVF9NT0RFLCAmd2hpdGVvdXQpOwo+PiAgIAkJaWYgKGVycikgewo+PiArCQkJ
aWYgKHdoaXRlb3V0KQo+PiArCQkJCWlwdXQod2hpdGVvdXQpOwo+IAo+IFNob3VsZCB0aGlzIHJh
dGhlciBiZSBkb25lIGluIGRvX3RtcGZpbGUoKSBkaXJlY3RseT8KWWVzLCBJIHNob3VsZCBoYXZl
IGRvbmUgaXQuIEFsdGhvdWdoIG5leHQgcGF0Y2ggcmVjb25zdHJ1Y3RzIGRvX3JlbmFtZSgpIAp3
aGljaCBtYWtlcyB0aGlzIHVnbHkganVkZ2VtZW50IGRpc2FwcGVyZWQuIEkgd2lsbCBmaXggaXQg
YWxvbmcgd2l0aCAKb3RoZXIgc3VnZ2VzdGlvbnMgZnJvbSBvdGhlciBwYXRjaGVzIGluIG5leHQg
aXRlcmF0aW9uLiBUaGFua3MuCj4gU2FzY2hhCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
