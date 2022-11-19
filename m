Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A97C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Nov 2022 05:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7XsPaEubOAPu2FBSNHnBVXaI9HmD9DBQPi47aDKrNw=; b=IEagv2HO+x4OVN
	h3dGPK7o93DHTEj0OWPBmdlUBI945E2SCc2t7UFgIA/YKyDI+VnzO/eHaB7r+NUGXDM5+0FJu90ov
	cHRGZZy1I1zfLQgBApYGZazN4tC2V5t0qUKac4syT9ZhsXBxumD/5gzp9DfPxRwH4MG1D4mmy8PSD
	axMfAhCtuZQZy2KvIcEeSNS5hUUlVWK4UYDJI5EVfQlWcwuXGn6vI2XMQyPX2ZSucYajwCW4wTthZ
	Qv2LUl6MwSSkUhnB8m4Z/EAcmiTqmEUyEeP2xCA2mF13OjfyyR5uK0TPNHvVeUEacL8iX/tNygTwq
	Trcqmh8EqokpUNEJISlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owGIN-00BMmT-Cp; Sat, 19 Nov 2022 05:21:39 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owGI6-00BMXD-OZ
	for linux-mtd@lists.infradead.org; Sat, 19 Nov 2022 05:21:24 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NDhjP0vpxzqSMw;
	Sat, 19 Nov 2022 13:17:13 +0800 (CST)
Received: from [10.67.109.51] (10.67.109.51) by canpemm500009.china.huawei.com
 (7.192.105.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 19 Nov
 2022 13:21:03 +0800
Message-ID: <23feff35-6f2d-5cd7-57f9-ff2591a3c74e@huawei.com>
Date: Sat, 19 Nov 2022 13:21:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] ubifs: Fix build errors as symbol undefined
To: <richard@nod.at>, <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<weiyongjun1@huawei.com>, <yusongping@huawei.com>
References: <20221115083335.21211-1-hucool.lihua@huawei.com>
From: "Lihua (lihua, ran)" <hucool.lihua@huawei.com>
In-Reply-To: <20221115083335.21211-1-hucool.lihua@huawei.com>
X-Originating-IP: [10.67.109.51]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_212122_994970_AF96B4B2 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

cGluZwoK5ZyoIDIwMjIvMTEvMTUgMTY6MzMsIExpIEh1YSDlhpnpgZM6Cj4gV2hlbiBDT05GSUdf
VUJJRlNfRlMgaXMgZW5hYmxlIGJ1dCBDT05GSUdfVUJJRlNfRlNfQVVUSEVOVElDQVRJT04gaXMg
bm90IHNldDoKPiAgICAgIEVSUk9SOiBtb2Rwb3N0OiAidWJpZnNfYmFkX2hhc2giIFtmcy91Ymlm
cy91Ymlmcy5rb10gdW5kZWZpbmVkIQo+IAo+IEZpeGVzOiAxNmEyNmIyMGQyYWYgKCJ1Ymlmczog
YXV0aGVudGljYXRpb246IEFkZCBoYXNoZXMgdG8gaW5kZXggbm9kZXMiKQo+IFNpZ25lZC1vZmYt
Ynk6IExpIEh1YSA8aHVjb29sLmxpaHVhQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy9L
Y29uZmlnIHwgMiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9mcy91Ymlmcy9LY29uZmlnIGIvZnMvdWJpZnMvS2NvbmZpZwo+IGluZGV4IDQ1
ZDNkMjA3ZmI5OS4uOTNiZGExMDU3ZmRjIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL0tjb25maWcK
PiArKysgYi9mcy91Ymlmcy9LY29uZmlnCj4gQEAgLTEzLDYgKzEzLDcgQEAgY29uZmlnIFVCSUZT
X0ZTCj4gICAJc2VsZWN0IENSWVBUT19IQVNIX0lORk8KPiAgIAlzZWxlY3QgVUJJRlNfRlNfWEFU
VFIgaWYgRlNfRU5DUllQVElPTgo+ICAgCXNlbGVjdCBGU19FTkNSWVBUSU9OX0FMR1MgaWYgRlNf
RU5DUllQVElPTgo+ICsJc2VsZWN0IFVCSUZTX0ZTX0FVVEhFTlRJQ0FUSU9OCj4gICAJZGVwZW5k
cyBvbiBNVERfVUJJCj4gICAJaGVscAo+ICAgCSAgVUJJRlMgaXMgYSBmaWxlIHN5c3RlbSBmb3Ig
Zmxhc2ggZGV2aWNlcyB3aGljaCB3b3JrcyBvbiB0b3Agb2YgVUJJLgo+IEBAIC05MSw2ICs5Miw3
IEBAIGNvbmZpZyBVQklGU19GU19BVVRIRU5USUNBVElPTgo+ICAgCXNlbGVjdCBLRVlTCj4gICAJ
c2VsZWN0IENSWVBUT19ITUFDCj4gICAJc2VsZWN0IFNZU1RFTV9EQVRBX1ZFUklGSUNBVElPTgo+
ICsJc2VsZWN0IFNZU1RFTV9UUlVTVEVEX0tFWVJJTkcKPiAgIAloZWxwCj4gICAJICBFbmFibGUg
YXV0aGVudGljYXRpb24gc3VwcG9ydCBmb3IgVUJJRlMuIFRoaXMgZmVhdHVyZSBvZmZlcnMgcHJv
dGVjdGlvbgo+ICAgCSAgYWdhaW5zdCBvZmZsaW5lIGNoYW5nZXMgZm9yIGJvdGggZGF0YSBhbmQg
bWV0YWRhdGEgb2YgdGhlIGZpbGVzeXN0ZW0uCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
