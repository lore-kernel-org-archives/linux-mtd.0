Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC4FC4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 02:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOcjtk20V41ZCkVATfVAtEC/jt0A63m10TH9lzsXrGQ=; b=WmH9Bpd9Us8qXaJ2M2Vhyfm5cm
	Wmws4ELz4IWWEHNJQcMl9X0z+6E+3DM9s7Iwsq8PcSbV/5SoSugRpveoLeX6HIPzoIkLQLosPZhYA
	qO3AJA2NXc2rf+QJm6/gNY+quksbTgDMVjZ577aIpPj1Cjro99yDxvxsX19OrE7rrGmTc74rZK9BG
	zAR9eh/qpL5j/tr0f9Z2Zyr0JDaT/rqhWeqvA3FRM2Mi5JCTNduS9FUOcSAGusH0JsAMaKxl8GMLO
	/lo4UiAR+WMvO5j/klBuzIORe7H7NCqeqTxGpBK2Xpg2DGyeTX2EKSamPptJ1PiIpuAnVBnYyYU9W
	pr1zaIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7nhE-003s0V-2y;
	Tue, 28 Nov 2023 02:19:32 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7nhB-003rz1-27
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 02:19:31 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4SfQxp1QDPzMnTd;
	Tue, 28 Nov 2023 10:14:22 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Nov 2023 10:19:11 +0800
Subject: Re: [PATCH v2] ubi: don't decrease ubi->ref_count on detach error
To: Daniel Golle <daniel@makrotopia.org>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <771902199.32600.1701116758852.JavaMail.zimbra@nod.at>
 <8d48839a1bf928886e86de8fdc09dc0676fc187f.1701132215.git.daniel@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f55da3cf-47ca-e942-0713-1133279eab46@huawei.com>
Date: Tue, 28 Nov 2023 10:18:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8d48839a1bf928886e86de8fdc09dc0676fc187f.1701132215.git.daniel@makrotopia.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_181929_899973_02171772 
X-CRM114-Status: GOOD (  16.29  )
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

1NogMjAyMy8xMS8yOCA4OjQ1LCBEYW5pZWwgR29sbGUg0LS1wDoKPiBJZiBhdHRlbXB0aW5nIHRv
IGRldGFjaCBhIFVCSSBkZXZpY2Ugd2hpbGUgaXQgaXMgc3RpbGwgYnVzeSwgZGV0YWNoaW5nCj4g
aXMgcmVmdXNlZC4gSG93ZXZlciwgdGhlIHJlZmVyZW5jZSBjb3VudGVyIGlzIHN0aWxsIGJlaW5n
IGRlY3JlYXNlZAo+IGRlc3BpdGUgdGhlIGVycm9yLiBSZXdvcmsgZGV0YWNoIGZ1bmN0aW9uIHRv
IG9ubHkgZGVjcmVhc2UgdGhlIHJlZmVyZW5jZQo+IGNvdW50ZXIgb25jZSBhbGwgY29uZGl0aW9u
cyBmb3IgZGV0YWNobWVudCBhcmUgbWV0Lgo+Cj4gRml4ZXM6IGNkZmE3ODhhY2QxMyAoIlVCSTog
cHJlcGFyZSBhdHRhY2ggYW5kIGRldGFjaCBmdW5jdGlvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBHb2xsZSA8ZGFuaWVsQG1ha3JvdG9waWEub3JnPgo+IC0tLQo+IHYyOiBhbHNvIGNhdGNo
IG5lZ2F0aXZlIHJlZl9jb3VudCBhbmQgYWRkIHViaV9hc3NlcnQgYXMgc3VnZ2VzdGVkCj4KPiAg
IGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgNyArKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVu
ZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L3ViaS9idWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBpbmRleCA3ZDRmZjExOTNk
YjZmLi4yMzE2ZjYwMTRjN2Y1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBAQCAtMTA5OSwxNiArMTA5OSwxNyBA
QCBpbnQgdWJpX2RldGFjaF9tdGRfZGV2KGludCB1YmlfbnVtLCBpbnQgYW55d2F5KQo+ICAgCj4g
ICAJc3Bpbl9sb2NrKCZ1YmlfZGV2aWNlc19sb2NrKTsKPiAgIAlwdXRfZGV2aWNlKCZ1YmktPmRl
dik7Cj4gLQl1YmktPnJlZl9jb3VudCAtPSAxOwo+IC0JaWYgKHViaS0+cmVmX2NvdW50KSB7Cj4g
KwlpZiAodWJpLT5yZWZfY291bnQgIT0gMSkgewo+ICAgCQlpZiAoIWFueXdheSkgewo+ICAgCQkJ
c3Bpbl91bmxvY2soJnViaV9kZXZpY2VzX2xvY2spOwo+ICAgCQkJcmV0dXJuIC1FQlVTWTsKPiAg
IAkJfQo+ICAgCQkvKiBUaGlzIG1heSBvbmx5IGhhcHBlbiBpZiB0aGVyZSBpcyBhIGJ1ZyAqLwo+
ICAgCQl1YmlfZXJyKHViaSwgIiVzIHJlZmVyZW5jZSBjb3VudCAlZCwgZGVzdHJveSBhbnl3YXki
LAo+IC0JCQl1YmktPnViaV9uYW1lLCB1YmktPnJlZl9jb3VudCk7Cj4gKwkJCXViaS0+dWJpX25h
bWUsIHViaS0+cmVmX2NvdW50IC0gMSk7Cj4gICAJfQo+ICsJdWJpLT5yZWZfY291bnQgLT0gMTsK
PiArCXViaV9hc3NlcnQodWJpLT5yZWZfY291bnQgPT0gMCk7Cj4gICAJdWJpX2RldmljZXNbdWJp
X251bV0gPSBOVUxMOwo+ICAgCXNwaW5fdW5sb2NrKCZ1YmlfZGV2aWNlc19sb2NrKTsKPiAgIAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
