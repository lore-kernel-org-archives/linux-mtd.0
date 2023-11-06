Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780ADC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Nov 2023 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+2ZV4mGgbkRxUp42LT+wvnfRFDA7gba+//c/XmqmzQ=; b=Z/QB3Hh2lyESCZ7F1mu1aXntPf
	IQm37ydw4gQbRtbaCTRk2Z9Jkm5VHIO4hRKN5QEf6dDnonhiA7g6JmnTrrwgVv9DGK8+2+L9frqPT
	8F9O/sxKn8ooWMyjlC/U5iDVZDN9Upmr7Kk8EFjYbpy0x/F8lo2I8TkgnEbQ4ikxmxTkSeoHA6z0u
	BhnO/agMB1rxEALI966Bd1+vJdHWAp912KMEx7Xdxw5vlHEKkjQF+cmu/PKdIJLREl2/eq6KO/rpE
	pWEbbHLTbXwGvOzuBKG5EnOXen7nHdcv5QUaa3kq9/JykFUMQdo0qin9v4gIjFp9NqFf/SEXC6ewj
	oH5hdE+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzswn-00FwGi-2v;
	Mon, 06 Nov 2023 06:18:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzswk-00FwFV-0k
	for linux-mtd@lists.infradead.org;
	Mon, 06 Nov 2023 06:18:51 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SP1PP4YswzVk7x;
	Mon,  6 Nov 2023 14:18:17 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 6 Nov 2023 14:18:26 +0800
Subject: Re: [PATCH] ubifs: auth.c: fix kernel-doc function prototype warning
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
CC: kernel test robot <lkp@intel.com>, Richard Weinberger <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
References: <20231106060744.10847-1-rdunlap@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <97389b3e-ae43-a344-333f-e74281c0fef9@huawei.com>
Date: Mon, 6 Nov 2023 14:18:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231106060744.10847-1-rdunlap@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_221850_463016_9B27D920 
X-CRM114-Status: UNSURE (   9.61  )
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

1NogMjAyMy8xMS82IDE0OjA3LCBSYW5keSBEdW5sYXAg0LS1wDoKPiBVc2UgdGhlIGNvcnJlY3Qg
ZnVuY3Rpb24gbmFtZSBpbiB0aGUga2VybmVsLWRvYyBjb21tZW50IHRvIHByZXZlbnQKPiBhIGtl
cm5lbC1kb2Mgd2FybmluZzoKPgo+IGF1dGguYzozMDogd2FybmluZzogZXhwZWN0aW5nIHByb3Rv
dHlwZSBmb3IgdWJpZnNfbm9kZV9jYWxjX2hhc2goKS4gUHJvdG90eXBlIHdhcyBmb3IgX191Ymlm
c19ub2RlX2NhbGNfaGFzaCgpIGluc3RlYWQKPgo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4KPiBDbG9zZXM6IGxvcmUua2VybmVsLm9yZy9yLzIwMjMxMTA1MjEy
NS5nRTFSeWxveC1sa3BAaW50ZWwuY29tCj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFy
ZEBub2QuYXQ+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gICBm
cy91Ymlmcy9hdXRoLmMgfCAgICAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhh
bzFAaHVhd2VpLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
