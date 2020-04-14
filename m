Return-Path: <SRS0=sS6D=56=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A081FC2BA2B
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Apr 2020 01:16:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40FD520732
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Apr 2020 01:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UZk6lS/A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40FD520732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f/F7AfxjmaAkRQ2gkS/cSQCZbDmFzkycAHsCfyqMiVY=; b=UZk6lS/AwasJcdZcBS7x6QO8C
	dQXoL4JPrswcR8iOjDwYPyPIvjOWxRi4MwDk3xsXFVygbn3X6+3jpgphNYqMVxo4GwPOl4Si4NlNW
	XUmj+QVTZz9yS10FCRcU5BO1YdX42cj/I6ew9we/kTGMYMZRSSdyq09EtzvaE0rR0UE1eVkeypCHw
	4oAz2KFK4EewF+x74z+V2rl7BtbkHk8gWe/VqZTSXazDFxbHU+VEVf+JD/aqsta03cStfHvIOGDXk
	5eNlaIz46QjsKggcJKQgDrcLZLHNofyFd2dv9pvnHJ80gVHV/5SX28RoiU5StjgTyKm4Y2xFw5OD8
	mnkKzL1CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOABu-0005vA-If; Tue, 14 Apr 2020 01:16:42 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOABq-0005tO-Qs
 for linux-mtd@lists.infradead.org; Tue, 14 Apr 2020 01:16:40 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1F3BCB04D1BE513BC195;
 Tue, 14 Apr 2020 09:16:20 +0800 (CST)
Received: from [127.0.0.1] (10.74.219.194) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Apr 2020
 09:16:11 +0800
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q128a11
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
References: <1585105663-199127-1-git-send-email-chenxiang66@hisilicon.com>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <6d329b9b-153f-74fa-f94d-1f223b3ee767@hisilicon.com>
Date: Tue, 14 Apr 2020 09:16:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1585105663-199127-1-git-send-email-chenxiang66@hisilicon.com>
X-Originating-IP: [10.74.219.194]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_181639_043350_6D51237F 
X-CRM114-Status: GOOD (  11.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: john.garry@huawei.com, linux-mtd@lists.infradead.org, linuxarm@huawei.com,
 Tudor.Ambarus@microchip.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UGluZy4uLgoK1NogMjAyMC8zLzI1IDExOjA3LCBjaGVueGlhbmcg0LS1wDoKPiBGcm9tOiBYaWFu
ZyBDaGVuIDxjaGVueGlhbmc2NkBoaXNpbGljb24uY29tPgo+Cj4gQXMgNGJpdCBibG9jayBwcm90
ZWN0aW9uIHBhdGhzZXQgZm9yIHNvbWUgbWljcm9uIG1vZGVscyBhcmUgbWVyZ2VkLAo+IG4yNXEx
MjhhMTEgYWxzbyB1c2VzIDQgYml0IEJsb2NrIFByb3RlY3Rpb24gc2NoZW1lLCBzbyBlbmFibGUg
bG9ja2luZwo+IGZvciBpdC4gVGVzdGVkIGl0IG9uIG4yNXExMjhhMTEsIHRoZSBsb2NraW5nIGZ1
bmN0aW9ucyB3b3JrIHdlbGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBDaGVuIDxjaGVueGlh
bmc2NkBoaXNpbGljb24uY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24t
c3QuYyB8IDQgKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCj4gaW5kZXggNmMwMzRiOS4uMDJjMGI1
MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYwo+IEBAIC0yOSw3ICsyOSw5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzdF9wYXJ0c1tdID0gewo+ICAgCXsgIm4yNXEwNjRh
IiwgICAgSU5GTygweDIwYmIxNywgMCwgNjQgKiAxMDI0LCAgMTI4LAo+ICAgCQkJICAgICAgU0VD
VF80SyB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+ICAgCXsgIm4yNXExMjhhMTEiLCAgSU5GTygw
eDIwYmIxOCwgMCwgNjQgKiAxMDI0LCAgMjU2LAo+IC0JCQkgICAgICBTRUNUXzRLIHwgVVNFX0ZT
UiB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+ICsJCQkgICAgICBTRUNUXzRLIHwgVVNFX0ZTUiB8
IFNQSV9OT1JfUVVBRF9SRUFEIHwKPiArCQkJICAgICAgU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9O
T1JfSEFTX1RCIHwKPiArCQkJICAgICAgU1BJX05PUl80QklUX0JQIHwgU1BJX05PUl9CUDNfU1Jf
QklUNikgfSwKPiAgIAl7ICJuMjVxMTI4YTEzIiwgIElORk8oMHgyMGJhMTgsIDAsIDY0ICogMTAy
NCwgIDI1NiwKPiAgIAkJCSAgICAgIFNFQ1RfNEsgfCBVU0VfRlNSIHwgU1BJX05PUl9RVUFEX1JF
QUQpIH0sCj4gICAJeyAibXQyNXFsMjU2YSIsICBJTkZPNigweDIwYmExOSwgMHgxMDQ0MDAsIDY0
ICogMTAyNCwgIDUxMiwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
