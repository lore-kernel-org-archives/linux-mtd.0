Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B185AC02181
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcNrbFaE9LeXbZ6vHWeUO25hdWxlxQc5j0YSuo8taf4=; b=R3Bh+SssYhm6vi
	AEGuc+2puzHHUz//hiLvaR4qi6osiljXRWgYXYt6HqSO9FmENifKwPkpgRsWx0eHo3wop/y7AUaFe
	2xKbkJT6yd+uC5dE6Qr/7eMBtEfxotY8FllHLorG5Ywo4n/9mwpXd7mSV69BNcHw82cHnptx+pswc
	amD3Gjy/+uDSIdnzSXvIJxD6HorbEtxtG69ke/VCMsz7VFLgU/tYKNPigze9wFWEgrfgVm5HFU7uG
	+0YSlgKhxZAlasu3/dZ4CpSgquWeHQUIpUI2AyE1CgagaoLnToOgf4m+vH4v7H86yCe4B4iJfMjjw
	kA6V8hRKGjLka4fLSgmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQu-0000000HAMm-0UZa;
	Sun, 26 Jan 2025 06:47:48 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQo-0000000HAIw-3IMS
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 06:47:44 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yghpt632Rz1l098;
	Sun, 26 Jan 2025 14:44:06 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B6EA91400FD;
	Sun, 26 Jan 2025 14:47:30 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 26 Jan
 2025 14:47:30 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>
CC: <yangerkun@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 3/7] =?UTF-8?q?misc-utils:=20flashcp:=20Fix=20un?= =?UTF-8?q?initialized=20variable=20=E2=80=98wrlast=5Fbuf=E2=80=99=20compi?= =?UTF-8?q?ling=20warning?=
Date: Sun, 26 Jan 2025 14:41:59 +0800
Message-ID: <20250126064203.3348494-4-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250126064203.3348494-1-chengzhihao1@huawei.com>
References: <20250126064203.3348494-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_224743_052835_2C8A17E7 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIGNvbXBpbGVyIGNvbXBhaW5zIGZvbGxvd2luZyBtZXNzYWdlOgogbWlzYy11dGlscy9mbGFz
aGNwLmM6NDM5OjM6IHdhcm5pbmc6IOKAmHdybGFzdF9idWbigJkgbWF5IGJlIHVzZWQKIHVuaW5p
dGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbgpJdCB3b24ndCBicmluZyBhbnkgcHJvYmxlbXMgYmVj
YXVzZSB2YXJpYWJsZSAn4oCYd3JsYXN0X2J1ZuKAmSBpcyBhbHdheXMKaW5pdGlhbGl6ZWQgYmVm
b3JlIGJlaW5nIHVzZWQuIEZpeCB0aGUgd2FybmluZyBieSBzZXR0aW5nICd3cmxhc3RfYnVmJwph
cyBOVUxMIHdoZW4gZGVjbGFyaW5nIGl0LgoKU2lnbmVkLW9mZi1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KLS0tCiBtaXNjLXV0aWxzL2ZsYXNoY3AuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL21pc2MtdXRpbHMvZmxhc2hjcC5jIGIvbWlzYy11dGlscy9mbGFzaGNwLmMKaW5kZXggOWM0
ODYzNy4uNjA2NWE4YyAxMDA2NDQKLS0tIGEvbWlzYy11dGlscy9mbGFzaGNwLmMKKysrIGIvbWlz
Yy11dGlscy9mbGFzaGNwLmMKQEAgLTIyMSw3ICsyMjEsNyBAQCBpbnQgbWFpbiAoaW50IGFyZ2Ms
Y2hhciAqYXJndltdKQogCXN0cnVjdCBtdGRfaW5mb191c2VyIG10ZDsKIAlzdHJ1Y3QgZXJhc2Vf
aW5mb191c2VyIGVyYXNlOwogCXN0cnVjdCBzdGF0IGZpbGVzdGF0OwotCXVuc2lnbmVkIGNoYXIg
KnNyYywqZGVzdCwqd3JsYXN0X2J1ZjsKKwl1bnNpZ25lZCBjaGFyICpzcmMsICpkZXN0LCAqd3Js
YXN0X2J1ZiA9IE5VTEw7CiAJdW5zaWduZWQgbG9uZyBsb25nIHdybGFzdF9sZW4gPSAwOwogCWlu
dCBlcnJvciA9IDA7CiAKLS0gCjIuMTMuNgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
