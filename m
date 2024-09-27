Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215D0CDD1B2
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2024 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0hpXP2Q1t/a5LeOykHClquDgS7PN6SUD1FKzY2abJE=; b=nARyCykop7YN+CvxNznzw4cQko
	hkGcV6mT5ycYIAUlNzgHBWH007MLLTFFBkikzM3s+xTCKnAnwdmiHDqnaxzOkipqxTRJsTN672c12
	bLQp/iFxpU6Z4Nw0rdMCLlklDXrn2r6idnGFBbZTOscbxDmWVrxmkHTRIawoccCx+sgTWPrki2JeQ
	8+qOqymHJwNg58gpcB8ngdwt6NmOeI+pdCOCqlX4mOlcpmU5M/fMU7jFB5nva+umQJUBmOxZWbH/4
	ikb9FNylC0ScUtztO82b2O6GcCXIvtMF6eMonhTecx96RxF4tk67b7EyQCcOadzJw23WvZvaEZ2Pj
	8S+dFYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suBl2-0000000BR4p-1Pag;
	Fri, 27 Sep 2024 14:15:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suBky-0000000BR1b-2jiV
	for linux-mtd@lists.infradead.org;
	Fri, 27 Sep 2024 14:15:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XFXXR4DrGzySFM;
	Fri, 27 Sep 2024 22:14:31 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 018351400CF;
	Fri, 27 Sep 2024 22:15:35 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 22:15:34 +0800
Subject: Re: [PATCH] ubifs: Convert ubifs to use the new mount API
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Eric Sandeen <sandeen@redhat.com>, <linux-mtd@lists.infradead.org>
CC: <brauner@kernel.org>, David Howells <dhowells@redhat.com>, Richard
 Weinberger <richard@nod.at>
References: <20240926203604.23622-1-sandeen@redhat.com>
 <6081021a-be81-7877-8c1d-5311d9968124@huawei.com>
Message-ID: <6440eb69-bf16-8c24-955e-88793977bcb3@huawei.com>
Date: Fri, 27 Sep 2024 22:15:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6081021a-be81-7877-8c1d-5311d9968124@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_071541_725528_9A12E54F 
X-CRM114-Status: GOOD (  10.60  )
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

5ZyoIDIwMjQvOS8yNyAyMjoxMiwgWmhpaGFvIENoZW5nIOWGmemBkzoKPiDlnKggMjAyNC85LzI3
IDQ6MzYsIEVyaWMgU2FuZGVlbiDlhpnpgZM6Cj4gSGkgRXJpYywgdHdvIGNvbW1lbnRzIGJlbG93
Lgo+PiBGcm9tOiBEYXZpZCBIb3dlbGxzIDxkaG93ZWxsc0ByZWRoYXQuY29tPgo+Pgo+PiBDb252
ZXJ0IHRoZSB1YmlmcyBmaWxlc3lzdGVtIHRvIHRoZSBuZXcgaW50ZXJuYWwgbW91bnQgQVBJIGFz
IHRoZSBvbGQKPj4gb25lIHdpbGwgYmUgb2Jzb2xldGVkIGFuZCByZW1vdmVkLsKgIFRoaXMgYWxs
b3dzIGdyZWF0ZXIgZmxleGliaWxpdHkgaW4KPj4gY29tbXVuaWNhdGlvbiBvZiBtb3VudCBwYXJh
bWV0ZXJzIGJldHdlZW4gdXNlcnNwYWNlLCB0aGUgVkZTIGFuZCB0aGUKPj4gZmlsZXN5c3RlbS4K
Pj4KPj4gU2VlIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW91bnRfYXBpLnR4dCBmb3IgbW9y
ZSBpbmZvcm1hdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSG93ZWxscyA8ZGhvd2Vs
bHNAcmVkaGF0LmNvbT4KPj4gW3NhbmRlZW46IGZvcndhcmQtcG9ydCBvbGQgcGF0Y2hdCj4+IFNp
Z25lZC1vZmYtYnk6IEVyaWMgU2FuZGVlbiA8c2FuZGVlbkByZWRoYXQuY29tPgo+PiBjYzogUmlj
aGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPj4gY2M6IFpoaWhhbyBDaGVuZyA8Y2hl
bmd6aGloYW8xQGh1YXdlaS5jb20+Cj4+IGNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+PiAtLS0KPj4gwqAgZnMvdWJpZnMvc3VwZXIuYyB8IDQ1OSArKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjA0IGlu
c2VydGlvbnMoKyksIDI1NSBkZWxldGlvbnMoLSkKPj4KCkJUVywgSSBoYXZlIHRlc3RlZCB0aGlz
IHBhdGNoIHdpdGggeGZzdGVzdHMtZGV2LCB0aGUgcmVzdWx0IGxvb2tzIGdvb2QuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
