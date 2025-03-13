Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD69C28B28
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 01:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHi9zpW3B98hndBLp2YVv6c1aUcKkbkbhWvYALKtV1U=; b=qPYug1+zm29+ThfajycddSsZgR
	bRobrbRUZHJLNi2FtfQ0t/freWj5Y23BZbtKtg9U8Jbcv7wXoAL/q+zhOEtjiI/Hd887s494g+JhB
	cr/gUJW5TyTx0BGFAlvQrMOWjkTkieu44yTMasS9qv/BagUNm/91AHuy2aDmjjTmoHu9jqgTvrVEU
	kxO+ybT2ikx8Hk+MBcGFsS9qiV47VrvOcedu8NhpKUBoYmC9aJz+60SOI7mncHuxy2+YGanLmLThJ
	2uYQ6ctGQ2fZPAbY2iJDNISw9RIPSYuYy0ugM5Q0owEqZS/FSdIhyixGwVWZ9fA8kTOMKO2Sm2yFB
	vNBrrJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXJQ-00000009s6y-2kei;
	Thu, 13 Mar 2025 01:24:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXJN-00000009s4m-1zbj
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 01:24:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZCqSd62pfzCs76;
	Thu, 13 Mar 2025 09:20:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id E0A421402DB;
	Thu, 13 Mar 2025 09:24:22 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Mar 2025 09:24:22 +0800
Subject: Re: [PATCH v1 1/1] mtd: mtdpart: Do not supply NULL to printf()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250312201649.217555-1-andriy.shevchenko@linux.intel.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e6616c70-7579-6114-95b0-3c4a94f98aa0@huawei.com>
Date: Thu, 13 Mar 2025 09:24:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250312201649.217555-1-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_182437_653876_FF3FFD81 
X-CRM114-Status: GOOD (  12.11  )
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

5ZyoIDIwMjUvMy8xMyA0OjE2LCBBbmR5IFNoZXZjaGVua28g5YaZ6YGTOgo+IENvbXBpbGVyIGlz
IG5vdCBoYXBweSBhYm91dCBOVUxMIGJlaW5nIHN1cHBsaWVkIGFzIHByaW50ZigpIHBhcmFtZXRl
cjoKCnByaW50ZiAtPiBwcmludGs/IFRoZSB0aXRsZSBoYXMgdGhlIHNhbWUgaXNzdWUuCj4gCj4g
ZHJpdmVycy9tdGQvbXRkcGFydC5jOjY5MzozNDogZXJyb3I6IOKAmCVz4oCZIGRpcmVjdGl2ZSBh
cmd1bWVudCBpcyBudWxsIFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dCj4gCj4gUmVwbGFjZSB0
aGF0IHdpdGggIihudWxsKSIgdG8gZml4IGNvbXBpbGF0aW9uIGVycm9yLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvbXRkcGFydC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFv
IENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4gaW5kZXggNjgxMWE3MTQzNDlk
Li42ZjdlMjUwZWY3MTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4gKysr
IGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4gQEAgLTY5MSw3ICs2OTEsNyBAQCBpbnQgcGFyc2Vf
bXRkX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsIGNvbnN0IGNoYXIgKmNvbnN0
ICp0eXBlcywKPiAgIAkJCWlmICghcGFyc2VyICYmICFyZXF1ZXN0X21vZHVsZSgiJXMiLCAqdHlw
ZXMpKQo+ICAgCQkJCXBhcnNlciA9IG10ZF9wYXJ0X3BhcnNlcl9nZXQoKnR5cGVzKTsKPiAgIAkJ
CXByX2RlYnVnKCIlczogZ290IHBhcnNlciAlc1xuIiwgbWFzdGVyLT5uYW1lLAo+IC0JCQkJcGFy
c2VyID8gcGFyc2VyLT5uYW1lIDogTlVMTCk7Cj4gKwkJCQlwYXJzZXIgPyBwYXJzZXItPm5hbWUg
OiAiKG51bGwpIik7Cj4gICAJCQlpZiAoIXBhcnNlcikKPiAgIAkJCQljb250aW51ZTsKPiAgIAkJ
CXJldCA9IG10ZF9wYXJ0X2RvX3BhcnNlKHBhcnNlciwgbWFzdGVyLCAmcHBhcnRzLCBkYXRhKTsK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
