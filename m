Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A3FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jul 2022 09:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKAI2xgqbRaAV1tQpd1SwmgQ8rscZaqDpxeM83XoVCU=; b=Z14GfdMdZijMgQ2AsUck4iB0rN
	xSCp200fUq+WyCaAKVFUMCmM2pR33MbRXPO3FgUniQqDoWBpBwLHYkHUd42B49pEGj3LnTIUBoR9J
	duBiquDELPNcayfaerjUmo+acbsXiXcipsqEdfFkZWchOVmySXI8DeDiVkIeOxt7Zuxbq3OTXEQzf
	19ymuJheriDwS71RFH7pXCTIF/GP+SmpS+byicIFCrYxNnwC0x+A6tNpYDPdKidJgc6FSuTBVFvQG
	kdeiU/ghKnuBqKnekm/J8PgaBvTeHYdoYjABlMlXLdaQFxA8cLn9+RtxrEdT7iP/5epcUj/yq2p5w
	mk5006dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9juZ-002kuW-I1; Fri, 08 Jul 2022 09:04:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9juT-002krr-Ra
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2022 09:04:29 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LfS180DvNzThBt
	for <linux-mtd@lists.infradead.org>; Fri,  8 Jul 2022 17:00:44 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:04:14 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:04:13 +0800
Subject: Re: [PATCH] ubi: fastmap: Fix typo in comments
To: <linux-mtd@lists.infradead.org>
References: <20220704021356.14849-1-jiaming@nfschina.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e7dcf649-0fd8-9f89-490a-129537b7fe27@huawei.com>
Date: Fri, 8 Jul 2022 17:04:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20220704021356.14849-1-jiaming@nfschina.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_020426_113810_CE0BE070 
X-CRM114-Status: GOOD (  14.01  )
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

1NogMjAyMi83LzQgMTA6MTMsIFpoYW5nIEppYW1pbmcg0LS1wDoKPiBUaGVyZSBhcmUgYSB0eXBv
KGRvbnQndCkgaW4gY29tbWVudHMuCj4gRml4IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoYW5n
IEppYW1pbmcgPGppYW1pbmdAbmZzY2hpbmEuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJp
L3dsLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL3dsLmMgYi9kcml2ZXJzL210
ZC91Ymkvd2wuYwo+IGluZGV4IDU1YmFlMDZjZjQwOC4uYWI0MTNhNjc0NzgzIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL3ViaS93bC5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL3dsLmMKPiBA
QCAtMTQ2NCw3ICsxNDY0LDcgQEAgc3RhdGljIGJvb2wgc2NydWJfcG9zc2libGUoc3RydWN0IHVi
aV9kZXZpY2UgKnViaSwgc3RydWN0IHViaV93bF9lbnRyeSAqZSkKPiAgICAqIHViaV9iaXRmbGlw
X2NoZWNrIC0gQ2hlY2sgYW4gZXJhc2VibG9jayBmb3IgYml0ZmxpcHMgYW5kIHNjcnViIGl0IGlm
IG5lZWRlZC4KPiAgICAqIEB1Ymk6IFVCSSBkZXZpY2UgZGVzY3JpcHRpb24gb2JqZWN0Cj4gICAg
KiBAcG51bTogdGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sgdG8gc2NoZWR1bGUKPiAtICogQGZvcmNl
OiBkb250J3QgcmVhZCB0aGUgYmxvY2ssIGFzc3VtZSBiaXRmbGlwcyBoYXBwZW5lZCBhbmQgdGFr
ZSBhY3Rpb24uCj4gKyAqIEBmb3JjZTogZG9uJ3QgcmVhZCB0aGUgYmxvY2ssIGFzc3VtZSBiaXRm
bGlwcyBoYXBwZW5lZCBhbmQgdGFrZSBhY3Rpb24uCj4gICAgKgo+ICAgICogVGhpcyBmdW5jdGlv
biByZWFkcyB0aGUgZ2l2ZW4gZXJhc2VibG9jayBhbmQgY2hlY2tzIGlmIGJpdGZsaXBzIG9jY3Vy
ZWQuCj4gICAgKiBJbiBjYXNlIG9mIGJpdGZsaXBzLCB0aGUgZXJhc2VibG9jayBpcyBzY2hlZHVs
ZWQgZm9yIHNjcnViYmluZy4KPiAKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
