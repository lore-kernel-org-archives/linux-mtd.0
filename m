Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A15CFD371
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhJsUlGTKxiOuBjoFsubnCZpqE5Mvs+m0gzJy4PmBJc=; b=rDnY4dn07RrQvAyYoBTSWKQPoB
	n+8Dv1q2473ZwlSll6GyOIB8XozLkVKWAJVvwqQJa3CkJwlHnZA9bNrL+Yd5vyJadIJArpg1HmH98
	I0ujRqmuIspmF7IIgg8bCrEvTlkoQqDfiC+cVKOpgkgXFC6vRRBVc1u4e4OVvd3TsdUU5KsCZK6Kv
	tBn9ylHcfsWhnmau+l97GEeE31cWxs6s1GYdgGyAM29rYjuBL636KyR1cd4JjSGRVtSnNGZfJrj7r
	1e2WwqtmXzpoUl3A6mOnW0EhtJKWuZM61cqTbINqQPBUaInsAhMKFHcv/Jx7aj/GgpEAAuDaIo+Xl
	y2bE4HmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEZy-0000000GGao-1fQp;
	Fri, 11 Oct 2024 12:17:10 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szERe-0000000GETn-1Gff
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:08:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XQ54g3GJ0z3275L;
	Fri, 11 Oct 2024 20:08:35 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9054F1A0188;
	Fri, 11 Oct 2024 20:08:30 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:08:29 +0800
Subject: Re: [PATCH v2 09/10] ubi: Add mean erase counter sysfs attribute for
 data area
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
 <20241011092134.2909496-9-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <78c5bf02-58d7-777a-eab3-9242679eabc4@huawei.com>
Date: Fri, 11 Oct 2024 20:08:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-9-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050834_621597_911FCDFF 
X-CRM114-Status: UNSURE (   8.79  )
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

1NogMjAyNC8xMC8xMSAxNzoyMSwgUmlja2FyZCBBbmRlcnNzb24g0LS1wDoKPiBEYXRhIGFyZWEg
aW5jbHVkZXMgYWxsIGJsb2NrcyBleGNlcHQgZm9yIHRoZSBmYXN0bWFwIGFyZWEuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29t
Pgo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWNsYXNzLXViaSB8IDgg
KysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5
OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtY2xhc3MtdWJpIGIvRG9jdW1lbnRhdGlv
bi9BQkkvc3RhYmxlL3N5c2ZzLWNsYXNzLXViaQo+IGluZGV4IDYyYzkzZmRhMGJjNC4uMTAwZTFj
MDY5OGEzIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1jbGFz
cy11YmkKPiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtY2xhc3MtdWJpCj4g
QEAgLTI0MiwzICsyNDIsMTEgQEAgQ29udGFjdDoJbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiAgIERlc2NyaXB0aW9uOgo+ICAgCQlNZWFuIHBoeXNpY2FsIGVyYXNlYmxvY2sgZXJhc2Ug
Y291bnRlciB2YWx1ZSBmb3IgdGhlIGZhc3RtYXAKPiAgIAkJYXJlYS4KPiArCj4gK1doYXQ6CQkv
c3lzL2NsYXNzL3ViaS91YmlYL21lYW5fZWNfZGF0YQo+ICtEYXRlOgkJT2N0b2JlciAyMDI0Cj4g
K0tlcm5lbFZlcnNpb246CTYuWAo+ICtDb250YWN0OglsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ICtEZXNjcmlwdGlvbjoKPiArCQlNZWFuIHBoeXNpY2FsIGVyYXNlYmxvY2sgZXJhc2Ug
Y291bnRlciB2YWx1ZSBmb3IgZGF0YSBhcmVhLgo+ICsJCURhdGEgYXJlYSBpbmNsdWRlcyBhbGwg
YmxvY2tzIGV4Y2VwdCBmb3IgdGhlIGZhc3RtYXAgYXJlYS4KPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
