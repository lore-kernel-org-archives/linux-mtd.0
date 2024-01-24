Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D659CC48260
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSUyRSobwNPhbagOo++XfRvHOAd0CoTKP96Y4XAU8p4=; b=uM06DtHW0wx1/tREB/G0tSQqZU
	6h1WYnzzVPRA0NRs8hTLjJvquHMMq3K+UYs6wg9lV26grogLRuK4BrgV5YZGMHPZyQgUQ7tckR6uu
	SUTO2ZBJB9bkOAM+vw9/yvwxlc1JB+jo9MyfICyNKh24OSQ+5fGzxY7K5RO6kSTtRreLSvHgk8ALI
	0iyiDNajVTN5xIHl4EajXV/r5oqeICQYyN+MaIsfsUbBUB4TGIurQCEXIa6bnXnmnGBpKDC076Mjc
	fiCIsG+nklYR16OReEFDj2A38Mnfa7i04QOKb6iRfwp969LE2COk/V6nbfQz4eKdv1DVnF+3EBvDK
	UVhmls6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rScd3-003Ibj-0B;
	Wed, 24 Jan 2024 12:45:17 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSccy-003IYC-0q
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 12:45:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TKkDL1Rz5z1xmWl;
	Wed, 24 Jan 2024 20:44:18 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id B386B140414;
	Wed, 24 Jan 2024 20:45:10 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 20:45:10 +0800
Subject: Re: [PATCH] MAINTAINERS: Add Zhihao Cheng as UBI/UBIFS reviewer
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>
References: <20240124092246.9616-1-richard@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7e25b80c-99a9-cbde-7744-7fc264e6eb1c@huawei.com>
Date: Wed, 24 Jan 2024 20:45:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240124092246.9616-1-richard@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_044512_482716_F220AA87 
X-CRM114-Status: GOOD (  13.02  )
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

1NogMjAyNC8xLzI0IDE3OjIyLCBSaWNoYXJkIFdlaW5iZXJnZXIg0LS1wDoKPiBSZWNvZ25pemlu
ZyBaaGloYW8gQ2hlbmcncyB2YWx1YWJsZSBjb250cmlidXRpb25zLAo+IGxldCdzIG9mZmljaWFs
bHkgYXBwb2ludCBoaW0gYXMgYSBVQkkvVUJJRlMgcmV2aWV3ZXIuCj4gSGlzIGRlbW9uc3RyYXRl
ZCBleHBlcnRpc2UgYW5kIGFzc2lzdGFuY2UgbWFrZSBoaW0gYSB2YWx1YWJsZQo+IGFkZGl0aW9u
IHRvIHRoZSBNVEQgY29tbXVuaXR5Lgo+IAo+IENjOiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFv
MUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFy
ZEBub2QuYXQ+Cj4gLS0tCj4gWmhpaGFvIENoZW5nLAo+IAo+IFBsZWFzZSBhY2sgdGhpcyBwYXRj
aCBpZiB5b3UncmUgZmluZSB3aXRoIHRoaXMgY2hhbmdlLgoKVGhhbmtzIGEgbG90IGZvciB0aGUg
YXBwcm92YWwgZnJvbSBSaWNoYXJkLCBpdCdzIG15IGhvbm9yIHRvIHRha2Ugb24gCnRoaXMgcmVz
cG9uc2liaWxpdHkuCgpBY2tlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4KCj4gCj4gVGhhbmtzLAo+IC8vcmljaGFyZAo+IC0tLQo+ICAgTUFJTlRBSU5FUlMgfCAy
ICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCA4ZDEwNTJmYTZhNjkuLmZjOTljYzM4
MTI2OCAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAg
LTIyNDUzLDYgKzIyNDUzLDcgQEAgRjoJaW5jbHVkZS91YXBpL21pc2MvdWFjY2UvCj4gICAKPiAg
IFVCSSBGSUxFIFNZU1RFTSAoVUJJRlMpCj4gICBNOglSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hh
cmRAbm9kLmF0Pgo+ICtSOglaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+
ICAgTDoJbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAgIFM6CVN1cHBvcnRlZAo+ICAg
VzoJaHR0cDovL3d3dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy9kb2MvdWJpZnMuaHRtbAo+IEBA
IC0yMjU4MSw2ICsyMjU4Miw3IEBAIEY6CWRyaXZlcnMvdWZzL2hvc3QvdWZzLXJlbmVzYXMuYwo+
ICAgCj4gICBVTlNPUlRFRCBCTE9DSyBJTUFHRVMgKFVCSSkKPiAgIE06CVJpY2hhcmQgV2VpbmJl
cmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gK1I6CVpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1
YXdlaS5jb20+Cj4gICBMOglsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ICAgUzoJU3Vw
cG9ydGVkCj4gICBXOglodHRwOi8vd3d3LmxpbnV4LW10ZC5pbmZyYWRlYWQub3JnLwo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
