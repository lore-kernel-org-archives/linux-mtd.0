Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E537D5B176
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVaLs5WD7iw8HbrjQjltUEHdbCEk8vDLCltP5LyqB8Q=; b=SWK5TCN0LLNeVG/dsWvQT7R2Gf
	s0W8CXU4lfMv2XiL+cl5Dx+7ntgdMcURnj2tVEIB6ppyju/ZRy5s5n2Ytvv6D2AicKG9Qz3FJhmpc
	z5xI/SyPpiTsmUS5GF815CkndSJaISWfqnddBLx7sPr9gihY6J6IVFBd9F9/tGl4e7RqMxrscfhy0
	LiZ9KqrjJsiwUlya1MP+xxAA4TWT4tcY2qS+UzbV2xV8a3u3+QoNfEOyLah8snFnlekDmGzbeVTfU
	AoKLP77blK66Q5YB/cf1TWac/SjLGI6/0AO8UV9l/nYo7PFM2CkJtzBv8hYJAQXNdjze29qBfpKx/
	R7FzpO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iGV-0000000DpsJ-0aKr;
	Tue, 29 Oct 2024 09:11:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iBT-0000000Doub-0Qcx
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 09:06:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xd48Q4682zyTcT;
	Tue, 29 Oct 2024 17:04:54 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EAEF140257;
	Tue, 29 Oct 2024 17:06:32 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Oct 2024 17:06:31 +0800
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
To: Ryder Wang <rydercoding@hotmail.com>, Waqar Hameed
	<waqar.hameed@axis.com>, Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: "kernel@axis.com" <kernel@axis.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
 <MEYP282MB316412B08A32373E5ED9B896BF4B2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <fc567699-59c7-265a-b7c8-7b658cc6fc05@huawei.com>
Date: Tue, 29 Oct 2024 17:06:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB316412B08A32373E5ED9B896BF4B2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_020639_360604_9540B9D4 
X-CRM114-Status: GOOD (  12.60  )
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

1NogMjAyNC8xMC8yOSAxNjoxMCwgUnlkZXIgV2FuZyDQtLXAOgoKSGksIFJ5ZGVyCj4gSSBqdXN0
IGhhdmUgc29tZSBpbnRlcmVzdGluZyBmaW5kaW5nLgo+IAo+IFRoZSBjb2RlIG9mIHRoZSBmdW5j
dGlvbiB3cml0ZV9pbmRleCgpIGhhcyBhIHJhY2UgY29uZGl0aW9uIGJ1Zy4gYy0+ZW5leHQgaXMg
dXNlZCBpbiB3cml0ZV9pbmRleCgpLCBidXQgaXQgaXMgTk9UIHByb3RlY3RlZCBieSBjLT50bmNf
bXV0ZXguIFNvIHRoZXJlIG11c3QgYmUgU09NRSByYWNlIGNvbmRpdGlvbiBwcm9ibGVtLiBJIGJl
bGlldmUgc29tZSB6bm9kZSBtYXkgYmUgY29ycnVwdGVkIG9yIG1pc3JlYWQgaWYgMiBrZXJuZWwg
dGFza3MgYXJlIG9wZXJhdGluZyB0aGUgc2FtZSB6bm9kZSBjb25jdXJyZW50bHkuCgpUaGFua3Mg
Zm9yIHJlcG9ydGluZyB0aGF0IDotKS4gSSBub3RpY2VkIGl0IGEgcGVyaW9kIHRpbWUgYWdvIHRv
bywgYW5kIEkgCmZvdW5kICdjLT56bmV4dCcsICdjLT5jbmV4dCcgYW5kICd6bm9kZS0+Y25leHQn
IHdvbid0IGJlIGFjY2Vzc2VkIChpbiAKd3JpdGUgbW9kZSkgYnkgb3RoZXIgdGFza3MsIGJlY2F1
c2UgdGhlcmUgaXMgb25seSBvbmUgZnVuY3Rpb24gCmRvX2NvbW1pdCgpIG1vZGlmeWluZyB0aGVt
IGFuZCBkb19jb21taXQoKSBjYW4gYmUgZXhlY3V0ZWQgYnkgYXQgbW9zdCAKb25lIHRhc2sgaW4g
YW55IHRpbWUuCj4gCj4gVGhlIGNvZGUgY29tbWVudCBvZiBzdHJ1Y3QgdWJpZnNfaW5mbyBiZWxv
dyBpbmRpY2F0ZXMgdGhhdCBjLT5lbmV4dCBtdXN0IGJlIHByb3RlY3RlZCBieSBjLT50bmNfbXV0
ZXguCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgICogQHRu
Y19tdXRleDogcHJvdGVjdHMgdGhlIFRyZWUgTm9kZSBDYWNoZSAoVE5DKSwgQHpyb290LCBAY25l
eHQsIEBlbmV4dCwgYW5kCj4gICAqICAgICAgICAgICAgIEBjYWxjX2lkeF9zego+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gVGhhdCdzIHdoeSBJIGRvbid0
IHRoaW5rIHRoaXMgcGF0Y2ggY2FuIGZ1bGx5IGZpeCB0aGlzIGlzc3VlIGJlY2F1c2UgdGhlIHJh
Y2UgY29uZGl0aW9uIGlzIHN0aWxsIHRoZXJlLgo+IAo+IC4KPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
