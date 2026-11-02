Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF0606A33A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UW4uTZ3d;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fj7nE0QQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Me51/qXBkOJs/oc+hgCu8vmhVOKwhxgsBxHZnQQS13g=; b=UW4uTZ3djt61yDXflsK4YbTNh0
	Yi9QKA9QhWHevchzGnRBEM3yHH7NLGrsjaR2d/9C1LLh99EHTH/989IGmU7/SAcrqJ+NIBpcgxXf1
	oczhpACn6sSp7hWOnomxVo6Hgm2gAvg/hmz8S7l2gktlcIpqHdELPkUnVMkSjb2ppnRvxxb0u78oe
	lPvYcIAlTCMhvI4xAZ+7FFTkJG2Z8pIGy8WWsd7/5UgQeb55kF8tzlRW4dtPt8fTZCmBoLuXgCDII
	bUF6I7yzGVI7g4cCVRueLoNMTybi1WLkEIuW3/U+ZYKR2oFWPl6c45pIyAKNnHAEBOACc88eeVv3w
	ps5SQCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsCF-0000000GdqH-0pDy;
	Mon, 02 Nov 2026 13:35:35 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsC9-0000000GdpV-3RFy
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 13:35:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EVQ1vt5IOHfbKCljKX6ruZ5U/TgA9shpEQ/gchFOu6o=;
	b=fj7nE0QQBrFVgelGUx5/bAjuyRDhVopUTwWxLH5Eq303JkvheDHXcYwTVWlS2a9DVOSk9nDi6
	n8rziU8/imZmV0QEIDsNBb+Lg4eV3zFhT5p+uZ4kDFe7gsNRvnob+ds155Smaa5QtMHLgZwd0DC
	r3ELel2G/i5s6AnzdtsSzkU=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jJCPJ2fsfzcbNv;
	Mon,  2 Nov 2026 21:35:00 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id B7AC540537;
	Mon,  2 Nov 2026 21:35:23 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 2 Nov 2026 21:35:22 +0800
Subject: Re: [PATCH 2/3] ubifs: xattr: preserve the encryption flag when
 creation fails
To: <shao.mingyin@zte.com.cn>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261102195625207uxpYcc94_VO6Ir71GcQ99@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <485421cb-458a-4608-1453-09443df2ccd2@huawei.com>
Date: Mon, 2 Nov 2026 21:35:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102195625207uxpYcc94_VO6Ir71GcQ99@zte.com.cn>
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_053530_533027_7830D388 
X-CRM114-Status: GOOD (  18.59  )
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

5ZyoIDIwMjYvMTEvMiAxOTo1Niwgc2hhby5taW5neWluQHp0ZS5jb20uY24g5YaZ6YGTOgo+IGNy
ZWF0ZV94YXR0cigpIGNsZWFycyBVQklGU19DUllQVF9GTCBpbiBpdHMgZXJyb3IgcGF0aCByZWdh
cmRsZXNzIG9mCj4gd2hldGhlciB0aGlzIGNhbGwgc2V0IHRoZSBmbGFnLiAgVGhlIGZsYWcgaXMg
YWxzbyBzZXQgZm9yIGV2ZXJ5IGlub2RlCj4gdGhhdCBhbHJlYWR5IGNhcnJpZXMgYW4gZW5jcnlw
dGlvbiBjb250ZXh0LCBzbyBhIGZhaWxlZCBzZXR4YXR0cigpIG9uCj4gc3VjaCBhbiBpbm9kZSBj
bGVhcnMgaXQgZnJvbSB0aGUgaW4tbWVtb3J5IGlub2RlLiAgVGhlIG5leHQgaW5vZGUgd3JpdGUK
PiB0aGVuIHBhY2tzIHVpLT5mbGFncyB3aXRob3V0IFVCSUZTX0NSWVBUX0ZMLCBhbmQgYWZ0ZXIg
dGhlIG5leHQgbW91bnQKPiB0aGUgaW5vZGUgaXMgbm8gbG9uZ2VyIHRyZWF0ZWQgYXMgZW5jcnlw
dGVkIGFsdGhvdWdoIGl0cyBuYW1lcyBhbmQgZGF0YQo+IHN0aWxsIGFyZS4gIHViaWZzX2pubF91
cGRhdGUoKSBjYW4gZmFpbCBiZWZvcmUgYW55dGhpbmcgaXMgd3JpdHRlbiwgZm9yCj4gZXhhbXBs
ZSB3aGVuIGl0cyBqb3VybmFsIGJ1ZmZlciBjYW5ub3QgYmUgYWxsb2NhdGVkLgo+IAo+IFJlbWVt
YmVyIHdoZXRoZXIgdGhpcyBjYWxsIGFjdHVhbGx5IHNldCB0aGUgZmxhZyBhbmQgb25seSBjbGVh
ciBpdCBpbgo+IHRoYXQgY2FzZS4KPiAKPiBGaXhlczogZDQ3NWE1MDc0NTdiICgidWJpZnM6IEFk
ZCBza2VsZXRvbiBmb3IgZnNjcnlwdG8iKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4g
U2lnbmVkLW9mZi1ieTogU2hhbyBNaW5neWluIDxzaGFvLm1pbmd5aW5AenRlLmNvbS5jbj4KPiAt
LS0KUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4g
ZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3hhdHRyLmMgYi9mcy91Ymlmcy94YXR0ci5jCj4gaW5kZXgg
M2IwZThhMjcwZjU5Li43ZjgyZGRiOWUzZjIgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMveGF0dHIu
Ywo+ICsrKyBiL2ZzL3ViaWZzL3hhdHRyLmMKPiBAQCAtNjksNiArNjksNyBAQCBzdGF0aWMgaW50
IGNyZWF0ZV94YXR0cihzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IGlub2RlICpob3N0LAo+
ICAgCQkJY29uc3Qgc3RydWN0IGZzY3J5cHRfbmFtZSAqbm0sIGNvbnN0IHZvaWQgKnZhbHVlLCBp
bnQgc2l6ZSkKPiAgIHsKPiAgIAlpbnQgZXJyLCBuYW1lc19sZW47Cj4gKwlib29sIHNldF9jcnlw
dCA9IGZhbHNlOwo+ICAgCXN0cnVjdCBpbm9kZSAqaW5vZGU7Cj4gICAJc3RydWN0IHViaWZzX2lu
b2RlICp1aSwgKmhvc3RfdWkgPSB1Ymlmc19pbm9kZShob3N0KTsKPiAgIAlzdHJ1Y3QgdWJpZnNf
YnVkZ2V0X3JlcSByZXEgPSB7IC5uZXdfaW5vID0gMSwgLm5ld19kZW50ID0gMSwKPiBAQCAtMTMz
LDggKzEzNCwxMCBAQCBzdGF0aWMgaW50IGNyZWF0ZV94YXR0cihzdHJ1Y3QgdWJpZnNfaW5mbyAq
Yywgc3RydWN0IGlub2RlICpob3N0LAo+ICAgCSAqIFRvIGF2b2lkIG11bHRpcGxlIHVwZGF0ZXMg
b2YgdGhlIHNhbWUgaW5vZGUgaW4gdGhlIHNhbWUgb3BlcmF0aW9uLAo+ICAgCSAqIGxldCdzIGRv
IGl0IGhlcmUuCj4gICAJICovCj4gLQlpZiAoc3RyY21wKGZuYW1lX25hbWUobm0pLCBVQklGU19Y
QVRUUl9OQU1FX0VOQ1JZUFRJT05fQ09OVEVYVCkgPT0gMCkKPiArCWlmIChzdHJjbXAoZm5hbWVf
bmFtZShubSksIFVCSUZTX1hBVFRSX05BTUVfRU5DUllQVElPTl9DT05URVhUKSA9PSAwKSB7Cj4g
KwkJc2V0X2NyeXB0ID0gIShob3N0X3VpLT5mbGFncyAmIFVCSUZTX0NSWVBUX0ZMKTsKPiAgIAkJ
aG9zdF91aS0+ZmxhZ3MgfD0gVUJJRlNfQ1JZUFRfRkw7Cj4gKwl9Cj4gICAKPiAgIAllcnIgPSB1
Ymlmc19qbmxfdXBkYXRlKGMsIGhvc3QsIG5tLCBpbm9kZSwgMCwgMSwgMCk7Cj4gICAJaWYgKGVy
cikKPiBAQCAtMTUyLDcgKzE1NSw4IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hhdHRyKHN0cnVjdCB1
Ymlmc19pbmZvICpjLCBzdHJ1Y3QgaW5vZGUgKmhvc3QsCj4gICAJaG9zdF91aS0+eGF0dHJfc2l6
ZSAtPSBDQUxDX0RFTlRfU0laRShmbmFtZV9sZW4obm0pKTsKPiAgIAlob3N0X3VpLT54YXR0cl9z
aXplIC09IENBTENfWEFUVFJfQllURVMoc2l6ZSk7Cj4gICAJaG9zdF91aS0+eGF0dHJfbmFtZXMg
LT0gZm5hbWVfbGVuKG5tKTsKPiAtCWhvc3RfdWktPmZsYWdzICY9IH5VQklGU19DUllQVF9GTDsK
PiArCWlmIChzZXRfY3J5cHQpCj4gKwkJaG9zdF91aS0+ZmxhZ3MgJj0gflVCSUZTX0NSWVBUX0ZM
Owo+ICAgCW11dGV4X3VubG9jaygmaG9zdF91aS0+dWlfbXV0ZXgpOwo+ICAgb3V0X2ZyZWU6Cj4g
ICAJbWFrZV9iYWRfaW5vZGUoaW5vZGUpOwo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
