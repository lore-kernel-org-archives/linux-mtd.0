Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C5AC5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 12:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWX5pPXYc6amimC7gbqJnnl/b/3qNUAMbph7+fQMzjo=; b=KgMyuM5nBfzu5BtpTNrqfvZbBS
	AkdDCJBEeE6+K8VHhs6Jtg+yMzE3UP6aJyIhgvU/m4scXSuBW2MYyymK1BIoixGX8W1XiwBNYhKZf
	XTZqnQXabb2Vx+dhWLs9L+JagY/WgE9TgokXjMgkeLWmPjsdtyTIouG7uY/8FIC0kp1GenKNjUTfd
	zeCv1aVE3NruCj2ZTONvfcerhsFJEjpbiHFE/41A2JCQ+U0wAAnihe0OL/O67y52j+kYeDtASnjcE
	37/4xN9WXOV7oSBnZhN2x2eMpu9MKO2DOtOUfWJSJcfKZ/GOT/TJmwFTEMK7ZFBuRLl6DbyIdLqfb
	sco1RWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYt9-00000007Jp0-19DJ;
	Mon, 26 Aug 2024 12:32:03 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYt5-00000007JoT-394x
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 12:32:01 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wsqhx4JX1z1HH79
	for <linux-mtd@lists.infradead.org>; Mon, 26 Aug 2024 20:28:33 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 38D4C140120
	for <linux-mtd@lists.infradead.org>; Mon, 26 Aug 2024 20:31:51 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 20:31:50 +0800
Subject: Re: [PATCH v2 1/2] fs-tests: integck: Refactor: split out common
 remount logic
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>,
	<linux-mtd@lists.infradead.org>
References: <20240826112456.239882-1-csokas.bence@prolan.hu>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0ff08144-f183-bd2a-c585-b15de3176d88@huawei.com>
Date: Mon, 26 Aug 2024 20:31:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240826112456.239882-1-csokas.bence@prolan.hu>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_053200_069706_E4889988 
X-CRM114-Status: GOOD (  10.31  )
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

5ZyoIDIwMjQvOC8yNiAxOToyNCwgQ3PDs2vDoXMsIEJlbmNlIOWGmemBkzoKPiByZW1vdW50X3Rl
c3RlZF9mcygpIGFuZCByZWNvdmVyX3Rlc3RlZF9mcygpIGJvdGggaGF2ZQo+IGFsbW9zdCB0aGUg
c2FtZSBjb2RlIGZvciB1bW91bnQnaW5nIHRoZSB0YXJnZXQgRlMgYW5kCj4gbW91bnQnaW5nIGl0
IGJhY2suIFNwbGl0IHRoaXMgc2VxdWVuY2UgaW50byBhIG5ldwo+IGZ1bmN0aW9uIGNhbGxlZCB1
bW91bnRfYW5kX3JlbW91bnQoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDc8Oza8OhcywgQmVuY2Ug
PGNzb2thcy5iZW5jZUBwcm9sYW4uaHU+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgICBgLS1jb2xv
ci1tb3ZlZGAgaXMgcmVjb21tZW5kZWQKPiAgICAgIAo+ICAgICAgQ2hhbmdlcyBpbiB2MjoKPiAg
ICAgICoga2VlcCBDSEVDSygpaW5nIHRoZSByZXR1cm4gdmFsdWUgb2YgdW1vdW50KCkgdG8gYXZv
aWQgYnVzeWxvY2tpbmcgcmVjb3Zlcl90ZXN0ZWRfZnMoKSdzIGNhbGxlcnMKPiAKPiAgIHRlc3Rz
L2ZzLXRlc3RzL2ludGVncml0eS9pbnRlZ2NrLmMgfCAyMDAgKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCAxMDggZGVsZXRp
b25zKC0pCj4gCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
