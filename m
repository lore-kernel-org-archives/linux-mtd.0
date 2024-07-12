Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C2BC2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 06:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ib9uy8PQKpLkdVZ3kiVHItJ6+/4a/fJ11xx3/mWpNXY=; b=fSTPoC4Z6pWvKLFnpw+QtH8Yhz
	b2tADn/USxZfY/3eW8ywgx0ZbHTz3xal/CbxOgFiJjkGWRwlnNC2f1Mz27yIuorO4nBQUzrvXta8b
	8zp0EimmpLB9Vh9sNG0MgBQZp3py0ej+J30uf996iS9gGTzIMQH/1zWk6xzyKk7uLto1sUyGQK7lU
	ljOqDViXXDxidjEHD1YaoZCNa13eHNl3C1yQXUA2BzCPmzXVSsaT31gED6xQxsY/P1AhShADN8mpe
	WuaUJ1oPc2LG8TLZQo0UuN9eupvwfAvJc940hiqCYrqNbvgxgjybEE5kpCkLX7wbJmwY9bx8/vx6T
	bBntfLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS9xN-0000000GecN-3MAj;
	Fri, 12 Jul 2024 06:40:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS9xK-0000000Gebo-359J
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 06:40:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WL20d5hsBzwX7D;
	Fri, 12 Jul 2024 14:35:45 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id E4341180ADF;
	Fri, 12 Jul 2024 14:40:30 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 14:40:30 +0800
Subject: Re: [PATCH 0/2] ubifs: Fix deadlock between inode reclaiming and host
 inode writing
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240710022628.1227996-1-chengzhihao1@huawei.com>
Message-ID: <505847e7-9ab9-f8b4-07ee-592dbafc645a@huawei.com>
Date: Fri, 12 Jul 2024 14:40:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240710022628.1227996-1-chengzhihao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_234034_966135_32B952F4 
X-CRM114-Status: UNSURE (   8.33  )
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

1NogMjAyNC83LzEwIDEwOjI2LCBaaGloYW8gQ2hlbmcg0LS1wDoKPiBQYXRjaCAxIG9wdGltaXpl
cyBsb2dpYyBwcm9jZXNzIGluIGZ1bmN0aW9uIHViaWZzX2pubF93cml0ZV9pbm9kZSgpLgo+IFBh
dGNoIDIgZml4ZXMgYW4gQUJCQSBkZWFkbG9jayBwcm9ibGVtIGJhc2VkIG9uIHRoZSBwcm9jZXNz
IGJ5IGFwcGx5aW5nCj4gcGF0Y2ggMS4KPiAKPiBaaGloYW8gQ2hlbmcgKDIpOgo+ICAgIHViaWZz
OiB1Ymlmc19qbmxfd3JpdGVfaW5vZGU6IE9ubHkgY2hlY2sgb25jZSBmb3IgdGhlIGxpbWl0YXRp
b24gb2YKPiAgICAgIHhhdHRyIGNvdW50Cj4gICAgdWJpZnM6IEZpeCBBQkJBIGRlYWRsb2NrIGJl
dHdlZW4gaW5vZGUgcmVjbGFpbWluZyBhbmQgZGVsZXRlZCBpbm9kZQo+ICAgICAgd3JpdGluZwo+
IAo+ICAgZnMvdWJpZnMvam91cm5hbC5jIHwgMTA2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyks
IDQwIGRlbGV0aW9ucygtKQo+IAoKUGxlYXNlIGlnbm9yZSB0aGlzIHNlcmllcyBvZiBwYXRjaGVz
LCB0aGUgdjIgdmVyc2lvbiBjYW4gYmUgZm91bmQgaGVyZToKWzFdIApodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tdGQvMzdjMjljNDItNzY4NS1kMWYwLTA2N2QtNjM1ODJmZmFjNDA1QGh1
YXdlaWNsb3VkLmNvbS9ULyN1ClsyXSAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRk
LzIwMjQwNzEyMDYzNjI1LjMzNjM5NzQtMS1jaGVuZ3poaWhhbzFAaHVhd2VpLmNvbS9ULyN0Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
