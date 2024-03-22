Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E98C54E71
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YbPb0BbGtZsCu+JXrOHxTFLjH05nRAG4DFUdOdUYRE=; b=BkzfRxBJ+659FVIUnQBsb3g5o6
	hKnR4l+9bNQ06vKhMaIn3l79bS5lQ5b2FLVif5dzHtNtpSFj/vsxVjDKDetPaTwS+uThdCrp62jy5
	2jL7L4y5zxfxdjboIGGutMaWl/pFg+lpcceqGceHrwv4/v/Jdfdgb74YKco5hI93ZFqZxM2CiSCQd
	eonfRie8utvU2uz4s0tgDm8UIWmbzbiuI78sjQjpJrCTEv2Du6fq2vTRiaXSkbCbHq+7dysCW3jzR
	QGoNNzBZg2FVuQH3KJE0dOr0DEatEFrrodI4M8O7mTRNH/U4vB7vkMGotDTmyPAFBP3Mgcpe69nSP
	rAZcAhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndj5-000000074hB-0b8E;
	Fri, 22 Mar 2024 12:10:23 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndj1-000000074g0-1x4m
	for linux-mtd@lists.infradead.org;
	Fri, 22 Mar 2024 12:10:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4V1Ljm15h3z1GCkx;
	Fri, 22 Mar 2024 20:09:48 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id A03C614013B;
	Fri, 22 Mar 2024 20:10:13 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 20:10:12 +0800
Subject: Re: [RFC PATCH 4/5] ubifs: Introduce ACLs mount options
To: Li Zetao <lizetao1@huawei.com>, <richard@nod.at>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
References: <20240319161646.2153867-1-lizetao1@huawei.com>
 <20240319161646.2153867-5-lizetao1@huawei.com>
 <c3d5f06e-bdc4-4312-19a1-17a7a64e8795@huawei.com>
 <b91ebdb0-bcca-18f9-6f0f-5eef6c72b42c@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4c30c8e4-92fe-9935-b2ee-7b5728f261fc@huawei.com>
Date: Fri, 22 Mar 2024 20:10:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b91ebdb0-bcca-18f9-6f0f-5eef6c72b42c@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_051019_790948_5B564A2A 
X-CRM114-Status: GOOD (  10.08  )
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

5ZyoIDIwMjQvMy8yMiAyMDowNSwgTGkgWmV0YW8g5YaZ6YGTOgo+IEhpLAo+IAo+IE9uIDIwMjQv
My8yMSAxNDo0OSwgWmhpaGFvIENoZW5nIHdyb3RlOgo+PiDlnKggMjAyNC8zLzIwIDA6MTYsIExp
IFpldGFvIOWGmemBkzoKPj4+IEltcGxlbWVudCB0aGUgYWJpbGl0eSB0byBlbmFibGUgb3IgZGlz
YWJsZSB0aGUgQUNMcyBmZWF0dXJlIHRocm91Z2gKPj4+IG1vdW50IG9wdGlvbnMuICItbyBhY2wi
IG9wdGlvbiBtZWFucyBlbmFibGUgYW5kICItbyBub2FjbCIgbWVhbnMgZGlzYWJsZQo+Pj4gYW5k
IGl0IGlzIGVuYWJsZSBieSBkZWZhdWx0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IExpIFpldGFv
IDxsaXpldGFvMUBodWF3ZWkuY29tPgoKWy4uLl0KPj4+IEBAIC0yMDExLDEyICsyMDQxLDE3IEBA
IHN0YXRpYyBpbnQgdWJpZnNfcmVtb3VudF9mcyhzdHJ1Y3QgCj4+PiBzdXBlcl9ibG9jayAqc2Is
IGludCAqZmxhZ3MsIGNoYXIgKmRhdGEpCj4+PiDCoMKgwqDCoMKgIHN5bmNfZmlsZXN5c3RlbShz
Yik7Cj4+PiDCoMKgwqDCoMKgIGRiZ19nZW4oIm9sZCBmbGFncyAlI2x4LCBuZXcgZmxhZ3MgJSN4
Iiwgc2ItPnNfZmxhZ3MsICpmbGFncyk7Cj4+PiArwqDCoMKgIGMtPm1vdW50X29wdHMuYWNsID0g
MDsKPj4+IMKgwqDCoMKgwqAgZXJyID0gdWJpZnNfcGFyc2Vfb3B0aW9ucyhjLCBkYXRhLCAxKTsK
Pj4KPj4gMS4gbW91bnQgLW9ub2FjbCAvZGV2L3ViaTBfMCAvbW50ICMgQWZ0ZXIgdGhhdCwgbW91
bnQgd2lsbCBzaG93IAo+PiAnbm9hY2wnIG9wdGlvbgo+PiAyLiBtb3VudCAtb3JlbW91bnQseHh4
IC9kZXYvdWJpMF8wIC9tbnQKPj4gSWYgJ3h4eCcgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBhY2ws
IGMtPm1vdW50X29wdHMuYWNsIGlzIHNldCBhcyAnMCcuIAo+PiBUaGVuIHN1cGVyYmxvY2sgZmxh
ZyBpcyBhc3NpZ25lZCB3aXRoICdTQl9QT1NJWEFDTCcgYW5kIG1vdW50IHdpbGwgbm90IAo+PiBk
aXNwbGF5ICdub2NhbCcuIFdpbGwgaXQgbWFrZSB1c2VyIGNvbmZ1c2VkPwo+IEkgaGF2ZSB0ZXN0
ZWQgdGhpcyB1c2UgY2FzZSBhbmQgaXQgd29ya3MgZmluZS4gVGhpcyBpcyBiZWNhdXNlIHRoZSBt
b3VudCAKPiBvcHRpb25zIHdpbGwgYmUgcmUtcGFyc2VkIGR1cmluZyByZW1vdW50LCBqdXN0IGxp
a2UgdGhlIGxhc3QgbW91bnQuIEJ1dCAKPiB0aGlzIGlzIGluZGVlZCByZWR1bmRhbnQuIEkgYWRq
dXN0ZWQgaXQgdG8gbWFrZSBpdCBtb3JlIHJlYXNvbmFibGUuCgpZZXMsIHBhcmFtZXRlciAnZGF0
YScgY2FycmllcyBvbGQgbW91bnQgaW5mb3JtYXRpb24uIFJlbW92aW5nIHRoZSAKcmVkdW5kYW50
IGFzc2lnbm1lbnQgaXMgZmluZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
