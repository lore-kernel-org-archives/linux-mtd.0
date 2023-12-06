Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7BEC4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 07:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQXPaQC0ypCf+/xd9GkgHxIBv9pq7OQGAi1H28+gMU0=; b=qTKUo9wOD52rurK6ngoPt72AgT
	Pqroz2Ci6P7qkwaN3M+s7NbJ2/mg9LSGIfzXLHFiaeVDEw55QCUpvGIbiKaScn+cxaMP2Sfpxzuzu
	mCNhMN3jl/XRvI0c4vFJrdiw4tx3bIjfw6FDMx5HMPIrHZ4kHPFL+Pbfe7xT0B7xJmodOdJXkmqUB
	MlZYeOuhHEzmCofJ17ni4P6Gj2lo57sJO9BfpWPilmSoQsHXty7wOePANDqztKPxgTgsE/7xpUW9H
	z+znAr20yMdFSwAyaDjHIo0JVFkHf19gBPEopqxCQc4tAiaDI9tHCj296za/oDa+PiIybM5TGhwF/
	E6pZJ4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmFN-009IEt-1I;
	Wed, 06 Dec 2023 07:23:05 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmFJ-009ICZ-2g
	for linux-mtd@lists.infradead.org;
	Wed, 06 Dec 2023 07:23:04 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4SlTJK4zBTz14Lmf;
	Wed,  6 Dec 2023 15:17:53 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:22:51 +0800
Subject: Re: [PATCH] ubifs: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>, <linux-fsdevel@vger.kernel.org>
CC: kernel test robot <lkp@intel.com>, Richard Weinberger <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
References: <20231206024850.31425-1-rdunlap@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4e69f73a-3327-681c-ea16-ca1297769f24@huawei.com>
Date: Wed, 6 Dec 2023 15:22:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231206024850.31425-1-rdunlap@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_232302_082325_378FBD68 
X-CRM114-Status: UNSURE (   9.50  )
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

1NogMjAyMy8xMi82IDEwOjQ4LCBSYW5keSBEdW5sYXAg0LS1wDoKPiBGaXgga2VybmVsLWRvYyB3
YXJuaW5ncyBmb3VuZCB3aGVuIHVzaW5nICJXPTEiLgo+Cj4gZmlsZS5jOjEzODU6IHdhcm5pbmc6
IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3RpbWUnIGRlc2NyaXB0aW9uIGluICd1Ymlmc191
cGRhdGVfdGltZScKPiBhbmQgOSB3YXJuaW5ncyBsaWtlIHRoaXMgb25lOgo+IGZpbGUuYzozMjY6
IHdhcm5pbmc6IE5vIGRlc2NyaXB0aW9uIGZvdW5kIGZvciByZXR1cm4gdmFsdWUgb2YgJ2FsbG9j
YXRlX2J1ZGdldCcKPgo+IGF1dGguYzozMDogd2FybmluZzogZXhwZWN0aW5nIHByb3RvdHlwZSBm
b3IgdWJpZnNfbm9kZV9jYWxjX2hhc2goKS4gUHJvdG90eXBlIHdhcyBmb3IgX191Ymlmc19ub2Rl
X2NhbGNfaGFzaCgpIGluc3RlYWQKPiBhbmQgMTEgd2FybmluZ3MgbGlrZSB0aGlzIG9uZToKPiBh
dXRoLmM6MzA6IHdhcm5pbmc6IE5vIGRlc2NyaXB0aW9uIGZvdW5kIGZvciByZXR1cm4gdmFsdWUg
b2YgJ19fdWJpZnNfbm9kZV9jYWxjX2hhc2gnCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1
aWxkLWFsbC8yMDIzMTIwMzA0MTcuNjZjNVB3SGotbGtwQGludGVsLmNvbS8KPiBDYzogUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiAtLS0KPiBUaGlzIGRvZXMgbm90IENsb3NlOiB0aGUgcmVwb3J0IGtlcm5lbCBy
b2JvdCByZXBvcnQgc2luY2UgdGhlcmUgaXMKPiBhbHNvIGEgbWlzc2luZy1wcm90b3R5cGUgd2Fy
bmluZyBpbiBpdC4KPgo+ICAgZnMvdWJpZnMvYXV0aC5jIHwgICAyOCArKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tCj4gICBmcy91Ymlmcy9maWxlLmMgfCAgIDMwICsrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAyMSBk
ZWxldGlvbnMoLSkKPgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVh
d2VpLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
