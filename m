Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACBD606EE82
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 02:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H8h1toa8;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=MOlk8Ovr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rrab2p89C5/CJIMHEFOPq4pMHJ+mYs3B1dFUpcmonOs=; b=H8h1toa8jRYgPc0EbKzQK1zaaD
	XWHIb2YfhW4FNHo2JDO5y5CQr+r+HzkZHVG6YNQ5QZ/DOG708qlnTNtmAb/O4Cd3XO5CTkkgDnSPZ
	H6UyBBkTYLmP9b9dx2Dj07CLPRl9uagtxiaXQShxFP2z0q/XWftT7cN9XiQyIcpzLpdtrqHaJjEjN
	DCWXCJSOJAVIyoNacZpfUdZ3cfyzDBEWWbtop8Q+q2/ztSgqmODbnAMRr1GZpmb6E0iCFmMoqHQWg
	cbaD93FM0L1RRp+eqWsFvRb03SNz1DyToFog7Lffs/j+4w9ryuUsin6WlBPmTZp16ibZGfgsi2ifw
	9IybooIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3ur-00000000pyt-3FJl;
	Tue, 03 Nov 2026 02:06:25 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3uk-00000000pre-3hvt
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 02:06:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9eQOyo+IfoykMUCBNu9pw763kypSfDmJgqjlvxDApw8=;
	b=MOlk8Ovrnv9M2b6BANy190osKUGXiWsJJOzVOm0oroqq5uoDB3X7pN20VxheZXXwz3OPMe8wQ
	SQRfOVI4ocTcN3t/FvzX2c/v4m7/cpY47sU+DM1IEusYB1zjKs9Mj5+6jm/MbOGajjsp1YJh+d0
	DGKJLq2F4tcCTj/RY7FUYbk=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jJX4663p8znV89;
	Tue,  3 Nov 2026 10:06:14 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 6DF674048B;
	Tue,  3 Nov 2026 10:06:14 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 3 Nov 2026 10:06:13 +0800
Subject: Re: [PATCH 3/5] ubifs: reject master nodes claiming a too small inode
 number
To: <shao.mingyin@zte.com.cn>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20261102214935612btR10gHRJy3yrzqeLcnE9@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6ff71dd8-84e0-dcef-01c7-1bb7e341ccff@huawei.com>
Date: Tue, 3 Nov 2026 10:06:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102214935612btR10gHRJy3yrzqeLcnE9@zte.com.cn>
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_180619_866283_98B4ECD7 
X-CRM114-Status: GOOD (  17.11  )
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTEvMiAyMTo0OSwgc2hhby5taW5neWluQHp0ZS5jb20uY24g5YaZ6YGTOgo+IHZh
bGlkYXRlX21hc3RlcigpIG9ubHkgcmVqZWN0cyBoaWdoZXN0X2ludW0gdmFsdWVzIGFib3ZlCj4g
SU5VTV9XQVRFUk1BUksuICBBIG1hc3RlciBub2RlIHdob3NlIHZhbHVlIGlzIGJlbG93IFVCSUZT
X0ZJUlNUX0lOTyBpcwo+IGFjY2VwdGVkLCBhbmQgdWJpZnNfbmV3X2lub2RlKCkgdGhlbiBhbGxv
Y2F0ZXMgaW5vZGUgbnVtYmVycyBzdGFydGluZwo+IGZyb20gdGhhdCB2YWx1ZSwgaS5lLiBmcm9t
IHRoZSByYW5nZSByZXNlcnZlZCBmb3Igc3BlY2lhbCBpbm9kZXMuICBXaXRoCj4gaGlnaGVzdF9p
bnVtID0gMCB0aGUgdmVyeSBmaXJzdCBuZXcgaW5vZGUgZ2V0cyBudW1iZXIgMSwgd2hpY2ggaXMK
PiBVQklGU19ST09UX0lOTyBhbmQgaXMgYWxyZWFkeSB1c2VkIGJ5IHRoZSByb290IGlub2RlLCBz
byB0d28gaW5vZGVzIGVuZAo+IHVwIHdpdGggdGhlIHNhbWUgbnVtYmVyIGFuZCB0aGUgaW5kZXgg
aXMgY29ycnVwdGVkLgo+IAo+IENoZWNrIHRoZSBsb3dlciBib3VuZCBhcyB3ZWxsLgo+IAo+IEZp
eGVzOiAxZTUxNzY0YTNjMmEgKCJVQklGUzogYWRkIG5ldyBmbGFzaCBmaWxlIHN5c3RlbSIpCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBTaGFvIE1pbmd5aW4g
PHNoYW8ubWluZ3lpbkB6dGUuY29tLmNuPgo+IC0tLQo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9t
YXN0ZXIuYyBiL2ZzL3ViaWZzL21hc3Rlci5jCj4gaW5kZXggYTE0ODc2MGZhNDllLi44YTFiYTgx
YzEwYmIgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvbWFzdGVyLmMKPiArKysgYi9mcy91Ymlmcy9t
YXN0ZXIuYwo+IEBAIC0xOTEsNiArMTkxLDE2IEBAIHN0YXRpYyBpbnQgdmFsaWRhdGVfbWFzdGVy
KGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+ICAgCQlnb3RvIG91dDsKPiAgIAl9Cj4gICAK
PiArCS8qCj4gKwkgKiBJbm9kZSBudW1iZXJzIGJlbG93IFVCSUZTX0ZJUlNUX0lOTyBhcmUgcmVz
ZXJ2ZWQuICBJZiB0aGUgbWFzdGVyCj4gKwkgKiBub2RlIGNsYWltcyBhIHNtYWxsZXIgdmFsdWUs
IG5ld2x5IGNyZWF0ZWQgaW5vZGVzIHdvdWxkIHJldXNlIHRoZQo+ICsJICogcm9vdCBpbm9kZSBu
dW1iZXIgb3IgYW5vdGhlciByZXNlcnZlZCBvbmUuCj4gKwkgKi8KPiArCWlmIChjLT5oaWdoZXN0
X2ludW0gPCBVQklGU19GSVJTVF9JTk8pIHsKPiArCQllcnIgPSAyNDsKPiArCQlnb3RvIG91dDsK
PiArCX0KPiArCgpUaGlzIGNoZWNrIGNvdWxkIGJlIG1lcmdlZCBpbnRvIHByZXZpb3VzIGNoZWNr
OgogIGYgKGMtPmhpZ2hlc3RfaW51bSA+PSBJTlVNX1dBVEVSTUFSSykKPiAgIAlpZiAoYy0+bGhl
YWRfbG51bSA8IFVCSUZTX0xPR19MTlVNIHx8Cj4gICAJICAgIGMtPmxoZWFkX2xudW0gPj0gVUJJ
RlNfTE9HX0xOVU0gKyBjLT5sb2dfbGVicyB8fAo+ICAgCSAgICBjLT5saGVhZF9vZmZzIDwgMCB8
fCBjLT5saGVhZF9vZmZzID49IGMtPmxlYl9zaXplIHx8Cj4gLgo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
