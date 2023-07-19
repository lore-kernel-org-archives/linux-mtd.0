Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB858EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/0EgFUGmfepr61i3m02vEJAxc+fN1nuEf5O0LNwUvA=; b=G8fq5pOc4R8HzHHPo2sJ+H5ICs
	Of4ukNcD7pQOt7NK+TVSywmw+H7CUAuCw1xOitQXdmhipb7ZWq7qHPnurs0eZr31Ix2EAYJ2XYwgu
	HhDFzXNqcyg7XzyfjRln/fUZAUmM0jM8DLPy5VON16LQIpjEiXvB9KXq7U4Q/7NSxYt1Ie4KmWssD
	XfkhT8nX6Toehi2LpY11JOzI+6Fq0PdEFW2rVx1xd5250MEW2k0hI/8fwCkP/hTeOoTbcSeubyaoU
	kGXkhrN6as2tE6l3X/M2TS4ReWm3L3RNYY6O76xi848gaqnJgU/djqOvXWVaWGJ81Q+ZR3wl3FUij
	p/g8JGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0dR-005iqV-1D;
	Wed, 19 Jul 2023 06:26:05 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0dO-005ijx-0L
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 06:26:04 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R5Qm23ZXFz18M24
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 14:25:06 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 14:25:49 +0800
Subject: Re: [PATCH] ubifs: Fix memory leak of bud->log_hash
To: <linux-mtd@lists.infradead.org>
References: <20230718-ubifs-replay-auth-leak-v1-1-2dd2e00e6dc6@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <708cfc7a-acda-f9ed-748b-53e26de004bf@huawei.com>
Date: Wed, 19 Jul 2023 14:25:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230718-ubifs-replay-auth-leak-v1-1-2dd2e00e6dc6@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_232602_360354_D5D78587 
X-CRM114-Status: GOOD (  15.42  )
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

1NogMjAyMy83LzE4IDIwOjQxLCBWaW5jZW50IFdoaXRjaHVyY2gg0LS1wDoKPiBFbnN1cmUgdGhh
dCB0aGUgYWxsb2NhdGVkIGJ1ZC0+bG9nX2hhc2ggKGlmIGFueSkgaXMgZnJlZWQgaW4gYWxsIGNh
c2VzCj4gd2hlbiB0aGUgYnVkIGl0c2VsZiBpcyBmcmVlZCwgdG8gZml4IHRoaXMgbGVhayBjYXVn
aHQgYnkga21lbWxlYWs6Cj4gCj4gICAjIGtleWN0bCBhZGQgbG9nb24gZm9vOmJhciBkYXRhIEBz
Cj4gICAjIGVjaG8gY2xlYXIgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9rbWVtbGVhawo+ICAgIyBtb3Vu
dCAtdCB1YmlmcyAvZGV2L3ViaTBfMCBtbnQgLW8gYXV0aF9oYXNoX25hbWU9c2hhMjU2LGF1dGhf
a2V5PWZvbzpiYXIKPiAgICMgZWNobyBhID4gbW50L3gKPiAgICMgdW1vdW50IG1udAo+ICAgIyBt
b3VudCAtdCB1YmlmcyAvZGV2L3ViaTBfMCBtbnQgLW8gYXV0aF9oYXNoX25hbWU9c2hhMjU2LGF1
dGhfa2V5PWZvbzpiYXIKPiAgICMgdW1vdW50IG1udAo+ICAgIyBzbGVlcCA1Cj4gICAjIGVjaG8g
c2NhbiA+IC9zeXMva2VybmVsL2RlYnVnL2ttZW1sZWFrCj4gICAjIGVjaG8gc2NhbiA+IC9zeXMv
a2VybmVsL2RlYnVnL2ttZW1sZWFrCj4gICAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9rbWVtbGVh
awo+ICAgdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmLi4uIChzaXplIDEyOCk6Cj4gICAgIGNvbW0g
Im1vdW50Igo+ICAgICBiYWNrdHJhY2U6Cj4gICAgICAgX19rbWFsbG9jCj4gICAgICAgX191Ymlm
c19oYXNoX2dldF9kZXNjKzB4NWQvMHhlMCB1Ymlmcwo+ICAgICAgIHViaWZzX3JlcGxheV9qb3Vy
bmFsCj4gICAgICAgdWJpZnNfbW91bnQKPiAgICAgICAuLi4KPiAKPiBGaXhlczogZGE4ZWY2NWY5
NTczICgidWJpZnM6IEF1dGhlbnRpY2F0ZSByZXBsYXllZCBqb3VybmFsIikKPiBTaWduZWQtb2Zm
LWJ5OiBWaW5jZW50IFdoaXRjaHVyY2ggPHZpbmNlbnQud2hpdGNodXJjaEBheGlzLmNvbT4KPiAt
LS0KPiAgIGZzL3ViaWZzL3N1cGVyLmMgfCA1ICsrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3N1
cGVyLmMgYi9mcy91Ymlmcy9zdXBlci5jCj4gaW5kZXggMzJjYjE0NzU5Nzk2Li4wZWY4YzFmM2Q3
NjAgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvc3VwZXIuYwo+ICsrKyBiL2ZzL3ViaWZzL3N1cGVy
LmMKPiBAQCAtOTIzLDggKzkyMywxMCBAQCBzdGF0aWMgdm9pZCBmcmVlX2J1ZHMoc3RydWN0IHVi
aWZzX2luZm8gKmMpCj4gICB7Cj4gICAJc3RydWN0IHViaWZzX2J1ZCAqYnVkLCAqbjsKPiAgIAo+
IC0JcmJ0cmVlX3Bvc3RvcmRlcl9mb3JfZWFjaF9lbnRyeV9zYWZlKGJ1ZCwgbiwgJmMtPmJ1ZHMs
IHJiKQo+ICsJcmJ0cmVlX3Bvc3RvcmRlcl9mb3JfZWFjaF9lbnRyeV9zYWZlKGJ1ZCwgbiwgJmMt
PmJ1ZHMsIHJiKSB7Cj4gKwkJa2ZyZWUoYnVkLT5sb2dfaGFzaCk7Cj4gICAJCWtmcmVlKGJ1ZCk7
Cj4gKwl9Cj4gICB9Cj4gICAKPiAgIC8qKgo+IEBAIC0xMTkzLDYgKzExOTUsNyBAQCBzdGF0aWMg
dm9pZCBkZXN0cm95X2pvdXJuYWwoc3RydWN0IHViaWZzX2luZm8gKmMpCj4gICAKPiAgIAkJYnVk
ID0gbGlzdF9lbnRyeShjLT5vbGRfYnVkcy5uZXh0LCBzdHJ1Y3QgdWJpZnNfYnVkLCBsaXN0KTsK
PiAgIAkJbGlzdF9kZWwoJmJ1ZC0+bGlzdCk7Cj4gKwkJa2ZyZWUoYnVkLT5sb2dfaGFzaCk7Cj4g
ICAJCWtmcmVlKGJ1ZCk7Cj4gICAJfQo+ICAgCXViaWZzX2Rlc3Ryb3lfaWR4X2djKGMpOwo+IAo+
IC0tLQo+IGJhc2UtY29tbWl0OiBmZGYwZWFmMTE0NTJkNzI5NDVhZjMxODA0ZTJhMTA0OGVlMWI1
NzRjCj4gY2hhbmdlLWlkOiAyMDIzMDcxOC11Ymlmcy1yZXBsYXktYXV0aC1sZWFrLTliMzk1Yjgz
MTk2Zgo+IAo+IEJlc3QgcmVnYXJkcywKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5n
emhpaGFvMUBodWF3ZWkuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
