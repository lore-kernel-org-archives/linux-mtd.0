Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340D1606A31D
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 01:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rSQoASFl;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TT9AMUXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t14wvRmyRrrNZsWa/zCAxrD/3K847spuyIPJQSPg++I=; b=rSQoASFlEP8/ii4HBEb90ZeVyY
	+y0YogpKKjOKrMOyk/cj0DqEEFLf98Pw25SDYJj2+4sql1eGCgZKJL21Ce/cfwbRRTYbk4+z4DiAT
	3a00GV7JZOdLDQLIk4zXgfFxaC2ChD7MdPSdCxqwevSWcKylhsD/XJOUMLbgAaZRHxGuClo/KBFuJ
	T7is24k1A5w8IvwNCSgpMKe1HOCxN3vWDXbrkjYboFhYodWHPBAB66t+lgio3yjeau3ALBgH2vmnS
	pTh66RQL3EQ2urIXLRJ+kBVY6qqIKnDMm/xcuP3CMUXSB0nq9/VcBzTUBEKkOa63/5JQ8qAyDMsu+
	LBj4WJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWCE-00000003bcT-1Pr0;
	Tue, 27 Oct 2026 01:41:50 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWCA-00000003bbg-2mOM
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 01:41:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HU2jQwEVpLrvbwEbz/Gar4ZXPXw7yw5r3qXadtLdjKo=;
	b=TT9AMUXewXBPUH4eMiKZUBBGYQREKpLjnDUybvQgbv+j/BKMlQMt1cA5OE17l0xXNnVzUfCOv
	bRaWIsXyYZLHcJKUh9tb/I6r6trUU4mrT90NDWFCxx/oueHqziYNFKAi0uPVFYoPFTVciolO5uB
	A6kpgDFyvHzCsWGSs9N2D9c=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jDCrn5JRZz1T4G9;
	Tue, 27 Oct 2026 09:41:29 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 8434C4057F;
	Tue, 27 Oct 2026 09:41:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 27 Oct 2026 09:41:36 +0800
Subject: Re: [PATCH] jffs2: Fix a lock leak in jffs2_flash_writev()
To: Bart Van Assche <bvanassche@acm.org>, Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <f7faca912d873560eff94cf729e6d75decee76bb.1793044478.git.bvanassche@acm.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b40928c1-ff16-f973-f3e3-c5b0b9e83644@huawei.com>
Date: Tue, 27 Oct 2026 09:41:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f7faca912d873560eff94cf729e6d75decee76bb.1793044478.git.bvanassche@acm.org>
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_184147_150672_6E3EA713 
X-CRM114-Status: GOOD (  16.79  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1NogMjAyNi8xMC8yNyAzOjU0LCBCYXJ0IFZhbiBBc3NjaGUg0LS1wDoKPiBqZmZzMl9mbGFzaF93
cml0ZXYoKSB3cml0ZS1sb2NrcyBjLT53YnVmX3NlbSBuZWFyIHRoZSBzdGFydCBvZiB0aGUKPiBm
dW5jdGlvbi4gSWYgamZmczJfc3VtX2FkZF9rdmVjKCkgZmFpbHMsIHRoZSBmdW5jdGlvbiByZXR1
cm5zIHdpdGhvdXQKPiB1bmxvY2tpbmcgYy0+d2J1Zl9zZW0uIEZpeCB0aGlzIGJ5IHVubG9ja2lu
ZyBjLT53YnVmX3NlbSBiZWZvcmUKPiByZXR1cm5pbmcuIFRoaXMgYnVnIGhhcyBiZWVuIGRldGVj
dGVkIGJ5IHRoZSBDbGFuZyB0aHJlYWQtc2FmZXR5Cj4gYW5hbHl6ZXIuCj4gCj4gRml4ZXM6IGU2
MzFkZGJhNTg4NyAoIltKRkZTMl0gQWRkIGVyYXNlIGJsb2NrIHN1bW1hcnkgc3VwcG9ydCAobW91
bnQgdGltZSBpbXByb3ZlbWVudCkiKQo+IFNpZ25lZC1vZmYtYnk6IEJhcnQgVmFuIEFzc2NoZSA8
YnZhbmFzc2NoZUBhY20ub3JnPgo+IC0tLQo+ICAgZnMvamZmczIvd2J1Zi5jIHwgNCArKystCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pClJldmlld2Vk
LWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1n
aXQgYS9mcy9qZmZzMi93YnVmLmMgYi9mcy9qZmZzMi93YnVmLmMKPiBpbmRleCAzYjc4MDNjNzVk
NTguLmM4ZmI1ODUxMzc4MyAxMDA2NDQKPiAtLS0gYS9mcy9qZmZzMi93YnVmLmMKPiArKysgYi9m
cy9qZmZzMi93YnVmLmMKPiBAQCAtOTA0LDggKzkwNCwxMCBAQCBpbnQgamZmczJfZmxhc2hfd3Jp
dGV2KHN0cnVjdCBqZmZzMl9zYl9pbmZvICpjLCBjb25zdCBzdHJ1Y3Qga3ZlYyAqaW52ZWNzLAo+
ICAgCj4gICAJaWYgKGpmZnMyX3N1bV9hY3RpdmUoKSkgewo+ICAgCQlpbnQgcmVzID0gamZmczJf
c3VtX2FkZF9rdmVjKGMsIGludmVjcywgY291bnQsICh1aW50MzJfdCkgdG8pOwo+IC0JCWlmIChy
ZXMpCj4gKwkJaWYgKHJlcykgewo+ICsJCQl1cF93cml0ZSgmYy0+d2J1Zl9zZW0pOwo+ICAgCQkJ
cmV0dXJuIHJlczsKPiArCQl9Cj4gICAJfQo+ICAgCj4gICAJaWYgKGMtPndidWZfbGVuICYmIGlu
bykKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPiAuCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
