Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DD0CEF140
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=en4kp6ibD9NYUFLXOtnpqERxJR0PHYGPxO7OSKLJ8Co=; b=PDhb5f0vHmceBHz9fLC0po6KhQ
	HycDSLZfGEPWrk/SgvaCxue/A+4Ljqdq15RDV8NFCNaeDU5qWbOboBT7oXVUI2giBVr5my47Ic7bc
	EVMLiKtuWlo+OJsOPYKcNw4DO2/cNqLTXrAd2wRVFY0wGadQq0qrTIcmGYJMqNlsi7rcEanIXn9Fy
	WtYIrTtdY4lKXKocQT7pHktkutXWsMRiRnmr7N85kphIkqvEu3DW9Few1Ym7LQKoCtz/Il+nZkhyW
	USdQsR9mvEGgrzPBY+jBNLArrXZUiu6Y3e3ja8SXG+E8Z0qfkk62/pzfGbXkWo/CoNLYOgXM43Fsc
	NBBsZzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6QY-00000005HGz-045Q;
	Tue, 08 Oct 2024 09:22:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5CD-00000004vwS-0pgb
	for linux-mtd@bombadil.infradead.org;
	Tue, 08 Oct 2024 08:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=49EYrThMsj/LhEb03yEriRYmqSA1+tQ5ovc+QChLx1A=; b=mAHCFgiByCbpGud3vPf/cELEXo
	9jMwDHr4iz2TX3RNSGJxuvpfADGW0daJJatrKDafvPxr2sJ3vT31zUd0g4hSr6CkLrLK3ffkX3C+f
	LDSHjLoWhtKk8xyVV9z/Gfu5Y8XwyKYr0f4rVtZnyXzV+vYXVJCODrsQ4AiM4VJAa4gBmeBpiBtzh
	eKvjW+VIduh/PY8uQgRjnDOHhBGApvjqZkbjiL46eT2MKsi6+NaTQezeVhSvfCY4Z6vvkoOhiWERL
	MvN0wlNswep2fruoBES6b1tIz9ES13Z31vXCSCTaWjf74mpCh/9qdo3fD3SS9mS4QnBCqf3/OPrDH
	TW+sHezQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5C8-00000004ZqA-1mI9
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 08:03:50 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XN7mF38kRz20pwr;
	Tue,  8 Oct 2024 16:02:37 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id BE09D14011F;
	Tue,  8 Oct 2024 16:03:12 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 16:03:12 +0800
Subject: Re: [PATCH V2] ubifs: Convert ubifs to use the new mount API
To: Eric Sandeen <sandeen@redhat.com>, <linux-mtd@lists.infradead.org>
CC: <brauner@kernel.org>, David Howells <dhowells@redhat.com>, Richard
 Weinberger <richard@nod.at>
References: <20241002165834.868046-1-sandeen@redhat.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c50d4353-ada9-1d4a-5343-219ddc1e3f76@huawei.com>
Date: Tue, 8 Oct 2024 16:03:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241002165834.868046-1-sandeen@redhat.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_090349_171588_BF091081 
X-CRM114-Status: GOOD (  11.53  )
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

1NogMjAyNC8xMC8zIDA6NTgsIEVyaWMgU2FuZGVlbiDQtLXAOgo+IEZyb206IERhdmlkIEhvd2Vs
bHMgPGRob3dlbGxzQHJlZGhhdC5jb20+Cj4gCj4gQ29udmVydCB0aGUgdWJpZnMgZmlsZXN5c3Rl
bSB0byB0aGUgbmV3IGludGVybmFsIG1vdW50IEFQSSBhcyB0aGUgb2xkCj4gb25lIHdpbGwgYmUg
b2Jzb2xldGVkIGFuZCByZW1vdmVkLiAgVGhpcyBhbGxvd3MgZ3JlYXRlciBmbGV4aWJpbGl0eSBp
bgo+IGNvbW11bmljYXRpb24gb2YgbW91bnQgcGFyYW1ldGVycyBiZXR3ZWVuIHVzZXJzcGFjZSwg
dGhlIFZGUyBhbmQgdGhlCj4gZmlsZXN5c3RlbS4KPiAKPiBTZWUgRG9jdW1lbnRhdGlvbi9maWxl
c3lzdGVtcy9tb3VudF9hcGkudHh0IGZvciBtb3JlIGluZm9ybWF0aW9uLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERhdmlkIEhvd2VsbHMgPGRob3dlbGxzQHJlZGhhdC5jb20+Cj4gQ28tZGV2ZWxvcGVk
LWJ5OiBFcmljIFNhbmRlZW4gPHNhbmRlZW5AcmVkaGF0LmNvbT4KPiBbc2FuZGVlbjogZm9yd2Fy
ZC1wb3J0IG9sZCBwYXRjaCwgdXNlIGRlZGljYXRlZCBjb250ZXh0IHN0cnVjdF1dCj4gU2lnbmVk
LW9mZi1ieTogRXJpYyBTYW5kZWVuIDxzYW5kZWVuQHJlZGhhdC5jb20+Cj4gY2M6IFJpY2hhcmQg
V2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gY2M6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+Cj4gY2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0t
Cj4gICBmcy91Ymlmcy9zdXBlci5jIHwgMzk5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjAzIGluc2VydGlvbnMoKyks
IDE5NiBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhp
aGFvMUBodWF3ZWkuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
