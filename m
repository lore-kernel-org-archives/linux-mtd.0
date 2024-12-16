Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A838DE7717F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 10:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGRrouJCW8hylaTdRjlp1U8wHthJmmKutO2AH1zIuIo=; b=GAy6ySzNKiCmzK
	m8hVmG6kx5CJYT10AaHWT31miusnU4WSujq8arQjlk+f1ITlucFdL2y7hlqNorZHsxqV8CyRO7YUR
	Wdi3IUg3f2VqOVA8wl+8BzA4JPrnKMf527k2BmhhUo593R31DR8fRVazrSkOQ3Ju6uJT16ckHuoZF
	ESLIBcsD8wWKZ1EuDCejF2x8aimmbFDy2VptcOmiQWc1wm0X9lsaI54flyUNwgyZk6yJF7kdYNuAF
	FRwOFlPYfdtvSc4RD1p/H2zihY3R+t6oYUEC0eJ230Ohneml3eNCKCSXSmsY3pmuV6HQwJD164Aad
	IqvupK/Okikp2sjGRC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN82x-00000009eCA-37OM;
	Mon, 16 Dec 2024 10:09:51 +0000
Received: from mail.analyticsservices.pl ([217.61.0.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6yw-00000009Twi-1obV
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 09:01:39 +0000
Received: by mail.analyticsservices.pl (Postfix, from userid 1002)
	id BFA5283A32; Mon, 16 Dec 2024 10:01:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=analyticsservices.pl;
	s=mail; t=1734339675;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=isQUTakkcCJ45P+1afAja6E2A8lh8wLKhZ3yerkVjQbKRk7EPiskKjfMoDHgAtUTK
	 Q5LpKJSXwLBzJyZSzJMV/VA40iBi09O0Lawek0kyUYQ3eo6lfyFys3AGl89QTW0z7N
	 cqJEh2g5PUuwx+gmJuJcUM2ydIqmnnM8RakPtoN6kcxaUaLgDCqVwX+mDF6U0RbKBi
	 5cRKq00GBwuNy2yY0UURxA2hz8xjo3Td9Z/FZAx9nVZidlNMq16mr1fRkYhSl9M2sq
	 ERgYDWQR4aiM9drOC1FblHFNT+Zt7My/qiPvJRaZfA/k58GEstFyUE9mu4Ne+U98Um
	 fjJG4yhFy8Ihw==
Received: by mail.analyticsservices.pl for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 09:01:01 GMT
Message-ID: <20241216084501-0.1.i.3nir.0.4r8bkp1b0i@analyticsservices.pl>
Date: Mon, 16 Dec 2024 09:01:01 GMT
From: "Patryk Wysocki" <patryk.wysocki@analyticsservices.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.analyticsservices.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_010138_600847_912E9E56 
X-CRM114-Status: UNSURE (   1.60  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
