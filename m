Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793FAC636C8
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 01:43:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D91F613DA
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 01:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D91F613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1sczdIfgEKLPAIPWwmwD1yilTIoCjiwTZYnxle+Uhe8=; b=W7JCVcgqA2wZFlIYHmd3/ub7DO
	IP1jw3BRHPtwAyva6bZ/8tgzLZx0gk8za2sUu4Ij3OJ7pVc8Xu9Q0huJGH1HVK85Yh2eotDgTAEsJ
	AKxJmnddx6nS0VAcl4sn8vFtSF8K/Dqr30ji6Z+5ir82NL92gGv37GvC4JkUOYgILHcVZ+KSs0gdD
	sCRwsMaMdrCUk3pJHJIYpV4KRG41/ki88QCj/uOH+EwAWdQZ3/0LrIylXrgFA3AMivsQ/n7LbCNF9
	YfhK5dFPTuVZ7/YGEqQclmvNXz4OAiWu2ApmmGPTvvtPtsyCSYQ9aQ+L6T1QT040QuO6jh3j+aD+J
	Lj7nNfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Cs0-002qyO-H7; Fri, 16 Jul 2021 01:42:28 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Crw-002qxp-Ok
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 01:42:26 +0000
Received: from dggeme703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GQv5x1kZ0z7v3J;
 Fri, 16 Jul 2021 09:38:45 +0800 (CST)
Received: from [10.174.178.125] (10.174.178.125) by
 dggeme703-chm.china.huawei.com (10.1.199.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 16 Jul 2021 09:42:19 +0800
Subject: Re: [PATCH] mtd: fix size in mtd_info_user to support 64-bit
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <David.Woodhouse@intel.com>,
 <Artem.Bityutskiy@nokia.com>, <ext-adrian.hunter@nokia.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linfeilong@huawei.com>
References: <20210708131359.21591-1-linmiaohe@huawei.com>
 <20210716010224.44582046@xps13>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <95e3d455-ccb1-0e22-ee83-78dc6ad8aab1@huawei.com>
Date: Fri, 16 Jul 2021 09:42:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210716010224.44582046@xps13>
Content-Language: en-US
X-Originating-IP: [10.174.178.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme703-chm.china.huawei.com (10.1.199.99)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_184225_035037_57874DC7 
X-CRM114-Status: GOOD (  13.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS83LzE2IDc6MDIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgTWlhb2hlLAo+IAo+
IE1pYW9oZSBMaW4gPGxpbm1pYW9oZUBodWF3ZWkuY29tPiB3cm90ZSBvbiBUaHUsIDggSnVsIDIw
MjEgMjE6MTM6NTkKPiArMDgwMDoKPiAKPj4gRnJvbTogRmVpbG9uZyBMaW4gPGxpbmZlaWxvbmdA
aHVhd2VpLmNvbT4KPj4KPj4gVGhlIHNpemUgaW4gc3RydWN0IG10ZF9pbmZvX3VzZXIgaXMgMzIt
Yml0LCB3aGljaCB3aWxsIGNhdXNlIGVycm9ycwo+PiB3aGVuIG9idGFpbmluZyB0aGUgc2l6ZSBv
ZiBsYXJnZS1jYXBhY2l0eSBNVEQgZGV2aWNlcywgc3VjaCBhcyBUTEMKPj4gTkFORCBGTEFTSC0y
MDQ4R2IuCj4gCj4gQmVzaWRlcyB0aGUgZmFjdCB0aGF0IHN1Y2ggZGV2aWNlcyBhcmUgZmFyIGZy
b20gYmVpbmcgc3VwcG9ydGVkIGJ5IHRoZQo+IExpbnV4IGtlcm5lbCwgdGhpcyBjaGFuZ2Ugd291
bGQgYmFzaWNhbGx5IGJyZWFrIHVzZXJzcGFjZSwgaXQgY2Fubm90Cj4gZW50ZXIgYXMtaXMuLi4K
PiAKCkkgc2VlLiBNYW55IHRoYW5rcyBmb3IgeW91ciByZXBseSEgV2UncmUgd29ya2luZyB3aXRo
IHRoZXNlIGxhcmdlLWNhcGFjaXR5Ck1URCBkZXZpY2VzIG5vdywgYW55IHN1Z2dlc3Rpb24gdG8g
d29yayBhcm91bmQgdGhpcz8KClRoYW5rcyBhZ2FpbiEKCj4+IEZpeGVzOiA2OTQyM2Q5OWZjMTgg
KCJbTVREXSB1cGRhdGUgaW50ZXJuYWwgQVBJIHRvIHN1cHBvcnQgNjQtYml0IGRldmljZSBzaXpl
IikKPj4gU2lnbmVkLW9mZi1ieTogRmVpbG9uZyBMaW4gPGxpbmZlaWxvbmdAaHVhd2VpLmNvbT4K
Pj4gLS0tCj4+ICBpbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaCB8IDIgKy0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL210ZC9tdGQtYWJpLmggYi9pbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaAo+
PiBpbmRleCBiODY5OTkwYzJkYjIuLmVmZTBiNTNiMTBjMSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVk
ZS91YXBpL210ZC9tdGQtYWJpLmgKPj4gKysrIGIvaW5jbHVkZS91YXBpL210ZC9tdGQtYWJpLmgK
Pj4gQEAgLTEyOCw3ICsxMjgsNyBAQCBzdHJ1Y3QgbXRkX3dyaXRlX3JlcSB7Cj4+ICBzdHJ1Y3Qg
bXRkX2luZm9fdXNlciB7Cj4+ICAJX191OCB0eXBlOwo+PiAgCV9fdTMyIGZsYWdzOwo+PiAtCV9f
dTMyIHNpemU7CS8qIFRvdGFsIHNpemUgb2YgdGhlIE1URCAqLwo+PiArCV9fdTY0IHNpemU7CS8q
IFRvdGFsIHNpemUgb2YgdGhlIE1URCAqLwo+PiAgCV9fdTMyIGVyYXNlc2l6ZTsKPj4gIAlfX3Uz
MiB3cml0ZXNpemU7Cj4+ICAJX191MzIgb29ic2l6ZTsJLyogQW1vdW50IG9mIE9PQiBkYXRhIHBl
ciBibG9jayAoZS5nLiAxNikgKi8KPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IC4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
