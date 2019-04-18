Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA6DC10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5D8206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iY7RhJBJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D5D8206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sY+4hSIpopiP2Jp1Kphbyre6KElJ5BlECmBRjbTMxoQ=; b=iY7RhJBJ3ViYnl
	hU7ho4Q62iIuVG3oZOgM0n4VEVXv2il6mRJJgHYQRM/dyGVbPLtkP8jvU5KVEGQNbQ8Gt/2pFbpyh
	gLuDu4Oc71OhmLKWXZBRd5Q4E1mw2Z4D24kCF2devD2TBQmRqjSp6EiwGp6bXRd2mXu24WE0Ubdgy
	8UPgmka+ONzl3Gh6Z0R0LhIehASoFWnNtThfXouyWAe0rIxz9JTcg64weT8yFQgAkV6R0k28LQtpm
	psmGV6lRtmhy8I9KA8aFoUVPI4/CQvu+VjZiYV48BebZJPiuSuF4CSwbYKeOBJiATC7HeAsI1fF6H
	UP0mxGx/Vj8nwq1LmRsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9oH-0001En-0N; Thu, 18 Apr 2019 16:22:49 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9oB-0001ES-RE
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:22:47 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7C84A20004;
 Thu, 18 Apr 2019 16:22:40 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:22:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yue Haibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] mtd: rawnand: ingenic: Make jz4725b_ooblayout_ops
 static
Message-ID: <20190418182238.2284f917@xps13>
In-Reply-To: <20190410140035.33004-1-yuehaibing@huawei.com>
References: <20190410140035.33004-1-yuehaibing@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_092244_025222_234A9F3D 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWXVlLAoKWXVlIEhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4gd3JvdGUgb24gV2Vk
LCAxMCBBcHIgMjAxOSAyMjowMDozNQorMDgwMDoKCj4gRnJvbTogWXVlSGFpYmluZyA8eXVlaGFp
YmluZ0BodWF3ZWkuY29tPgo+IAo+IEZpeCBzcGFyc2Ugd2FybmluZzoKPiAKPiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZC5jOjE0MDozMjogd2FybmluZzoKPiAgc3lt
Ym9sICdqejQ3MjViX29vYmxheW91dF9vcHMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBi
ZSBzdGF0aWM/Cj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAt
LS0KCgpBcHBsaWVkIHRvIApodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9tdGQvbGludXguZ2l0IApicmFuY2ggbmFuZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
