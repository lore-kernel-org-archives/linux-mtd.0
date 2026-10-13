Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879D1CC6B0E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 06:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PI239UFJkEgx99ppKUQlBsI1szRBb6sYY7DU2WPFYo=; b=0b0FN+/RVwMzrvGkt4FaKg7umn
	oE6QN/2pFO7RA5iFZ2eLuuft28D7I0K7PqNDMu1F1SWtCD57xGLqFPvCzlJ8d3eqKgeRp0qlEq46o
	QCvT4xgAYEs58yX1uGP0r0zusMcQl5wM2Ziunwbf6UUGp28a5KYYUjmN6p6isHKSMIqgQx2XB3xHb
	jjCjM31C1nBA5WZBurHgo7mc4g5aW3cI6Wx1YKshuQ0LyEE9DwFcWQvB7wKtXfxmXIFiQvMG0pKZc
	RB5vcR+0YdoXrLyPK9+P2Nsvi6Th1oUi1WJc92ZAysSbXwm2Y0P57jB+OBKSVt2LWXAyIACy3V8N1
	XrTUBKZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVhh-0000000C6yp-1y15;
	Tue, 13 Oct 2026 06:09:37 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVhb-0000000C6x1-323V
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 06:09:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=40uAvGtB89UrnliI+trk4ouePijCjFhtYsvGS/V1SXw=;
	b=hOQfiPjpIAoFpTW1jY9Ti5gnF0iwjU3DR6NTOIfes5GK6oIFW7bsMn0lqUZmvK9+JLH4MP7SV
	X3T9Ef2shjvcNOYGMuLeSBG4rPd+r8FTJmDRkIKNUfHwDCPMuVxHtKNDaLxG/5Tjgj5liCLbqp+
	TNzKTgKVAzqAfD5uI4Yr7Mc=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4j3kBC0H3hzLlSh;
	Tue, 13 Oct 2026 13:57:07 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id AAD9940578;
	Tue, 13 Oct 2026 14:09:24 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 13 Oct 2026 14:09:23 +0800
Subject: Re: [PATCH v2] ubifs: fix host inode TNC offset when deleting an
 xattr
To: Nan Lin <lin.nan@h3c.com>, <richard@nod.at>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>, <stable@vger.kernel.org>
References: <mv5oa6u2.f135b439-8d58-4f22-b346-3aacaa66e9e4@nod.at>
 <20261013052953.1401741-1-lin.nan@h3c.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e9bde32f-753c-a803-3fab-cb49e1031aeb@huawei.com>
Date: Tue, 13 Oct 2026 14:09:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20261013052953.1401741-1-lin.nan@h3c.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_230932_374481_78CE268F 
X-CRM114-Status: GOOD (  16.99  )
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

1NogMjAyNi8xMC8xMyAxMzoyOSwgTmFuIExpbiDQtLXAOgo+IHViaWZzX2pubF9kZWxldGVfeGF0
dHIoKSB3cml0ZXMgYSBncm91cCBvZiB0aHJlZSBub2RlczogdGhlIHhlbnQsIHRoZQo+IHhhdHRy
IGlub2RlIGFuZCB0aGUgaG9zdCBpbm9kZS4gVGhlIGhvc3QgaW5vZGUgaXMgcGFja2VkIGF0Cj4g
eGVudF9vZmZzICsgYWxpZ25lZF94bGVuICsgVUJJRlNfSU5PX05PREVfU1osIGJ1dCBpdHMgVE5D
IHBvc2l0aW9uIGlzCj4gY29tcHV0ZWQgYmFja3dhcmRzIGFzIHhlbnRfb2ZmcyArIGxlbiAtIGhs
ZW4uIFNpbmNlIGxlbiBpbmNsdWRlcyB0aGUKPiBncm91cCdzIHRhaWwgcGFkZGluZywgQUxJR04o
aGxlbiwgOCkgLSBobGVuLCB0aGUgdHdvIGRpZmZlciB3aGVuZXZlcgo+IHRoZSBob3N0IGlub2Rl
J3MgaW5saW5lIGRhdGEgbGVuZ3RoIGlzIG5vdCBhIG11bHRpcGxlIG9mIDguIFRoaXMKPiBhZmZl
Y3RzIHN5bWxpbmtzIGFuZCBkZXZpY2Ugbm9kZXMuCj4gCj4gVGhlIHVuYWxpZ25lZCBvZmZzZXQg
ZW5kcyB1cCBpbiB0aGUgb24tZmxhc2ggaW5kZXggYW5kIHRoZSBuZXh0IG1vdW50Cj4gcmVqZWN0
cyB0aGUgaW5kZXggbm9kZSwgdHVybmluZyB0aGUgZmlsZXN5c3RlbSByZWFkLW9ubHkuCj4gCj4g
Rml4ZXM6IDFlNTE3NjRhM2MyYSAoIlVCSUZTOiBhZGQgbmV3IGZsYXNoIGZpbGUgc3lzdGVtIikK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFRlc3RlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOYW4gTGluIDxsaW4ubmFu
QGgzYy5jb20+Cj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgIC0gY29tcHV0ZSB0aGUgaG9zdCBp
bm9kZSBvZmZzZXQgaW50byBhIG5ldyBob3N0X29mZnMgdmFyaWFibGUgaW5zdGVhZAo+ICAgICBv
ZiBvcGVuLWNvZGluZyB0aGUgb2Zmc2V0IChSaWNoYXJkIFdlaW5iZXJnZXIpOwo+ICAgLSBzaG9y
dGVuIHRoZSBjb21taXQgbWVzc2FnZS4KPiAKPiAtLS0KPiAgIGZzL3ViaWZzL2pvdXJuYWwuYyB8
IDcgKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29t
Pgo+IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9qb3VybmFsLmMgYi9mcy91Ymlmcy9qb3VybmFs
LmMKPiBpbmRleCA0MGE5NWEyZmFkNTAuLjBiMmRhZTU3ZTQ2NyAxMDA2NDQKPiAtLS0gYS9mcy91
Ymlmcy9qb3VybmFsLmMKPiArKysgYi9mcy91Ymlmcy9qb3VybmFsLmMKPiBAQCAtMTg1OCw3ICsx
ODU4LDggQEAgaW50IHViaWZzX2pubF9kZWxldGVfeGF0dHIoc3RydWN0IHViaWZzX2luZm8gKmMs
IGNvbnN0IHN0cnVjdCBpbm9kZSAqaG9zdCwKPiAgIAkJCSAgIGNvbnN0IHN0cnVjdCBpbm9kZSAq
aW5vZGUsCj4gICAJCQkgICBjb25zdCBzdHJ1Y3QgZnNjcnlwdF9uYW1lICpubSkKPiAgIHsKPiAt
CWludCBlcnIsIHhsZW4sIGhsZW4sIGxlbiwgbG51bSwgeGVudF9vZmZzLCBhbGlnbmVkX3hsZW4s
IHdyaXRlX2xlbjsKPiArCWludCBlcnIsIHhsZW4sIGhsZW4sIGxlbiwgbG51bSwgeGVudF9vZmZz
LCBob3N0X29mZnMsIGFsaWduZWRfeGxlbiwKPiArCQl3cml0ZV9sZW47Cj4gICAJc3RydWN0IHVi
aWZzX2RlbnRfbm9kZSAqeGVudDsKPiAgIAlzdHJ1Y3QgdWJpZnNfaW5vX25vZGUgKmlubzsKPiAg
IAl1bmlvbiB1Ymlmc19rZXkgeGVudF9rZXksIGtleTEsIGtleTI7Cj4gQEAgLTE5MTUsNiArMTkx
Niw4IEBAIGludCB1Ymlmc19qbmxfZGVsZXRlX3hhdHRyKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBj
b25zdCBzdHJ1Y3QgaW5vZGUgKmhvc3QsCj4gICAJCXViaWZzX3didWZfYWRkX2lub19ub2xvY2so
JmMtPmpoZWFkc1tCQVNFSERdLndidWYsIGhvc3QtPmlfaW5vKTsKPiAgIAlyZWxlYXNlX2hlYWQo
YywgQkFTRUhEKTsKPiAgIAo+ICsJaG9zdF9vZmZzID0geGVudF9vZmZzICsgYWxpZ25lZF94bGVu
ICsgVUJJRlNfSU5PX05PREVfU1o7Cj4gKwo+ICAgCXViaWZzX2FkZF9hdXRoX2RpcnQoYywgbG51
bSk7Cj4gICAJa2ZyZWUoeGVudCk7Cj4gICAJaWYgKGVycikKPiBAQCAtMTk0Myw3ICsxOTQ2LDcg
QEAgaW50IHViaWZzX2pubF9kZWxldGVfeGF0dHIoc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0
IHN0cnVjdCBpbm9kZSAqaG9zdCwKPiAgIAo+ICAgCS8qIEFuZCB1cGRhdGUgVE5DIHdpdGggdGhl
IG5ldyBob3N0IGlub2RlIHBvc2l0aW9uICovCj4gICAJaW5vX2tleV9pbml0KGMsICZrZXkxLCBo
b3N0LT5pX2lubyk7Cj4gLQllcnIgPSB1Ymlmc190bmNfYWRkKGMsICZrZXkxLCBsbnVtLCB4ZW50
X29mZnMgKyBsZW4gLSBobGVuLCBobGVuLCBoYXNoKTsKPiArCWVyciA9IHViaWZzX3RuY19hZGQo
YywgJmtleTEsIGxudW0sIGhvc3Rfb2ZmcywgaGxlbiwgaGFzaCk7Cj4gICAJaWYgKGVycikKPiAg
IAkJZ290byBvdXRfcm87Cj4gICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
