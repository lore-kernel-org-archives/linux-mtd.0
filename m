Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AC7CDB47E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 08:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pu97J83JWiPmzayMA/Te/LYSP6HAFxzYaPd2qn77iAU=; b=skCAux8rE//2xnl2oIpL7SbP5k
	Lv2HLsz9jl+GVdzLRmrNsjbKzvw1akCgSwX1NMXHrntn69csNkppZlnBfkOOl10rn25LFfbCnyIWV
	Fy0GmiQizIgRMV0hOOgn+VSFB30kilt2dykK9qnt7nkdPkIsTld1/TXCtkGBh3S+IjPXaLTUE882N
	tlv96kInieeurQKhjchdsg52MOqgl7HFqrcgJ+4NJ/2qjDnQaBQYL0XPHtCbC9utB3oIX0tar0XWn
	TEs4/0d035rNP2zFKbycljpNo8Rai1VGcpjr+YeOeFYG4w67nPLbD4ZDu7Y2Vbl3uIU1BGMmGXaNJ
	Ueb4ncIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlIQ-001c2b-2g;
	Fri, 20 Oct 2023 08:55:54 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlIO-001c0w-0H
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 08:55:54 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SBdcf55l2zVlfv;
	Fri, 20 Oct 2023 16:52:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 20 Oct 2023 16:55:45 +0800
Subject: Re: [PATCH v3 1/5] ubi: Use the fault injection framework to enhance
 the fault injection capability
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231020064803.643399-1-wangzhaolong1@huawei.com>
 <20231020064803.643399-2-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e6e151fc-3515-8b21-e7b0-cc3d9148a696@huawei.com>
Date: Fri, 20 Oct 2023 16:55:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231020064803.643399-2-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_015552_340541_C1989A40 
X-CRM114-Status: UNSURE (   9.06  )
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

1NogMjAyMy8xMC8yMCAxNDo0NywgWmhhb0xvbmcgV2FuZyDQtLXAOgo+IFRvIG1ha2UgZGVidWcg
cGFyYW1ldGVycyBjb25maWd1cmFibGUgYXQgcnVuIHRpbWUsIHVzZSB0aGUKPiBmYXVsdCBpbmpl
Y3Rpb24gZnJhbWV3b3JrIHRvIHJlY29uc3RydWN0IHRoZSBkZWJ1Z2ZzIGludGVyZmFjZSwKPiBh
bmQgcmV0YWluIHRoZSBsZWdhY3kgZmF1bHQgaW5qZWN0aW9uIGludGVyZmFjZS4KPiAKPiBOb3cs
IHRoZSBmaWxlIGVtdWxhdGVfZmFpbHVyZXMgYW5kIGZhdWx0X2F0dHIgZmlsZXMgY29udHJvbCB3
aGV0aGVyCj4gdG8gZW5hYmxlIGZhdWx0IGVtbXVsYXRpb24uCj4gCj4gVGhlIGZpbGUgZW11bGF0
ZV9mYWlsdXJlcyByZWNlaXZlcyBhIG1hc2sgdGhhdCBjb250cm9scyB0eXBlIGFuZAo+IHByb2Nl
c3Mgb2YgZmF1bHQgaW5qZWN0aW9uLiBHZW5lcmFsbHksIGZvciBlYXNlIG9mIHVzZSwgeW91IGNh
bgo+IGRpcmVjdGx5IGVudGVyIGEgbWFzayB3aXRoIGFsbCAxcy4KPiAKPiBlY2hvIDB4ZmZmZiA+
IC9zeXMva2VybmVsL2RlYnVnL3ViaS91YmkwL2VtdWxhdGVfZmFpbHVyZXMKPiAKPiBBbmQgeW91
IG5lZWQgdG8gY29uZmlndXJlIG90aGVyIGZhdWx0LWluamVjdGlvbiBjYXBhYmlsaXRpZXMgZm9y
Cj4gdGVzdGluZyBwdXJwb3NlOgo+IAo+IGVjaG8gMTAwID4gL3N5cy9rZXJuZWwvZGVidWcvdWJp
L2ZhdWx0X2luamVjdC9lbXVsYXRlX3Bvd2VyX2N1dC9wcm9iYWJpbGl0eQo+IGVjaG8gMTUgPiAv
c3lzL2tlcm5lbC9kZWJ1Zy91YmkvZmF1bHRfaW5qZWN0L2VtdWxhdGVfcG93ZXJfY3V0L3NwYWNl
Cj4gZWNobyAyID4gL3N5cy9rZXJuZWwvZGVidWcvdWJpL2ZhdWx0X2luamVjdC9lbXVsYXRlX3Bv
d2VyX2N1dC92ZXJib3NlCj4gZWNobyAtMSA+IC9zeXMva2VybmVsL2RlYnVnL3ViaS9mYXVsdF9p
bmplY3QvZW11bGF0ZV9wb3dlcl9jdXQvdGltZXMKPiAKPiBUaGUgQ09ORklHX01URF9VQklfRkFV
TFRfSU5KRUNUSU9OIHRvIGVuYWJsZSB0aGUgRmF1bHQgSW5qZWN0aW9uIGlzCj4gYWRkZWQgdG8g
a2NvbmZpZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGFvTG9uZyBXYW5nIDx3YW5nemhhb2xvbmcx
QGh1YXdlaS5jb20+CgoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1
YXdlaS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
