Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B615C4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq8NwzNt0OQF9M6JJ74HXjyVz6Yl7uuZuSGF7E6XvaY=; b=dI/vdZ6Aj0hfHWLzJ9StRnqv0Y
	w/M9ZAI7JSjwN8uOkJlkvn9zHCBNuBaYJVyaXOF8bBsJ9ekPHDy/VUAaxa4LcHvSDiw7fnL0WATJ4
	+Mbk5QswWsXyUAMvK3WrdKuxt5ZNiwbwilLBYG7ty7PlTZIc1Ss+ynAqyD8KBsHoJIpw7/wvQW5QN
	wXlo1zhR4PEgyBF2VVyfWqaIxRg5ANdSW0iDKLJmurpJ189UqM2B0deVvlXtYUhGzgdKShrcqz85A
	FwYCwlLxBXlLE/9ExWc7+5vDtyPOMW8JQYHu9q3fVuW61bPsyc/5ROIm1Eid2Hb04IQahNmY1ruWz
	z+LUGVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtCN-00C32s-2q;
	Mon, 22 Jan 2024 12:14:43 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtCK-00C31M-23
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 12:14:42 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TJTdz5lFBz1xmWx;
	Mon, 22 Jan 2024 20:13:43 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 2907B140669;
	Mon, 22 Jan 2024 20:14:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 20:14:18 +0800
Subject: Re: [PATCH 12/15] ubifs: Convert cancel_budget() to take a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-13-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a595d53c-3fbe-c7dd-d6b9-1438363f4067@huawei.com>
Date: Mon, 22 Jan 2024 20:14:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-13-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_041440_862750_FB1BAA25 
X-CRM114-Status: GOOD (  18.40  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gVGhlIG9u
ZSBjYWxsZXIgYWxyZWFkeSBoYXMgYSBmb2xpbywgc28gcGFzcyBpdCBpbiBpbnN0ZWFkIG9mIHRo
ZSBwYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgV2lsY294IChPcmFjbGUpIDx3aWxs
eUBpbmZyYWRlYWQub3JnPgo+IC0tLQo+ICAgZnMvdWJpZnMvZmlsZS5jIHwgMTAgKysrKystLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKClJl
dmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiAKPiBk
aWZmIC0tZ2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIvZnMvdWJpZnMvZmlsZS5jCj4gaW5kZXggNmJj
Nzk2NWNlOTE4Li5mMzQzNzE0MzZhODQgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvZmlsZS5jCj4g
KysrIGIvZnMvdWJpZnMvZmlsZS5jCj4gQEAgLTUwMSwxNCArNTAxLDE0IEBAIHN0YXRpYyBpbnQg
dWJpZnNfd3JpdGVfYmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3NwYWNl
ICptYXBwaW5nLAo+ICAgLyoqCj4gICAgKiBjYW5jZWxfYnVkZ2V0IC0gY2FuY2VsIGJ1ZGdldC4K
PiAgICAqIEBjOiBVQklGUyBmaWxlLXN5c3RlbSBkZXNjcmlwdGlvbiBvYmplY3QKPiAtICogQHBh
Z2U6IHBhZ2UgdG8gY2FuY2VsIGJ1ZGdldCBmb3IKPiArICogQGZvbGlvOiBmb2xpbyB0byBjYW5j
ZWwgYnVkZ2V0IGZvcgo+ICAgICogQHVpOiBVQklGUyBpbm9kZSBvYmplY3QgdGhlIHBhZ2UgYmVs
b25ncyB0bwo+ICAgICogQGFwcGVuZGluZzogbm9uLXplcm8gaWYgdGhlIHBhZ2UgaXMgYXBwZW5k
ZWQKPiAgICAqCj4gICAgKiBUaGlzIGlzIGEgaGVscGVyIGZ1bmN0aW9uIGZvciBhIHBhZ2Ugd3Jp
dGUgb3BlcmF0aW9uLiBJdCB1bmxvY2tzIHRoZQo+ICAgICogQHVpLT51aV9tdXRleCBpbiBjYXNl
IG9mIGFwcGVuZGluZy4KPiAgICAqLwo+IC1zdGF0aWMgdm9pZCBjYW5jZWxfYnVkZ2V0KHN0cnVj
dCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKPiArc3RhdGljIHZvaWQgY2FuY2Vs
X2J1ZGdldChzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IGZvbGlvICpmb2xpbywKPiAgIAkJ
CSAgc3RydWN0IHViaWZzX2lub2RlICp1aSwgaW50IGFwcGVuZGluZykKPiAgIHsKPiAgIAlpZiAo
YXBwZW5kaW5nKSB7Cj4gQEAgLTUxNiw4ICs1MTYsOCBAQCBzdGF0aWMgdm9pZCBjYW5jZWxfYnVk
Z2V0KHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKPiAgIAkJCXViaWZz
X3JlbGVhc2VfZGlydHlfaW5vZGVfYnVkZ2V0KGMsIHVpKTsKPiAgIAkJbXV0ZXhfdW5sb2NrKCZ1
aS0+dWlfbXV0ZXgpOwo+ICAgCX0KPiAtCWlmICghUGFnZVByaXZhdGUocGFnZSkpIHsKPiAtCQlp
ZiAoUGFnZUNoZWNrZWQocGFnZSkpCj4gKwlpZiAoIWZvbGlvLT5wcml2YXRlKSB7Cj4gKwkJaWYg
KGZvbGlvX3Rlc3RfY2hlY2tlZChmb2xpbykpCj4gICAJCQlyZWxlYXNlX25ld19wYWdlX2J1ZGdl
dChjKTsKPiAgIAkJZWxzZQo+ICAgCQkJcmVsZWFzZV9leGlzdGluZ19wYWdlX2J1ZGdldChjKTsK
PiBAQCAtNTUwLDcgKzU1MCw3IEBAIHN0YXRpYyBpbnQgdWJpZnNfd3JpdGVfZW5kKHN0cnVjdCBm
aWxlICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIAkJICovCj4gICAJ
CWRiZ19nZW4oImNvcGllZCAlZCBpbnN0ZWFkIG9mICVkLCByZWFkIHBhZ2UgYW5kIHJlcGVhdCIs
Cj4gICAJCQljb3BpZWQsIGxlbik7Cj4gLQkJY2FuY2VsX2J1ZGdldChjLCAmZm9saW8tPnBhZ2Us
IHVpLCBhcHBlbmRpbmcpOwo+ICsJCWNhbmNlbF9idWRnZXQoYywgZm9saW8sIHVpLCBhcHBlbmRp
bmcpOwo+ICAgCQlmb2xpb19jbGVhcl9jaGVja2VkKGZvbGlvKTsKPiAgIAo+ICAgCQkvKgo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
