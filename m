Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E617606A321
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ppHf1eFR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tXRuL6/x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ff7hd+QU+db12m2muepNBLgThOlHXBUJpi8qz9tz6f8=; b=ppHf1eFRSLkQjf/U14Qlc55s4d
	+e1sOyNXQ1PRRfaMzF7BNX3cUvmm2WoFjSDM/LTYMnx6qbLIkoqggwjp8yhtmMTvX0ebMpglECrtU
	IZkmba1DGkpUOLZuNeYMHVbUaFQ3oHwi8esOxhhi73QRA0Uwu1xzB2X2Vrsa+ZR5Kp3o3WffgG7C7
	O+66PV5LwTZqdoVWE+TtC7mihgbCPlvVWHOeUw9bTPdiDtxrRXZyxXt5SIxN1Y3e7Tir6a7YKfbS6
	r824kUsoMq1qZ1FK0ld7XGE0JwcYMAaeGZIpihoy0dCACjGZ9wcIWXu7pKk/WmyRGWQ/8bbIosLT4
	0cm60Mfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLuD-00000008lwa-1Wyw;
	Thu, 29 Oct 2026 08:54:41 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLu9-00000008lui-2cUb
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 08:54:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Q70iv8hgHPImGJwByc0Z4M1+rMHdNArmQ9AkIYYXNY0=;
	b=tXRuL6/xPq9TBBk+P1aKoWdgSV4+tindXcCZsh8kohvox+SUEeNu4so695q0CP5msi7f36Ki2
	2GixcqT16Uot/LZADeCLoFx0yFJzCZfUx+IZ+NMIwMWnp0DWvxyhdgtmZ8iqsvLtey7f/ZSljY+
	5cWpY+8lLIh0phmG9Mm5c5U=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jFdMH5fdFzKm61;
	Thu, 29 Oct 2026 16:54:19 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EE104057C;
	Thu, 29 Oct 2026 16:54:29 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 29 Oct 2026 16:54:28 +0800
Subject: Re: [PATCH] ubifs: fix fscrypt_name leak when purging xattrs fails
To: <shao.mingyin@zte.com.cn>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20261029164549455vmvRvpHkZ8cVjNxAzoyoO@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <07e98a63-b9d0-4f94-24f1-f394390389d1@huawei.com>
Date: Thu, 29 Oct 2026 16:54:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029164549455vmvRvpHkZ8cVjNxAzoyoO@zte.com.cn>
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_015438_143812_56D3F255 
X-CRM114-Status: GOOD (  15.06  )
X-Spam-Score: -3.3 (---)
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTAvMjkgMTY6NDUsIHNoYW8ubWluZ3lpbkB6dGUuY29tLmNuIOWGmemBkzoKPiBG
cm9tOiBTaGFvIE1pbmd5aW4gPHNoYW8ubWluZ3lpbkB6dGUuY29tLmNuPgo+IAo+IHViaWZzX3Vu
bGluaygpIGFuZCB1Ymlmc19ybWRpcigpIGNhbGwgZnNjcnlwdF9zZXR1cF9maWxlbmFtZSgpIGFu
ZAo+IHRoZW4gdWJpZnNfcHVyZ2VfeGF0dHJzKCkuICBGb3IgYW4gZW5jcnlwdGVkIGRpcmVjdG9y
eSB0aGUgZm9ybWVyCj4gYWxsb2NhdGVzIHRoZSBidWZmZXIgaG9sZGluZyB0aGUgZW5jcnlwdGVk
IG9uLWRpc2sgbmFtZSwgYW5kIGV2ZXJ5Cj4gbGF0ZXIgZXJyb3IgcGF0aCBvZiBib3RoIGZ1bmN0
aW9ucyByZWxlYXNlcyBpdCB0aHJvdWdoIHRoZSBvdXRfZm5hbWUKPiBsYWJlbC4gIFRoZSBwdXJn
ZSBmYWlsdXJlIHBhdGggcmV0dXJucyBkaXJlY3RseSBpbnN0ZWFkLCBzbyB0aGF0Cj4gYnVmZmVy
IGlzIGxlYWtlZC4KPiAKPiB1Ymlmc19wdXJnZV94YXR0cnMoKSBvbmx5IGRvZXMgcmVhbCB3b3Jr
IHdoZW4gdGhlIGlub2RlIGNsYWltcyBtb3JlCj4geGF0dHJzIHRoYW4gVUJJRlMgYWxsb3dzLCBp
biB3aGljaCBjYXNlIGl0IGRlbGV0ZXMgdGhlbSBvbmUgYnkgb25lLgo+IFRoYXQgY2FuIGZhaWws
IGZvciBleGFtcGxlIHdpdGggLUVOT1NQQyBmcm9tIHViaWZzX2J1ZGdldF9zcGFjZSgpIG9yCj4g
d2l0aCBhbiBJL08gZXJyb3IuICBFdmVyeSBzdWNoIGZhaWxlZCB1bmxpbmsoKSBvciBybWRpcigp
IHRoZW4gbGVha3MKPiBvbmUgYnVmZmVyIG9mIHVwIHRvIE5BTUVfTUFYIGJ5dGVzLCBzbyByZXBl
YXRlZCBhdHRlbXB0cyBsZWFrIG1lbW9yeQo+IHdpdGhvdXQgYm91bmQuCj4gCj4gSnVtcCB0byB0
aGUgZXhpc3RpbmcgY2xlYW51cCBsYWJlbCBpbnN0ZWFkLiAgZG9fcmVuYW1lKCkgaXMgbm90Cj4g
YWZmZWN0ZWQ6IGl0IHB1cmdlcyB0aGUgeGF0dHJzIGJlZm9yZSBpdCBjYWxscwo+IGZzY3J5cHRf
c2V0dXBfZmlsZW5hbWUoKS4KPiAKPiBGaXhlczogOWNhMmQ3MzI2NDQ0ICgidWJpZnM6IExpbWl0
IG51bWJlciBvZiB4YXR0cnMgcGVyIGlub2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBTaGFvIE1pbmd5
aW4gPHNoYW8ubWluZ3lpbkB6dGUuY29tLmNuPgoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8
Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gLS0tCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2Rp
ci5jIGIvZnMvdWJpZnMvZGlyLmMKPiBpbmRleCBjNjc5NTRmNmJlZTAuLjczNTk0ZDQ3NmZlMyAx
MDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9kaXIuYwo+ICsrKyBiL2ZzL3ViaWZzL2Rpci5jCj4gQEAg
LTg0Niw3ICs4NDYsNyBAQCBzdGF0aWMgaW50IHViaWZzX3VubGluayhzdHJ1Y3QgaW5vZGUgKmRp
ciwgc3RydWN0IGRlbnRyeSAqZGVudHJ5KQo+IAo+ICAgCWVyciA9IHViaWZzX3B1cmdlX3hhdHRy
cyhpbm9kZSk7Cj4gICAJaWYgKGVycikKPiAtCQlyZXR1cm4gZXJyOwo+ICsJCWdvdG8gb3V0X2Zu
YW1lOwo+IAo+ICAgCXN6X2NoYW5nZSA9IENBTENfREVOVF9TSVpFKGZuYW1lX2xlbigmbm0pKTsK
PiAKPiBAQCAtOTU1LDcgKzk1NSw3IEBAIHN0YXRpYyBpbnQgdWJpZnNfcm1kaXIoc3RydWN0IGlu
b2RlICpkaXIsIHN0cnVjdCBkZW50cnkgKmRlbnRyeSkKPiAKPiAgIAllcnIgPSB1Ymlmc19wdXJn
ZV94YXR0cnMoaW5vZGUpOwo+ICAgCWlmIChlcnIpCj4gLQkJcmV0dXJuIGVycjsKPiArCQlnb3Rv
IG91dF9mbmFtZTsKPiAKPiAgIAlzel9jaGFuZ2UgPSBDQUxDX0RFTlRfU0laRShmbmFtZV9sZW4o
Jm5tKSk7Cj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
