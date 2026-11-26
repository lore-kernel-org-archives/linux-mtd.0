Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95B606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wszvGnHA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YKDyj+27
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zhl0doRlUuR1ZLsclxyMBPWDHKqWuUn6AyZIV04TXMw=; b=wszvGnHAd74rCpFD/ALNIBrCvN
	9jbitjfNQpLxYo7lGSkyq+VNcmvYznKqNCAb4H90lmeSTleoQ5+Z1ahdvDdTjtW5ePEvm/0seneGJ
	sNxcIHeGdan7x5nUtKvXolxmsO76csGOOU2yTQ+N3U5IULnCrw2Ya8hd/jF4djBCEYj4XK1dtC1Y4
	4KuMql3zCyoapV0PXr7exdm0X6QVVsnjb/lfmLLr0VMgPL0DDU3MXiFz+Nk/GPos4WJyhHMLeKvxo
	KKlQhd2RdPiv/D5bRJiACALUcFi8gwFhgS42L9p0qh43701JHPoqoBmP8Mm8bgtjNRocrf/nJxMg6
	22NmdXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXE9-0000000CnPV-39RD;
	Thu, 26 Nov 2026 11:01:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXE5-0000000CnOo-3WLR
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 11:01:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F356C4E4179C;
	Thu, 26 Nov 2026 11:01:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5F7060237;
	Thu, 26 Nov 2026 11:01:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD16611E6B36B;
	Thu, 26 Nov 2026 12:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795690870; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9w5AEZ00ldKkg/YYySuzq7oRUsGsgwOxx6Rdnue+ceI=;
	b=YKDyj+27WLUu23Osv1n6c4pCOh/vJ4pJ2r4DPBqon9fyBEk5oHc1MpktuOW+ySBDu6UH7U
	ccfU6JuV0qYHqOK74PlAk3Fxm9MvVBa1XzmyWySngoMKppBsxxJ3thuGEOFzpjj9DTnMFy
	UbGTeqpZizcP7cSLm2dwa9+HEraL5qsRtI0dYUHRlv4NrpC2/YPGeunI0G4adQyWaI6JyT
	NVsgghxmzsAQbhD0iEafly5fSo2OAyYYbOx+pn/gh0O03Cp+q7m9Kp3BejevheRYyxwbJH
	/S//61yyJoq5q4icBI4VWqK7O9R8TxFR8RXrsbtSpEkY9dyur73ArvgMGQt74w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  tsbogend@alpha.franken.de,
  linux-mtd@lists.infradead.org,  linux-mips@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linusw@kernel.org,  kaloz@kernel.org,
  ulli.kroll@googlemail.com,  john@phrozen.org,  nico@fluxnic.net,
  dwmw2@infradead.org,  corbet@lwn.net,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/4] mtd: point() for cfi_cmdset_0002, on simple maps
 only
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com> (Orgad Shaneh's
	message of "Thu, 26 Nov 2026 08:59:02 +0000")
References: <20261126085906.814373-1-orgads@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:01:05 +0100
Message-ID: <87ecc7yhzi.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_030118_020247_E4CCF63A 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgo+IE9uZSBxdWVzdGlvbjogYSBjcmFtZnMgb24gQU1EIGZsYXNoIGZhbGxzIGJhY2sgdG8g
dGhlIGJsb2NrIGRldmljZQo+IHRvZGF5LiBBZnRlciAyLzQgaXQga2VlcHMgaXRzIGltYWdlIHBv
aW50ZWQgd2hpbGUgbW91bnRlZCwgYXMgaXQgZG9lcwo+IG9uIEludGVsIGZsYXNoLCBzbyBqZmZz
MiB3cml0ZXMgdG8gdGhlIHNhbWUgY2hpcCB3YWl0IHVudGlsIGNyYW1mcyBpcwo+IHVubW91bnRl
ZC4gSXMgdGhhdCBhY2NlcHRhYmxlLCBvciBzaG91bGQgcG9pbnQoKSBpbiBjZmlfY21kc2V0XzAw
MDIKPiBiZSBvcHQtaW4/CgpJIGFtIG5vdCBwYXJ0aWN1bGFybHkga25vd2xlZGdlYWJsZSBvbiB0
aGlzIGFyZWEsIFZpZ25lc2ggY291bGQgeW91CnBsZWFzZSBoYXZlIGEgbG9vaz8KClRoYW5rcyEK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
