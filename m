Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE92D5D695
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2024 01:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4LF9arDAsf1+MG588KZ41MGtqGImXkPF4zaws3kL+c=; b=rxYFtA1E1Dvs6CSkVxpUztz8aw
	DuRNjQfEH3DluhS3jwaVBzG+QP4f7YUpGuqyciqQIj8TWc7NIl7zzKetzxCW/1KwWT5hlRSVEUDUQ
	VswlBrB2uHcYA/1yjNgpiyW8CzQt9Qt/6Ne+ai940ln+UrZAP6ELXk1V0HKx/2f+67DjsE7SpWZDB
	qKm4O3D2EuJSFqwErOI/RE7Uyvv7g28mVfxw7s0AWfDkuqMNOwBMioFYPFXsi12CkJWyvW10kBI5k
	qB9gDw80JtgQ/GuScASh9QC+rXnL/XMO9oC2Y1kBXBNAiqh+i5EqLr6aLEZHaioZCjn7eB1E68Umd
	jqNSRxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9E15-00000008xQN-489M;
	Fri, 08 Nov 2024 01:42:27 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9E0W-00000008xK0-2NNm
	for linux-mtd@lists.infradead.org;
	Fri, 08 Nov 2024 01:41:54 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xl1q85XqvzQs71;
	Fri,  8 Nov 2024 09:40:36 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id AA35818012B;
	Fri,  8 Nov 2024 09:41:45 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 Nov 2024 09:41:44 +0800
Subject: Re: [PATCH] mtd: ubi: remove redundant check on bytes_left at end of
 function
To: Colin Ian King <colin.i.king@gmail.com>, Richard Weinberger
	<richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241107152357.63387-1-colin.i.king@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <56b13d09-91ce-6a4b-c6cb-449b478e3335@huawei.com>
Date: Fri, 8 Nov 2024 09:41:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241107152357.63387-1-colin.i.king@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_174152_789602_A5A11824 
X-CRM114-Status: GOOD (  15.72  )
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

5ZyoIDIwMjQvMTEvNyAyMzoyMywgQ29saW4gSWFuIEtpbmcg5YaZ6YGTOgo+IEluIGZ1bmN0aW9u
IHViaV9udm1lbV9yZWdfcmVhZCB0aGUgd2hpbGUtbG9vcCBjYW4gb25seSBiZSBleGl0aW5nCj4g
b2YgYnl0ZXNfbGVmdCBpcyB6ZXJvIG9yIGFuIGVycm9yIGhhcyBvY2N1cnJlZC4gVGhlcmUgaXMg
YW4gZXhpdAo+IHJldHVybiBwYXRoIGlmIGFuIGVycm9yIG9jY3Vycywgc28gdGhlIGJ5dGVzX2xl
ZnQgY2FuIG9ubHkgYmUKPiB6ZXJvIGFmdGVyIHRoYXQgcG9pbnQuIEhlbmNlIHRoZSBjaGVjayBm
b3IgYSBub24temVybyBieXRlc19sZWZ0Cj4gYXQgdGhlIGVuZCBvZiB0aGUgZnVuY3Rpb24gaXMg
cmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4gUmVtb3ZlCj4gdGhlIGNoZWNrIGFuZCBqdXN0
IHJldHVybiAwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5pLmtp
bmdAZ21haWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL252bWVtLmMgfCAyICstCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKTWFrZSBz
ZW5zZS4KUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9udm1lbS5jIGIvZHJpdmVycy9tdGQvdWJp
L252bWVtLmMKPiBpbmRleCBhOTRhMWE5YWFlYzEuLjM0ZjhjMWQzY2RlZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC91YmkvbnZtZW0uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9udm1lbS5j
Cj4gQEAgLTU1LDcgKzU1LDcgQEAgc3RhdGljIGludCB1YmlfbnZtZW1fcmVnX3JlYWQodm9pZCAq
cHJpdiwgdW5zaWduZWQgaW50IGZyb20sCj4gICAJaWYgKGVycikKPiAgIAkJcmV0dXJuIGVycjsK
PiAgIAo+IC0JcmV0dXJuIGJ5dGVzX2xlZnQgPT0gMCA/IDAgOiAtRUlPOwo+ICsJcmV0dXJuIDA7
Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbnQgdWJpX252bWVtX2FkZChzdHJ1Y3QgdWJpX3ZvbHVt
ZV9pbmZvICp2aSkKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
