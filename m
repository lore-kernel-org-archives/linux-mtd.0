Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9699AE7717D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r1jkkQSYntlz4z7Gv7Z+5DxF/x6bEeiFvtD44KUXeM=; b=1EXOZRi4IH0U1tADPq3gpHj9Yv
	YsUu8/dN096EMy/l8SkIeZgnlqHXx9w1GiFutl9+qepnM3euuee4GyLCP+jo1MGG+TP9Ek6nLsUGW
	M5neJr8qCaj2V2L7AvaDsyyAp6xzu/2gQ1qd1Ih8iUiCKCivK17uQRiOnqDbRmObIYuCeli42vaH0
	qeLfQ6rG+u1JZoVyQdHjlYoDuuVvyZnHEgcovxrol6BzWqv7esemEPtsLTlDNC3Th1eQW6yLkqqhR
	PXXli/PIW7LTK4ZGaB4Gnzcuj/BtwPQrTWL5mz4Iqq2bqvwwftD4xNopklZ/G4ReB8QNu1Plkotqu
	gXgXZkzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeZO-00000008Anp-2cAA;
	Mon, 09 Dec 2024 14:17:06 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeZL-00000008An7-0Ojc
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 14:17:06 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y6P4m0YyKz2Dh7m;
	Mon,  9 Dec 2024 22:14:32 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7CE4D1A016C;
	Mon,  9 Dec 2024 22:16:55 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Dec 2024 22:16:54 +0800
Subject: Re: [PATCH v2] ubifs: dump_lpt_leb: remove return at end of void
 function
To: Pintu Kumar <quic_pintu@quicinc.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>
References: <20241209135936.13229-1-quic_pintu@quicinc.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c5f85328-04d4-0653-4202-c3b3d7f92bfe@huawei.com>
Date: Mon, 9 Dec 2024 22:16:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241209135936.13229-1-quic_pintu@quicinc.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_061703_293200_025243F7 
X-CRM114-Status: GOOD (  12.36  )
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

1NogMjAyNC8xMi85IDIxOjU5LCBQaW50dSBLdW1hciDQtLXAOgo+IE5vdGljZWQgdGhhdCB0aGVy
ZSBpcyBhIHVzZWxlc3MgcmV0dXJuIHN0YXRlbWVudCBhdCB0aGUgZW5kIG9mIHZvaWQKPiBmdW5j
dGlvbiBkdW1wX2xwdF9sZWIoKS4KPiBKdXN0IHJlbW92aW5nIGl0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBpbnR1IEt1bWFyIDxxdWljX3BpbnR1QHF1aWNpbmMuY29tPgo+IAoKUmV2aWV3ZWQtYnk6
IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBp
biBWMjoKPiBDaGFuZ2UgY29tbWl0IHRpdGxlIGFzIHN1Z2dlc3RlZCBieSBaaGloYW8gQ2hlbmcu
Cj4gVjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hYmU3OWUwYS1hMzVmLTBiNTMtYmJl
Yy03ZDY0MmY1OTJmYWVAaHVhd2VpLmNvbS8KPiAtLS0KPiAgIGZzL3ViaWZzL2xwdF9jb21taXQu
YyB8IDEgLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZnMvdWJpZnMvbHB0X2NvbW1pdC5jIGIvZnMvdWJpZnMvbHB0X2NvbW1pdC5jCj4gaW5kZXgg
YWE4ODM3ZTYyNDdjLi5mMmNiMjE0NTgxZmQgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvbHB0X2Nv
bW1pdC5jCj4gKysrIGIvZnMvdWJpZnMvbHB0X2NvbW1pdC5jCj4gQEAgLTE5MzIsNyArMTkzMiw2
IEBAIHN0YXRpYyB2b2lkIGR1bXBfbHB0X2xlYihjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywg
aW50IGxudW0pCj4gICAJcHJfZXJyKCIocGlkICVkKSBmaW5pc2ggZHVtcGluZyBMRUIgJWRcbiIs
IGN1cnJlbnQtPnBpZCwgbG51bSk7Cj4gICBvdXQ6Cj4gICAJdmZyZWUoYnVmKTsKPiAtCXJldHVy
bjsKPiAgIH0KPiAgIAo+ICAgLyoqCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
