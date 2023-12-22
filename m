Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9F0C46CD8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P04Xx8hy1riUiUQssq80aWkGioAvI3EVoXV5gtqkBLk=; b=kG1uyxrJ+T9+Zg
	Jfe/tCu+QmFvX5u0u570RrmEJonU6ZOlnc1fXDPwdtpPejAV2p04WpucuYPYZNiGPK8W6z+y30K8/
	rV5niQ4lt+k6tAyP7BhjTvt8bJV0TN2H7HWtoXWpYSqNTGeEldUTWm+W7vZq1p+YPEV3DWyhOH2cF
	x4wZ9e85a1zwhqyHO0TmdPvjuLouRNxEWbCGxUprgQIBdptD49bFXniMAdpsZBNBuV1tp/5XDNGRg
	oOKDZXtClrrUUr13ujD9IFq2J6GX/e44x3usjgGCRf43pjV3vnkvcNfdG3SHiY8VS5VArVLP3+jaW
	6FnBwxkTYfIG53Wv6x3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe0i-005oqv-0e;
	Fri, 22 Dec 2023 11:48:12 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe0f-005oms-2a
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 11:48:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B825240006;
	Fri, 22 Dec 2023 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703245684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pz3QGvN7OQjslObqFvAMfrXWArrgJlBSR5+46rBNKj4=;
	b=C5pnaOXbxR4m3701u3zKoyTub2ri948qGa6Kaag7thbd/+BLdizRrFoI99Wz7pR5l6yBeL
	bvc/0SkdIFFKL8VkTEDVIsnTUpE3Y5I4izvGBzEzt1YONlwxaqICv9GxspHeN/1fVdsZvr
	epLauGjocIa48Sw4H5UZUTI4dqOwlBus/ut4LwywjrfHsX0fLq2Cbowcj/gfN4EeU0DlaO
	ZS/q7ogeBQwqKVcoCY1Tb0mpCsGK4LQF/fzOkSWj3oxGaPnzly4jbfZEUKsiOLoyfdng9l
	o1Um89U7C/iHQbrX1ICIB4u9dZNaH4qbxFsUCHHYah0eRKFIRtYDU7MNgaA2TA==
Date: Fri, 22 Dec 2023 12:48:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: Re: [GIT PULL] mtd: nand: Changes for v6.8-rc1
Message-ID: <20231222124802.52e14a6d@xps-13>
In-Reply-To: <20231220102853.61275d76@xps-13>
References: <20231220102853.61275d76@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_034809_986269_A8EA433F 
X-CRM114-Status: UNSURE (   5.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gV2VkLCAyMCBEZWMgMjAyMyAxMDoy
ODo1MyArMDEwMDoKCj4gSGVsbG8sCj4gCj4gVGhpcyBpcyB0aGUgTkFORCBQUiBmb3IgdjYuOC1y
YzEuCgpNZXJnZWQgaW50byBtdGQvbmV4dC4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
