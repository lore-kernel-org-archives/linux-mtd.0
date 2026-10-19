Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EC9CCF2D4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2026 01:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxOHD+HX6opynK8GxXt5t6QcW4KxVV7uWJrb7qJ78Io=; b=iZNNCwdFKeF8xGf4iITIX7ZAFV
	Ns2MqTobNf02I+82wacUXVSqPVA/z3EV7m4qi6MG28TfGrbRAXhD11e0e8DlyelUZrBBx+CkqH3Tw
	OtiSsEhVlOmFx2ZEUb9MnDIi1yaAfkg0dBfb07+bwp1Ft9qff90BFpoLtRsy9LSTz4V6aN7PPTKnP
	zFS34R7dYXuEEoMDt0vBETLMIJUsRz8RiXvOG3D3zVTQrhek4v4o+8K3CKWe0t5Om5Lo14Win27wU
	gKbHDZFecXF7s2czcRep9yip+mTY7jHWLZmm7N76Vgt78p0qPwgVrQeMzKy+wnJws0Y8EBotgWx/w
	gruTXnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIby9-00000006NMr-22VW;
	Mon, 19 Oct 2026 01:15:17 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIby5-00000006N9N-00Wr
	for linux-mtd@lists.infradead.org;
	Mon, 19 Oct 2026 01:15:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=V7FqMxsUcKwN0UwLr5HSM14+Ny3a42v8ifOoh1UDt2k=;
	b=d9BZw3EE8n8oabxVe7b56ypiueA58tefns0jCYfa4V4ONVtHBPbUCp6jaLVn2fWZpyV5PT6cG
	Ok9nw2ORQpXgdc64+9RYYEKv6AUr5HD17Y1kAbAasRvi0PSW4kRbczdSOtVxltFH7ZGeVVy1UI6
	Kmd8NHkzWEuT20eiyMFj1aE=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j7Hdr5gmdznTb2;
	Mon, 19 Oct 2026 09:14:56 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 73A7040580;
	Mon, 19 Oct 2026 09:14:56 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 19 Oct 2026 09:14:54 +0800
Subject: Re: [PATCH] mtd: phram: fix name leak when phram_setup() fails
To: Palla Raghunath <raghunathpalla.0209@gmail.com>, <joern@lazybastard.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<shuah@kernel.org>, <me@brighamcampbell.com>,
	<linux-kernel-mentees@lists.linux.dev>, <stable@vger.kernel.org>,
	<syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com>
References: <20261017235733.14667-1-raghunathpalla.0209@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <577933c6-f1b5-0a45-1cf6-0c5607c6d382@huawei.com>
Date: Mon, 19 Oct 2026 09:14:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20261017235733.14667-1-raghunathpalla.0209@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_181513_655690_B703D722 
X-CRM114-Status: GOOD (  21.00  )
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

1NogMjAyNi8xMC8xOCA3OjU3LCBQYWxsYSBSYWdodW5hdGgg0LS1wDoKPiBwYXJzZV9lcnIoKSBp
cyBhIG1hY3JvIHRoYXQgcHJpbnRzIHRoZSBtZXNzYWdlIGFuZCB0aGVuIGRvZXMgInJldHVybiAx
Ii4KPiBwaHJhbV9zZXR1cCgpIHN0aWxsIHVzZXMgaXQgYWZ0ZXIgcGFyc2VfbmFtZSgpIGhhcyBh
bGxvY2F0ZWQgdGhlIGRldmljZQo+IG5hbWUsIHdpdGggYSAiZ290byBlcnJvciIgcmlnaHQgYWZ0
ZXIgZWFjaCBjYWxsLiBUaGF0IGdvdG8gaXMgbmV2ZXIKPiByZWFjaGVkLCBzbyB0aGUga2ZyZWUo
bmFtZSkgdW5kZXIgdGhlIGVycm9yIGxhYmVsIG5ldmVyIHJ1bnMgYW5kIHRoZQo+IG5hbWUgbGVh
a3MgZXZlcnkgdGltZSBvbmUgb2YgdGhlc2UgY2hlY2tzIGZhaWxzLgo+IAo+IHN5emJvdCBoaXQg
dGhpcyBieSB3cml0aW5nICJwMCwweDgwMDAwMDAwMDAwMDAwMDAsMCIgdG8KPiAvc3lzL21vZHVs
ZS9waHJhbS9wYXJhbWV0ZXJzL3BocmFtLiBUaGUgemVybyBsZW5ndGggZmFpbHMgdGhlCj4gZXJh
c2VzaXplL2xlbiBjaGVjayBhbmQgdGhlICJwMCIgc3RyaW5nIGlzIGxlYWtlZC4KPiAKPiBVc2Ug
cHJfZXJyKCkgZm9yIHRoZXNlIGZpdmUgbWVzc2FnZXMgc28gd2UgcmVhbGx5IGp1bXAgdG8gdGhl
IGVycm9yCj4gbGFiZWwgYW5kIGZyZWUgdGhlIG5hbWUuIFRoaXMgYWxzbyBtZWFucyB0aGUgcmVh
bCBlcnJvciBjb2RlIGdvZXMgYmFjawo+IHRvIHRoZSBjYWxsZXIgaW5zdGVhZCBvZiAxLCB3aGlj
aCBzeXNmcyByZXR1cm5lZCB0byB1c2Vyc3BhY2UgYXMgaWYgb25lCj4gYnl0ZSBoYWQgYmVlbiB3
cml0dGVuLgo+IAo+IEZpeGVzOiA0OWM2NGRmODgwNTcgKCJtdGQ6IHBocmFtOiBmaXggYSBkb3Vi
bGUgZnJlZSBpc3N1ZSBpbiBlcnJvciBwYXRoIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrYzlkOGJjOWY4Y2NjMDM3OTllMWZAc3l6a2FsbGVyLmFw
cHNwb3RtYWlsLmNvbQo+IENsb3NlczogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVn
P2V4dGlkPWM5ZDhiYzlmOGNjYzAzNzk5ZTFmCj4gU2lnbmVkLW9mZi1ieTogUGFsbGEgUmFnaHVu
YXRoIDxyYWdodW5hdGhwYWxsYS4wMjA5QGdtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRk
L2RldmljZXMvcGhyYW0uYyB8IDEwICsrKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2
aWNlcy9waHJhbS5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCj4gaW5kZXggYjQyY2Fk
Y2Q3NmIxLi43YWVkNTdiMzE5NjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9w
aHJhbS5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCj4gQEAgLTI4OSwzNCAr
Mjg5LDM0IEBAIHN0YXRpYyBpbnQgcGhyYW1fc2V0dXAoY29uc3QgY2hhciAqdmFsKQo+ICAgCj4g
ICAJcmV0ID0gcGFyc2VfbnVtNjQoJnN0YXJ0LCB0b2tlblsxXSk7Cj4gICAJaWYgKHJldCkgewo+
IC0JCXBhcnNlX2VycigiaWxsZWdhbCBzdGFydCBhZGRyZXNzXG4iKTsKPiArCQlwcl9lcnIoImls
bGVnYWwgc3RhcnQgYWRkcmVzc1xuIik7Cj4gICAJCWdvdG8gZXJyb3I7Cj4gICAJfQo+ICAgCj4g
ICAJcmV0ID0gcGFyc2VfbnVtNjQoJmxlbiwgdG9rZW5bMl0pOwo+ICAgCWlmIChyZXQpIHsKPiAt
CQlwYXJzZV9lcnIoImlsbGVnYWwgZGV2aWNlIGxlbmd0aFxuIik7Cj4gKwkJcHJfZXJyKCJpbGxl
Z2FsIGRldmljZSBsZW5ndGhcbiIpOwo+ICAgCQlnb3RvIGVycm9yOwo+ICAgCX0KPiAgIAo+ICAg
CWlmICh0b2tlblszXSkgewo+ICAgCQlyZXQgPSBwYXJzZV9udW02NCgmZXJhc2VzaXplLCB0b2tl
blszXSk7Cj4gICAJCWlmIChyZXQpIHsKPiAtCQkJcGFyc2VfZXJyKCJpbGxlZ2FsIGVyYXNlc2l6
ZVxuIik7Cj4gKwkJCXByX2VycigiaWxsZWdhbCBlcmFzZXNpemVcbiIpOwo+ICAgCQkJZ290byBl
cnJvcjsKPiAgIAkJfQo+ICAgCX0KPiAgIAo+ICAgCWlmIChsZW4gPT0gMCB8fCBlcmFzZXNpemUg
PT0gMCB8fCBlcmFzZXNpemUgPiBsZW4KPiAgIAkgICAgfHwgZXJhc2VzaXplID4gVUlOVF9NQVgp
IHsKPiAtCQlwYXJzZV9lcnIoImlsbGVnYWwgZXJhc2VzaXplIG9yIGxlblxuIik7Cj4gKwkJcHJf
ZXJyKCJpbGxlZ2FsIGVyYXNlc2l6ZSBvciBsZW5cbiIpOwo+ICAgCQlyZXQgPSAtRUlOVkFMOwo+
ICAgCQlnb3RvIGVycm9yOwo+ICAgCX0KPiAgIAo+ICAgCWRpdl91NjRfcmVtKGxlbiwgKHVpbnQz
Ml90KWVyYXNlc2l6ZSwgJnJlbSk7Cj4gICAJaWYgKHJlbSkgewo+IC0JCXBhcnNlX2VycigibGVu
IGlzIG5vdCBtdWx0aXBsZSBvZiBlcmFzZXNpemVcbiIpOwo+ICsJCXByX2VycigibGVuIGlzIG5v
dCBtdWx0aXBsZSBvZiBlcmFzZXNpemVcbiIpOwo+ICAgCQlyZXQgPSAtRUlOVkFMOwo+ICAgCQln
b3RvIGVycm9yOwo+ICAgCX0KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
