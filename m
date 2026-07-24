Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397B8C531FC
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2026 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uovMZ5ql6ck2uPtdxYuk1lC90yEJ9+9/XZ/sauwAnec=; b=QXV5bhbXVksxu91K7YkVG6qa6p
	nV8d7PGhHiESBX9QLCXUchuPZ366u7r4fC/noqBHZfmz2EkHOoAy6Ds9lz5U5c4BPWFSxFHfoLZeU
	ct2tSyBQN3XiDr3Qv29a53jvTUVhhDYBm2+okQjAILt9CSaEj4y5LcMMzzFM4skPamuXMNiDd996K
	y3yXjZ+lbX24NoRUdSTXGyCuRVJ2Q9n+PzXtSiyoUJwJ1EyV3Njk6KLfZqS2zRvbZ20BzDwdshWMk
	BqS+7zsveUFn2wEfS2nWJA2btJxrodvmbwXLbT/srEFgVTb0pkvQkGkIpP5stfLA5ufD/pC8kjpX1
	3wUNEO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDZo-0000000GCDC-3P80;
	Fri, 24 Jul 2026 10:56:24 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDZi-0000000GC6F-1x82
	for linux-mtd@lists.infradead.org;
	Fri, 24 Jul 2026 10:56:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bOwmN0G+JNpQ4yphnI+bJsqQsa/x5LFQtpnkOCvk05Y=;
	b=c+iyus1HA8mhiix0uGbJsu0jOJyfzeha2zFSo/3E6t4a6qpP6km4Ggp3rGhpLHCASZVgLSqXT
	fi6aa6lEFS8n51DSnM9pOyyj4PsWmCs9cCc28ExQEMGjE22Hy09q7NV7Fur54+MOCmf8jHsevxk
	scxZP5q94VPPjpWEPUwWD+I=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h64Rw5lHGzpT0h;
	Fri, 24 Jul 2026 18:46:52 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EF432025F;
	Fri, 24 Jul 2026 18:56:01 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jul 2026 18:56:00 +0800
Subject: Re: [PATCH] ubifs: fix out-of-bounds read in signature length check
To: Ibrahim Hashimov <security@auditcode.ai>, <richard@nod.at>
CC: <s.hauer@pengutronix.de>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20260724074327.73582-1-security@auditcode.ai>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9803bb99-31b9-f21c-7ca3-e4deafc667c4@huawei.com>
Date: Fri, 24 Jul 2026 18:55:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260724074327.73582-1-security@auditcode.ai>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_035619_223296_41B5ECC2 
X-CRM114-Status: GOOD (  19.33  )
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

1NogMjAyNi83LzI0IDE1OjQzLCBJYnJhaGltIEhhc2hpbW92INC0tcA6Cj4gdWJpZnNfc2JfdmVy
aWZ5X3NpZ25hdHVyZSgpIGJvdW5kcyB0aGUgb24tZGlzayB1Ymlmc19zaWdfbm9kZS0+bGVuIGZp
ZWxkCj4gYmVmb3JlIGhhbmRpbmcgdGhlIHNpZ25hdHVyZSBwYXlsb2FkIHRvIHZlcmlmeV9wa2Nz
N19zaWduYXR1cmUoKSwgYnV0IHRoZQo+IGNoZWNrIGhhcyB0aGUgd3Jvbmcgc2lnbjoKPiAKPiAJ
aWYgKGxlMzJfdG9fY3B1KHNpZ25vZGUtPmxlbikgPiBzbm9kLT5sZW4gKyBzaXplb2Yoc3RydWN0
IHViaWZzX3NpZ19ub2RlKSkKPiAKPiBUaGUgc2lnbmF0dXJlIGJ5dGVzIHN0YXJ0IHNpemVvZihz
dHJ1Y3QgdWJpZnNfc2lnX25vZGUpIChVQklGU19TSUdfTk9ERV9TWiwKPiA2NCBieXRlcykgaW50
byB0aGUgbm9kZSwgc28gdGhlIHBheWxvYWQgaXMgYXQgbW9zdAo+IAo+IAlzbm9kLT5sZW4gLSBz
aXplb2Yoc3RydWN0IHViaWZzX3NpZ19ub2RlKQo+IAo+IGJ5dGVzIGxvbmcuIEFkZGluZyB0aGUg
aGVhZGVyIHNpemUgaW5zdGVhZCBvZiBzdWJ0cmFjdGluZyBpdCBhY2NlcHRzIGEKPiBkZWNsYXJl
ZCBsZW5ndGggdXAgdG8gMiAqIFVCSUZTX1NJR19OT0RFX1NaIGxhcmdlciB0aGFuIHRoZSBub2Rl
IGFjdHVhbGx5Cj4gaG9sZHMgLS0gcGFzdCB0aGUgZW5kIG9mIGMtPnNidWYsIHdoaWNoIGlzIHZt
YWxsb2MoYy0+bGViX3NpemUpLgo+IHZlcmlmeV9wa2NzN19zaWduYXR1cmUoKSAtPiBwa2NzN19w
YXJzZV9tZXNzYWdlKCkgLT4gYXNuMV9iZXJfZGVjb2RlcigpCj4gaXMgdGhlbiBoYW5kZWQgdGhh
dCBpbmZsYXRlZCBsZW5ndGggYW5kIHJlYWRzIGJleW9uZCB0aGUgYWxsb2NhdGlvbiB3aGlsZQo+
IHdhbGtpbmcgdGhlIERFUiBoZWFkZXJzLiBUaGUgbm9kZSBsZW5ndGggY29tZXMgc3RyYWlnaHQg
ZnJvbSB0aGUgbW91bnRlZAo+IGltYWdlLCBzbyBhIGNyYWZ0ZWQgc2lnbmVkIFVCSUZTIGltYWdl
IHJlYWNoZXMgdGhpcyB2aWEKPiB1Ymlmc19yZWFkX3N1cGVyYmxvY2soKSBiZWZvcmUgdGhlIHNp
Z25hdHVyZSBpcyBjcnlwdG9ncmFwaGljYWxseSBjaGVja2VkLgo+IAo+IHNub2QtPmxlbiBpcyBn
dWFyYW50ZWVkIHRvIGJlID49IFVCSUZTX1NJR19OT0RFX1NaIGJ5IHRoZSBub2RlIHNjYW5uZXIK
PiAoYy0+cmFuZ2VzW1VCSUZTX1NJR19OT0RFXS5taW5fbGVuID09IFVCSUZTX1NJR19OT0RFX1Na
KSwgc28gdGhlIGNvcnJlY3RlZAo+IHN1YnRyYWN0aW9uIGNhbm5vdCB1bmRlcmZsb3cuIExlZ2l0
aW1hdGVseSBzaWduZWQgaW1hZ2VzIGFyZSB1bmFmZmVjdGVkOiBhCj4gY29ycmVjdCBzdXBlcmJs
b2NrIG5ldmVyIGRlY2xhcmVzIGEgc2lnbmF0dXJlIGxvbmdlciB0aGFuIHRoZSBub2RlIGl0IGlz
Cj4gZW1iZWRkZWQgaW4uCj4gCj4gRml4ZXM6IDgxN2FhMDk0ODQyZCAoInViaWZzOiBzdXBwb3J0
IG9mZmxpbmUgc2lnbmVkIGltYWdlcyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBJYnJhaGltIEhhc2hpbW92IDxzZWN1cml0eUBhdWRpdGNvZGUuYWk+Cj4g
QXNzaXN0ZWQtYnk6IEF1ZGl0Q29kZS1BSToyMDI2LjA3Cj4gLS0tCj4gICBmcy91Ymlmcy9hdXRo
LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+
IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9hdXRoLmMgYi9mcy91Ymlmcy9hdXRoLmMKPiBpbmRl
eCBhNGEwMTU4ZjcxMmQuLjFmNzcwNzk1ZWU3MCAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9hdXRo
LmMKPiArKysgYi9mcy91Ymlmcy9hdXRoLmMKPiBAQCAtMjE3LDcgKzIxNyw3IEBAIGludCB1Ymlm
c19zYl92ZXJpZnlfc2lnbmF0dXJlKHN0cnVjdCB1Ymlmc19pbmZvICpjLAo+IAo+ICAgCXNpZ25v
ZGUgPSBzbm9kLT5ub2RlOwo+IAo+IC0JaWYgKGxlMzJfdG9fY3B1KHNpZ25vZGUtPmxlbikgPiBz
bm9kLT5sZW4gKyBzaXplb2Yoc3RydWN0IHViaWZzX3NpZ19ub2RlKSkgewo+ICsJaWYgKGxlMzJf
dG9fY3B1KHNpZ25vZGUtPmxlbikgPiBzbm9kLT5sZW4gLSBzaXplb2Yoc3RydWN0IHViaWZzX3Np
Z19ub2RlKSkgewo+ICAgCQl1Ymlmc19lcnIoYywgImludmFsaWQgc2lnbmF0dXJlIGxlbiAlZCIs
IGxlMzJfdG9fY3B1KHNpZ25vZGUtPmxlbikpOwo+ICAgCQllcnIgPSAtRUlOVkFMOwo+ICAgCQln
b3RvIG91dF9kZXN0cm95Owo+IC0tCj4gMi41MC4xIChBcHBsZSBHaXQtMTU1KQo+IC4KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
