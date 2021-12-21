Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D99C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imbHxDKNBPHtjzTNs7BQIR+wJfAo2/FNKnRjxFfmfeA=; b=qRPimXvW6V+Iv3FxuxbzKYvVlC
	SWChOx/82OoSqppAhFNyv1bnemHJo7lgIVjriV+Huxp7JReMGNws9zrGnueQyjBEgkj7ftfKv8IDm
	4DBRZ+nOAWMuSO/hEVkfVOeScGyTQYzpJH2Ti4MuZpw6gy4VPz1IhKphqL1+InR72z2fJNbWwKMnS
	dRrnqBCxPRpDE+p0xybxWFHS4tARfPVmcC1qJzKhauSZJErO649OG994MKj6JGNJyVhRcGJr01PGr
	c8UBky2aEmyR5Z00ht0hX1Xb6Qv5kMWZ2ekGBHqN7GLvHSnahg8D6ivbdFAmLUc4F2R0Sa7WlTPnI
	82RwdGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzeMM-006nEA-E8; Tue, 21 Dec 2021 12:35:14 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzeMJ-006nBr-Tw
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 12:35:13 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JJG9x4qJnzcbtH;
 Tue, 21 Dec 2021 20:34:45 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 20:35:07 +0800
Subject: Re: [PATCH -next 0/3] fix some bugs in ubifs_garbage_collect
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <yukuai3@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20211115013144.2479319-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <21ad2492-0396-6da3-4e21-b58cc13292ab@huawei.com>
Date: Tue, 21 Dec 2021 20:35:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20211115013144.2479319-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_043512_171169_F5FE06A6 
X-CRM114-Status: UNSURE (   5.42  )
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

1NogMjAyMS8xMS8xNSA5OjMxLCBCYW9rdW4gTGkg0LS1wDoKCnBpbmcKCj4gQmFva3VuIExpICgz
KToKPiAgICB1YmlmczogZml4IHNsYWItb3V0LW9mLWJvdW5kcyBpbiB1Ymlmc19jaGFuZ2VfbHAK
PiAgICB1YmlmczogZml4IGRvdWJsZSByZXR1cm4gbGViIGluIHViaWZzX2dhcmJhZ2VfY29sbGVj
dAo+ICAgIHViaWZzOiByZWFkLW9ubHkgaWYgTEVCIG1heSBhbHdheXMgYmUgdGFrZW4gaW4gdWJp
ZnNfZ2FyYmFnZV9jb2xsZWN0Cj4KPiAgIGZzL3ViaWZzL2djLmMgfCAxOSArKysrKysrKysrKysr
KysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
