Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B617DC54E58
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 01:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPAs860nVm1h+qmiXodEajyCpIzSNUQ8pQlZp3WcWcg=; b=dvHEoiS/zz69MnQhtbjMlbN25G
	GH52gbufP/DlxGGkEt04IYtvMyFkBiJHA/t/jBjPf5JxzQ1yAT1W/9W1szqQJVwJTckXi9FqAOcRy
	vmXfUd64uo1hmn/JW7fSwL+VHI68bgQnkyUpGZ054SpbMk8R7XxuVZT4GavCcBcG6oYYSWjtamzER
	ovC8Xynway3L4tt37rqToJ1VCMaeBiQitxMtQkAAiq87MEm5L3q5E5IVvUAGjCiPSuISIti1877gS
	YshiaPbOT7/YRgVZAaTZYDweaQHViU0xjyYDjm4b4bkdu5Ja1XbKQ+Urntnvr0Bdgt89JTdbPrTVH
	N8HNLccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmOO6-0000000AoJO-42Lc;
	Tue, 19 Mar 2024 01:35:34 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmONx-0000000AoFi-31Ca
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 01:35:29 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TzDkC3xRJz1Q9nH;
	Tue, 19 Mar 2024 09:32:51 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id C14991400F4;
	Tue, 19 Mar 2024 09:35:05 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 09:35:04 +0800
Subject: Re: [linux-next:master] BUILD REGRESSION
 2e93f143ca010a5013528e1cfdc895f024fe8c21
To: kernel test robot <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>,
	<amd-gfx@lists.freedesktop.org>, <bpf@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<netdev@vger.kernel.org>
References: <202403182219.XrvfZx4s-lkp@intel.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e7ca3f69-7052-616b-68db-f29a66b42edc@huawei.com>
Date: Tue, 19 Mar 2024 09:35:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <202403182219.XrvfZx4s-lkp@intel.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_183526_151148_1DC760AF 
X-CRM114-Status: UNSURE (   6.17  )
X-CRM114-Notice: Please train this message.
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

1NogMjAyNC8zLzE4IDIyOjMzLCBrZXJuZWwgdGVzdCByb2JvdCDQtLXAOgo+IHRyZWUvYnJhbmNo
OiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xp
bnV4LW5leHQuZ2l0IG1hc3Rlcgo+IGJyYW5jaCBIRUFEOiAyZTkzZjE0M2NhMDEwYTUwMTM1Mjhl
MWNmZGM4OTVmMDI0ZmU4YzIxICBBZGQgbGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAy
NDAzMTgKPiAKPiBFcnJvci9XYXJuaW5nIGlkcyBncm91cGVkIGJ5IGtjb25maWdzOgo+IAo+IGdj
Y19yZWNlbnRfZXJyb3JzCj4gfC0tIGFyYy1hbGxtb2Rjb25maWcKPiB8ICAgYC0tIGZzLXViaWZz
LWpvdXJuYWwuYzp3YXJuaW5nOmV4cGVjdGluZy1wcm90b3R5cGUtZm9yLXdha2VfdXBfcmVzZXJ2
YXRpb24oKS4tUHJvdG90eXBlLXdhcy1mb3ItYWRkX29yX3N0YXJ0X3F1ZXVlKCktaW5zdGVhZAo+
IHwtLSBhcmMtYWxseWVzY29uZmlnCj4gfCAgIGAtLSBmcy11Ymlmcy1qb3VybmFsLmM6d2Fybmlu
ZzpleHBlY3RpbmctcHJvdG90eXBlLWZvci13YWtlX3VwX3Jlc2VydmF0aW9uKCkuLVByb3RvdHlw
ZS13YXMtZm9yLWFkZF9vcl9zdGFydF9xdWV1ZSgpLWluc3RlYWQKPiB8LS0gYXJtLWFsbG1vZGNv
bmZpZwo+IHwgICB8LS0gYXJjaC1hcm0tbWFjaC1vbWFwMi1wcm0zM3h4LmM6d2FybmluZzpleHBl
Y3RpbmctcHJvdG90eXBlLWZvci1hbTMzeHhfcHJtX2dsb2JhbF93YXJtX3N3X3Jlc2V0KCkuLVBy
b3RvdHlwZS13YXMtZm9yLWFtMzN4eF9wcm1fZ2xvYmFsX3N3X3Jlc2V0KCktaW5zdGVhZAo+IHwg
ICB8LS0gZHJpdmVycy1ncHUtZHJtLWFtZC1hbWRncHUtYW1kZ3B1X3Zjbi5jOndhcm5pbmc6LmJp
bi1kaXJlY3RpdmUtb3V0cHV0LW1heS1iZS10cnVuY2F0ZWQtd3JpdGluZy1ieXRlcy1pbnRvLWEt
cmVnaW9uLW9mLXNpemUtYmV0d2Vlbi1hbmQKPiB8ICAgYC0tIGZzLXViaWZzLWpvdXJuYWwuYzp3
YXJuaW5nOmV4cGVjdGluZy1wcm90b3R5cGUtZm9yLXdha2VfdXBfcmVzZXJ2YXRpb24oKS4tUHJv
dG90eXBlLXdhcy1mb3ItYWRkX29yX3N0YXJ0X3F1ZXVlKCktaW5zdGVhZAo+IHwtLSBhcm0tYWxs
eWVzY29uZmlnCj4gfCAgIHwtLSBhcmNoLWFybS1tYWNoLW9tYXAyLXBybTMzeHguYzp3YXJuaW5n
OmV4cGVjdGluZy1wcm90b3R5cGUtZm9yLWFtMzN4eF9wcm1fZ2xvYmFsX3dhcm1fc3dfcmVzZXQo
KS4tUHJvdG90eXBlLXdhcy1mb3ItYW0zM3h4X3BybV9nbG9iYWxfc3dfcmVzZXQoKS1pbnN0ZWFk
Cj4gfCAgIHwtLSBkcml2ZXJzLWdwdS1kcm0tYW1kLWFtZGdwdS1hbWRncHVfdmNuLmM6d2Fybmlu
ZzouYmluLWRpcmVjdGl2ZS1vdXRwdXQtbWF5LWJlLXRydW5jYXRlZC13cml0aW5nLWJ5dGVzLWlu
dG8tYS1yZWdpb24tb2Ytc2l6ZS1iZXR3ZWVuLWFuZAo+IHwgICBgLS0gZnMtdWJpZnMtam91cm5h
bC5jOndhcm5pbmc6ZXhwZWN0aW5nLXByb3RvdHlwZS1mb3Itd2FrZV91cF9yZXNlcnZhdGlvbigp
Li1Qcm90b3R5cGUtd2FzLWZvci1hZGRfb3Jfc3RhcnRfcXVldWUoKS1pbnN0ZWFkCj4gfC0tIGFy
bTY0LWRlZmNvbmZpZwo+IHwgICBgLS0gZnMtdWJpZnMtam91cm5hbC5jOndhcm5pbmc6ZXhwZWN0
aW5nLXByb3RvdHlwZS1mb3Itd2FrZV91cF9yZXNlcnZhdGlvbigpLi1Qcm90b3R5cGUtd2FzLWZv
ci1hZGRfb3Jfc3RhcnRfcXVldWUoKS1pbnN0ZWFkCj4gfC0tIGNza3ktYWxsbW9kY29uZmlnCj4g
fCAgIHwtLSBkcml2ZXJzLWdwdS1kcm0tYW1kLWFtZGdwdS1hbWRncHVfdmNuLmM6d2FybmluZzou
YmluLWRpcmVjdGl2ZS1vdXRwdXQtbWF5LWJlLXRydW5jYXRlZC13cml0aW5nLWJ5dGVzLWludG8t
YS1yZWdpb24tb2Ytc2l6ZS1iZXR3ZWVuLWFuZAo+IHwgICBgLS0gZnMtdWJpZnMtam91cm5hbC5j
Ondhcm5pbmc6ZXhwZWN0aW5nLXByb3RvdHlwZS1mb3Itd2FrZV91cF9yZXNlcnZhdGlvbigpLi1Q
cm90b3R5cGUtd2FzLWZvci1hZGRfb3Jfc3RhcnRfcXVldWUoKS1pbnN0ZWFkCj4gfC0tIGNza3kt
YWxseWVzY29uZmlnCj4gfCAgIHwtLSBkcml2ZXJzLWdwdS1kcm0tYW1kLWFtZGdwdS1hbWRncHVf
dmNuLmM6d2FybmluZzouYmluLWRpcmVjdGl2ZS1vdXRwdXQtbWF5LWJlLXRydW5jYXRlZC13cml0
aW5nLWJ5dGVzLWludG8tYS1yZWdpb24tb2Ytc2l6ZS1iZXR3ZWVuLWFuZAo+IHwgICBgLS0gZnMt
dWJpZnMtam91cm5hbC5jOndhcm5pbmc6ZXhwZWN0aW5nLXByb3RvdHlwZS1mb3Itd2FrZV91cF9y
ZXNlcnZhdGlvbigpLi1Qcm90b3R5cGUtd2FzLWZvci1hZGRfb3Jfc3RhcnRfcXVldWUoKS1pbnN0
ZWFkCgpIaSwgUmljaGFyZCwKSSBzZW50IG91dCB0aGUgd2FybmluZyBmaXggcGF0Y2ggaW4gCmh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvcGF0Y2gvMjAyNDAy
MjcwMjQyMDQuMTA4MDczOS0xLWNoZW5nemhpaGFvMUBodWF3ZWkuY29tLwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
