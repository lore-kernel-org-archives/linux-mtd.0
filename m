Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05D2CFD379
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Nov 2025 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wpDAJ6AMdynJQz0BQx/c6NBmNYbWqBbd1mU1AV4jx6c=; b=xZiJv9t78cyseA
	0AuK3R0LNCuA4ko+qUoZm9ot0/1M6gB00tyzNXMAVhEk9MaxdEg5daHzN80gkTTMNdSioG86jsB6Y
	l9vjRfNlL5lXVN2Ry03/M0hmjZUuQ9wmUxeTeQyXzUWuKH81JD44UhmT5NmkCHLZauMjOVziH/0PP
	yhT7XPsX+m8NKUbV2hXeGB/xgLsok24yRVy+8brInGBhHa+OGqNRrVFOZGlsXDARMsWwDetDGmYKc
	0vbhFB29CK4oe6Juz6dB+2dNuWjSKCEH9CHxZlIPws6oLf0TM+Etp4GMq+3PnST/sPo3AL6wlsHtq
	PHEdk61cjnCxi5GYGu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNolT-0000000Cza9-44vO;
	Tue, 25 Nov 2025 08:51:11 +0000
Received: from mail.optivobiz.pl ([51.195.45.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNolR-0000000CzZ5-2sOA
	for linux-mtd@lists.infradead.org;
	Tue, 25 Nov 2025 08:51:11 +0000
Received: by mail.optivobiz.pl (Postfix, from userid 1002)
	id BEB4FA6C7D; Tue, 25 Nov 2025 09:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=optivobiz.pl; s=mail;
	t=1764060663; bh=B+kicJ2U0DZeZyJfBITI5a/fHSQxPQMoq3se7lAh4rU=;
	h=Date:From:To:Subject:From;
	b=Ul2OZ1ufAQiKXS33v0jA9MpLdW0AZoEcG8zjXLz2CtT4gMY5SM64TFI1zu4fYgjau
	 MAaH0woSsxY86BgN29txX/E+UVr5s/TWlkBMAtEGsMUeZ22wmFxufizANAMcZtapAe
	 ZBsakuGLbYYxCRK7NsCZd0PexKNMoB4Mcr6SonvXCmPKzVXDaH3RCm7njHmEa4LDQo
	 BQ2M/ERWsQadIaBYt9ZiHBlYr9BA3pvA2YLUAc1+lMBOZTMnvxmMZCK+2bDdgp6Oa7
	 vtVysEYvM/9NqmRdTzyuJ+CYI8dW40kvXb2/mYwFPQgm1eLc+vncXqZtztq6ZLNOz4
	 NBaw4ZAV+msrQ==
Received: by mail.optivobiz.pl for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2025 08:50:56 GMT
Message-ID: <20251125084500-0.1.sa.37e81.0.i6a16m9cel@optivobiz.pl>
Date: Tue, 25 Nov 2025 08:50:56 GMT
From: =?UTF-8?Q?"Karol_Zdu=C5=84ski"?= <karol.zdunski@optivobiz.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Nowe lokalizacje magazynowe
X-Mailer: mail.optivobiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_005110_005890_2864CFC4 
X-CRM114-Status: UNSURE (   2.04  )
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

RHppZcWEIGRvYnJ5LAoKa29uaWVjIHJva3UgdG8gb2Rwb3dpZWRuaSBtb21lbnQgbmEgem5hbGV6
aWVuaWUgbW/FvGxpd2/Fm2NpIG9ibmnFvGVuaWEga29zenTDs3cgbmFqbXUgbWFnYXp5bsOzdyBi
ZXogcHJ6ZXJ5d2FuaWEgYmllxbzEhWN5Y2ggb3BlcmFjamkuIAoKVyB3aWVsdSBwcnp5cGFka2Fj
aCB1ZGFqZSBzacSZIG5hbSB0byBwcnpleiByZW5lZ29jamFjasSZIHVtw7N3IGx1YiBsZXBzemVt
dSBkb3Bhc293YW5pdSBsb2thbGl6YWNqaSAod29qLiBtYXpvd2llY2tpZSBpIHdpZWxrb3BvbHNr
aWUpLiAKCkplxZtsaSBQYcWEc3R3YSBmaXJtYSBwbGFudWplIHBvZG9ibmUgZHppYcWCYW5pYSwg
Y2jEmXRuaWUgcHJ6ZWRzdGF3acSZIGtvbmtyZXRuZSBtb8W8bGl3b8WbY2ksIGt0w7NyZSBtb2fF
gnlieSBwcnplxYJvxbx5xIcgc2nEmSBuYSBvc3pjesSZZG5vxZtjaSBpIGxlcHN6ZSBkb3Bhc293
YW5pZSBwb3dpZXJ6Y2huaS4gCgpDenkgY2hjaWVsaWJ5IFBhxYRzdHdvIHBvem5hxIcgc3pjemVn
w7PFgnkgb2ZlcnR5IGkgdW3Ds3dpxIcgc2nEmSBuYSBwcmV6ZW50YWNqxJkgbWFnYXp5bnU/CgoK
UG96ZHJhd2lhbQpLYXJvbCBaZHXFhHNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
