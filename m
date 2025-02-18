Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7236C021AA
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 12:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IROlmsa+/IsC308v70SamNLgG8DBeNSehXR6o3+YD0=; b=zKpqi9OL+axgjQxb+m6xXEE0Gx
	HMYyEbmoyjZ52OWCAeuWwexaNmkxrm2EjplAN1fk2y7di9RGWSrcdUVgEbLvNdTJRR8CdohpuP5yd
	1JpQUWQ1sMuX4tuHQZHCRyAnPriRlstiiZv/b7LINpBc6kGPTrgkr6dDR0yEwGnUxEs8vgMlUR62P
	ZJ4RPBsFiy5HNDpuAzRACaPIHQ67RR3ig6KhIPF4XAGXO2azViC7hADrkrlN8jmuVWpze0CtFJTCs
	vJARVR/fAQC5d2gth58njOfVoohh+0f5/iHzzzuH8Zn366a/vIn8+phItJeLRJZI7NiPH6xy1N1HP
	zlVI1OPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMhU-000000088mC-1Rnj;
	Tue, 18 Feb 2025 12:27:44 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMIa-0000000845z-1Hrx
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 12:02:01 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Yxygk6ZJbz1Y1r3;
	Tue, 18 Feb 2025 19:57:22 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B6ACE18032E;
	Tue, 18 Feb 2025 20:01:57 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Feb 2025 20:01:57 +0800
Subject: Re: [PATCH v2 mtd-utils 4/4] ubifs-utils: extract_files: Include
 <linux/limits.h>
To: Fabio Estevam <festevam@gmail.com>, <david.oberhollenzer@sigma-star.at>
CC: <raj.khem@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20250218113123.1956575-1-festevam@gmail.com>
 <20250218113123.1956575-4-festevam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <41c00c68-4eba-167f-af41-17223cb43792@huawei.com>
Date: Tue, 18 Feb 2025 20:01:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250218113123.1956575-4-festevam@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_040200_510569_888DB1C4 
X-CRM114-Status: GOOD (  15.26  )
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

1NogMjAyNS8yLzE4IDE5OjMxLCBGYWJpbyBFc3RldmFtINC0tcA6Cj4gSW5jbHVkZSA8bGludXgv
bGltaXRzLmg+IHRvIGZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yIHdoZW4gYnVpbGRpbmcK
PiB3aXRoIG11c2w6Cj4gCj4gfCAuLi9naXQvdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9leHRyYWN0
X2ZpbGVzLmM6IEluIGZ1bmN0aW9uICdwYXJzZV9pbm9fbm9kZSc6Cj4gfCAuLi9naXQvdWJpZnMt
dXRpbHMvZnNjay51Ymlmcy9leHRyYWN0X2ZpbGVzLmM6MTQ0OjQ3OiBlcnJvcjogJ1hBVFRSX0xJ
U1RfTUFYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiB8ICAgMTQ0
IHwgICAgICAgICBpZiAoaW5vX25vZGUtPnhubXMgKyBpbm9fbm9kZS0+eGNudCA+IFhBVFRSX0xJ
U1RfTUFYKSB7Cj4gfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fgo+IHwgLi4vZ2l0L3ViaWZzLXV0aWxzL2ZzY2sudWJp
ZnMvZXh0cmFjdF9maWxlcy5jOjE0NDo0Nzogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZp
ZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4K
PiB8IG1ha2U6ICoqKiBbTWFrZWZpbGU6NDM3NDogdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9mc2Nr
X3ViaWZzLWV4dHJhY3RfZmlsZXMub10gRXJyb3IgMQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYmlv
IEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+
IC0gSW5jbHVkZSA8bGludXgvbGltaXRzLmg+LiAoWmhpaGFvKQo+IAo+ICAgdWJpZnMtdXRpbHMv
ZnNjay51Ymlmcy9leHRyYWN0X2ZpbGVzLmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVh
d2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9leHRyYWN0
X2ZpbGVzLmMgYi91Ymlmcy11dGlscy9mc2NrLnViaWZzL2V4dHJhY3RfZmlsZXMuYwo+IGluZGV4
IGM4M2QzNzc0OWJjMC4uMDAwZWY1ZDEwNTY1IDEwMDY0NAo+IC0tLSBhL3ViaWZzLXV0aWxzL2Zz
Y2sudWJpZnMvZXh0cmFjdF9maWxlcy5jCj4gKysrIGIvdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9l
eHRyYWN0X2ZpbGVzLmMKPiBAQCAtMTAsNiArMTAsOCBAQAo+ICAgI2luY2x1ZGUgPGdldG9wdC5o
Pgo+ICAgI2luY2x1ZGUgPHN5cy9zdGF0Lmg+Cj4gICAKPiArI2luY2x1ZGUgPGxpbnV4L2xpbWl0
cy5oPgo+ICsKPiAgICNpbmNsdWRlICJsaW51eF9lcnIuaCIKPiAgICNpbmNsdWRlICJiaXRvcHMu
aCIKPiAgICNpbmNsdWRlICJrbWVtLmgiCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
