Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C881BCF6495
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 01:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SkrSdDiiUiMjdEtAqUfrfDSpU+DHC/HLklwbOoOeNo=; b=CEC1eNOIEeLMgYR00dte8w9csp
	rmWtuyNCqIDbkEKfjDUCTjTLvRvrn14w9Qw4dDJJ/LlWnEKOR4+ieg73QgBDk7mvb86LropFxfeH4
	WaZVA/qWzYLU8NGqj93EI4OAXhvaeEtaaH4dTMsYlUvQXWuIRxxWWUz/6Ra113I15jI07YFb5NnVw
	xgO1UuKaiuu6kB9xq8ZVVHlY8F0sehuBHzY1clZOQ+kdrApcPr4hAkt6Pk7041ZrdxaL9N7iCnPmt
	XgnOjFgfIaenj93Zj4GuuMqKlMW6erFVt3gUO0JDpfCh0x02lxipUIppo5VpcizAuyDFcpQ7lawHn
	m673OQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv57y-0000000Fe4m-0ns6;
	Mon, 30 Sep 2024 01:23:06 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv57t-0000000Fe48-3CdR
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 01:23:03 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XH3B45y19z1HKLf;
	Mon, 30 Sep 2024 09:18:52 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 586D01A016C;
	Mon, 30 Sep 2024 09:22:48 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 09:22:47 +0800
Subject: Re: [PATCH] ubifs: Convert ubifs to use the new mount API
To: Eric Sandeen <sandeen@redhat.com>, <linux-mtd@lists.infradead.org>
CC: <brauner@kernel.org>, David Howells <dhowells@redhat.com>, Richard
 Weinberger <richard@nod.at>
References: <20240926203604.23622-1-sandeen@redhat.com>
 <6081021a-be81-7877-8c1d-5311d9968124@huawei.com>
 <a2ff7d9b-799c-46e3-bd43-1b34bf8fdc66@redhat.com>
 <1075eb6d-9de8-8dcb-cd26-b548e6477206@huawei.com>
 <fde1e3c9-f3ba-450c-ae5d-83abb912d2fe@redhat.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3418947d-36ad-0fe9-e27c-0fd0540f0918@huawei.com>
Date: Mon, 30 Sep 2024 09:22:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fde1e3c9-f3ba-450c-ae5d-83abb912d2fe@redhat.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_182302_082518_8B6493DE 
X-CRM114-Status: GOOD (  13.53  )
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

5ZyoIDIwMjQvOS8zMCAwOjQ2LCBFcmljIFNhbmRlZW4g5YaZ6YGTOgo+IE9uIDkvMjgvMjQgODo1
NyBQTSwgWmhpaGFvIENoZW5nIHdyb3RlOgo+PiBBYm92ZSBtb2RpZmljYXRpb24gY2FuIGZpeCB0
aGUgcHJvYmxlbSwgYnV0IGl0IGxvb2tzIG5vdCBzbyBjbGVhbi4KPj4gVGhlcmUgYXJlIHR3byBt
YWluIHN0ZXBzIGZvciBtb3VudC9yZW1vdW50IGluIHRoZSBuZXcgQVBJIGZyYW1ld29yazoKPj4g
MS4gR2V0IGZpbGVzeXN0ZW0gY29uZmlndXJhdGlvbnMgYnkgcGFyc2luZyB0aGUgcGFyYW1hdGVy
cyBmcm9tIHRoZSB1c2VyIGRhdGEuCj4+IDIuIEFwcGx5IHRoZSBmaWxlc3lzdGVtIGNvbmZpZ3Vy
YXRpb25zIHRvIHN1cGVyYmxvY2soRm9yIG1vdW50LCBhIHN1cGVyYmxvY2sgc2hvdWxkIGJlIGFs
bG9jYXRlZCBmaXJzdC4pLgo+Pgo+PiBTbywgaG93IGFib3V0IGRvaW5nIHRoYXQgbGlrZSBleHQ0
IGRvZXM6Cj4+IDEpIHRoZSBmaWxlc3lzdGVtIHNwZWNpZmllZCBzdXBlcmJsb2NrIGlzIGFsbG9j
YXRlZCBpbiBmaWxsX3N1cGVyKCksIG5vdCBpbiBpbml0X2ZzX2NvbnRleHQoKSwgaXQgbG9va3Mg
bW9yZSByZWFzb25hYmxlLCBiZWNhdXNlIGZpbGVzeXN0ZW0gZG9lc24ndCBuZWVkIGEgbmV3IHBy
aXZhdGUgc3VwZXJibG9jayBpbiByZW1vdW50aW5nIHByb2Nlc3MuIEJ1dCwgVUJJRlMgaGFzIG9u
ZXRoaW5nIGRpZmZlcmVudCwgc2JfdGVzdCgpIG5lZWRzIHZvbHVtZSBpbmZvcm1hdGlvbiB3aGlj
aCBjb21lcyBmcm9tIHByaXZhdGUgc3VwZXJibG9jaywgc28gVUJGSVMgcHJpdmF0ZSBzdXBlcmJs
b2NrKHN0cnVjdCB1Ymlmc19pbmZvKSBpcyBhbGxvY2F0ZWQgaW4gdWJpZnNfbW91bnQoKS4gSGVy
ZSwgSSBwcmVmZXIgdG8ga2VlcCBwcml2YXRlIHN1cGVyYmxvY2sgYWxsb2NhdGlvbiBzdGlsbCBp
biB1Ymlmc19tb3VudChmb3IgbmV3IG1vdW50IEFQSSwgaXQgaXMgY2FsbGVkIHViaWZzX2dldF90
cmVlKS4KPj4gMikgdGhlIGZpbGVzeXN0ZW0gY29uZmlndXJhdGlvbnMoY29udGFpbnMgbW91bnQg
b3B0aW9ucykgYXJlIHN0b3JlZCBpbiBhIHNlcGFyYXRlZCBzdHJ1Y3R1cmUoaW4gZXh0NCwgaXQg
aXMgY2FsbGVkIGV4dDRfZnNfY29udGV4dCksIHdoaWNoIGlzIGFsbG9jYXRlZCBpbiBpbml0X2Zz
X2NvbnRleHQoKS4gRm9yIFVCSUZTLCB3ZSBjYW4gZGVmaW5lIGEgc2ltaWxhciBzdHJ1Y3R1cmUg
dG8gc3RvcmUgdGhlIGZpbGVzeXN0ZW0gY29uZmlndXJhdGlvbnMuCj4gCj4gWWVzLCB0aGlzIGlz
IHdoYXQgSSBoYWQgbWVudGlvbmVkIGFib3ZlLCBpLmUuIGhhdmluZyBhIHNlcGFyYXRlIG1vdW50
Cj4gY29udGV4dCBpbiAtPmZzX3ByaXZhdGUgcmFhdGhlciB0aGFuIHVzaW5nIC0+ZnNfaW5mbywg
SSBjYW4gZG8gaXQgdGhpcwo+IHdheSBpZiB5b3UgcHJlZmVyLiBJIGhhZCBqdXN0IHN0YXJ0ZWQg
d2l0aCBkaG93ZWxsJ3Mgb3JpZ2luYWwKPiBpbXBsZW1lbnRhdGlvbiBmb3Igc3BlZWQuIDopCgpG
aW5lLCB3ZSd2ZSBjb21lIHRvIGFuIGFncmVlbWVudC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
