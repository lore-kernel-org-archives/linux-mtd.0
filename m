Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006C4C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Mar 2022 03:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VH7obfoQkoX6if401AKQWfbv/vs4NfRjhQe6bVEICuU=; b=ZwnBCQl8woGg+iRVQz+CCve8D3
	ZuLP7cJnNU4g3UgJ9p8tQETvOX3IgFMOqWoNB0XYvYhXBKHUwH66L6bJ0C+RN/59scVGLvTePdaH+
	YyxhILIoHtgzDolp/16PUPGXIwbJupzwy8NCt0iRq3EImrNvDbMi5uYdwQf77VfRLn+Kc6hFX9IAH
	TsXbb13zdDwrlOkPtAE8TmuGlF/do6L6CPisQVbW4D52tP63gafYJyiSJPVJzbetkee3RgO8lTSFs
	f6dA0q7DF//npJMqCWDMa6/KZq+gt6pZ7nJnVG9Ebpf7uVixYixOHpPc6lhaZowEruHK+NpDB3gFw
	eI+phnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVPYh-0039I2-W0; Sat, 19 Mar 2022 03:15:16 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVPYe-0039HH-55
 for linux-mtd@lists.infradead.org; Sat, 19 Mar 2022 03:15:14 +0000
Received: from kwepemi100005.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KL5bS4839zcZxh
 for <linux-mtd@lists.infradead.org>; Sat, 19 Mar 2022 11:15:00 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100005.china.huawei.com (7.221.188.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 11:15:03 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 11:15:03 +0800
Subject: Re: [PATCH] UBI: support EOF block marking end of ubinized image
To: <linux-mtd@lists.infradead.org>
References: <20220318155304.14916-1-zajec5@gmail.com>
 <085c994f-1362-8757-0432-fd612a38430c@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c47d1b8d-772f-aed2-8b82-ee5385c96dd7@huawei.com>
Date: Sat, 19 Mar 2022 11:15:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <085c994f-1362-8757-0432-fd612a38430c@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_201512_406195_0CC3B494 
X-CRM114-Status: GOOD (  12.61  )
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

SGksIFJhZmHFggo+IFdoaWxlIEkgcGVyc29uYWxseSB0aGluayB0aGF0IFVCSSBzaG91bGQgcHJv
dmlkZSAqYW55KiBzb2x1dGlvbiBmb3Igc3VjaAo+IHBvb3IgYm9vdGxvYWRlcnMgaXQgaGFzIGJl
ZW4gc3RhdGVkIHVwc3RyZWFtIHdvbid0IGFjY2VwdCB0aGlzIGhhY2suCj4gVGhlcmUgaXMgbm8g
aWRlYSBmb3IgYW55IG90aGVyIC8gY2xlYW5lciBzb2x1dGlvbiBuZWl0aGVyLgo+IAo+IEZvciBk
ZXRhaWxzIHNlZSBlLW1haWwgdGhyZWFkOgo+IEhhbmRsaW5nIHViaW5pemVkIGltYWdlIGZsYXNo
ZWQgb24gbm90IGVyYXNlZCBmbGFzaCBzcGFjZQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L3BpcGVybWFpbC9saW51eC1tdGQvMjAyMi1NYXJjaC8wOTE5OTMuaHRtbAo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAyMi1NYXJjaC8wOTIwODEuaHRt
bAo+IAo+IFRoaXMgcGF0Y2ggaXMgbWVhbnQgZm9yIGRvd25zdHJlYW0gdXNhZ2UgaW4gcHJvamVj
dHMgbGlrZSBPcGVuV3J0IC8KPiBCdWlsZHJvb3QgLyBZb2N0byAvIGZvby4KRG9lcyAnZG93bnN0
cmVhbScgbWVhbiB0aGlzIHBhdGNoIHdvbid0IGJlIGFwcGxpZWQgdG8gbWFpbmxpbmU/IApFdmVu
dGhvdWdoLCBJIGRvbid0IHRoaW5rIHRoaXMgbW9kaWZpY2F0aW9uIGlzIHN1dGlhYmxlIGZvciBj
b21tb24gCnNjZW5hcmlvcy4gVGhlIFVCSSBpbWFnZSBwcm92aWRlZCBieSBwb29yIGJvb3Rsb2Fk
ZXIgZG9lcyBub3QgZm9sbG93IHRoZSAKc3RhbmRhcmQgVUJJIGZvcm1hdCBkZWZpbmVkIGluIFsx
XSwgYW5kIGxpbnV4IGtlcm5lbCBzaG91bGQgaGF2ZSAKcmVjb2duaXplZCBiYWQgaW1hZ2UgYW5k
IHJlamVjdGVkIGF0dGFjaGluZyByYXRoZXIgdGhhbiB0cmllcyBmaXhpbmcgYmFkIAppbWFnZS4K
Ck1heWJlIHRoZXJlIGFyZSBvdGhlciBiZXR0ZXIgc29sdXRpb25zPyBTdWNoIGFzLAoxLiBGb3Ig
J0VPRicgZW5kZWQgaW1hZ2Ugc2NlbmFyaW9zLCBESVkgYW4gdXNlcnNwYWNlIHRvb2wgdG8gY29u
dmVydCBiYWQgClVCSSBpbWFnZSB0byB2YWxpZCBVQkkgaW1hZ2UuCjIuIEVyYXNpbmcvRm9ybWF0
dGluZyB0aGUgd2hvbGUgbXRkIHBhcnRpdGlvbi4gKEJUVywgd2h5IGRvZXMgYm9vbG9hZGVyIApv
bmx5IGZvcm1hdCBwYXJ0IG9mIG10ZCBwYXJ0aXRpb24/IFdoYXQgd2lsbCB0aGUgbGVmdCBzcGFj
ZSBpbiBtdGQgCnBhcnRpdGlvbiBiZSB1c2VkIGZvcj8pCgpbMV0gaHR0cDovL3d3dy5saW51eC1t
dGQuaW5mcmFkZWFkLm9yZy9kb2MvdWJpLmh0bWwjTF91YmlfaGVhZGVycwo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
