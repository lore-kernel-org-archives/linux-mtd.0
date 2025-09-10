Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F45ECA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l6ckuWbANdYWJONb8qB7jjsNg/J+aUpdExPQeVm/xyA=; b=FcP9e/PFuZr3qP
	J3Wk/xfXXuhHB8GQKlBLMaJ8eXEbwBDr3qNzXM64TeMrqLyzZnzo2eNSpqQWw7oy+Cv3/bk5u3310
	fxKmq+vsiYDbme1sHWH3Tz3K82NB1+tRWe83xu8GEo8OyzzOXhqXYEt6PVz1kwvWkmZUh9gSb79RZ
	zbYBQznUfIKY/ru7wW5ixW0clm6gJO3evl0t+1/hXFct5ze2pI0XpSLPGKPF2zvsB33V9SC4QOtke
	YHEkxc1hlrwR/DbIz8lhFve8KOhP78TlJ2y6yy94FCR2tuKEDSbuBxTK1SC85FRrF5ZRPO7xbFZLX
	LloHGkTBqp1r8W3BA4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFNX-0000000CbKa-3EKt;
	Wed, 10 Sep 2025 07:36:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFNW-0000000CbJy-2usD
	for linux-mtd@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7Cq0DHB5k0l5CQs6BVZUFt4lPJTtmejSvjf3feeP/U8=; b=ZL+09hrqaQx/dkMitt0wZul2OU
	q41iC2gmZjVZnjyO4E6UHln3IZy0LUvNJ3/Eh0ILauLOMoki2nM/xQei7dguREWXU23g3OxIJO944
	l7x8KeB6yZxztCx+NIkGoxVJ9ock3e2SXmuM3aw2+x2CN5jP7902GiqPRQV9K2Q3rD5dhss+QBiXg
	PpQYY+wrEGcqn45vljNSLsatZL/LPZFBncxwOTDxM2mKMXcd0J0WuF5zOAU27WKGOUB6RIAW/OTv8
	UPKEQ3hMRIFNGQNzvnKDAQGYCfRqbQX6wbNVDrj2HE0IK1jASAhxFQDG3cIepBvr21m0Spq5BR3qS
	xNGfo4MQ==;
Received: from mail.bizosto.pl ([151.80.59.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFNT-00000005ljc-44pD
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 07:36:29 +0000
Received: by mail.bizosto.pl (Postfix, from userid 1002)
	id 8D5BC24149; Wed, 10 Sep 2025 07:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizosto.pl; s=mail;
	t=1757489766; bh=7Cq0DHB5k0l5CQs6BVZUFt4lPJTtmejSvjf3feeP/U8=;
	h=Date:From:To:Subject:From;
	b=QguUgdTmgI/K6NpQXGY6CqxQdY85rVhf3CJTZw8SngSxwgqFN3YAnULmz8yVgEVE/
	 SbBUvtOrrctGCdocs49V5vWk4rBqjoTw4wjlOSGRGcQKAusADQP0bpTFHQSyd9bIFL
	 2enAL1aN+9WXYG50ljrqDmBCgAPB34god8whq1bRQWLdMK9bC6S4lk0rz+qTqhDFkk
	 nwRpfGK/5OxYUC8Ww6p3WKwqq5FAYNFmY+6ac90umDuZXdCxu7ZDzQie0HRMHBhC7w
	 Z4J3cFeLE97Ku5PUKjO5o4zjkiGTb8FkL5b/EA51BowdUJID9cuM4/ju33E0C/BgVs
	 o9y7++VxvFdbQ==
Received: by mail.bizosto.pl for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2025 07:35:57 GMT
Message-ID: <20250910064500-0.1.3v.1ahs3.0.t9d1bql55h@bizosto.pl>
Date: Wed, 10 Sep 2025 07:35:57 GMT
From: "Kamil Nakielski" <kamil.nakielski@bizosto.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zatrudnienie nowej osoby
X-Mailer: mail.bizosto.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_083628_189913_7422DF29 
X-CRM114-Status: UNSURE (   2.29  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB3IHNwcmF3aWUgemF0cnVkbmllbmlhIHBy
YWNvd25pa8OzdyB6IFVrcmFpbnkgdyBQYcWEc3R3YSB6YWvFgmFkemllLgoKU3RhbGUgb2JzxYJ1
Z3VqZW15IGZpcm15IHByb2R1a2N5am5lIHcgdHltIHRlbWFjaWUuIEplxZtsaSBwb3RyemVidWpl
Y2llIFBhxYRzdHdvIGRvZGF0a293ZWdvIHBlcnNvbmVsdSBkbyBwcmFjeSwgcHJvc3rEmSBvIHdp
YWRvbW/Fm8SHLiAKCgpQb3pkcmF3aWFtCkthbWlsIE5ha2llbHNraQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
