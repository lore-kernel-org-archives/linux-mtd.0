Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7A5C54754
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJxIyh42tpWJY2BomAllheZA+tCXMX3vU8KjAx5iBxw=; b=NAnNe1L/qLc4PinHu93ySWNErx
	tuRVezYQcdQKP9Agd8CWGFmX8wD2LDb6WuFrJc46rx3xmcmojePW/KPMLK4yXJdxd+cj/1HoeEVA9
	n88FWyUJ8IiHa5pZbf5F3zCoBr0uzGcmdVu+numz+YJrT2nBLpWapGfdECx3Q0tnMdFJFWSTmyAiQ
	5YxJysAnjl5bhseyM87QsPghL9/G/VX//VCa46QmHaEzMFE9CEEgKWY9uZc7mCDRSQEnLWqWtjkcb
	NNF6SPDUo2uQdCzLzvS0LCgSjPb0zmPCIY8HCoregDL3gaqvO1QYa8te3L+L0YbWBvjRzr7lQWDuc
	8lbsG2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEif-0000000Eezg-2KrW;
	Wed, 28 Aug 2024 09:12:01 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEib-0000000Eex1-3BkH
	for linux-mtd@lists.infradead.org;
	Wed, 28 Aug 2024 09:11:59 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WtzC41hcTzpTvH;
	Wed, 28 Aug 2024 17:10:08 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 25E08180106;
	Wed, 28 Aug 2024 17:11:50 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 17:11:49 +0800
Subject: Re: [PATCH v1] ubifs: Convert to use ERR_CAST()
To: Shen Lichuan <shenlichuan@vivo.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<opensource.kernel@vivo.com>
References: <20240828085908.35695-1-shenlichuan@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <30abe7aa-ce3a-782b-b4d4-b2177040ed6b@huawei.com>
Date: Wed, 28 Aug 2024 17:11:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240828085908.35695-1-shenlichuan@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_021158_000453_BCCE063D 
X-CRM114-Status: GOOD (  13.85  )
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

1NogMjAyNC84LzI4IDE2OjU5LCBTaGVuIExpY2h1YW4g0LS1wDoKPiBBcyBvcHBvc2VkIHRvIG9w
ZW4tY29kZSwgdXNpbmcgdGhlIEVSUl9DQVNUIG1hY3JvIGNsZWFybHkgaW5kaWNhdGVzIHRoYXQK
PiB0aGlzIGlzIGEgcG9pbnRlciB0byBhbiBlcnJvciB2YWx1ZSBhbmQgYSB0eXBlIGNvbnZlcnNp
b24gd2FzIHBlcmZvcm1lZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTaGVuIExpY2h1YW4gPHNoZW5s
aWNodWFuQHZpdm8uY29tPgo+IC0tLQo+ICAgZnMvdWJpZnMvbHB0X2NvbW1pdC5jIHwgNCArKy0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAoK
UmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlm
ZiAtLWdpdCBhL2ZzL3ViaWZzL2xwdF9jb21taXQuYyBiL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+
IGluZGV4IDA3MzUxZmRjZTcyMi4uYWE4ODM3ZTYyNDdjIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZz
L2xwdF9jb21taXQuYwo+ICsrKyBiL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+IEBAIC01NzcsNyAr
NTc3LDcgQEAgc3RhdGljIHN0cnVjdCB1Ymlmc19wbm9kZSAqbmV4dF9wbm9kZV90b19kaXJ0eShz
dHJ1Y3QgdWJpZnNfaW5mbyAqYywKPiAgIAkvKiBHbyByaWdodCAqLwo+ICAgCW5ub2RlID0gdWJp
ZnNfZ2V0X25ub2RlKGMsIG5ub2RlLCBpaXApOwo+ICAgCWlmIChJU19FUlIobm5vZGUpKQo+IC0J
CXJldHVybiAodm9pZCAqKW5ub2RlOwo+ICsJCXJldHVybiBFUlJfQ0FTVChubm9kZSk7Cj4gICAK
PiAgIAkvKiBHbyBkb3duIHRvIGxldmVsIDEgKi8KPiAgIAl3aGlsZSAobm5vZGUtPmxldmVsID4g
MSkgewo+IEBAIC01OTQsNyArNTk0LDcgQEAgc3RhdGljIHN0cnVjdCB1Ymlmc19wbm9kZSAqbmV4
dF9wbm9kZV90b19kaXJ0eShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKPiAgIAkJfQo+ICAgCQlubm9k
ZSA9IHViaWZzX2dldF9ubm9kZShjLCBubm9kZSwgaWlwKTsKPiAgIAkJaWYgKElTX0VSUihubm9k
ZSkpCj4gLQkJCXJldHVybiAodm9pZCAqKW5ub2RlOwo+ICsJCQlyZXR1cm4gRVJSX0NBU1Qobm5v
ZGUpOwo+ICAgCX0KPiAgIAo+ICAgCWZvciAoaWlwID0gMDsgaWlwIDwgVUJJRlNfTFBUX0ZBTk9V
VDsgaWlwKyspCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
