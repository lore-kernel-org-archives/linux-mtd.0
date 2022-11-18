Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05978C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynnLN8s5Nm5cEW4fsSI58L803sUYR9Njv+WIuyN/kQ4=; b=j8H/oXxlC+yaYt63QhrCepBD5q
	rcqcvoPHvaEV3PPD9bgIgI1VVYVDHYms/sCxuzZZ0o4WAwAoXXlqmofe+fPFI9fxXvduBUUEUcVQs
	DWwO9elzuF70ypJJ48pZOq5je6MZqWSV+O/lwFD3ekHmZ7EH98wKS557/FirMmPzaLDqwL7/VAyvn
	PaUfZizhTKO0v6bgKy+qVbekgvICljlPcbpgWR2wey5Lj7fmXCKRjeFjZhh868s+vXWyPeDDqkwT2
	xb4bv3M5GjfLOtgw8mKU0akIVshFos2GkIoAQkH0wibK9533GdLlmkJC5z+E3MseAwGM3/ueStRyn
	1RoW1e4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovx8A-002tPX-Ux; Fri, 18 Nov 2022 08:53:51 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovx87-002tNK-D0
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2022 08:53:49 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ND9Y96wLMz15Mkl;
	Fri, 18 Nov 2022 16:53:17 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 16:53:41 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 16:53:41 +0800
Subject: Re: [PATCH 0/6] ubifs: Fix wrong space calculation while doing budget
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "zhangyi
 (F)" <yi.zhang@huawei.com>
References: <20221011034732.45605-1-chengzhihao1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8207d8f9-8b30-cfbb-9a5f-56294cb35601@huawei.com>
Date: Fri, 18 Nov 2022 16:53:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221011034732.45605-1-chengzhihao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_005347_629939_62FAE2DF 
X-CRM114-Status: UNSURE (   8.26  )
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

5ZyoIDIwMjIvMTAvMTEgMTE6NDcsIFpoaWhhbyBDaGVuZyDlhpnpgZM6CgpIaS4gUmljaGFyZApK
dXN0IGEgcmVtaW5kaW5nLiBDb3VsZCB5b3UgcGxlYXNlIGxvb2sgdGhyb3VnaCBmb2xsb3dpbmcg
c2VyaWVzKFNvbWUgb2YgCnRoZW0gaXMgc2VudCBzZXZlcmFsIG1vbnRocyBhZ28pLCBJIHdpc2gg
dGhlc2UgY2FuIGJlIG1lcmdlZCBpbiA2LjEsIAp0aGFua3MgYSBsb3Q6Cgp1YmkgaW5maW5pdGUg
bG9vcDogCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvbGlz
dC8/c2VyaWVzPTMwNDQ4NQp1YmkgdWFmIGluIHN5c2ZzOiAKaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9saXN0Lz9zZXJpZXM9MzExOTU2CnViaSBmYXN0bWFw
OiAKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9saXN0Lz9z
ZXJpZXM9MzEzMDYzCnViaWZzIGFzc2VydGlvbiBmYWlsZWQgYWJvdXQgd3JpdGVwYWdlOiAKaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9saXN0Lz9zZXJpZXM9
MzAyNzc2CnViaWZzIHNwYWNlIGJ1ZGdldDogCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9saW51eC1tdGQvbGlzdC8/c2VyaWVzPTMyMjIyMAoKPiBUaGlzIHNlcmllcyBvZiBw
YXRjaGVzIGZpeCB1YmlmcyB3cm9uZyBidWRnZXQgc3BhY2UgY2FsY3VsYXRpb25zLAo+IHdoaWNo
IGNvdWxkIG1ha2UgbWFrZV9yZXNlcnZhdGlvbigpIGZhaWxlZCB3aXRoIEVOT1NQQyBlcnJvciBj
b2RlCj4gYW5kIGxldCB1YmlmcyBiZWNvbWUgcmVhZC1vbmx5Lgo+Cj4gWmhpaGFvIENoZW5nICg2
KToKPiAgICB1YmlmczogUmVjdGlmeSBzcGFjZSBidWRnZXQgZm9yIHViaWZzX3N5bWxpbmsoKSBp
ZiBzeW1saW5rIGlzCj4gICAgICBlbmNyeXB0ZWQKPiAgICB1YmlmczogUmVjdGlmeSBzcGFjZSBi
dWRnZXQgZm9yIHViaWZzX3hyZW5hbWUoKQo+ICAgIHViaWZzOiBBZGQgY29tbWVudHMgYW5kIGRl
YnVnIGluZm8gZm9yIHViaWZzX3hyZW5hbWUoKQo+ICAgIHViaWZzOiBGaXggd3JvbmcgZGlydHkg
c3BhY2UgYnVkZ2V0IGZvciBkaXJ0eSBpbm9kZQo+ICAgIHViaWZzOiBkb19yZW5hbWU6IEZpeCB3
cm9uZyBzcGFjZSBidWRnZXQgd2hlbiB0YXJnZXQgaW5vZGUncyBubGluayA+IDEKPiAgICB1Ymlm
czogUmVzZXJ2ZSBvbmUgbGViIGZvciBlYWNoIGpvdXJuYWwgaGVhZCB3aGlsZSBkb2luZyBidWRn
ZXQKPgo+ICAgZnMvdWJpZnMvYnVkZ2V0LmMgfCAgOSArKysrLS0tLS0KPiAgIGZzL3ViaWZzL2Rp
ci5jICAgIHwgMTggKysrKysrKysrKysrKysrKystCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
