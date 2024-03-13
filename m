Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DD9C54791
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 12:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31Ph0g4xk8PkPgWjh1mfBavthZjzLYGXuBzzEPLZWys=; b=MFDcSz2OOvamLbkiVmM0VYEu1Q
	CCPndivDIIhaEebzOg5EZJpdtNQykeK+q//UqL9MtDIQTzPU2WITk1APUaw4/+bbAamE/CMFOvCTS
	u2NDw22kdxZqKO4POMjAz2J9/aURKZ1StyOHcznMyE8zIYW5SqJCoEsm8vX+QWyUgNVRQjc+D5/ab
	UgY5xPBvxEMCEr26M9U+qac/fNksq5fAvhHsiTAcWA7aYWXGDtPRg7TfgEsZD78sx//cco2lur57l
	16V5Yuj8w4RUh4MMltUJrCNU3i39Zf/3Pm4yi2JH6Ist5wrpqNbH6VqAre0xObKlo7NLYoxI7UJTk
	7rDOHLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNRs-0000000A1Kt-29QS;
	Wed, 13 Mar 2024 12:11:08 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNRm-0000000A1K8-3zRN
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 12:11:06 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tvq8w4fJ0z1FMBr;
	Wed, 13 Mar 2024 20:10:40 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 642BC140159;
	Wed, 13 Mar 2024 20:10:56 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 20:10:55 +0800
Subject: Re: [PATCH] mtd: ubi: avoid expensive do_div() on 32-bit machines
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240313084707.3292300-1-arnd@kernel.org>
 <4f945f4a-ac29-3ef7-9e15-123962f2a0e9@huawei.com>
 <e0684202-6926-4bd1-86f6-2bb682524712@app.fastmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1a12c8ed-0cb5-5650-24a2-84b021c444c3@huawei.com>
Date: Wed, 13 Mar 2024 20:10:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e0684202-6926-4bd1-86f6-2bb682524712@app.fastmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_051103_201211_2E2AD2D4 
X-CRM114-Status: GOOD (  15.19  )
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

5ZyoIDIwMjQvMy8xMyAxOTo1MywgQXJuZCBCZXJnbWFubiDlhpnpgZM6Cj4gT24gV2VkLCBNYXIg
MTMsIDIwMjQsIGF0IDEyOjI5LCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+IOWcqCAyMDI0LzMvMTMg
MTY6NDYsIEFybmQgQmVyZ21hbm4g5YaZ6YGTOgo+Pj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KPj4+Cj4+PiBUaGUgdXNlIG9mIGRvX2RpdigpIGluIHViaV9udm1lbV9yZWdf
cmVhZCgpIG1ha2VzIGNhbGxpbmcgaXQgb24KPj4+IDMyLWJpdCBtYWNoaW5lcyByYXRoZXIgZXhw
ZW5zaXZlLiBTaW5jZSB0aGUgJ2Zyb20nIHZhcmlhYmxlIGlzCj4+PiBrbm93biB0byBiZSBhIDMy
LWJpdCBxdWFudGl0eSwgaXQgaXMgY2xlYXJseSBuZXZlciBuZWVkZWQgYW5kCj4+PiBjYW4gYmUg
b3B0aW1pemVkIGludG8gYSByZWd1bGFyIGRpdmlzaW9uIG9wZXJhdGlvbi4KPj4+Cj4+IERvIHlv
dSBtZWV0IGEgcGVyZm9ybWFuY2UgcHJvYmxlbSBvbiBhIDMyLWJpdCBtYWNoaW5lPyBUaGVyZSBh
cmUgdG9vCj4+IG1hbnkgcGxhY2VzIGludm9raW5nIGRvX2Rpdiwgd2h5IGRvIHlvdSBvcHRpbWl6
ZSB0aGlzIG9uZT8KPj4gSGF2ZSB5b3UgdGVzdGVkIHRoZSBpbmZsdWVuY2Ugb24gYSB4ODZfNjQg
cGxhdGZvcm0gYWZ0ZXIgdGhpcyBwYXRjaAo+PiBhcHBsaWVkPyBMb29rcyBsaWtlIHRoYXQgZG9f
ZGl2IGlzIG1vcmUgZWZmaWNpZW50IGluIHg4Ni4KPiAKPiBUaGlzIG9uZSB3YXMganVzdCBpbnRy
b2R1Y2VkLiBUaGUgY2FsbCBzaXRlIGxvb2tzIGxpa2UgYSBmYXN0Cj4gcGF0aCBhbmQgaXQgY2F1
c2VkIGEgYnVpbGQgcmVncmVzc2lvbiB0aGF0IERhbmllbCBhZGRyZXNzZWQgd2l0aAo+IGFuIHN1
Ym9wdGltYWwgY29tbWl0IGI4YTc3YjlhNWY5YyAoIm10ZDogdWJpOiBmaXggTlZNRU0gb3Zlcgo+
IFVCSSB2b2x1bWVzIG9uIDMyLWJpdCBzeXN0ZW1zIikuCj4gCj4gVGhlIHdheSBpdCB1c3VhbGx5
IGdvZXMgaXMgdGhhdCBzb21lb25lIGFkZHMgYW4gb3Blbi1jb2RlZAo+IDY0LWJpdCBkaXZpc2lv
biB0aGF0IGNhdXNlcyBhIGxpbmsgZmFpbHVyZSwgd2hpY2ggcHJvbXB0cwpJJ20gYSBsaXR0bGUg
Y29uZnVzZWQsIHdoYXQga2luZCBvZiBsaW5rIGZhaWx1cmU/IENvdWxkIHlvdSBzaG93IGFuIGV4
YW1wbGU/Cj4gdGhlIG9yaWdpbmFsIGRldmVsb3BlciB0byBlaXRoZXIgcmV3cml0ZSB0aGUgY29k
ZSB0byBhdm9pZAo+IHRoZSBsb25nIGRpdmlzaW9uIGlmIHBvc3NpYmxlLCBvciBhZGQgZG9fZGl2
KCkgYWZ0ZXIgc2hvd2luZwo+IHRoYXQgaXQgaXMgbm93IHBlcmZvcm1hbmNlIGNyaXRpY2FsLCBl
LmcuIG9ubHkgY2FsbGVkIGF0Cj4gcHJvYmUgdGltZS4KPiAKPiAgICAgICBBcm5kCj4gLgo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
