Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECEBC47422
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moVdFPIMSntw5DH5zw9M8W95HDB+YjyTPXWlhzrXFss=; b=mYFIjhlRkVBrS4MENpFmU4a5VM
	WRVn2ZrJzaJtnquzVrcYYUWPFJJFFuB7i05sg2iDh61wwmL7d3Go8s+qwwVvs4k9cIzP7u0zYIu1i
	oj/1/EBvmpIMCehnwR5wUqSl69jFWxEZYyjzLa6xGJpiizEuJySZL30XjyVcK9k6yYF/wrEX13xto
	Y4KWZiI1JfUc89PbwniU2hNBDUNJsX3dFPuHH67rLJ3J6SuVFZbuhdSuEak6zX8KLjoqYCxpHIVa1
	Cps/DVFdZHGGkzhyIFwE6XJ18MY8SRGk7EtvN81hP618xCbF6TRELS2f/F3ArW+Ks4yprGucYRcjD
	DQ51Z8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXZW-001pn3-2K;
	Wed, 24 Jan 2024 07:21:18 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXZR-001pjf-2F
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 07:21:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TKb1H47m3z29khk;
	Wed, 24 Jan 2024 15:19:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id B6EB61A0172;
	Wed, 24 Jan 2024 15:20:59 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 15:20:59 +0800
Subject: Re: [PATCH] ubi: Check for too small LEB size in VTBL code
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Chenyuan Yang <cy54@illinois.edu>,
	<stable@vger.kernel.org>
References: <20240124063702.5642-1-richard@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7875bf6f-faf4-5612-1d82-0f16a58f8455@huawei.com>
Date: Wed, 24 Jan 2024 15:20:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240124063702.5642-1-richard@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_232113_935031_00B2EE10 
X-CRM114-Status: GOOD (  14.27  )
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

1NogMjAyNC8xLzI0IDE0OjM3LCBSaWNoYXJkIFdlaW5iZXJnZXIg0LS1wDoKPiBJZiB0aGUgTEVC
IHNpemUgaXMgc21hbGxlciB0aGFuIGEgdm9sdW1lIHRhYmxlIHJlY29yZCB3ZSBjYW5ub3QKPiBo
YXZlIHZvbHVtZXMuCj4gSW4gdGhpcyBjYXNlIGFib3J0IGF0dGFjaGluZy4KPiAKPiBDYzogQ2hl
bnl1YW4gWWFuZyA8Y3k1NEBpbGxpbm9pcy5lZHU+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiBGaXhlczogODAxYzEzNWNlNzNkICgiVUJJOiBVbnNvcnRlZCBCbG9jayBJbWFnZXMiKQo+
IFJlcG9ydGVkLWJ5OiBDaGVueXVhbiBZYW5nIDxjeTU0QGlsbGlub2lzLmVkdT4KPiBDbG9zZXM6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8xNDMzRUI3QS1GQzg5LTQ3RDYtOEY0
Ny0yM0JFNDFCMjYzQjNAaWxsaW5vaXMuZWR1Lwo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgV2Vp
bmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91YmkvdnRibC5j
IHwgNiArKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKClJldmlld2Vk
LWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvdWJpL3Z0YmwuYyBiL2RyaXZlcnMvbXRkL3ViaS92dGJsLmMKPiBp
bmRleCBmNzAwZjBlNGYyZWMuLjZlNTQ4OWUyMzNkZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC91YmkvdnRibC5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL3Z0YmwuYwo+IEBAIC03OTEsNiAr
NzkxLDEyIEBAIGludCB1YmlfcmVhZF92b2x1bWVfdGFibGUoc3RydWN0IHViaV9kZXZpY2UgKnVi
aSwgc3RydWN0IHViaV9hdHRhY2hfaW5mbyAqYWkpCj4gICAJICogVGhlIG51bWJlciBvZiBzdXBw
b3J0ZWQgdm9sdW1lcyBpcyBsaW1pdGVkIGJ5IHRoZSBlcmFzZWJsb2NrIHNpemUKPiAgIAkgKiBh
bmQgYnkgdGhlIFVCSV9NQVhfVk9MVU1FUyBjb25zdGFudC4KPiAgIAkgKi8KPiArCj4gKwlpZiAo
dWJpLT5sZWJfc2l6ZSA8IFVCSV9WVEJMX1JFQ09SRF9TSVpFKSB7Cj4gKwkJdWJpX2Vycih1Ymks
ICJMRUIgc2l6ZSB0b28gc21hbGwgZm9yIGEgdm9sdW1lIHJlY29yZCIpOwo+ICsJCXJldHVybiAt
RUlOVkFMOwo+ICsJfQo+ICsKPiAgIAl1YmktPnZ0Ymxfc2xvdHMgPSB1YmktPmxlYl9zaXplIC8g
VUJJX1ZUQkxfUkVDT1JEX1NJWkU7Cj4gICAJaWYgKHViaS0+dnRibF9zbG90cyA+IFVCSV9NQVhf
Vk9MVU1FUykKPiAgIAkJdWJpLT52dGJsX3Nsb3RzID0gVUJJX01BWF9WT0xVTUVTOwo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
