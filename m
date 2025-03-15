Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21107C28B30
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 05:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODw4OoJ+4xll6bqL+1ZJG4V/Va1edIct/2xdxn3OROs=; b=ETuToZoDLAbIkA7Aa2WHJAHxfA
	FHqp70CDjEDvOBmN/CzW7ZMQod7K0l3VN4shYHsUOrtEIH80wyAH/a5zcPN+lBNibjWSaGhhPSdWg
	9awZlMstJoXGdbdeJzOGKqfsYfR9LmZbaSJKTLwPQNu9jVf4SZNC+a/ebRVWXgFtGkdSUWu8rHmMm
	5xe/3iUORc/RVpQCyrdvS3nM8VC5SOmsJnkdDHPePXT1WfIBZ26GI1al1TuDeESNqG+5COS1h+3GT
	vRka9m2vwlad73YI60yn6fGLjM6vOvO9r6RXWUM7irgJ87B9InkjxZDc64bxSBbav+ZvjjXXZhmuz
	ShcGfWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttJri-0000000FqBz-00tp;
	Sat, 15 Mar 2025 05:15:18 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttJrg-0000000FqBW-06ui
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 05:15:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZF8Yz44S1z1cyxW;
	Sat, 15 Mar 2025 13:15:03 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A12C818007F;
	Sat, 15 Mar 2025 13:15:11 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 15 Mar 2025 13:15:10 +0800
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto Mailing List
	<linux-crypto@vger.kernel.org>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	<linux-pm@vger.kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
	<netdev@vger.kernel.org>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <02dd5000-7ced-df02-d9d0-a3c1a410d062@huawei.com>
Date: Sat, 15 Mar 2025 13:15:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_221516_261941_00BCE5A8 
X-CRM114-Status: GOOD (  13.31  )
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

1NogMjAyNS8zLzE0IDIwOjIyLCBIZXJiZXJ0IFh1INC0tcA6Cj4gUmVwbGFjZSB0aGUgbGVnYWN5
IGNyeXB0byBjb21wcmVzc2lvbiBpbnRlcmZhY2Ugd2l0aCB0aGUgbmV3IGFjb21wCj4gaW50ZXJm
YWNlLgo+IAo+IFJlbW92ZSB0aGUgY29tcHJlc3Npb24gbXV0ZXhlcyBhbmQgdGhlIG92ZXJhbGxv
Y2F0aW9uIGZvciBtZW1vcnkKPiAodGhlIG9mZmVuZGVyIExaTyBoYXMgYmVlbiBmaXhlZCkuCgpI
aSwgSGVyYmVydC4gQ2FuIHlvdSBzaG93IG1lIHdoaWNoIHBhdGNoIGZpeGVkIHRoZSBwcm9ibGVt
IGluIExaTz8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5h
cGFuYS5vcmcuYXU+Cj4gLS0tCj4gICBmcy91Ymlmcy9jb21wcmVzcy5jIHwgMTE2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gICBmcy91Ymlmcy9qb3VybmFs
LmMgIHwgICAyICstCj4gICBmcy91Ymlmcy91Ymlmcy5oICAgIHwgIDE1ICstLS0tLQo+ICAgMyBm
aWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKPiAKClsuLi5d
Cj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3ViaWZzLmggYi9mcy91Ymlmcy91Ymlmcy5oCj4gaW5k
ZXggMzM3NWJiZTA1MDhjLi43ZDBhYWY1ZDJlMjMgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvdWJp
ZnMuaAo+ICsrKyBiL2ZzL3ViaWZzL3ViaWZzLmgKPiBAQCAtMTI0LDEzICsxMjQsNiBAQAo+ICAg
I2RlZmluZSBPTERfWk5PREVfQUdFIDIwCj4gICAjZGVmaW5lIFlPVU5HX1pOT0RFX0FHRSA1Cj4g
ICAKPiAtLyoKPiAtICogU29tZSBjb21wcmVzc29ycywgbGlrZSBMWk8sIG1heSBlbmQgdXAgd2l0
aCBtb3JlIGRhdGEgdGhlbiB0aGUgaW5wdXQgYnVmZmVyLgo+IC0gKiBTbyBVQklGUyBhbHdheXMg
YWxsb2NhdGVzIGxhcmdlciBvdXRwdXQgYnVmZmVyLCB0byBiZSBzdXJlIHRoZSBjb21wcmVzc29y
Cj4gLSAqIHdpbGwgbm90IGNvcnJ1cHQgbWVtb3J5IGluIGNhc2Ugb2Ygd29yc3QgY2FzZSBjb21w
cmVzc2lvbi4KPiAtICovCj4gLSNkZWZpbmUgV09SU1RfQ09NUFJfRkFDVE9SIDIKCkRvZXMgTFpP
IGd1YXJhbnRlZSB0aGUgb3V0cHV0IGRhdGEgbGVuZ3RoIHNtYWxsZXIgdGhhbiBpbnB1dCBidWZm
ZXIgCmxlbmd0aD8gV2hpY2ggY29tbWl0IGZpeGVkIHRoZSBpc3N1ZT8KPiAtCj4gICAjaWZkZWYg
Q09ORklHX0ZTX0VOQ1JZUFRJT04KPiAgICNkZWZpbmUgVUJJRlNfQ0lQSEVSX0JMT0NLX1NJWkUg
RlNDUllQVF9DT05URU5UU19BTElHTk1FTlQKPiAgICNlbHNlCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
