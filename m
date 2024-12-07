Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBE2E77173
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 02:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LH1xHg6ecFuxORmkRwpnmOty7JNkb7Z0OwqdzedF6vU=; b=hFIkMBGmztrd5HHpO4Jq8z2xHR
	50doKvLiN5cJkWYFBQAqHKetHvbNusv3CCGTumhvemReIt7kmU274XZyIH4cX527GP8gpHWQepJlx
	CnI5obrAuhIqx+funChwx06Wj1kOCnrBmekup7by4U7UdYpICFB5pd9PslxnpPbLp/rZpEYKQyN+o
	bUWMb7HOoxgZsDLsNsSXGaZzexl7Kkl/SF/sKydh5isj5Lp5AMOUkcPB2VMZxUqgTy529dt4jG8e7
	Nxo1wdcw5wbFa4DsJvWU9p5Jla8PY3MIPTUagjFM6qadsKkM8fZOJ2cOOInbynHEPd4Ngq+GRKm/8
	Ox9cFaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJkyK-00000003EVT-2UQK;
	Sat, 07 Dec 2024 02:55:08 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJkyG-00000003ESW-38Oc
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 02:55:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y4t3S3jyCz21mcX;
	Sat,  7 Dec 2024 10:53:08 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B0B8B1402CA;
	Sat,  7 Dec 2024 10:54:48 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Dec 2024 10:54:48 +0800
Subject: Re: [PATCH] ubifs/lpt_commit: remove return at end of void function
To: Pintu Kumar <quic_pintu@quicinc.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>
References: <20241206130511.32592-1-quic_pintu@quicinc.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <abe79e0a-a35f-0b53-bbec-7d642f592fae@huawei.com>
Date: Sat, 7 Dec 2024 10:54:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241206130511.32592-1-quic_pintu@quicinc.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_185504_952675_57865073 
X-CRM114-Status: GOOD (  10.86  )
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

1NogMjAyNC8xMi82IDIxOjA1LCBQaW50dSBLdW1hciDQtLXAOgo+IE5vdGljZWQgdGhhdCB0aGVy
ZSBpcyBhIHVzZWxlc3MgcmV0dXJuIHN0YXRlbWVudCBhdCB0aGUgZW5kIG9mIHZvaWQKPiBmdW5j
dGlvbiBkdW1wX2xwdF9sZWIoKS4KPiBKdXN0IHJlbW92aW5nIGl0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBpbnR1IEt1bWFyIDxxdWljX3BpbnR1QHF1aWNpbmMuY29tPgo+IC0tLQo+ICAgZnMvdWJp
ZnMvbHB0X2NvbW1pdC5jIHwgMSAtCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoK
SGksIFBpbnR1LiBUaGUgdGl0bGUgb2YgdGhlIHBhdGNoIHNob3VsZCBiZSBzb21ldGhpbmcgbGlr
ZSAidWJpZnM6IApkdW1wX2xwdF9sZWI6IHJlbW92ZSByZXR1cm4gYXQgZW5kIG9mIHZvaWQgZnVu
Y3Rpb24iLiBTZWUgCkRvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0
LiBPdGhlcndpc2UsCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVh
d2VpLmNvbT4KCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2xwdF9jb21taXQuYyBiL2ZzL3Vi
aWZzL2xwdF9jb21taXQuYwo+IGluZGV4IGFhODgzN2U2MjQ3Yy4uZjJjYjIxNDU4MWZkIDEwMDY0
NAo+IC0tLSBhL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+ICsrKyBiL2ZzL3ViaWZzL2xwdF9jb21t
aXQuYwo+IEBAIC0xOTMyLDcgKzE5MzIsNiBAQCBzdGF0aWMgdm9pZCBkdW1wX2xwdF9sZWIoY29u
c3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBsbnVtKQo+ICAgCXByX2VycigiKHBpZCAlZCkg
ZmluaXNoIGR1bXBpbmcgTEVCICVkXG4iLCBjdXJyZW50LT5waWQsIGxudW0pOwo+ICAgb3V0Ogo+
ICAgCXZmcmVlKGJ1Zik7Cj4gLQlyZXR1cm47Cj4gICB9Cj4gICAKPiAgIC8qKgo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
