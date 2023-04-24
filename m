Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D747C6FD18
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Apr 2023 01:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeSthdslfo2dCyzUefL2/V6Hft6jVbSJ4dzOa9iQ5IQ=; b=FiYLXJyYCFEpInLsCCS2+XueM2
	I4UExaDAkiUnGm8AOPcV/0gDEqbJ/+fzjW688iQ2ydOfuMoDSiE8+DTca3SIVIxlVRfvE9xZdlVMR
	quYcsEyMBJksxAOxnAfI9iiyLYz0H/MVUkDDEfN9aPUek5D6seyu4Ip8EOK3vcFeSTWkh/Rc7DugF
	awQyRp3gQrf9OuIgrqvSLUAJncNvEOwsHwFIJ3QMgv0kJFndNPSAj9WRtZuYqzWE5xNkNYZpCg5v1
	v9TQWN6y7GRV1FVO+AK2tpqkXVb6a+s1y3peAKsjsR5V+OtGYwme6BWIDtGgSmcH5qcmBT7CzehER
	oGnx/5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqlJd-00F4NH-0Y;
	Mon, 24 Apr 2023 01:48:29 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqlJZ-00F4M7-1y
	for linux-mtd@lists.infradead.org;
	Mon, 24 Apr 2023 01:48:27 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Q4SdD5c5pzL0kV;
	Mon, 24 Apr 2023 09:45:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 09:48:19 +0800
Subject: Re: [PATCH] misc-utils: flashcp: correct casting for percent display
To: cchoux <chou.cosmo@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <cosmo.chou@quantatw.com>
References: <20230422073115.3555981-1-chou.cosmo@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <14dd246d-ef2b-2fd1-e874-a3ede1a6996c@huawei.com>
Date: Mon, 24 Apr 2023 09:48:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230422073115.3555981-1-chou.cosmo@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_184825_807994_823D488B 
X-CRM114-Status: GOOD (  10.39  )
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

1NogMjAyMy80LzIyIDE1OjMxLCBjY2hvdXgg0LS1wDoKPiBBZGQgY29ycmVjdCBjYXN0aW5nIGZv
ciB3cml0dGVuIHRvIHByZXZlbnQgb3ZlcmZsb3cgdGhhdCBzaXplX3QgaXMKPiBvbmx5IDMyIGJp
dHMgb24gYSAzMi1iaXQgcGxhdGZvcm0uCj4gCj4gU2lnbmVkLW9mZi1ieTogY2Nob3V4IDxjaG91
LmNvc21vQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFv
MUBodWF3ZWkuY29tPgoKPiAtLS0KPiAgIG1pc2MtdXRpbHMvZmxhc2hjcC5jIHwgNCArKy0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9taXNjLXV0aWxzL2ZsYXNoY3AuYyBiL21pc2MtdXRpbHMvZmxhc2hjcC5jCj4g
aW5kZXggMmU4ZDRjMS4uNTBmOGMwNCAxMDA2NDQKPiAtLS0gYS9taXNjLXV0aWxzL2ZsYXNoY3Au
Ywo+ICsrKyBiL21pc2MtdXRpbHMvZmxhc2hjcC5jCj4gQEAgLTM3MSw3ICszNzEsNyBAQCBpbnQg
bWFpbiAoaW50IGFyZ2MsY2hhciAqYXJndltdKQo+ICAgCQlsb2dfdmVyYm9zZSAoIlxyV3JpdGlu
ZyBkYXRhOiAlZGsvJWxsdWsgKCVsbHUlJSkiLAo+ICAgCQkJCUtCICh3cml0dGVuICsgaSksCj4g
ICAJCQkJS0IgKCh1bnNpZ25lZCBsb25nIGxvbmcpZmlsZXN0YXQuc3Rfc2l6ZSksCj4gLQkJCQlQ
RVJDRU5UQUdFICh3cml0dGVuICsgaSwodW5zaWduZWQgbG9uZyBsb25nKWZpbGVzdGF0LnN0X3Np
emUpKTsKPiArCQkJCVBFUkNFTlRBR0UgKCh1bnNpZ25lZCBsb25nIGxvbmcpd3JpdHRlbiArIGks
KHVuc2lnbmVkIGxvbmcgbG9uZylmaWxlc3RhdC5zdF9zaXplKSk7Cj4gICAKPiAgIAkJLyogcmVh
ZCBmcm9tIGZpbGVuYW1lICovCj4gICAJCXNhZmVfcmVhZCAoZmlsX2ZkLGZpbGVuYW1lLHNyYyxp
KTsKPiBAQCAtNDAzLDcgKzQwMyw3IEBAIGludCBtYWluIChpbnQgYXJnYyxjaGFyICphcmd2W10p
Cj4gICAJCWxvZ192ZXJib3NlICgiXHJWZXJpZnlpbmcgZGF0YTogJWx1ay8lbGx1ayAoJWxsdSUl
KSIsCj4gICAJCQkJS0IgKHdyaXR0ZW4gKyBpKSwKPiAgIAkJCQlLQiAoKHVuc2lnbmVkIGxvbmcg
bG9uZylmaWxlc3RhdC5zdF9zaXplKSwKPiAtCQkJCVBFUkNFTlRBR0UgKHdyaXR0ZW4gKyBpLCh1
bnNpZ25lZCBsb25nIGxvbmcpZmlsZXN0YXQuc3Rfc2l6ZSkpOwo+ICsJCQkJUEVSQ0VOVEFHRSAo
KHVuc2lnbmVkIGxvbmcgbG9uZyl3cml0dGVuICsgaSwodW5zaWduZWQgbG9uZyBsb25nKWZpbGVz
dGF0LnN0X3NpemUpKTsKPiAgIAo+ICAgCQkvKiByZWFkIGZyb20gZmlsZW5hbWUgKi8KPiAgIAkJ
c2FmZV9yZWFkIChmaWxfZmQsZmlsZW5hbWUsc3JjLGkpOwo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
