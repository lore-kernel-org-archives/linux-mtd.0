Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237DBC6FD18
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Mar 2023 02:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5n3vZgF/CKOxcZryW9kEzg2+BlZgLpEL0hWnXzbX8I=; b=opbWBo7SUj2G6BD5eWykQ4U22s
	8e5wLOdWLRgtd1eIo01FZsevUj1xXM9/PTfEM8IeqS0IO31dlasubSezIzyXxkO1X15Aem8vcuWYh
	JxPsD8AvD44WjlPOKS8VqBYrrZM2Ri/Diam55bsme5jadSK5RUJfwEIBovyc11FEXy9F3uPylM7v4
	rSmxbhELkBe5MhdC0/ftWtxK4UC6FId6tRqKIgvbPVUb2N8y69bRWPWTW9zHS4xGZeQvrJMdUU/lx
	UDO7KCSzyn7GUPeV1ofITjcWgTeudSpi9vJptbGBLSF/4GoabpehbbQcj5k8gxAFHy5g14vYSjpOq
	gGPEFUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phhzX-002LVz-0T;
	Thu, 30 Mar 2023 02:26:19 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phhzR-002LTI-13
	for linux-mtd@lists.infradead.org;
	Thu, 30 Mar 2023 02:26:16 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Pn6dc6crXz17Q8s;
	Thu, 30 Mar 2023 10:22:44 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 10:26:00 +0800
Subject: Re: [PATCH] ubifs: Free memory for tmpfile name
To: =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>, Richard
 Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>
References: <20230329-memleak-fix-v1-1-7133da56ea8f@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cec30bcb-85d2-5de0-186b-6838ce94e3f7@huawei.com>
Date: Thu, 30 Mar 2023 10:25:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230329-memleak-fix-v1-1-7133da56ea8f@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_192613_550491_A88D3F98 
X-CRM114-Status: GOOD (  17.58  )
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

SGkgTcOlcnRlbiwKPiBXaGVuIG9wZW5pbmcgYSB1YmlmcyB0bXBmaWxlIG9uIGFuIGVuY3J5cHRl
ZCBkaXJlY3RvcnksIGZ1bmN0aW9uCj4gZnNjcnlwdF9zZXR1cF9maWxlbmFtZSBhbGxvY2F0ZXMg
bWVtb3J5IGZvciB0aGUgbmFtZSB0aGF0IGlzIHRvIGJlCj4gc3RvcmVkIGluIHRoZSBkaXJlY3Rv
cnkgZW50cnksIGJ1dCBhZnRlciB0aGUgbmFtZSBoYXMgYmVlbiBjb3BpZWQgdG8gdGhlCj4gZGly
ZWN0b3J5IGVudHJ5IGlub2RlLCB0aGUgbWVtb3J5IGlzIG5vdCBmcmVlZC4KPiAKPiBXaGVuIHJ1
bm5pbmcga21lbWxlYWsgb24gaXQgd2Ugc2VlIHRoYXQgaXQgaXMgcmVnaXN0ZXJlZCBhcyBhIGxl
YWsuIFRoZQo+IHJlcG9ydCBiZWxvdyBpcyB0cmlnZ2VyZWQgYnkgYSBzaW1wbGUgcHJvZ3JhbSAn
dG1wZmlsZScganVzdCBvcGVuaW5nIGEKPiB0bXBmaWxlOgo+IAo+ICAgIHVucmVmZXJlbmNlZCBv
YmplY3QgMHhmZmZmODg4MTAxNzhmMzgwIChzaXplIDMyKToKPiAgICAgIGNvbW0gInRtcGZpbGUi
LCBwaWQgNTA5LCBqaWZmaWVzIDQyOTQ5MzQ3NDQgKGFnZSAxNTI0Ljc0MnMpCj4gICAgICBiYWNr
dHJhY2U6Cj4gICAgICAgIF9fa21lbV9jYWNoZV9hbGxvY19ub2RlCj4gICAgICAgIF9fa21hbGxv
Ywo+ICAgICAgICBmc2NyeXB0X3NldHVwX2ZpbGVuYW1lCj4gICAgICAgIHViaWZzX3RtcGZpbGUK
PiAgICAgICAgdmZzX3RtcGZpbGUKPiAgICAgICAgcGF0aF9vcGVuYXQKPiAKPiBGcmVlIHRoaXMg
bWVtb3J5IGFmdGVyIGl0IGhhcyBiZWVuIGNvcGllZCB0byB0aGUgaW5vZGUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTcOlcnRlbiBMaW5kYWhsIDxtYXJ0ZW4ubGluZGFobEBheGlzLmNvbT4KPiAtLS0K
PiAgIGZzL3ViaWZzL2Rpci5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwo+IGlu
ZGV4IDBmMjljZjIwMTEzNi4uMDg5Y2E2OTEwMTI0IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2Rp
ci5jCj4gKysrIGIvZnMvdWJpZnMvZGlyLmMKPiBAQCAtNDkxLDYgKzQ5MSw3IEBAIHN0YXRpYyBp
bnQgdWJpZnNfdG1wZmlsZShzdHJ1Y3QgdXNlcl9uYW1lc3BhY2UgKm1udF91c2VybnMsIHN0cnVj
dCBpbm9kZSAqZGlyLAo+ICAgCQlnb3RvIG91dF9jYW5jZWw7Cj4gICAJdW5sb2NrXzJfaW5vZGVz
KGRpciwgaW5vZGUpOwo+ICAgCj4gKwlmc2NyeXB0X2ZyZWVfZmlsZW5hbWUoJm5tKTsKPiAgIAl1
Ymlmc19yZWxlYXNlX2J1ZGdldChjLCAmcmVxKTsKPiAgIAo+ICAgCXJldHVybiBmaW5pc2hfb3Bl
bl9zaW1wbGUoZmlsZSwgMCk7CgpMb29rcyBnb29kLCBqdXN0IG9uZSBzbWFsbCBuaXQuIEknZCBw
cmVmZXIgdG8gYWRkIApmc2NyeXB0X2ZyZWVfZmlsZW5hbWUoKSBhZnRlciB1Ymlmc19yZWxlYXNl
X2J1ZGdldCgpIGp1c3QgbGlrZSAKdWJpZnNfY3JlYXRlL2xpbmsgZG9lcywgc28gdGhhdCB1Ymlm
cyBjYW4gZ2V0IHVudXNlZCBidWRnZXQgZWFybGllci4KCkFmdGVyIGxvb2tpbmcgdGhyb3VnaCB0
aGUgY29kZSwgSSBmb3VuZCBhbm90aGVyIHBsYWNlIGNyZWF0ZV93aGl0ZW91dCAKaGFzIHRoZSBz
YW1lIHByb2JsZW0oSW1wb3J0ZWQgaW4gMjc4ZDlhMjQzNjM1ZjI2YzA1KCJ1YmlmczogUmVuYW1l
IAp3aGl0ZW91dCBhdG9taWNhbGx5IikgYnkgbWUpLiBXb3VsZCB5b3UgbWluZCBmaXhpbmcgdGhp
cyBwb2ludCBqdXN0IGJ5IApyZW1vdmluZyB1bnVzZWQgJ25tJyBpbiBjcmVhdGVfd2hpdGVvdXQo
KT8KCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IGM5YzMzOTVkNWUzZGNjNmRhZWU2NmM2OTA4MzU0
ZDQ3YmY5OGNiMGMKPiBjaGFuZ2UtaWQ6IDIwMjMwMzI5LW1lbWxlYWstZml4LTg3YTAxZGFmNDY5
ZQo+IAo+IEJlc3QgcmVnYXJkcywKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
