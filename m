Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B885CFD372
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45uLvlT6D4IzzDexxP74Hbb9PI2ILVx2RpgBVp3/yYo=; b=UVX3huzwMJJbxz7dYu66vyrauZ
	X9cOih6/cDFXo/dfoFmXEKiU5jDN+1vxVaP5mlaQPbkVGDRDv9rZVjPgyAp6jTaANZVId+NI4TDIH
	3Wj+xj4hBgZxmg83kjEzzGX4tRvB/cucjtyhc/iWIBa+/ESXFW7XpskmcQ++o1TbqC1qCVXbgZqZl
	dLXY6W9v4+fVO46sYaqmaEIqvEtC1U50DG6hgTLrOvQLXQ4pK6ofPAfS0KsJ9WXLtk9hqn2isY37l
	dtDPgRQKp1ms7nzVmSGHruG2gq4yx91KYoqTg5Wb6zarmxnSbBotuauOBUS2/QCNjdcC7V1ZD1UwY
	UVDB+vuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEZz-0000000GGbG-0lhv;
	Fri, 11 Oct 2024 12:17:11 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szERx-0000000GEYw-2IHk
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:08:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XQ5015rYwz1HKWW;
	Fri, 11 Oct 2024 20:04:33 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C1F1C140123;
	Fri, 11 Oct 2024 20:08:41 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:08:41 +0800
Subject: Re: [PATCH v2 10/10] ubi: Add max erase counter sysfs attribute for
 data area
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
 <20241011092134.2909496-10-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9d8d3a8c-1761-e1af-f938-5b00d3cb5aeb@huawei.com>
Date: Fri, 11 Oct 2024 20:08:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-10-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050853_901354_8464A4F2 
X-CRM114-Status: GOOD (  10.15  )
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

1NogMjAyNC8xMC8xMSAxNzoyMSwgUmlja2FyZCBBbmRlcnNzb24g0LS1wDoKPiBEYXRhIGFyZWEg
aW5jbHVkZXMgYWxsIGJsb2NrcyBleGNlcHQgZm9yIHRoZSBmYXN0bWFwIGFyZWEuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29uQGF4aXMuY29t
Pgo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWNsYXNzLXViaSB8IDgg
KysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5
OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtY2xhc3MtdWJpIGIvRG9jdW1lbnRhdGlv
bi9BQkkvc3RhYmxlL3N5c2ZzLWNsYXNzLXViaQo+IGluZGV4IDEwMGUxYzA2OThhMy4uZmY0NTM1
NTdiMGRiIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1jbGFz
cy11YmkKPiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtY2xhc3MtdWJpCj4g
QEAgLTg2LDYgKzg2LDE0IEBAIERlc2NyaXB0aW9uOgo+ICAgCQlNYXhpbXVtIHBoeXNpY2FsIGVy
YXNlYmxvY2sgZXJhc2UgY291bnRlciB2YWx1ZSBmb3IgYSBibG9jawo+ICAgCQlpbiB0aGUgZmFz
dG1hcCBhcmVhLgo+ICAgCj4gK1doYXQ6CQkvc3lzL2NsYXNzL3ViaS91YmlYL21heF9lY19kYXRh
Cj4gK0RhdGU6CQlPY3RvYmVyIDIwMjQKPiArS2VybmVsVmVyc2lvbjoJNi5YCj4gK0NvbnRhY3Q6
CWxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gK0Rlc2NyaXB0aW9uOgo+ICsJCU1heCBw
aHlzaWNhbCBlcmFzZWJsb2NrIGVyYXNlIGNvdW50ZXIgdmFsdWUgZm9yIGRhdGEgYXJlYS4KPiAr
CQlEYXRhIGFyZWEgaW5jbHVkZXMgYWxsIGJsb2NrcyBleGNlcHQgZm9yIHRoZSBmYXN0bWFwIGFy
ZWEuCj4gKwo+ICAgV2hhdDoJCS9zeXMvY2xhc3MvdWJpL3ViaVgvbWF4X3ZvbF9jb3VudAo+ICAg
RGF0ZToJCUp1bHkgMjAwNgo+ICAgS2VybmVsVmVyc2lvbjoJMi42LjIyCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
