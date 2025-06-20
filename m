Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFECC7115B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Jun 2025 06:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPfSepb/slCRgEtZfVNtCPF5PvBC2kSzheAz+vX/s4g=; b=wA8SoOXTmplGPUwgHP9D7GUNsp
	ho91OoekT2YkUIQpHQ9nRiZraFqs3nPl8Xi2uUsL75WbMdUnTZrgwWYXcrWzAqIbzfeWVtaOIK9q4
	K0Ke9UMoBco9TUeA/05SUtunRQA/YR5qsbNyiyB8eorUUbDmf8b7yFgMhknJXuFHv9nXUKlf4Z5vW
	LsHnqCnScG86HerL+91rLIRSsjLRbUrDZFf8vrsIQnVBXtw43REJBoLJQSZA8uxQZiFzVw99QOhTA
	qlEvQTho+d2xQr/H9SlMiAbP2bKbz3HZcGFiAmMmyF1iKdiw1RPg+SHMhlRKNhA3gpGDBkyX22pzC
	9jzUvh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVHx-0000000ErYw-0F7s;
	Fri, 20 Jun 2025 06:31:49 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSVHt-0000000ErXu-2J3w
	for linux-mtd@lists.infradead.org;
	Fri, 20 Jun 2025 06:31:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bNncx2Gkmz1d1q1;
	Fri, 20 Jun 2025 14:29:21 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 314DE1800B1;
	Fri, 20 Jun 2025 14:31:35 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 14:31:34 +0800
Subject: Re: [PATCH] ubifs: Allocate shash export state on stack
To: Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger
	<richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <aFTZQb_Biyz9j5Nn@gondor.apana.org.au>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5c3eddb9-19f4-adf0-04ff-0f3e684e9772@huawei.com>
Date: Fri, 20 Jun 2025 14:31:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <aFTZQb_Biyz9j5Nn@gondor.apana.org.au>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_233145_774508_CCF6102A 
X-CRM114-Status: GOOD (  12.36  )
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

1NogMjAyNS82LzIwIDExOjQ1LCBIZXJiZXJ0IFh1INC0tcA6Cj4gVGhlIG91dHB1dCBzaXplIG9m
IGNyeXB0b19zaGFzaF9leHBvcnQgc2hvdWxkIGJlIG9idGFpbmVkIHZpYQo+IGNyeXB0b19zaGFz
aF9zdGF0ZXNpemUgYW5kIG5vdCBjcnlwdG9fc2hhc2hfZGVzY3NpemUuICBUaGUgbGF0dGVyCj4g
Y291bGQgYmUgdG9vIHNtYWxsIChidXQgaXMgdXN1YWxseSBiaWcgZW5vdWdoKS4KPiAKPiBIb3dl
dmVyLCBhcyBzdGF0ZSBzaXplcyBhcmUgQVBJLWxpbWl0ZWQsIHNpbXBseSBhbGxvY2F0ZSBpdCBv
biB0aGUKPiBzdGFjay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdv
bmRvci5hcGFuYS5vcmcuYXU+Cj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4KCk1heWJlIGFkZGluZyBhIGZpeCB0YWcgaXMgYmV0dGVyLCBjb21t
aXQgNDk1MjVlNWVlY2NhNWUxKCJ1YmlmczogQWRkIApoZWxwZXIgZnVuY3Rpb25zIGZvciBhdXRo
ZW50aWNhdGlvbiBzdXBwb3J0IikuCgo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9hdXRoLmMgYi9m
cy91Ymlmcy9hdXRoLmMKPiBpbmRleCBhNGEwMTU4ZjcxMmQuLmVkZjAxMmFhNTFiZiAxMDA2NDQK
PiAtLS0gYS9mcy91Ymlmcy9hdXRoLmMKPiArKysgYi9mcy91Ymlmcy9hdXRoLmMKPiBAQCAtNDc0
LDEzICs0NzQsOSBAQCBpbnQgX191Ymlmc19ub2RlX3ZlcmlmeV9obWFjKGNvbnN0IHN0cnVjdCB1
Ymlmc19pbmZvICpjLCBjb25zdCB2b2lkICpub2RlLAo+ICAgaW50IF9fdWJpZnNfc2hhc2hfY29w
eV9zdGF0ZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHNoYXNoX2Rlc2MgKnNy
YywKPiAgIAkJCSAgICAgc3RydWN0IHNoYXNoX2Rlc2MgKnRhcmdldCkKPiAgIHsKPiAtCXU4ICpz
dGF0ZTsKPiArCXU4IHN0YXRlW0hBU0hfTUFYX1NUQVRFU0laRV07Cj4gICAJaW50IGVycjsKPiAg
IAo+IC0Jc3RhdGUgPSBrbWFsbG9jKGNyeXB0b19zaGFzaF9kZXNjc2l6ZShzcmMtPnRmbSksIEdG
UF9OT0ZTKTsKPiAtCWlmICghc3RhdGUpCj4gLQkJcmV0dXJuIC1FTk9NRU07Cj4gLQo+ICAgCWVy
ciA9IGNyeXB0b19zaGFzaF9leHBvcnQoc3JjLCBzdGF0ZSk7Cj4gICAJaWYgKGVycikKPiAgIAkJ
Z290byBvdXQ7Cj4gQEAgLTQ4OCw4ICs0ODQsNiBAQCBpbnQgX191Ymlmc19zaGFzaF9jb3B5X3N0
YXRlKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3Qgc2hhc2hfZGVzYyAqc3JjLAo+
ICAgCWVyciA9IGNyeXB0b19zaGFzaF9pbXBvcnQodGFyZ2V0LCBzdGF0ZSk7Cj4gICAKPiAgIG91
dDoKPiAtCWtmcmVlKHN0YXRlKTsKPiAtCj4gICAJcmV0dXJuIGVycjsKPiAgIH0KPiAgIAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
