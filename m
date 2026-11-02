Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B44606A326
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 13:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=38OG1zv3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2fQLstKm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KS0xegsB+48NPzqIqbN5+HSSUGi20TbIeYkuuL3s9iA=; b=38OG1zv30Xe5Xk9i5TwYfbmw0m
	YJ0+xtZgbKljz5I4LrQNjngLWiritlzVrE684ZEKShtK3uAZMbVA917kT8zFBS6dlHAPZ3Y2LynyP
	B5ouj/mJpPGWSLE41eYLtf64U0DSlyvB34Pz4QdRG2hW2aO1b16xjOQmzCcP6LilQj14O4tF5An6v
	bsVuzA0D6kCiuHbsRkX8eQGz/29EvGuaB533UzEQ+CtkCHuwOKW9hFWjjIqoZEG25NYe4SmnpzC07
	Y96fFAgKpa8Qi03ATiJEddkGwmj4z0zu3/ZVlYAPl6XOsOay+dCuWWVIGHrGqR8OzInzM2JUZGbX5
	TUcP+i7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs7Y-0000000Gc50-1CQ1;
	Mon, 02 Nov 2026 13:30:44 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs7U-0000000Gc3N-0eyy
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 13:30:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gAsl0/fGRzxImhBpxQUProJyIEV9RDm2i+P8L5BSV2A=;
	b=2fQLstKmie1QZ2aSm8oKoxqw0FKScCiHUPxNLjnQr1MnbdsrYb6qWfZfKAemcKrJVVliqn4Y6
	cny4EEWiz9UJIto/JDCnEoOY6M+yi4ASxbYTqbOaDWWMuK9Aw5s2/yCa0+/DC68JVaGwM17faht
	wdHLx4V/vVqPrb8Uz6LBk0I=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jJCJ05DCRz1prQQ;
	Mon,  2 Nov 2026 21:30:24 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C2DF203C8;
	Mon,  2 Nov 2026 21:30:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 2 Nov 2026 21:30:26 +0800
Subject: Re: [PATCH 1/3] ubifs: gc: fix authentication node leak
To: <shao.mingyin@zte.com.cn>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261102195052961juHOv3LqlGtcYgvGv708m@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ee613d53-5275-64dc-716b-a87880f7d6e6@huawei.com>
Date: Mon, 2 Nov 2026 21:30:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102195052961juHOv3LqlGtcYgvGv708m@zte.com.cn>
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_053040_627426_FB3C244A 
X-CRM114-Status: GOOD (  11.30  )
X-Spam-Score: -3.8 (---)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTEvMiAxOTo1MCwgc2hhby5taW5neWluQHp0ZS5jb20uY24g5YaZ6YGTOgo+IG1v
dmVfbm9kZXMoKSBhbGxvY2F0ZXMgdGhlIGF1dGhlbnRpY2F0aW9uIG5vZGUsIHdyaXRlcyBpdCB0
byB0aGUgR0MKPiB3cml0ZS1idWZmZXIgYW5kIG9ubHkgZnJlZXMgaXQgb24gdGhlIGVycm9yIHBh
dGhzLiAgRXZlcnkgR0MgcGFzcyB0aGF0Cj4gbW92ZXMgbm9kZXMgb24gYW4gYXV0aGVudGljYXRl
ZCBmaWxlIHN5c3RlbSB0aGVyZWZvcmUgbGVha3MKPiB1Ymlmc19hdXRoX25vZGVfc3ooKSBieXRl
cy4KPiAKPiBGcmVlIHRoZSBidWZmZXIgYWZ0ZXIgaXQgaGFzIGJlZW4gd3JpdHRlbiB0byB0aGUg
d3JpdGUtYnVmZmVyLgo+IAo+IEZpeGVzOiA2ZjA2ZDk2ZmRmNjIgKCJ1YmlmczogQWRkIGF1dGgg
bm9kZXMgdG8gZ2FyYmFnZSBjb2xsZWN0b3Igam91cm5hbCBoZWFkIikKPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFNoYW8gTWluZ3lpbiA8c2hhby5taW5neWlu
QHp0ZS5jb20uY24+ClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3
ZWkuY29tPgo+IC0tLQo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9nYy5jIGIvZnMvdWJpZnMvZ2Mu
Ywo+IGluZGV4IDkzM2M3OWI1Y2Q2Yi4uMmIwZjI5NDIzZjQ4IDEwMDY0NAo+IC0tLSBhL2ZzL3Vi
aWZzL2djLmMKPiArKysgYi9mcy91Ymlmcy9nYy5jCj4gQEAgLTQyNyw2ICs0MjcsNyBAQCBzdGF0
aWMgaW50IG1vdmVfbm9kZXMoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc19zY2Fu
X2xlYiAqc2xlYikKPiAgIAkJCQlrZnJlZShhdXRoKTsKPiAgIAkJCQlnb3RvIG91dDsKPiAgIAkJ
CX0KPiArCQkJa2ZyZWUoYXV0aCk7Cj4gICAKPiAgIAkJCXViaWZzX2FkZF9kaXJ0KGMsIHdidWYt
PmxudW0sIHViaWZzX2F1dGhfbm9kZV9zeihjKSk7Cj4gICAJCX0KPiAuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
