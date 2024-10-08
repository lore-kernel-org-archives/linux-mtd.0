Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E600CED27A
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thl4pJ4iDyU13rWDspkTfVrXB6ylss4UCZL9rmnJZ+I=; b=1MDxR7YGfYgDPwmzMELFYuUzZX
	A+b1R3F7BvPW7dNFgccefXXu9E+qRrbL/uX8Dqyk/PwDMJatm46FtbmX7rQLJPYJPF2IJ3/WgTZZd
	YRzxH2PruHMOSGRz5tWKKmjYDAfB/5zAji2E/zQmO/iFkDALYh0awV7nwJKXCTMiZrREBsMinLwkt
	TpYIFtH7GipnqzyVtcEq1wmoBb6mlbc0kOdY35AxiDS5MbYg7hi8xfeL4r70c0EOCXTlyLqvz2kDT
	Y73D/BlcARO0ZiUQlgBt677zcRr1F25qFdRU+khDFyc7SGkQGWHwnhHPj/czHN3qkh7yjoEadeOI0
	+h3/J9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5bH-000000052bY-2Q8E;
	Tue, 08 Oct 2024 08:29:47 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5QA-00000004zIb-1KpM
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 08:18:20 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XN84z68wWz2Dcwg;
	Tue,  8 Oct 2024 16:17:07 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id AF25A14013B;
	Tue,  8 Oct 2024 16:18:11 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 16:18:10 +0800
Subject: Re: [PATCH 28/35] UBI: Reorganize kerneldoc parameter names
To: Julia Lawall <Julia.Lawall@inria.fr>, Richard Weinberger <richard@nod.at>
CC: <kernel-janitors@vger.kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-29-Julia.Lawall@inria.fr>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <372fa7f2-908d-194c-e773-37ea0951238a@huawei.com>
Date: Tue, 8 Oct 2024 16:18:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240930112121.95324-29-Julia.Lawall@inria.fr>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_011818_653475_77C480B2 
X-CRM114-Status: GOOD (  13.59  )
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

1NogMjAyNC85LzMwIDE5OjIxLCBKdWxpYSBMYXdhbGwg0LS1wDoKPiBSZW9yZ2FuaXplIGtlcm5l
bGRvYyBwYXJhbWV0ZXIgbmFtZXMgdG8gbWF0Y2ggdGhlIHBhcmFtZXRlcgo+IG9yZGVyIGluIHRo
ZSBmdW5jdGlvbiBoZWFkZXIuCj4gCj4gUHJvYmxlbXMgaWRlbnRpZmllZCB1c2luZyBDb2NjaW5l
bGxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGlhIExhd2FsbCA8SnVsaWEuTGF3YWxsQGlucmlh
LmZyPgo+IAo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2ViYS5jIHwgICAgMiArLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpSZXZpZXdlZC1ieTog
WmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvdWJpL2ViYS5jIGIvZHJpdmVycy9tdGQvdWJpL2ViYS5jCj4gaW5kZXggYzdi
YTdhMTVjOWY3Li5lZmNlNWJmNDFlZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2Vi
YS5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2ViYS5jCj4gQEAgLTczMSw4ICs3MzEsOCBAQCBp
bnQgdWJpX2ViYV9yZWFkX2xlYihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1Y3QgdWJpX3Zv
bHVtZSAqdm9sLCBpbnQgbG51bSwKPiAgICAqIHViaV9lYmFfcmVhZF9sZWJfc2cgLSByZWFkIGRh
dGEgaW50byBhIHNjYXR0ZXIgZ2F0aGVyIGxpc3QuCj4gICAgKiBAdWJpOiBVQkkgZGV2aWNlIGRl
c2NyaXB0aW9uIG9iamVjdAo+ICAgICogQHZvbDogdm9sdW1lIGRlc2NyaXB0aW9uIG9iamVjdAo+
IC0gKiBAbG51bTogbG9naWNhbCBlcmFzZWJsb2NrIG51bWJlcgo+ICAgICogQHNnbDogVUJJIHNj
YXR0ZXIgZ2F0aGVyIGxpc3QgdG8gc3RvcmUgdGhlIHJlYWQgZGF0YQo+ICsgKiBAbG51bTogbG9n
aWNhbCBlcmFzZWJsb2NrIG51bWJlcgo+ICAgICogQG9mZnNldDogb2Zmc2V0IGZyb20gd2hlcmUg
dG8gcmVhZAo+ICAgICogQGxlbjogaG93IG1hbnkgYnl0ZXMgdG8gcmVhZAo+ICAgICogQGNoZWNr
OiBkYXRhIENSQyBjaGVjayBmbGFnCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
