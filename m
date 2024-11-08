Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C645D5D695
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2024 01:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goOS6gBaaoLMBBsGYDKgCmRNq2tjpESG55LdArpTayA=; b=eYtChyq1014d/JzWlEgS0w+W9M
	TmNvM6J8Tl5tyHeIo7S7y2+D0uRAmjM1RjgGb0IlPYvvXlg/OXwqrXOxPz/88TawS5GAlyDwnP/Ym
	Dqh3AeBa+ijCqTNVAkXhet01iacBySwQwZWT6wNfWUQeCBXikVmaP0XKX/fAJDOzw/UEmAOr3fLSd
	9HIbD9ME94X4199tGiIcZi2WpNd/60Nmadc1O/w/+cG3uXkBps+njV+p71k+q528u8+QChEHZtbTc
	B08VPB/susW+Z14+kDJQntymMvrd7XFvcRdOn+7ytIBBT1HIZ12It9Bt32wI9F7Sf5ouhrm0vhdDu
	oQCak14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Dxq-00000008wxl-1mrC;
	Fri, 08 Nov 2024 01:39:06 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Dxm-00000008wxE-11DP
	for linux-mtd@lists.infradead.org;
	Fri, 08 Nov 2024 01:39:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xl1l92x6nz2Fb3V;
	Fri,  8 Nov 2024 09:37:09 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 87DFB14010D;
	Fri,  8 Nov 2024 09:38:52 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 Nov 2024 09:38:50 +0800
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
To: Waqar Hameed <waqar.hameed@axis.com>
CC: Richard Weinberger <richard@nod.at>, Sascha Hauer
	<s.hauer@pengutronix.de>, <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryder Wang <rydercoding@hotmail.com>
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
 <0f040e0a-c27f-2f29-6d9e-9c7152a18513@huawei.com> <pndttci1xgd.fsf@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <198ba9bd-9ef1-0cff-696e-6532dcdbe0dd@huawei.com>
Date: Fri, 8 Nov 2024 09:38:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <pndttci1xgd.fsf@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_173902_468594_C6AD5ABA 
X-CRM114-Status: UNSURE (   7.29  )
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

5ZyoIDIwMjQvMTEvOCA2OjM4LCBXYXFhciBIYW1lZWQg5YaZ6YGTOgo+IE9uIFRodSwgTm92IDA3
LCAyMDI0IGF0IDE2OjM5ICswODAwIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IHdyb3RlOgo+IApbLi4uXQo+IAo+IFAuUwo+IEkgd29uZGVyIGhvdyBtYW55IHN5c3RlbXMg
dGhhdCBtaWdodCBoYXZlIGV4cGVyaWVuY2VkIHRoaXMKPiB1c2UtYWZ0ZXItZnJlZSBhbmQgZ290
IHJhbmRvbSBtZW1vcnkgY29ycnVwdGlvbnMgKG9yIG90aGVyIHNlY3VyaXR5Cj4gaXNzdWVzKS4g
VGhpcyBidWcgaGFzIGJlZW4gdGhlcmUgc2luY2UgdjQuMjAuCj4gRC5TCj4gLgo+IAoKTWF5YmUg
dGhlIGF1dGhlbnRpY2F0aW9uIGZlYXR1cmUgaXMgbm90IHdpZGVseSB1c2VkLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
