Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08C6C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  7 May 2022 03:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHy0deW7f3fVIY0zCGlqfSeDNlhskE+3zhpyhg1o2Ws=; b=2CKPxGSSRk+K0X9XaaoTs5bSO9
	pUXvru71s+ddZc9L5eb1tHtURoBHaeJ9egnf/QCp9naW1gpoSN9mbQXzy6X8isKNFvQedBoBfw+0p
	FDHmp661WAzLt9yXeLNySol4A2Q+kDHmo6GJoB4Q102FZUKH5nkw2cZoJbbmxivR08al2z9XE+e/s
	bZPuyCtweLVW2TzmOchy5HfrkeGTlhV0x/gZ+T0BN0jcHDvGklJiFHj+b/HGqrAsLvX+Ftez722md
	nGYJFyTdh0MDIPWxa91N7tiSSMpOE2M0u8PJ1htgLn6rul41io70qG9SmwAeRcxKWr/8lQ52kdIo2
	XQh0hxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnAkJ-005oxf-ST; Sat, 07 May 2022 03:04:39 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnAkG-005ox1-5c
 for linux-mtd@lists.infradead.org; Sat, 07 May 2022 03:04:37 +0000
Received: from kwepemi500006.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KwBxC6VJgzXdmV;
 Sat,  7 May 2022 10:59:43 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi500006.china.huawei.com (7.221.188.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 11:04:26 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 11:04:26 +0800
Subject: Re: UBIFS: is the corrupted file in a finite state when power cut ?
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: =?UTF-8?B?6KKB5bu66bmP?= <yuanjp89@163.com>,
 <linux-mtd@lists.infradead.org>
References: <77eb7829.4ee3.1805aeab188.Coremail.yuanjp89@163.com>
 <6e6de35c-662f-39bd-2a45-dd4cf85e9b1f@huawei.com>
Message-ID: <a2493189-60ef-1b29-eac0-069ef8f8ff56@huawei.com>
Date: Sat, 7 May 2022 11:04:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6e6de35c-662f-39bd-2a45-dd4cf85e9b1f@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_200436_420310_5ABED8F9 
X-CRM114-Status: UNSURE (   3.37  )
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

Cj4+IFE0LiBwb3dlciBjdXQgb25seSBsb3N0IHdob2xlIG1pbiBJL08gdW5pdCBzaXplID8KPj4K
Pj4gwqDCoMKgwqB3aXRoIDIwNDggYnl0ZXMgbWluIGlvIHVuaXQgc2l6ZS4gd3JpdGUgMTAwIGJ5
dGVzIGluIG9uZSB3cml0ZSgpIAo+PiBjYWxsLgo+PiDCoMKgwqDCoGl0J3Mgbm90IHBvc3NpYmxl
IHRoYXQgc2VlbiAyMCBieXRlcyB3aXRoIDgwIGJ5dGVzIGxvc3QuCkl0IGlzIHBvc3NpYmxlIHRo
YXQgc2VlbiAyMCBieXRlcyB3aXRoIDgwIGJ5dGVzIGxvc3QuCgpVQklGUyB3cml0ZXMgZGF0YSBj
b250ZW50IGluIFBBR0UgdW5pdChXZSBhc3N1bWUgdGhhdCBwYWdlX3NpemUgZXF1YWxzIAp0byA0
MDk2KSwgZm9yIGV4YW1wbGUgKFNlZSB1Ymlmc193cml0ZXBhZ2UoKSBhbmQgZ2VuZXJpY19wZXJm
b3JtX3dyaXRlKCkpOgoKCiAgICAgICAgIDIwQiAgODBCCiAgICAgICAgICDihpMgICDihpMKfCAg
UEFHRTEgICB8ICAgIFBBR0UyIHwKICAgICAgICAgICAg4oaRCiAgICAgICAgICBwb3dlcmN1dCEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
