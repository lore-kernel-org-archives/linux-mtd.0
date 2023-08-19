Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554ADEE49A0
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Aug 2023 02:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2A1qJAeT8r4IS4foMagW1c5lfn1mXdPi8QG90fDGHjs=; b=h+ZZ7Nz4tX7fCe0Zrsab7hozM2
	YKiUjRfd/8bg9wsS6tPDzqItqzwrkDzBLcoEoKSQQpdyDKoBv4WJQGVXDyi9ZQQ0EfH7mdQIP3L4y
	LVaRT8bv6uRPgx0LqkOsq5mEDHxfkVclb+3USRUZr9vOW4BN9FNAu/F9IfP2qC6gK5yHrCt08HIRp
	VPq1vRuNd10JrHPpCNQlF4ZrVaJwjpCAhuFsuA17fur8urm8iCPMXnL4CT5L+X0ocrpb1J29Apmgb
	ed3IRLMFiiFj3PfqsCkin4Gq51bFbmx8PVMZDZOjxrarIq5DAhum7v8WZXjAq4kp6ZmHeAI7Jycon
	6WsW8suw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXBdR-00AI0F-2p;
	Sat, 19 Aug 2023 02:24:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXBdP-00AHz7-0h
	for linux-mtd@lists.infradead.org;
	Sat, 19 Aug 2023 02:24:16 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RSMsN1x7GztRhh;
	Sat, 19 Aug 2023 10:20:24 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 19 Aug 2023 10:24:03 +0800
Subject: Re: [PATCH] ubifs: fix missing error code err
To: Ferry Meng <mengferry@linux.alibaba.com>, Richard Weinberger
	<richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>
References: <20230818091848.108186-1-mengferry@linux.alibaba.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0acd50e2-8b0e-0529-9b58-4c92678ab2f9@huawei.com>
Date: Sat, 19 Aug 2023 10:24:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230818091848.108186-1-mengferry@linux.alibaba.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_192415_448980_3944C4DC 
X-CRM114-Status: UNSURE (   7.75  )
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

1NogMjAyMy84LzE4IDE3OjE4LCBGZXJyeSBNZW5nINC0tcA6Cj4gRml4IHNtYXRjaCB3YXJuaW5n
Ogo+IAo+IGZzL3ViaWZzL2pvdXJuYWwuYzoxNjEwIHViaWZzX2pubF90cnVuY2F0ZSgpIHdhcm46
IG1pc3NpbmcgZXJyb3IgY29kZQo+ICdlcnInCj4gCj4gU2lnbmVkLW9mZi1ieTogRmVycnkgTWVu
ZyA8bWVuZ2ZlcnJ5QGxpbnV4LmFsaWJhYmEuY29tPgo+IAoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBD
aGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cgo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9q
b3VybmFsLmMgYi9mcy91Ymlmcy9qb3VybmFsLmMKPiBpbmRleCBkYzUyYWMwZjRhMzQuLmFiODM3
YjczZDRiOSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9qb3VybmFsLmMKPiArKysgYi9mcy91Ymlm
cy9qb3VybmFsLmMKPiBAQCAtMTYwNyw2ICsxNjA3LDcgQEAgaW50IHViaWZzX2pubF90cnVuY2F0
ZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29uc3Qgc3RydWN0IGlub2RlICppbm9kZSwKPiAgIAkJ
CQl1Ymlmc19lcnIoYywgImJhZCBkYXRhIG5vZGUgKGJsb2NrICV1LCBpbm9kZSAlbHUpIiwKPiAg
IAkJCQkJICBibGssIGlub2RlLT5pX2lubyk7Cj4gICAJCQkJdWJpZnNfZHVtcF9ub2RlKGMsIGRu
LCBkbl9zaXplKTsKPiArCQkJCWVyciA9IC1FVUNMRUFOOwo+ICAgCQkJCWdvdG8gb3V0X2ZyZWU7
Cj4gICAJCQl9Cj4gICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
