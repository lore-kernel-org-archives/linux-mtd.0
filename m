Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA9BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Mar 2022 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=es49XO+P659p+XCEsBDGBHBFdCKUZRQmKC9kreW3dp4=; b=TvVhbb7IndJ0kPuNXqW1ppJkVR
	h8kGPkUlqQzXBszXZNoNcTs+WEe/bvRvtTGgmO7zbCkRHOry1Z25la0e87pEqWQI0H0ZxV2yAUz+U
	NV32P6lcax/kfQ8y/kuh15akfMFsSyBXWozqCX8eh+SF4PnKQZpQ7ZGQKSNfmBZjnfiP8rmU00/XP
	Rr1fb1t+RD5Ko1kn86XP2CFJR4gTvJpQebIm7yIcC5AqL6jcTllGvRhCcw8zHSsYdUhe/i87R2sny
	EPSoYj6BWskJ0X0PnYqOhA1oCmYryz8yZuiuIJezihHAWkxTbZ88O09FEzmAubFsuLcIMlDkSaWso
	mwLaRRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSEF8-00BvE6-3N; Thu, 10 Mar 2022 08:33:54 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSEEY-00BuzD-EU
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2022 08:33:20 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KDj0T2C8mz9sYG;
 Thu, 10 Mar 2022 16:29:29 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 16:33:11 +0800
Subject: Re: [PATCH -next] ubifs: rename_whiteout: correct old_dir size
 computing
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <yukuai3@huawei.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Baokun Li
 <libaokun1@huawei.com>
References: <20220215040736.2839939-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <dc55e8b3-7d22-6024-374d-4ed126e18c42@huawei.com>
Date: Thu, 10 Mar 2022 16:32:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20220215040736.2839939-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_003318_700094_6F464905 
X-CRM114-Status: GOOD (  11.73  )
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

QSBnZW50bGUgcGluZywgc29ycnkgZm9yIHRoZSBub2lzZS4KCgrlnKggMjAyMi8yLzE1IDEyOjA3
LCBCYW9rdW4gTGkg5YaZ6YGTOgo+IFdoZW4gcmVuYW1pbmcgdGhlIHdoaXRlb3V0IGZpbGUsIHRo
ZSBvbGQgd2hpdGVvdXQgZmlsZSBpcyBub3QgZGVsZXRlZC4KPiBUaGVyZWZvcmUsIHdlIGFkZCB0
aGUgb2xkIGRlbnRyeSBzaXplIHRvIHRoZSBvbGQgZGlyIGxpa2UgWEZTLgo+IE90aGVyd2lzZSwg
YW4gZXJyb3IgbWF5IGJlIHJlcG9ydGVkIGR1ZSB0byBgZnNja2ktPmNhbGNfc3ogIT0gZnNja2kt
PnNpemVgCj4gaW4gY2hlY2tfaW5kZXMuCj4KPiBGaXhlczogOWUwYTFmZmY4ZGI1NmVhICgidWJp
ZnM6IEltcGxlbWVudCBSRU5BTUVfV0hJVEVPVVQiKQo+IFJlcG9ydGVkLWJ5OiBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJhb2t1biBMaSA8
bGliYW9rdW4xQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy9kaXIuYyB8IDMgKysrCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZnMvdWJp
ZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwo+IGluZGV4IGFlMDgyYTBiZTJhMy4uODYxNTE4ODk1
NDhlIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2Rpci5jCj4gKysrIGIvZnMvdWJpZnMvZGlyLmMK
PiBAQCAtMTQwMiw2ICsxNDAyLDkgQEAgc3RhdGljIGludCBkb19yZW5hbWUoc3RydWN0IGlub2Rl
ICpvbGRfZGlyLCBzdHJ1Y3QgZGVudHJ5ICpvbGRfZGVudHJ5LAo+ICAgCQkJaXB1dCh3aGl0ZW91
dCk7Cj4gICAJCQlnb3RvIG91dF9yZWxlYXNlOwo+ICAgCQl9Cj4gKwo+ICsJCS8qIEFkZCB0aGUg
b2xkX2RlbnRyeSBzaXplIHRvIHRoZSBvbGRfZGlyIHNpemUuICovCj4gKwkJb2xkX3N6IC09IENB
TENfREVOVF9TSVpFKGZuYW1lX2xlbigmb2xkX25tKSk7Cj4gICAJfQo+ICAgCj4gICAJbG9ja180
X2lub2RlcyhvbGRfZGlyLCBuZXdfZGlyLCBuZXdfaW5vZGUsIHdoaXRlb3V0KTsKCi0tIApXaXRo
IEJlc3QgUmVnYXJkcywKQmFva3VuIExpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
