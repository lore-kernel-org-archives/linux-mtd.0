Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E5CEB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 07:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJtzatHh7/D2Wy0fI277QixCocpgmtoUbWc7B+cYl80=; b=QvrMcat6jXV+PJHvUr/jcuvTSA
	xbHqOIM6v7Gu6lEaFbzAmtg98uQdv6wE/vEiItNUJxvh52+klbza0QXH3XOkw5vBOXHq/qkpxQaWm
	4axx9gH3gwNAj3Xv9BLCXBQX+yZwhZjdXnPZHrfH5WNONIbzJt7HOKzLmOLU0qDrhawsaAL2Eqn38
	5DhgC+1+Bt5HqLLuGf+wp9mLeYyO+tjN/RmNOhWXdraCDmY7zh4rOCj9jh7yCiU8Gbqrt2SSOC/Yb
	0QboUWOioIU0b1ka/LIqlxnYdRk2OX2c8K1Dp80/E88gb0ko1yYHBsa7EyQmRG/BYTLIg0Z4Kg7sZ
	BmYiBkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9KsU-00Aemt-0d;
	Wed, 14 Jun 2023 07:25:14 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9KsR-00AemA-2O
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jun 2023 07:25:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 30DA8278;
	Wed, 14 Jun 2023 09:25:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1686727509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiH6wprVs/+N/MIOFx00ao2v7qFJy7tX3qyDxyA0/bk=;
	b=YBqFMdJcr8CYR9Cb0ckLFxkrwtJI8KcItmmeo92QluiinItjGqaNJ1ul3R1kSVBPRCY7+m
	pcsPHWG4B8mYT8oMzplLeLBgZG7UgQBJoeD7FMOcaYHxpA/iAChBK7KpIhzIgZ8WcMUPAT
	1/wbV6a4SJQp9hsniWlPOtbwvUq5aWJjCOo1PSFt1b+auoSDwFk+JXf70Tfi5lbuGzVKHD
	OvrQr1HjkBW1IlBeAv8i9Trmt9aJffdImeJF6KhonD+6637yX0M65Jzxv01hXBGEfezSlo
	l5ML5KMwFw1tL2FNC9mdM0jzdZQI2+kpARVQ6FOIJIw4p8vsKLx8Nbi1zol2tw==
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 09:25:09 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add support for sst26vf032b flash
In-Reply-To: <5a3b770b-45af-5d66-2596-c7d2ef8d70b1@linaro.org>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
 <20230609144324.850617-3-miquel.raynal@bootlin.com>
 <b3267c392523277bf15fe8d24679add3@walle.cc>
 <9cc52c0a-c765-2cb1-93f2-6f406e676604@linaro.org>
 <6bc68bc829f171dee260d1646ba58c50@walle.cc>
 <5a3b770b-45af-5d66-2596-c7d2ef8d70b1@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <504066732cbcda957ddefd746151d108@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_002511_939925_5B561553 
X-CRM114-Status: UNSURE (   8.28  )
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

Pj4+Pj4gK8KgwqDCoCB7ICJzc3QyNnZmMDMyYiIsIElORk8oMHhiZjI2NDIsIDAsIDY0ICogMTAy
NCwgNjQpCj4+Pj4gCj4+Pj4gUGxlYXNlIHRyeSB3aXRoIElORk8oMHhiZjI2NDIsIDAsIDAsIDAp
LiBZb3UgY2FuIGFsc28gaGF2ZSBhIGxvb2sKPj4+IAo+Pj4gT2gsIHllcywgSSBmb3Jnb3QgYWJv
dXQgdGhpcy4gV2lsbCB5b3Ugc2VuZCBhIG5ldyB2ZXJzaW9uIG9mCj4+PiBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL3BhdGNoLzIwMjIwNTEwMTQwMjMyLjM1
MTkxODQtMi1taWNoYWVsQHdhbGxlLmNjLwo+Pj4gb3IgeW91J2QgbGlrZSBzb21lb25lIGVsc2Ug
dG8gdGFrZSBvdmVyPwo+PiAKPj4gTm93IHRoYXQgSSdtIGJhY2sgZnJvbSB2YWNhdGlvbiwgSSds
bCBnZXQgYmFjayB0byBpdCBzb29uIDopCj4+IAo+IAo+IFdlbGNvbWUgYmFjayEgT2ssIHRoYW5r
cywgd2Ugd2lsbCBhbGwgYmVuZWZpdCBvZiBpdC4gU3BlY2lmeWluZyB6ZXJvZXMKPiBpcyBhIG5v
bi1zZW5zZSwgYnV0IGl0IGhlbHBzIHVzIHdoZW4gd2UgdHJhbnNpdGlvbiB0byBTRkRQX0lEIG1h
Y3JvCj4gKG9yIHdoYXRldmVyIGl0IHdpbGwgYmUgY2FsbGVkKS4KClN1cmUsIHRoYXQgd2FzIGFs
d2F5cyB0aGUgcGxhbi4gSSBqdXN0IHdhbnQgdG8gbWFrZSBzdXJlLCBubyBuZXcgZmxhc2hlcwph
cmUgYWRkZWQgd2l0aCB0aGlzIHVubmVlZGVkIGluZm9ybWF0aW9uIGFuZCB0aHVzIGl0IHdvdWxk
IHJlcXVpcmUKcmV0ZXN0aW5nIHdoZW4gbW92aW5nIHRvIHRoZSBuZXcgbWFjcm8uCgotbWljaGFl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
