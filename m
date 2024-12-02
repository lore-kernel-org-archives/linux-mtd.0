Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3EED7830D
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIlhTFVHLKxo7/Soqphl3JYpK7gDL6+/ZeqWG88GgrA=; b=NWT7IXAQw2+QfuxLHYR9QG/YBi
	CfBL5sarz4EyqY++TGGMhv/1L7VJGFss3B74X4UUAF5Z0GTssN+Bj/UKZWN7BURyd2Hv3CKQNyBo2
	ZHlel7ybLAbcZnu0wYs4vV5R6PFeBDBHJuun7KQgcDZjCuf6XECZb4qfMh9X4ll9geUEFR/LYB++I
	mmgqMyj5VHsok8X+Nl9u9evVYUViWWlmIanlG3yoluTBt+ej1pfUJaWeRsLPmwK4doRl/Bg52Jk73
	s+SNrODUp/Q2xpUGIGgRyr5drpqKxaTT/Zc/bwK/XZ2mB0J1q7zjeuPYXUtgKP/47yKnqbIQBsUoa
	Ckq3jeSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Ia-00000005oqy-2xtY;
	Mon, 02 Dec 2024 11:09:04 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Ev-00000005nyp-1ZWN
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 11:05:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y218t6jftz1k13S;
	Mon,  2 Dec 2024 19:02:54 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 124481A016C;
	Mon,  2 Dec 2024 19:05:09 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 2 Dec 2024 19:05:08 +0800
Subject: Re: [PATCH v2] mtd: ubi: Added a check for ubi_num
To: Denis Arefev <arefev@swemel.ru>, Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>, <stable@vger.kernel.org>
References: <20241202093652.5911-1-arefev@swemel.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7701c695-4e83-fffa-1dde-51206c8e4081@huawei.com>
Date: Mon, 2 Dec 2024 19:05:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241202093652.5911-1-arefev@swemel.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_030517_579156_7C7246A6 
X-CRM114-Status: GOOD (  14.56  )
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

1NogMjAyNC8xMi8yIDE3OjM2LCBEZW5pcyBBcmVmZXYg0LS1wDoKPiBBZGRlZCBhIGNoZWNrIGZv
ciB1YmlfbnVtIGZvciBuZWdhdGl2ZSBudW1iZXJzCj4gSWYgdGhlIHZhcmlhYmxlIHViaV9udW0g
dGFrZXMgbmVnYXRpdmUgdmFsdWVzIHRoZW4gd2UgZ2V0Ogo+IAo+IHFlbXUtc3lzdGVtLWFybSAu
Li4gLWFwcGVuZCAidWJpLm10ZD0wLDAsMCwtMjIyMjIzNDUiIC4uLgo+IFsgICAgMC43NDUwNjVd
ICB1YmlfYXR0YWNoX210ZF9kZXYgZnJvbSB1YmlfaW5pdCsweDE3OC8weDIxOAo+IFsgICAgMC43
NDUyMzBdICB1YmlfaW5pdCBmcm9tIGRvX29uZV9pbml0Y2FsbCsweDcwLzB4MWFjCj4gWyAgICAw
Ljc0NTM0NF0gIGRvX29uZV9pbml0Y2FsbCBmcm9tIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MTk4
LzB4MjI0Cj4gWyAgICAwLjc0NTQ3NF0gIGtlcm5lbF9pbml0X2ZyZWVhYmxlIGZyb20ga2VybmVs
X2luaXQrMHgxOC8weDEzNAo+IFsgICAgMC43NDU2MDBdICBrZXJuZWxfaW5pdCBmcm9tIHJldF9m
cm9tX2ZvcmsrMHgxNC8weDI4Cj4gWyAgICAwLjc0NTcyN10gRXhjZXB0aW9uIHN0YWNrKDB4OTAw
MTVmYjAgdG8gMHg5MDAxNWZmOCkKPiAKPiBGb3VuZCBieSBMaW51eCBWZXJpZmljYXRpb24gQ2Vu
dGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFNWQUNFLgo+IAo+IEZpeGVzOiA4M2ZmNTlhMDY2
NjMgKCJVQkk6IHN1cHBvcnQgdWJpX251bSBvbiBtdGQudWJpIGNvbW1hbmQgbGluZSIpCj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBEZW5pcyBBcmVmZXYgPGFy
ZWZldkBzd2VtZWwucnU+Cj4gLS0tCj4gVjEgLT4gVjI6IGNoYW5nZWQgdGhlIHRhZyBGaXhlcyBh
bmQgbW92ZWQgdGhlIGNoZWNrIHRvIHViaV9tdGRfcGFyYW1fcGFyc2UoKQo+ICAgZHJpdmVycy9t
dGQvdWJpL2J1aWxkLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBo
dWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYyBiL2Ry
aXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gaW5kZXggMzBiZTRlZDY4ZmFkLi5lZjZhMjJmMzcyZjkg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiArKysgYi9kcml2ZXJzL210
ZC91YmkvYnVpbGQuYwo+IEBAIC0xNTM3LDcgKzE1MzcsNyBAQCBzdGF0aWMgaW50IHViaV9tdGRf
cGFyYW1fcGFyc2UoY29uc3QgY2hhciAqdmFsLCBjb25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFtICpr
cCkKPiAgIAlpZiAodG9rZW4pIHsKPiAgIAkJaW50IGVyciA9IGtzdHJ0b2ludCh0b2tlbiwgMTAs
ICZwLT51YmlfbnVtKTsKPiAgIAo+IC0JCWlmIChlcnIpIHsKPiArCQlpZiAoZXJyIHx8IHAtPnVi
aV9udW0gPCBVQklfREVWX05VTV9BVVRPKSB7Cj4gICAJCQlwcl9lcnIoIlVCSSBlcnJvcjogYmFk
IHZhbHVlIGZvciB1YmlfbnVtIHBhcmFtZXRlcjogJXNcbiIsCj4gICAJCQkgICAgICAgdG9rZW4p
Owo+ICAgCQkJcmV0dXJuIC1FSU5WQUw7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
