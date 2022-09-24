Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40685C04A95
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Sep 2022 00:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFGKvjLhXph2K+/cRc9rs4ZxxlI6sjlA32bSexvHxcQ=; b=pLLDVm74qa+xZc
	Ci1QWtMtr1Pm/j0apESYbptPTBKEuj6b+FiFcNeLV1/IiXBd95TM7ECdZF2LBhJWEBtMimuhV/74e
	Esgru+nPuurabOkeAOisTSzx4mxtmLp8suPSmuoL9qwLqqb83ixxJ6P+EU3/MDiHipLlnzSuqF7gV
	scnpTLZGQu/W3j75xyIvXSef8nc+HbYJlKUpsi03PDLeQWlaX+P46kb9BL1i0IpZ0FKrcGHTSyTQg
	+hJTy0tI9+MXMy9igDVDzDoY+qDiwLl5yqRxA9xLN69heft5Ak37w0PatGjZBZbDSjdS7mOiBrPdP
	ndc1+AcB2Wh/qVJuar0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obtKf-00637n-42; Sat, 24 Sep 2022 00:47:49 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obtKb-00637P-N5
	for linux-mtd@lists.infradead.org; Sat, 24 Sep 2022 00:47:47 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MZ9Kc39bkzHqMZ;
	Sat, 24 Sep 2022 08:45:24 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 08:47:36 +0800
Message-ID: <fd206961-2557-87de-5c69-95afcc94a9c9@huawei.com>
Date: Sat, 24 Sep 2022 08:47:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH -next] mtd: spi-nor: fix artificial warning when
 CONFIG_MTD_CFI_Ix disable
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
CC: <tudor.ambarus@microchip.com>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<boris.brezillon@collabora.com>, <computersforpeace@gmail.com>,
	<linux-mtd@lists.infradead.org>, <liwei391@huawei.com>
References: <20220923015151.3302417-1-zengheng4@huawei.com>
 <9ff321c05419f382206d38df09650937@walle.cc>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <9ff321c05419f382206d38df09650937@walle.cc>
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_174745_958412_16BC5899 
X-CRM114-Status: UNSURE (   9.26  )
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

VGhhbmtzIGZvciB5b3VyIHJldmlldy4KClplbmcgSGVuZwoKT24gMjAyMi85LzIzIDE2OjE2LCBN
aWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjItMDktMjMgMDM6NTEsIHNjaHJpZWIgWmVuZyBI
ZW5nOgo+PiBXaGVuIENPTkZJR19TUElfSU5URUwgaXMgc2VsZWN0ZWQgd2l0aG91dAo+PiBDT05G
SUdfTVREX0NGSV9JWzEsMiw0LDhdIGVuYWJsZWQsIGl0IHdvdWxkIHJhaXNlCj4+IGNvbXBpbGUg
d2FybmluZyBhcyBiZWxvdzoKPj4KPj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9s
aW51eC9tdGQvc3BpLW5vci5oOjEwLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmcm9tIGRyaXZlcnMvc3BpL3NwaS1pbnRlbC5jOjEzOgo+PiAuL2luY2x1ZGUvbGludXgvbXRk
L2NmaS5oOjYyOjI6Cj4+IGVycm9yOiAjd2FybmluZyBObyBDT05GSUdfTVREX0NGSV9JeCBzZWxl
Y3RlZC4gTm8gTk9SIGNoaXAgc3VwcG9ydCBjYW4KPj4gd29yay4gWy1XZXJyb3I9Y3BwXQo+PiDC
oMKgIDYyIHwgI3dhcm5pbmcgTm8gQ09ORklHX01URF9DRklfSXggc2VsZWN0ZWQuIE5vIE5PUiBj
aGlwIHN1cHBvcnQgCj4+IGNhbiB3b3JrLgo+PiDCoMKgwqDCoMKgIHzCoCBefn5+fn5+Cj4+Cj4+
ICJtdGQvY2ZpLmgiIGlzIGludHJvZHVjZWQgaW50byAibXRkL3NwaS1ub3IuaCIgYnkKPj4gY29t
bWl0IGRiNDc0NWVkYjI4MiAoIm10ZDogc3BpLW5vcjogYWRkIFNQSSBOT1IgbWFudWZhY3R1cmVy
IElEcyIpLAo+PiB3aGljaCB3YXMgYWxyZWFkeSByZW1vdmVkIG91dCBzaW5jZSBmcm9tIHRoZSBj
b21taXQKPj4gZDNjNGJiMzFiZjYyICgibXRkOiBzcGktbm9yOiBEcm9wIHRoZSBNRlIgZGVmaW5p
dGlvbnMiKS4KPj4KPj4gQWZ0ZXIgYWJvdmUsIG10ZC9jZmkuaCBpcyBub3QgbW9yZSBuZWVkZWQg
YnkgbXRkL3NwaS1ub3IuaCwKPj4gc28gZGV0YWNoIHRoZSBkZXBlbmRlbmNlLgo+Pgo+PiBGaXhl
czogZDNjNGJiMzFiZjYyICgibXRkOiBzcGktbm9yOiBEcm9wIHRoZSBNRlIgZGVmaW5pdGlvbnMi
KQo+PiBGaXhlczogZGI0NzQ1ZWRiMjgyICgibXRkOiBzcGktbm9yOiBhZGQgU1BJIE5PUiBtYW51
ZmFjdHVyZXIgSURzIikKPgo+IFdoeSBhcmUgdGhlcmUgdHdvIGZpeGVzIHRhZ3M/IElmIHRoaXMg
cGF0Y2ggaXMgYXBwbGllZCB0bwo+IHRyZWVzIHdoaWNoIG9ubHkgY29udGFpbiB0aGUgc2Vjb25k
IGNvbW1pdCwgdGhlcmUgd2lsbCBiZSBhCj4gY29tcGlsZSBlcnJvci4KPgo+IFNvIGl0IHNob3Vs
ZCBvbmx5IGJlCj4gRml4ZXM6IGQzYzRiYjMxYmY2MiAoIm10ZDogc3BpLW5vcjogRHJvcCB0aGUg
TUZSIGRlZmluaXRpb25zIikKPgo+IHdpdGggdGhhdCBmaXhlZDoKPiBSZXZpZXdlZC1ieTogTWlj
aGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPgo+IC1taWNoYWVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
