Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5592C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Nov 2022 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Umox2b6na5Uv4sdXPrSczJjBy5gvGtMn2hijvvHLalY=; b=o1jyjishYWlgOysHMS7WQo3Ra0
	HtejqM6MomnYU0dOno4ZRvCnPb4RgbcuPvNLFJ+HK4inPb6NAQtMHrM39J8uav6vGM/mjOyuDHaM7
	8WEh9j46T43N1xDYun9w0Jo5RCfOZmAszQvOtK92cOgmYV++eaa5X3V/aNSOwfxCgiU0Dl07LWAmZ
	3sy+tnkKdNY85NlS/5iQllAah4I6/G6pBOI3dSdOidwwxRSNEN5vsM/cTuzRbzzHO+AbeBbfAWYpb
	oVzo1HgxsZK9bQVQkzhN3WAjBfSzZbtzl+kMIg/G3WEcbyIakC1QzLgBFLxAUP0B5YVAlQbTi1RAy
	89XWyV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourFL-008wZG-Cg; Tue, 15 Nov 2022 08:24:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ourFH-008wY8-UF
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2022 08:24:41 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NBK2r1ZJ4zHvtR
	for <linux-mtd@lists.infradead.org>; Tue, 15 Nov 2022 16:24:04 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 16:24:22 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 16:24:22 +0800
Subject: Re: [PATCH] ubifs: Fix build errors as symbol undefined
To: <linux-mtd@lists.infradead.org>
References: <20221115083335.21211-1-hucool.lihua@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <09ae000f-468c-1a48-b2f7-64f2f1c2a31b@huawei.com>
Date: Tue, 15 Nov 2022 16:24:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221115083335.21211-1-hucool.lihua@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_002440_554880_1AC8D8C1 
X-CRM114-Status: GOOD (  13.35  )
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

1NogMjAyMi8xMS8xNSAxNjozMywgTGkgSHVhINC0tcA6Cj4gV2hlbiBDT05GSUdfVUJJRlNfRlMg
aXMgZW5hYmxlIGJ1dCBDT05GSUdfVUJJRlNfRlNfQVVUSEVOVElDQVRJT04gaXMgbm90IHNldDoK
PiAgICAgIEVSUk9SOiBtb2Rwb3N0OiAidWJpZnNfYmFkX2hhc2giIFtmcy91Ymlmcy91Ymlmcy5r
b10gdW5kZWZpbmVkIQo+IAo+IEZpeGVzOiAxNmEyNmIyMGQyYWYgKCJ1YmlmczogYXV0aGVudGlj
YXRpb246IEFkZCBoYXNoZXMgdG8gaW5kZXggbm9kZXMiKQo+IFNpZ25lZC1vZmYtYnk6IExpIEh1
YSA8aHVjb29sLmxpaHVhQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy9LY29uZmlnIHwg
MiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9mcy91Ymlmcy9LY29uZmlnIGIvZnMvdWJpZnMvS2NvbmZpZwo+IGluZGV4IDQ1ZDNkMjA3ZmI5
OS4uOTNiZGExMDU3ZmRjIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL0tjb25maWcKPiArKysgYi9m
cy91Ymlmcy9LY29uZmlnCj4gQEAgLTEzLDYgKzEzLDcgQEAgY29uZmlnIFVCSUZTX0ZTCj4gICAJ
c2VsZWN0IENSWVBUT19IQVNIX0lORk8KPiAgIAlzZWxlY3QgVUJJRlNfRlNfWEFUVFIgaWYgRlNf
RU5DUllQVElPTgo+ICAgCXNlbGVjdCBGU19FTkNSWVBUSU9OX0FMR1MgaWYgRlNfRU5DUllQVElP
Tgo+ICsJc2VsZWN0IFVCSUZTX0ZTX0FVVEhFTlRJQ0FUSU9OCgp1YmlmcyBhdXRoZW50aWNhdGlv
biBpcyBhIHN1Ym1vZHVsZSB1bmRlciB1Ymlmcy4KCkkgZG9uJ3QgdGhpbmsgdWJpZnMgYXV0aGVu
dGljYXRpb24gc2hvdWxkIGJlIGVuYWJsZWQgYXV0b21hdGljYWxseSB3aGVuIAp1YmlmcyBpcyBl
bmFibGVkLiBMaW51eCB1c2VycyBtYXkgb25seSB3YW50IHRvIGNob29zZSB1YmlmcyB3aXRob3V0
IAphdXRoZW50aWNhdGlvbiBlbmFibGVkLgoKPiAgIAlkZXBlbmRzIG9uIE1URF9VQkkKPiAgIAlo
ZWxwCj4gICAJICBVQklGUyBpcyBhIGZpbGUgc3lzdGVtIGZvciBmbGFzaCBkZXZpY2VzIHdoaWNo
IHdvcmtzIG9uIHRvcCBvZiBVQkkuCj4gQEAgLTkxLDYgKzkyLDcgQEAgY29uZmlnIFVCSUZTX0ZT
X0FVVEhFTlRJQ0FUSU9OCj4gICAJc2VsZWN0IEtFWVMKPiAgIAlzZWxlY3QgQ1JZUFRPX0hNQUMK
PiAgIAlzZWxlY3QgU1lTVEVNX0RBVEFfVkVSSUZJQ0FUSU9OCj4gKwlzZWxlY3QgU1lTVEVNX1RS
VVNURURfS0VZUklORwo+ICAgCWhlbHAKPiAgIAkgIEVuYWJsZSBhdXRoZW50aWNhdGlvbiBzdXBw
b3J0IGZvciBVQklGUy4gVGhpcyBmZWF0dXJlIG9mZmVycyBwcm90ZWN0aW9uCj4gICAJICBhZ2Fp
bnN0IG9mZmxpbmUgY2hhbmdlcyBmb3IgYm90aCBkYXRhIGFuZCBtZXRhZGF0YSBvZiB0aGUgZmls
ZXN5c3RlbS4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
