Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD510C54791
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j91qCQW8u2Y19LhzKChPL6BEBO8BuATTVQXpgYzaAiI=; b=oE25XL8ep4BtjfvDyiBC38nMTn
	7N/ju+xM+SBBo0ANN2k3roRK0E1AGuqggZx/9wxWTyt3UPNZBNh/uOxeLM+dSLlXXbBCd0pJ7wQcH
	gIE+X3G2z679gNagj1KealaBk7cOfNvwHjJfFl1Ey6m/6kfp390PVapff+DjV5Y/dLxdh803F+mRL
	WspTLjEYZSKgXwSqqGn44GEmKY2ABDpRDitjpTfaPpYcMeVTVrQsHcetwd+dOSkwbhlRFy6w1VfF/
	WuPXKR1acOumGBLXhVAMXVXpX29q4uCjmP1xQrb4l1Cr+YoZ4wUo+xWsB7G/bdbWkdZ/VEqj1UF0Z
	JvcUq6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOto-0000000AGpL-2Ik6;
	Wed, 13 Mar 2024 13:44:04 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOtl-0000000AGoM-0e9p
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 13:44:02 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TvsDD3nMcz1FMJR;
	Wed, 13 Mar 2024 21:43:40 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 580CE1400FD;
	Wed, 13 Mar 2024 21:43:56 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 21:43:55 +0800
Subject: Re: [PATCH] mtd: ubi: avoid expensive do_div() on 32-bit machines
To: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240313084707.3292300-1-arnd@kernel.org>
 <4f945f4a-ac29-3ef7-9e15-123962f2a0e9@huawei.com>
 <e0684202-6926-4bd1-86f6-2bb682524712@app.fastmail.com>
 <1a12c8ed-0cb5-5650-24a2-84b021c444c3@huawei.com>
 <b08aaae4-8c69-47eb-9658-5f3f5c8e4056@app.fastmail.com>
 <610231c3-c3ee-e543-1a8a-8e1098ee6a7c@huawei.com>
 <21cd0f32-c94b-4b2b-8fa6-ebe12756b0c4@app.fastmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ecc5d070-a773-1180-b50c-59088b23695e@huawei.com>
Date: Wed, 13 Mar 2024 21:43:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <21cd0f32-c94b-4b2b-8fa6-ebe12756b0c4@app.fastmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_064401_426512_471B9833 
X-CRM114-Status: UNSURE (   9.49  )
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

5ZyoIDIwMjQvMy8xMyAyMTozOSwgQXJuZCBCZXJnbWFubiDlhpnpgZM6Cgo+PiBUaGFua3MgZm9y
IGV4cGxhaW5hdGlvbiwgd2hpY2ggbWVhbnMgdGhhdCBkb19kaXYgaXMgdXNlZCBmb3IgNjQtYml0
Cj4+IGRpdmlzaW9uIHRvIHNvbHZlIHRoZSBsaW5rIGZhaWx1cmUgY2F1c2VkIGJ5IG1pc3NlZCBs
aWJnY2MuIFNpbmNlCj4+IHBhcmFtZXRlciAnZnJvbScgaXMgdTMyLCB0aGVyZSBpcyBubyBuZWVk
IHRvIGludm9rZSBkb19kaXYgb24gYSAzMi1iaXQKPj4gcGxhdGZvcm0sIHlvdSBqdXN0IHdhbnQg
dG8gc3RvcCB0aGUgd2FzdGluZyBiZWhhdmlvciBvbiBhIDMyLWJpdAo+PiBwbGF0Zm9ybS4gRG8g
SSB1bmRlcnN0YW5kIHJpZ2h0Pwo+IAo+IFllcywgY29ycmVjdC4KPiAKPiAgICAgICAgQXJuZAo+
IC4KPiAKSG93IGRvIHlvdSBmaW5kIGl0PyBJIG1lYW4gdGhlcmUgYXJlIHNvIG1hbnkgdHlwZXMg
YW5kIG1hbnkgZG9fZGl2IApjYWxsZXJzLCBkbyB5b3UgaGF2ZSBhIHN0YXRpYyBjaGVjayB0b29s
PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
