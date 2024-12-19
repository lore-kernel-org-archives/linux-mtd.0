Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC693E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 04:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hypu3F+nWylnBjVWdMaU01xhYcl6dVT6iDflitkdXmI=; b=rFTqFlwyD4k3CKEsuX0Trc+pFU
	L7YSBvsT3WMTi5iE2gzMM+dj8l5v8EQE0IKlh/BvZycfpuqBMgInpc758yK2xPqgHvLbY+WAhYrlO
	FXev6Gxpw8jdPRe/SDQgX24pxPEazhhxLCZJ3dpexmUyWhCQyMdv85IEPikXfSocwBleHNSofc2lK
	cInHKQUkMwe3FBjg7JlrSftl9cf3e7P8hIQgjvaJuhSKI8w1WhKP4PvSKMKwlyX9rt4WF+ceKmUGm
	uK/BnjCuNFYf/C+pP8XcHXEvs6UFaH9RvXYus3JJ2XMXrLg2YdermvaoJSkBozqoyWloSdSFGfSkx
	6ckdnr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO8YW-00000000ooW-2JK7;
	Thu, 19 Dec 2024 04:54:36 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO8YT-00000000onu-1qWG
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 04:54:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YDJ6V2JZKzFrLC
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 12:51:30 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DB868180064
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 12:54:26 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Dec 2024 12:54:26 +0800
Subject: Re: [PATCH mtd-utils] jffsX-utils: fix integer overflow in
 jffs2dump.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241218114202.496950-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b37283d5-dc36-fdfb-b15c-3341ea5846d7@huawei.com>
Date: Thu, 19 Dec 2024 12:54:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241218114202.496950-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_205433_648469_1006D6AF 
X-CRM114-Status: GOOD (  14.41  )
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

1NogMjAyNC8xMi8xOCAxOTo0MiwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNzaW9u
ICdkYXRzaXplICsgb29ic2l6ZScgaXMgYSBzdWJqZWN0IHRvIG92ZXJmbG93IGJlY2F1c2UgaXRz
IG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdlciBkYXRhIHR5cGUgYmVmb3JlIHBlcmZv
cm1pbmcgYXJpdGhtZXRpYwo+IAo+IENvcnJlY3Rpb25zIGV4cGxhaW5lZDoKPiBGaXhlZCBwb3Rl
bnRpYWwgb3ZlcmZsb3cgaW4gYXJpdGhtZXRpYyBvcGVyYXRpb24gZGF0c2l6ZSArIG9vYnNpemUK
PiBieSBjYXN0aW5nIG9wZXJhbmRzIHRvIHVuc2lnbmVkIGxvbmcgbG9uZyB0byBlbnN1cmUgc2Fm
ZSBjb21wdXRhdGlvbi4KPiAKPiBUcmlnZ2VycyBmb3VuZCBieSBzdGF0aWMgYW5hbHl6ZXIgU3Zh
Y2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1vcnlha292QGdt
YWlsLmNvbT4KPiAKPiAtLS0KPiAgIGpmZnNYLXV0aWxzL2pmZnMyZHVtcC5jIHwgMiArLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2pmZnNYLXV0aWxzL2pmZnMyZHVtcC5jIGIvamZmc1gtdXRpbHMvamZmczJkdW1wLmMK
PiBpbmRleCAzMDQ1NWVhLi41YmU3YTViIDEwMDY0NAo+IC0tLSBhL2pmZnNYLXV0aWxzL2pmZnMy
ZHVtcC5jCj4gKysrIGIvamZmc1gtdXRpbHMvamZmczJkdW1wLmMKPiBAQCAtNzgzLDcgKzc4Myw3
IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAgIAkJCXJlYWRfbm9jaGVjayAo
ZmQsIG9vYiwgb29ic2l6ZSk7Cj4gICAJCQlpZHggKz0gZGF0c2l6ZTsKPiAgIAkJCWltZ2xlbiAt
PSBvb2JzaXplOwo+IC0JCQlsZW4gLT0gZGF0c2l6ZSArIG9vYnNpemU7Cj4gKwkJCWxlbiAtPSAo
dW5zaWduZWQgbG9uZyBsb25nKWRhdHNpemUgKyAodW5zaWduZWQgbG9uZyBsb25nKW9vYnNpemU7
CgpUaGUgJ2RhdHNpemUnIGFuZCAnb29ic2l6ZScgYXJlIHBhcnNlZCBmcm9tIHVzZXIgYXJndW1l
bnRzLCAnZGF0c2l6ZScgCmFuZCAnb29ic2l6ZScgY291bGQgYmUgbmVnYXRpdmUsIHNvIEkgdGhp
bmsgd2UgbmVlZCBtb3JlIGNoZWNraW5nIGl0ZW1zLgo+ICAgCQl9Cj4gICAKPiAgIAl9IGVsc2Ug
ewo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
