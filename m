Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D08C624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deebuFT3Dcqox2FcuS6XnwsV49IxNDRt92eH+4SM6Vs=; b=32c8WNfrjKQV5n
	8F35kXhmxCClmu/6sqwO2lJt6XA+bNs0CxWz94AAq7cHERakg92RcS6rdnpj/AqdBZba0ulL/sndL
	fwz/93ycLwXszFAc/xPbmY1Jd8PDc/soGTakwLh6N9BK+SxYpTUz7TUXVW9139p3D8WpJ0Xv+oGyr
	rdj9q6v0acxIQuSv67dZmmlPmlz5l4+eh/5ncBcdyQN1frjgO0ga1xo+/7oFJjRAdArlwVbcjm+2d
	u6uKOXj/kPHt5s7SgvlUpJ0Kz/h8C38JAdTVP1FNg7qIzP1Fv7xrq3gwP1oQl5m5K9ii2I/IJnZft
	gZL4/gtTs8feyGePDm1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xs2-00000002u8X-02Sg;
	Fri, 04 Sep 2026 17:38:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xs1-00000002u7U-0bce
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+11RD2VkhzWbJPSklHtMOUDZPRa5mUWSSSuUxHURdRo=; b=R1gpiZYhvnOeHg/LgiXURUKztw
	3X9dE99rV3jEhw4Io1eo/VI3kWCQ35wE4WFDfKBty8lQBqSDJCUtSxUim2efPQAiy/n//zNJLBmkJ
	26IW8hnRBBJXaXIMMueGgfFX3Hm0gJnfJTy/6+SuH//pGGd0AJtuiI4CnZZ9FarpU26u92N6UXK9n
	B1cpX76aV8njOM7MIEsD9aDqcFOLVxkmD0FLnv4ntq4gMIZ+skkhJyPmtGv0LtNEopfORx1JOzTzF
	tz0HNsItyNQsRUEqAJY9WEABEAxE94P+mWltMxNwqDeO91BGmKru9Rxz4chpEuQgOh4Ex9KC5HLkq
	FFUFNA0A==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2Xry-0000000EM9F-0Mnp
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:38:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D5B324E4151A;
	Fri,  4 Sep 2026 17:38:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA6016057F;
	Fri,  4 Sep 2026 17:38:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DD3D11C79AE2;
	Fri,  4 Sep 2026 19:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+11RD2VkhzWbJPSklHtMOUDZPRa5mUWSSSuUxHURdRo=;
	b=NH5S48NA0wszJyBXRhzNNDfsawFbJvBHPOTKtt2Pflkp+LgdLzgr7Ce5NfzlbaELqLUYob
	70E+z7KI0Huy/ZrU75B9RRY4z5mxs3RClOOZaL+OUFtiTGBvw0MGt74DXPnkQ94xfe6UcW
	RK963upBrxsfzsGybnVxrlKaIWjT0zz4acv2SAzzw88LMrELHS1jNAoJzFIr8oC4J/7s3f
	fdefzcFwQhwuvGCZKDx8ubtwgRuhwCbzzIuzr1Zm3r1/a/k9DPnVlOjco1L+SO7DqhlIua
	lpT+GgQymHuPps/NS3cDLap8SyCq2hLQY8TiNW+37UWId2eT6Y/lynyn1IeZ6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Menachem Adin <menachem.adin@intel.com>, stable@vger.kernel.org
In-Reply-To: <20260827-mtd_eraze_to_fix-v2-1-1395ae4fb795@intel.com>
References: <20260827-mtd_eraze_to_fix-v2-1-1395ae4fb795@intel.com>
Subject: Re: [PATCH v2] mtd: mtd_intel_dg: reset poll counter for each
 erase
Message-Id: <178854350239.1467647.10362961851699895483.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:22 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_183830_353348_F792EB8F 
X-CRM114-Status: UNSURE (   5.73  )
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

T24gVGh1LCAyNyBBdWcgMjAyNiAwODoxMTo1NiArMDMwMCwgQWxleGFuZGVyIFVzeXNraW4gd3Jv
dGU6Cj4gVGhlIG5vbi1wb3N0ZWQgZXJhc2UgcG9sbGluZyBjb3VudGVyIGlzIGluaXRpYWxpemVk
IG9ubHkgb25jZSBwZXIgTVRECj4gZXJhc2UgcmVxdWVzdC4gTGFyZ2UgcmVxdWVzdHMgdGhlcmVm
b3JlIHNoYXJlIHRoZSBwb2xsaW5nIGJ1ZGdldCBhY3Jvc3MKPiBhbGwgNEsgZXJhc2UgY29tbWFu
ZHMgYW5kIGNhbiBmYWlsIHdpdGggLUVUSU1FIGV2ZW4gdGhvdWdoIG5vIGluZGl2aWR1YWwKPiBj
b21tYW5kIHRpbWVkIG91dC4KPiAKPiBSZXNldCB0aGUgY291bnRlciBmb3IgZWFjaCA0SyBlcmFz
ZSBjb21tYW5kIHNvIGV2ZXJ5IG9wZXJhdGlvbiBnZXRzIHRoZQo+IGludGVuZGVkIGNvbXBsZXRp
b24gdGltZW91dC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsx
LzFdIG10ZDogbXRkX2ludGVsX2RnOiByZXNldCBwb2xsIGNvdW50ZXIgZm9yIGVhY2ggZXJhc2UK
ICAgICAgY29tbWl0OiBlMGE4NGMyZmMyOWRjMjNmOTMzMWE0YTlmMjM2ZWY2MWM5NDFjM2E0CgpQ
YXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJl
CnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5
IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
