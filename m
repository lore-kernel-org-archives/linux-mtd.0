Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E356DC3F2C6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 15:20:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34BC2073D
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 15:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mTdAYeJh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A34BC2073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lnOBwsKTlOGGFola5DVMjOvxsLdjdRrhNV3pSlwtpv8=; b=mTdAYeJhQ4R4MKV7aw2Rh6G4W
	x+dOHSbQj+D8ceP9PyY0C/I9r14dZ13T4BSul/Cql3x6jEg3etkzzl3d//T/GFIibzfjdE43AD22c
	0O5Z9ehZhKtx2j4jAPO3JfEHMggiKe+q0z3IZFzLyyTt5qIxqSU/yVVKxdIpid2K2bFR+LwgUar+o
	glbjwIV+VGTJMYC2kw2twpmKSUt+fYH2I4K0DdfJnopoE4kUv/aRzvMZtOMyOziRTx5avVH+BWIR4
	YTRyp6KQ+NSsL+beCOwOUZIolmR+76HCHQKgKwLNtJm4K+Hsd8ifqx421YpkLKVJ7t2eAhxjfq7kl
	qL14aV+JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j99Kl-0002YV-Jp; Tue, 03 Mar 2020 15:19:47 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j99Kh-0002Xu-FH
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 15:19:45 +0000
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id A8D7073E6D8D73F92C0F;
 Tue,  3 Mar 2020 15:19:36 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml703-cah.china.huawei.com (10.201.108.44) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 3 Mar 2020 15:19:32 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Mar 2020
 15:19:32 +0000
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>, "chenxiang (M)"
 <chenxiang66@hisilicon.com>, <linux-mtd@lists.infradead.org>
References: <20200227123657.26030-1-alexander.sverdlin@nokia.com>
 <18cdef63-75e3-97c3-2a22-4969d4997af9@hisilicon.com>
 <60b272c1-ab6a-7a7a-6f56-03d7c7daf8bc@nokia.com>
 <43ae2554-06c8-59f9-153e-094a326166c2@huawei.com>
 <5d6f3062-677f-3d0d-b0d7-7c97c658ed89@nokia.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <1f87b621-5c6e-3ac2-9559-d5b4ba9b0067@huawei.com>
Date: Tue, 3 Mar 2020 15:19:31 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <5d6f3062-677f-3d0d-b0d7-7c97c658ed89@nokia.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_071943_659843_0677253C 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDMvMDMvMjAyMCAxNDoyNywgQWxleGFuZGVyIFN2ZXJkbGluIHdyb3RlOgoKSGkgQWxleGFu
ZGVyLAoKPiAKPiBPbiAwMi8wMy8yMDIwIDE5OjI1LCBKb2huIEdhcnJ5IHdyb3RlOgo+Pj4+PiAt
wqDCoMKgwqB7wqAiczI1ZmwxMjlwMSIswqBJTkZPKDB4MDEyMDE4LMKgMHg0ZDAxLMKgwqA2NMKg
KsKgMTAyNCzCoDI1NizCoFNQSV9OT1JfRFVBTF9SRUFEwqB8wqBTUElfTk9SX1FVQURfUkVBRMKg
fMKgVVNFX0NMU1IpwqB9LAo+Pj4+PiArwqDCoMKgwqB7wqAiczI1ZmwxMjlwMSIswqBJTkZPKDB4
MDEyMDE4LMKgMHg0ZDAxLMKgwqA2NMKgKsKgMTAyNCzCoDI1NizCoFNQSV9OT1JfRFVBTF9SRUFE
wqB8wqBTUElfTk9SX1FVQURfUkVBRMKgfMKgVVNFX0NMU1IpCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAuZml4dXBzwqA9wqAmczI1ZnNfc19maXh1cHMswqB9LAo+Pj4+Cj4+Pj4gSXTC
oHNlZW1zwqBTRkRQwqBpc8Kgbm90wqBzdXBwb3J0ZWTCoG9uwqBzMjVmbDEyOXDCoCh5b3XCoGNh
bsKgY2hlY2vCoGl0wqBvbsKgaHR0cHM6Ly93d3cuY3lwcmVzcy5jb20vZmlsZS80MDA1ODYvZG93
bmxvYWQpLMKgc2/CoGlzwqBpdMKgbmVjZXNzYXJ5wqB0b8KgYWRkwqB0aGlzwqBmb3LCoHRoaXPC
oHR5cGXCoGZsYXNoPwo+Pj4KPj4+IFllcyzCoGFsbMKgb2bCoHRoZcKgYWJvdmXCoGlzwqBuZWNl
c3NhcnnCoHRvwqByZXBhaXLCoFMyNUZTMTI4UyzCoHdoaWNowqBzdXBwb3J0c8KgU0ZEUMKgYW5k
wqBsYW5kcwo+Pj4gaW7CoHRoZcKgYWJvdmXCoHRhYmxlwqBlbnRyeS4KPj4KPj4gU28gZG8geW91
IGtub3cgaG93IHdlIGNhbiB0ZWxsIGlmIHRoZSBwYXJ0IGlzIHMyNWZsMTI5cDEgb3IgUzI1RlMx
MjhTPyBJcyBpdCBiYXNlZCBvbiBmYW1pbHkgaWQ/IEZvciB0aGUgcGFydCBvZiBteSBib2FyZCwg
aXQgaGFzIHRoZSBzYW1lIGlkIGFjY29yZGluZyB0byAiczI1ZmwxMjlwMSIgZW50cnkgaW4gdGhl
IHNwaS1ub3IgZHJpdmVyLCB5ZXQgdGhlIFNGRFAgc2lnbmF0dXJlIGlzIG5vdCBwcmVzZW50IChz
aWduYXR1cmUgcmVhZHMgYXMgMHg0ZDE4MjAwMSB2cyBleHBlY3RlZCAweDUwNDQ0NjUzKS4gSSBw
cmludGVkIHRoZSBmYW1pbHkgaWQsIGFuZCBpdCBpcyA4MWgsIHdoaWNoIHNlZW1zIHRvIGFsaWdu
wqB3aXRowqBTMjVGU8KgKHdoaWNowqBzaG91bGTCoHN1cHBvcnTCoFNGRFApLsKgQ29uZnVzZWQu
Cj4+Cj4+IFdoYXQncyBtb3JlLCB0aGUgc3BpLW5vciBwcm9iZSBpcyBmYWlsaW5nIGZvciB0aGlz
IHBhcnQgc2luY2UgSSBlbmFibGVkIHF1YWQgc3BpLiBTbyBJIGFtIGludGVyZXN0ZWQgdG8ga25v
dyBpZiB0aGVyZSBpcyBzb21lIGRpZmZlcmVuY2VzIGJldHdlZW7CoHRoZXNlwqBwYXJ0wqBmYW1p
bGllc8KgZm9ywqB0aGF0Lgo+IAo+IEknZCBzYXksIG9uZSBjYW4gZGlzdGluZ3Vpc2ggdGhlbSBi
eSB0aGUgZmFjdCBvbmUgZG9lcyBzdXBwb3J0IFNGRFAgYW5kIGFub3RoZXIgZG9lc24ndC4KPiBJ
cyBpdCByZWFsbHkgbmVjZXNzYXJ5IHRvIGRpc3Rpbmd1aXNoIHRoZW0/CgpXZWxsIGl0IHdvdWxk
IGhlbHAgbWUgdG8ga25vdyBmb3Igc3VyZSB3aGljaCBwYXJ0IGlzIG9uIG15IGJvYXJkIDopCgpB
cyBhbiBleGFtcGxlIG9mIGEgcmVsZXZhbnQgZGlmZmVyZW5jZSwgUzI1RlMxMjhTIGRhdGFzaGVl
dCBoYXMgQ1IxViBhbmQgCkNSMU5WLCBidXQgUzI1RkwxMjkgb25seSBoYXMgYSBzaW5nbGUgY29u
ZmlndXJhdGlvbiByZWdpc3RlciwgYW5kIHRoaXMgCmlzIHJlbGF0ZWQgdG8gcXVhZCBtb2RlIGVu
YWJsZSwgd2hpY2ggSSBhbSBkZWJ1Z2dpbmcuCgpCVFcsIEhhdmUgeW91IHRyaWVkIHRvIGVuYWJs
ZSBxdWFkIG1vZGUgZm9yIHlvdXIgUzI1RlMtUyBwYXJ0PwoKVGhhbmtzLApKb2huCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
