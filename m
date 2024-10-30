Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4254AD7495F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 04:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+OUg0eP9r6HEJhcC1vfWwYlGHdsNNuMFTMkdqM5dpU=; b=1qGOYKH4ylofQJp44OmzHV/+z1
	NUsDtP1Hmp8YjWeBKdQj75cYePQoSZWWG4Qr18Xrmc0xNXjj7y6M47TFEijmSAkV4+yNDroh1FUu2
	S7w+RTd2ETFLaJAKVaBTmvP7pY8186sxeZiG5d61P2sVc5aTsuFURcxH1h5PXhhhrjWv4/FrlsS4K
	YidNktviWcfG0NNpgQuFuY5fQGO7Hsym+mqKXzFeqhKmvrJa3NTQupZCnrnQBCsp9D8IKGzKMk1YS
	SGJE6Vw0a5E4s3zIPGWf+fXI9NhWm2GKWoR/IA8JnWv199qpKDhgU14Jq83S8BprgSmzJ82TlwD30
	0vCsc1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60af-0000000GhMJ-1LKW;
	Wed, 30 Oct 2024 04:45:53 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60aa-0000000GhLg-2g6Q
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 04:45:50 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XdZKn1Vmjz20r5F;
	Wed, 30 Oct 2024 12:44:45 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4631B1A016C;
	Wed, 30 Oct 2024 12:45:44 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 30 Oct 2024 12:45:43 +0800
Subject: Re: [PATCH] jffs2: remove redundant check on outpos > pos
To: Colin Ian King <colin.i.king@gmail.com>, David Woodhouse
	<dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241029222015.3069873-1-colin.i.king@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cf07a880-1429-cc75-657e-55b32841cc00@huawei.com>
Date: Wed, 30 Oct 2024 12:45:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241029222015.3069873-1-colin.i.king@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_214549_112853_D55BF2AC 
X-CRM114-Status: GOOD (  15.45  )
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

1NogMjAyNC8xMC8zMCA2OjIwLCBDb2xpbiBJYW4gS2luZyDQtLXAOgo+IFRoZSBjaGVjayBmb3Ig
b3V0cG9zID4gcG9zIGlzIGFsd2F5cyBmYWxzZSBiZWNhdXNlIG91dHBvcyBpcyB6ZXJvCj4gYW5k
IHBvcyBpcyBhdCBsZWFzdCB6ZXJvOyBvdXRwb3MgY2FuIG5ldmVyIGJlIGdyZWF0ZXIgdGhhbiBw
b3MuCj4gVGhlIGNoZWNrIGlzIHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmkua2luZ0BnbWFpbC5jb20+Cj4gLS0t
Cj4gICBmcy9qZmZzMi9jb21wcl9ydWJpbi5jIHwgNSAtLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2pmZnMyL2NvbXByX3J1YmluLmMg
Yi9mcy9qZmZzMi9jb21wcl9ydWJpbi5jCj4gaW5kZXggNTU2ZGUxMDBlYmQ1Li45ODU0MjUzZDAx
MDggMTAwNjQ0Cj4gLS0tIGEvZnMvamZmczIvY29tcHJfcnViaW4uYwo+ICsrKyBiL2ZzL2pmZnMy
L2NvbXByX3J1YmluLmMKPiBAQCAtMjc2LDExICsyNzYsNiBAQCBzdGF0aWMgaW50IHJ1YmluX2Rv
X2NvbXByZXNzKGludCBiaXRfZGl2aWRlciwgaW50ICpiaXRzLCB1bnNpZ25lZCBjaGFyICpkYXRh
X2luLAo+ICAgCj4gICAJZW5kX3J1YmluKCZycyk7Cj4gICAKCk1heWJlIHRoaXMgY2hlY2sgY291
bGQgZGV0ZWN0IHRoZSBvdmVyZmxvdyBvZiAncG9zJywgSSBndWVzcy4KPiAtCWlmIChvdXRwb3Mg
PiBwb3MpIHsKPiAtCQkvKiBXZSBmYWlsZWQgKi8KPiAtCQlyZXR1cm4gLTE7Cj4gLQl9Cj4gLQo+
ICAgCS8qIFRlbGwgdGhlIGNhbGxlciBob3cgbXVjaCB3ZSBtYW5hZ2VkIHRvIGNvbXByZXNzLAo+
ICAgCSAqIGFuZCBob3cgbXVjaCBzcGFjZSBpdCB0b29rICovCj4gICAKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
