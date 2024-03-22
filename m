Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11765C54E71
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsbnMfymrLBQRoeGrWDBtub1ElPjEdqaTIjGHpS5A1M=; b=DysFamANsz9QYIZxFpDxFsdJAc
	RqoYBeivtj6CJrLEZSJUVzBRoTr1ZruwQzS8ZMaoGr6Q0t3DjyzHCqukn5zUQPpYcnbo/5wkpL9nt
	IPxBT5nfzY3b303p4ya8HmG1TMVNAfimOVZ0UsrCDSM8vknCuzcq2NuZBWr4WYLWzeau8gkEVYrmK
	mJbpqyIcOWTnH8K8VXU/6WcjCZghAjO5B+hol2cimytVcVw7qGLB49F2sfEyJmuANJfvZbrbzgHvo
	SNnNo+3rv3FrtnUW1w7ySE9ZIFhRYUNIddvyFghwjo8eLmFpFJ/yu0qDkKIFC9fsFxthHUMDAnzhl
	oty7PlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndg2-000000074BH-2V0p;
	Fri, 22 Mar 2024 12:07:14 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndfy-0000000748M-38R5
	for linux-mtd@lists.infradead.org;
	Fri, 22 Mar 2024 12:07:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V1LcP36Jyz1xsN1;
	Fri, 22 Mar 2024 20:05:09 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 821E71A0172;
	Fri, 22 Mar 2024 20:07:04 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 20:07:03 +0800
Subject: Re: [RFC PATCH 2/5] ubifs: Initialize or update ACLs for inode
To: Li Zetao <lizetao1@huawei.com>, <richard@nod.at>,
	<kent.overstreet@linux.dev>, <agruenba@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
References: <20240319161646.2153867-1-lizetao1@huawei.com>
 <20240319161646.2153867-3-lizetao1@huawei.com>
 <2991c168-723d-48ef-8420-61e22a897239@huawei.com>
 <661736fb-bb3c-3519-1f4b-44dff285ea0b@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <10859a10-5c31-a5ec-02f5-47216132cf01@huawei.com>
Date: Fri, 22 Mar 2024 20:07:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <661736fb-bb3c-3519-1f4b-44dff285ea0b@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_050710_987753_8A3AE28C 
X-CRM114-Status: GOOD (  12.07  )
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

5ZyoIDIwMjQvMy8yMiAxOTo1NywgTGkgWmV0YW8g5YaZ6YGTOgo+IEhpLAo+IAo+IE9uIDIwMjQv
My8yMSAxMTo0NywgWmhpaGFvIENoZW5nIHdyb3RlOgo+PiDlnKggMjAyNC8zLzIwIDA6MTYsIExp
IFpldGFvIOWGmemBkzoKPj4+IFRoZXJlIGFyZSB0d28gc2NlbmFyaW9zIHdoZXJlIEFDTCBuZWVk
cyB0byBiZSB1cGRhdGVkLCB0aGUgZmlyc3Qgb25lCj4+PiBpcyB3aGVuIGNyZWF0aW5nIHRoZSBp
bm9kZSwgYW5kIHRoZSBzZWNvbmQgb25lIGlzIGluIHRoZSBjaG1vZCBwcm9jZXNzLgo+Pj4gV2hl
biBjcmVhdGluZyBkaXJlY3Rvcmllcy9maWxlcy9kZXZpY2Ugbm9kZS90bXBmaWxlLCBBQ0xzIG5l
ZWRzIHRvIGJlCj4+PiBpbml0aWFsaXplZCwgYnV0IHN5bWxpbmsgZG8gbm90LldoeSBub3Qgc3Vw
cG9ydCBzeW1saW5rPyBJdCBsb29rcyAKPj4+IGxpa2UgbWFueSBmaWxlc3lzdGVtcyhlZy4gZXh0
NCwgZjJmcywgCj4+IGJ0cmZzKSBzdXBwb3J0IGl0LCBleGNlcHQgeGZzLgo+IFRoYW5rcyBmb3Ig
dGhlIHJldmlld3MsIGJ1dCB0aGlzIGlzIGluY29uc2lzdGVudCB3aXRoIG15IHVuZGVyc3RhbmRp
bmcuCj4gSSB0aGluayBtb3N0IGZpbGUgc3lzdGVtcyBpbiBMaW51eCBkbyBub3Qgc3VwcG9ydCBp
dCwgYmVjYXVzZSBtb3N0IGZpbGUgCj4gc3lzdGVtcyBkbyBub3QgcmVnaXN0ZXIgdGhlIGdldC9z
ZXQgZnVuY3Rpb25zIG9mIEFDTHMgZm9yIHN5bWxpbmsgCj4gb3BlcmF0aW9ucy4gQW5kIHRoZSBw
b3NpeF9hY2xfY3JlYXRlKCkgd2lsbCBkZXRlcm1pbmUgdGhhdCBpdCBpcyBhIAo+IHN5bWxpbmsg
dHlwZSBpbm9kZSwgYW5kIHRoZW4gc2tpcCB0aGUgY3JlYXRpb24gcHJvY2Vzcy4gQnV0IGV4Y2Vw
dCBmb3IgCj4gYmNhY2hlZnMsIGl0IG1heSBiZSB0byBzb2x2ZSB0aGUgcHJvYmxlbSBvZiBjZXJ0
YWluIHNjZW5hcmlvcywgc28gaXQgCj4gd291bGQgYmUgbmljZSBpZiBhbnlvbmUgY291bGQgZXhw
bGFpbiBpdCB0byB1cy4KCllvdSBhcmUgcmlnaHQsIG9ubHkgYmNhY2hlZnMgc3VwcG9ydCBhY2wg
Zm9yIHN5bWxpbmsuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
