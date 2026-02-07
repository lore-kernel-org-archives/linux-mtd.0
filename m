Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8BFEE6B6F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Feb 2026 02:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BocOa6wHn+tk4ybX981zhtdXvOTtcCGxoTSLQJGKeY=; b=jl5re/hG/I8xlLDhl+5gghBFVc
	0W7gqx7NqsbWCJ+p1KCqrFoTvcOAhpno2ZrU5bh+PJOr7ezlzKi8dMppff05VwewMuSW7s7SxHs3+
	m+zJ1i03XcabYhL9U8HCCXux8TPFKnfqr75EE43N0X53w8+yfKm4jVeHGcDy7V9uP1VM+0zVwjlhp
	oZ1sI2iJ/WyTY1Av7udgxWFA6bDyUvXbnscf5vXaakQdy5Woux1kRNDX6lEyhxnEp6aW9A7lM6ad0
	7/OY4S4hqFBbyL/QfF9f2/mN2xDQAwx6soaOR1xZfc5KD+TYnQ9+AQd6X9l457Q/cZ1SlONklJg1n
	pSi1stdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voYBp-0000000C3YU-3vmS;
	Sat, 07 Feb 2026 02:36:53 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voYBj-0000000C3Xs-2lXd
	for linux-mtd@lists.infradead.org;
	Sat, 07 Feb 2026 02:36:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wfqvc3BXrGKiR4wiQAq3dq087OBHYWgm5FyBM0o1zqU=;
	b=pHdd7CtMBE+Pyp6R7lFfBDivBhuvfbpjF6C52PrCIj6lwXNllHIYNHYJeS8i24cIRDZRY1F0d
	homzgMAuXmQwiaZyzcDXCJ6xW/YFZDff0aX1Qvd6Q81LNfYhv2ys7uo2oRhY+CWjWjDCkP8fj5J
	AHwREK7j2GIWKcs5DeP2NaU=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4f7FMt6JTbzKm4t;
	Sat,  7 Feb 2026 10:31:54 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E9004056D;
	Sat,  7 Feb 2026 10:36:31 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Feb 2026 10:36:30 +0800
Subject: Re: [PATCH] jffs2: use fs_umode_to_dtype() for dirent type
To: Adarsh Das <adarshdas950@gmail.com>, <dwmw2@infradead.org>,
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260206115100.84852-1-adarshdas950@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <134dec36-3bcf-89a4-2817-a880afa4280f@huawei.com>
Date: Sat, 7 Feb 2026 10:36:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260206115100.84852-1-adarshdas950@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_183648_210266_B7AB0DFF 
X-CRM114-Status: GOOD (  12.81  )
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

1NogMjAyNi8yLzYgMTk6NTEsIEFkYXJzaCBEYXMg0LS1wDoKPiBVc2UgZnNfdW1vZGVfdG9fZHR5
cGUoKSBpbnN0ZWFkIG9mIGRpcmVjdCBiaXQgc2hpZnRpbmcgd2hlbgo+IHNldHRpbmcgZGlyZWN0
b3J5IGVudHJ5IHR5cGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRhcnNoIERhcyA8YWRhcnNoZGFz
OTUwQGdtYWlsLmNvbT4KPiAtLS0KPiAgIGZzL2pmZnMyL2Rpci5jIHwgMTEgKysrLS0tLS0tLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2ZzL2pmZnMyL2Rpci5jIGIvZnMvamZmczIvZGlyLmMKPiBpbmRleCBkZDkx
ZjcyNWRlZDYuLjE4NWNmNzZhMDYxZSAxMDA2NDQKPiAtLS0gYS9mcy9qZmZzMi9kaXIuYwo+ICsr
KyBiL2ZzL2pmZnMyL2Rpci5jCj4gQEAgLTI2MSw4ICsyNjEsNyBAQCBzdGF0aWMgaW50IGpmZnMy
X2xpbmsgKHN0cnVjdCBkZW50cnkgKm9sZF9kZW50cnksIHN0cnVjdCBpbm9kZSAqZGlyX2ksIHN0
cnVjdCBkZQo+ICAgCWlmIChkX2lzX2RpcihvbGRfZGVudHJ5KSkKPiAgIAkJcmV0dXJuIC1FUEVS
TTsKPiAgIAo+IC0JLyogWFhYOiBUaGlzIGlzIHVnbHkgKi8KPiAtCXR5cGUgPSAoZF9pbm9kZShv
bGRfZGVudHJ5KS0+aV9tb2RlICYgU19JRk1UKSA+PiAxMjsKPiArCXR5cGUgPSBmc191bW9kZV90
b19kdHlwZShkX2lub2RlKG9sZF9kZW50cnkpLT5pX21vZGUpOwo+ICAgCWlmICghdHlwZSkgdHlw
ZSA9IERUX1JFRzsKCkhpIEFkYXJzaCwKVGhlIGNvbnZlcnRpb24gcmVzdWx0IGlzIHdyb25nIGZv
ciBqZmZzMl9kb19saW5rLgpUaGUgaV9tb2RlIG9mIG9sZF9kZW50cnkgaXMgJ1NfSUZJRk8nLCB0
aGUgamZmczIgZ2V0cyB0eXBlIERUX0ZJRk8oMSkgCmFuZCBwYXNzIGl0IHRvICdyZC0+dHlwZScg
YnkgamZmczJfZG9fbGluay4gSG93ZXZlciwgYWZ0ZXIgdGhlIHBhdGNoIAphcHBsaWVkLCBqZmZz
MiBnZXRzIHR5cGUgRlRfRklGTyg1KSwgd2hpY2ggd2lsbCBjb25mdXNlIG90aGVyICdyZC0+dHlw
ZScgCmFjY2Vzc2luZyBwcm9jZXNzZXMoZWcuIGpmZnMyX3NjYW5fZGlyZW50X25vZGVbcmQtPnR5
cGVdLCAKamZmczJfYnVpbGRfZmlsZXN5c3RlbVtmZC0+dHlwZV0pLgoKPiAgIAo+ICAgCW5vdyA9
IEpGRlMyX05PVygpOwo+IEBAIC03MzAsMTAgKzcyOSw3IEBAIHN0YXRpYyBpbnQgamZmczJfbWtu
b2QgKHN0cnVjdCBtbnRfaWRtYXAgKmlkbWFwLCBzdHJ1Y3QgaW5vZGUgKmRpcl9pLAo+ICAgCXJk
LT5pbm8gPSBjcHVfdG9famUzMihpbm9kZS0+aV9pbm8pOwo+ICAgCXJkLT5tY3RpbWUgPSBjcHVf
dG9famUzMihKRkZTMl9OT1coKSk7Cj4gICAJcmQtPm5zaXplID0gbmFtZWxlbjsKPiAtCj4gLQkv
KiBYWFg6IFRoaXMgaXMgdWdseS4gKi8KPiAtCXJkLT50eXBlID0gKG1vZGUgJiBTX0lGTVQpID4+
IDEyOwo+IC0KPiArCXJkLT50eXBlID0gZnNfdW1vZGVfdG9fZHR5cGUobW9kZSk7Cj4gICAJcmQt
Pm5vZGVfY3JjID0gY3B1X3RvX2plMzIoY3JjMzIoMCwgcmQsIHNpemVvZigqcmQpLTgpKTsKPiAg
IAlyZC0+bmFtZV9jcmMgPSBjcHVfdG9famUzMihjcmMzMigwLCBkZW50cnktPmRfbmFtZS5uYW1l
LCBuYW1lbGVuKSk7Cj4gICAKPiBAQCAtODExLDggKzgwNyw3IEBAIHN0YXRpYyBpbnQgamZmczJf
cmVuYW1lIChzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwKPiAgIAo+ICAgCS8qIE1ha2UgYSBoYXJk
IGxpbmsgKi8KPiAgIAo+IC0JLyogWFhYOiBUaGlzIGlzIHVnbHkgKi8KPiAtCXR5cGUgPSAoZF9p
bm9kZShvbGRfZGVudHJ5KS0+aV9tb2RlICYgU19JRk1UKSA+PiAxMjsKPiArCXR5cGUgPSBmc191
bW9kZV90b19kdHlwZShkX2lub2RlKG9sZF9kZW50cnkpLT5pX21vZGUpOwo+ICAgCWlmICghdHlw
ZSkgdHlwZSA9IERUX1JFRzsKPiAgIAo+ICAgCW5vdyA9IEpGRlMyX05PVygpOwo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
