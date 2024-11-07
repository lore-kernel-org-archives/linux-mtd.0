Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3B1D29FBC
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 01:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/G2abbnfxeukACXQAO/+xve5CqBkHtOlMikoEw+210w=; b=RuXNM8xcrWfHrguZg5pe+m5+c1
	XHhnt2EJ41YhPzTcAVpjvlxrt0DAfj49mpI3XxmNszirDqvQsZMXv1y5epotPOqIF8+2r8o4PM93h
	LVDfgkH4/GaDu4VqQelqFAryK+VTT0qAAFaUlplROW9oSVczZgeRpwcBf8wm5+Wcg6hMHhH/sfpdU
	KtZVkNckbjK8Tl+P8Z3OPg7Sk2yh9xHP3rI3DNMiOI0lD7Xr2lE3aM5JrHhtOSsajT1FdV1TGZDR4
	hPql3gc6P/PXrH3GhzIq8u54HYO3r0sF7lCY0CeFGVdgytDclP1XKlgXLPe37FukMQkScAydhkjaV
	uxIC5TTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rec-00000005LUu-1ps2;
	Thu, 07 Nov 2024 01:49:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rV6-00000005JRW-1UVd
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 01:39:58 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XkPnx4bf5z10Qjv;
	Thu,  7 Nov 2024 09:37:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B11ED14037E;
	Thu,  7 Nov 2024 09:39:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 Nov 2024 09:39:46 +0800
Subject: Re: [PATCH v3 01/10] ubi: Expose mean erase counter in sysfs
To: Richard Weinberger <richard@nod.at>, Rickard X Andersson
	<rickard.andersson@axis.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, rickard314 andersson
	<rickard314.andersson@gmail.com>, kernel <kernel@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
 <1034679385.201190.1730925253564.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <fde85cfc-8b66-37fd-3884-ad4d65930378@huawei.com>
Date: Thu, 7 Nov 2024 09:39:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1034679385.201190.1730925253564.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_173956_723554_579CB949 
X-CRM114-Status: UNSURE (   7.76  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjQvMTEvNyA0OjM0LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAiUmlja2FyZCBYIEFuZGVyc3NvbiIgPHJp
Y2thcmQuYW5kZXJzc29uQGF4aXMuY29tPgo+PiBUaGVyZSBleGlzdHMgbW9yZSBkZXRhaWxlZCBp
bmZvIGluIGRlYnVnZnMsIGJ1dCB0aGlzIGluZm9ybWF0aW9uIGlzCj4+IG9ubHkgYXZhaWxhYmxl
IGZvciBkZWJ1ZyBidWlsZHMuCj4gCj4gSWYgdGhlIGRldGFpbGVkIGluZm8gaXMgdXNlZnVsIGZv
ciByZWd1bGFyIHVzZXJzcGFjZSB3ZSBjYW4gYWxzbyB0aGluawo+IG9mIGFkZGluZyBhIG5vbi1k
ZWJ1Z2ZzIGludGVyZmFjZSBmb3IgaXQuCj4gRS5nLiBhbiBpb2N0bCgpIHRoYXQgcmV0dXJucyB0
aGlzIGRhdGEgaW4gYmluYXJ5IGZvcm0uCgpUaGlzIG1ldGhvZCBzb3VuZHMgYmV0dGVyLgo+IAo+
IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
