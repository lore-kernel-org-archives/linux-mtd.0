Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D21CC5B543
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Jun 2025 04:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URAxIxajcQAiOASdrJGol2j7gzSNizrxKHKNb625HyU=; b=CMuvKPgSqa2CxTn7Nzuq7uadjC
	GsMAEjdBmGEeSAqyXxo/o0nGGWyg/z/PjaTagPJatjBIZOwJLzmaZIpSSHRHBlF/pLDOZw90d/Cso
	h6T1fAQIe1GHGEpmhQvbG0XJOetXOIU5TRt6ehBq8o7ld2EONlOAoVAmZuiV2+HhP8MHFlI4v584Q
	xF5GS8Mf74Y09itNymWO7oGpqnQR8jUeyTwibf1hilWgQLTemBc67JsOa81xDDtfxsZzwlxZcO4t8
	ES+KRUr24yvl+TIXfgEelv1txv4tJ9tEl5+zmZOP1qFE+BVOJruXfODVTahWyrwvBYVpzCqYJVMRD
	YE1wLEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfwO-0000000CZl0-1gMU;
	Wed, 04 Jun 2025 04:41:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfc3-0000000CXy5-3vt0
	for linux-mtd@lists.infradead.org;
	Wed, 04 Jun 2025 04:20:29 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bBvTF6ksdz13Kfb;
	Wed,  4 Jun 2025 12:18:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 1124F180238;
	Wed,  4 Jun 2025 12:20:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Jun 2025 12:20:18 +0800
Subject: Re: [PATCH v1] jffs2: fix comment typo and adjust formatting
To: Baolin Liu <liubaolin12138@163.com>, <dwmw2@infradead.org>,
	<richard@nod.at>
CC: <liubaolin@kylinos.cn>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250604022056.111032-1-liubaolin12138@163.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1d247663-9b37-1bff-d18c-7f6866e5f041@huawei.com>
Date: Wed, 4 Jun 2025 12:20:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250604022056.111032-1-liubaolin12138@163.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_212028_149473_AE8C69D8 
X-CRM114-Status: GOOD (  16.75  )
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

1NogMjAyNS82LzQgMTA6MjAsIEJhb2xpbiBMaXUg0LS1wDoKPiBGcm9tOiBCYW9saW4gTGl1IDxs
aXViYW9saW5Aa3lsaW5vcy5jbj4KPiAKPiBUaGlzIGNvbW1pdCBtYWtlcyB0d28gZG9jdW1lbnRh
dGlvbiBpbXByb3ZlbWVudHM6Cj4gMS4gRml4ZXMgc3BlbGxpbmcgb2YgImNvcmVzcG9uZGluZyIg
dG8gImNvcnJlc3BvbmRpbmciCj4gMi4gQWRqdXN0cyBjb21tZW50IGZvcm1hdHRpbmcgdG8gbWVl
dCBrZXJuZWwgc3R5bGUgZ3VpZGVsaW5lcyBieToKPiAgICAgLSBCcmVha2luZyBsb25nIGxpbmVz
IHRvIGZpdCA4MC1jb2x1bW4gbGltaXQKPiAgICAgLSBBbGlnbmluZyBhc3Rlcmlza3MgaW4gbXVs
dGktbGluZSBjb21tZW50cwo+ICAgICAtIEltcHJvdmluZyByZWFkYWJpbGl0eSB3aGlsZSBwcmVz
ZXJ2aW5nIG9yaWdpbmFsIG1lYW5pbmcKPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQmFvbGluIExpdSA8bGl1YmFvbGluQGt5bGlub3MuY24+Cj4gLS0tCj4g
ICBmcy9qZmZzMi9idWlsZC5jIHwgNiArKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZnMvamZmczIvYnVpbGQuYyBi
L2ZzL2pmZnMyL2J1aWxkLmMKPiBpbmRleCA2YWU5ZDZmZWZiODYuLjFlNjUxZDNkY2VmMyAxMDA2
NDQKPiAtLS0gYS9mcy9qZmZzMi9idWlsZC5jCj4gKysrIGIvZnMvamZmczIvYnVpbGQuYwo+IEBA
IC0xODUsOCArMTg1LDEwIEBAIHN0YXRpYyBpbnQgamZmczJfYnVpbGRfZmlsZXN5c3RlbShzdHJ1
Y3QgamZmczJfc2JfaW5mbyAqYykKPiAgIAkJCSAqIG9uZS4gKi8KPiAgIAkJCWlmIChmZC0+dHlw
ZSA9PSBEVF9ESVIpIHsKPiAgIAkJCQlpZiAoIWZkLT5pYykgewo+IC0JCQkJCS8qIFdlJ2xsIGhh
dmUgY29tcGxhaW5lZCBhYm91dCBpdCBhbmQgbWFya2VkIHRoZSBjb3Jlc3BvbmRpbmcKPiAtCQkJ
CQkgICByYXcgbm9kZSBvYnNvbGV0ZSBhbHJlYWR5LiBKdXN0IHNraXAgaXQuICovCj4gKwkJCQkJ
LyogV2UnbGwgaGF2ZSBjb21wbGFpbmVkIGFib3V0IGl0Cj4gKwkJCQkJICogYW5kIG1hcmtlZCB0
aGUgY29ycmVzcG9uZGluZyByYXcgbm9kZSBvYnNvbGV0ZSBhbHJlYWR5Lgo+ICsJCQkJCSAqIEp1
c3Qgc2tpcCBpdC4KPiArCQkJCQkgKi8KPiAgIAkJCQkJY29udGludWU7Cj4gICAJCQkJfQo+ICAg
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
