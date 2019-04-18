Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7BBC10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:14:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D0CA20643
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oy8x/LtW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D0CA20643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tu9q9jHVskCmjO0t9/F1fJMhnB2yZQbhrF5ef/w5mEw=; b=Oy8x/LtWmNuhZQ
	q+c8xYRcxMbCe0KwgkMphU0cyrsd7MRh925SreR0tV8W0ZcuDDwmrTQn29Pon2HLwIWJxGffj7jZf
	cNlhe0sXdvJ7DXY476neS+fFjYabmx9AtkOmuRgPvlNnDKYaqCOqdEso60GggaZRp2vx1DnJ/74JG
	gwbe7dnRxio2qgtY4TZBiO1Gg3+WDu+VWraKJVJRoKFnuA3UqblHJE8RSiLv3AvdCCRrkltOX7nt/
	V9+CivxA+IC0pXoK7Ybn3JVIJtU9rZnlI/wSwHqIOSCnVTWTJxWZ9zQaMtDDK2+JmYvrYfd2Envyf
	UnbpDLWKaOnUxKkdPwmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9gA-000481-8D; Thu, 18 Apr 2019 16:14:26 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9g3-00047Z-RX
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:14:24 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6F0E460007;
 Thu, 18 Apr 2019 16:14:16 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:14:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yue Haibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] mtd: rawnand: ingenic: Add missing MODULE_*
 information
Message-ID: <20190418181415.221b5c0a@xps13>
In-Reply-To: <20190404104711.23560-1-yuehaibing@huawei.com>
References: <20190404104711.23560-1-yuehaibing@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_091420_051860_C3EEBEF1 
X-CRM114-Status: UNSURE (   9.80  )
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

SGkgWXVlLAoKWXVlIEhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4gd3JvdGUgb24gVGh1
LCA0IEFwciAyMDE5IDE4OjQ3OjExCiswODAwOgoKPiBGcm9tOiBZdWVIYWliaW5nIDx5dWVoYWli
aW5nQGh1YXdlaS5jb20+Cj4gCj4gZ2NjIHdhcm5pbmcgdGhpczoKPiAKPiBXQVJOSU5HOiBtb2Rw
b3N0OiBtaXNzaW5nIE1PRFVMRV9MSUNFTlNFKCkgaW4gZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5n
ZW5pYy9pbmdlbmljX2VjYy5vCj4gCj4gQWRkIE1PRFVMRV9MSUNFTlNFLE1PRFVMRV9BVVRIT1Ig
YW5kIE1PRFVMRV9ERVNDUklQVElPTi4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+Cj4gRml4ZXM6IDlkZjU3NDFhNTc3ZSAoIm10ZDogcmF3bmFuZDogaW5n
ZW5pYzogU2VwYXJhdGUgdG9wLWxldmVsIGFuZCBTb0Mgc3BlY2lmaWMgY29kZSIpCj4gU2lnbmVk
LW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmMgfCA1ICsrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX2VjYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5n
ZW5pYy9pbmdlbmljX2VjYy5jCj4gaW5kZXggN2IwN2E2YS4uNzdlOTk2ZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmMKPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmMKPiBAQCAtMTU4LDMgKzE1OCw4
IEBAIGludCBpbmdlbmljX2VjY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ICAJcmV0dXJuIDA7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChpbmdlbmljX2VjY19wcm9iZSk7Cj4g
Kwo+ICtNT0RVTEVfQVVUSE9SKCJBbGV4IFNtaXRoIDxhbGV4QGFsZXgtc21pdGgubWUudWs+Iik7
Cj4gK01PRFVMRV9BVVRIT1IoIkhhcnZleSBIdW50IDxoYXJ2ZXlodW50bmV4dXNAZ21haWwuY29t
PiIpOwo+ICtNT0RVTEVfREVTQ1JJUFRJT04oIkluZ2VuaWMgRUNDIGNvbW1vbiBkcml2ZXIiKTsK
PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwoKCgpBcHBsaWVkIHRvIApodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IApicmFuY2gg
bmFuZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
