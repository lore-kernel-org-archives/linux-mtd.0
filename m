Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F68C606A32C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q3eDoEtg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pBz0Xg5I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbaG6pTa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S03HssFs3x1Fhlaj81B+GpQN69n8bFe33umK5TRyo7E=; b=Q3eDoEtgAudkjuBPGS2SOJ5B+x
	wKa3VJdu3GlNkIiE8jUMNYtjK0t18XlBs1T9J7i+aV165Qb8G15dtY7sz8HyKMXVpkjVjZ7D4OTD+
	mJ7LLmyynTWbciHhExw5zuCCY12Lqz4obCBakBsUfblGXLcTSPU1AmlHhHnVPUo0HWt8AsTGJxRAL
	cshsSC5U21o3x0KulunMSiqwI18/KA6lGSuK+Rpda4hu3Vtv6KOxlzw4tg2nzv9WdTibdR5UXBVxO
	7y8tOnC1Mi9cbrB1m0qKFNCaSi7bR/5eRxTbVBiHRElDHPg8+OuUt3DmDGFlSg7GGFklniKBj33kk
	i7NumGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZGi-00000007uqQ-1jm9;
	Wed, 18 Nov 2026 06:35:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZGh-00000007uqC-0Exd
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Nov 2026 06:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RLInY9Pas2VGdZHhoGedVfli2rsw8GnKGiuTBZLrurs=; b=pBz0Xg5IoMsbcWHR0kApG7w/mz
	IKiO2AGcBSfKsRXfNPRy3cTCnwK3gHH1tEhIStG5KSSpioVjlLXR3J5uSwuR5KhmHnXiYrHKeiBpq
	770au8UGr4tSNtZWdQ3nkRPdTgxQBeQgyNM4LBLJ5qeyBdBb9U9nQn0yP8r7z1bEWPc+SEBYXwNYn
	k608Tu1ideYs2jvPDc3gpZFD0Mja+YqYskFsCYlvlP1isQS1ccXFn0PXELgFZYHUcbefcvS2LyhX/
	Eiw15Mh3hswIEYcjGMozKZcXrHfR+/ft6yYX4Br30gFQGK3kQ+dqYcECS+dyj3ha4QbB0l0YuAd0U
	+9U2p/Xw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZGe-0000000AcwG-0SCX
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 06:35:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so5403705e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 22:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983737; x=1795588537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLInY9Pas2VGdZHhoGedVfli2rsw8GnKGiuTBZLrurs=;
        b=nbaG6pTadJFNyI7iWt9FOKNZv6QhRwFZsB59mlusUksO0WFHj5rFKZacexx5/N+Pge
         shjMpPwvfYIt4+xBJAsc3AjSZgA72Ngpp5IdO2z4uRcfO14RAoJvkWzI74gG5Ag9UdFD
         y0XM73m06wQoPIN/IlLhJ/WnBQ5xScuFhs56tqdsGU9QTuqp8U739UuA64aDH3HCex3Z
         1cEZTv34f7tGqiqpV6P3ySFc5xSWjQV9iHSOzcqyGioLHRHB4leFcR29mVHiBUwEPFM4
         bMzZM0X5svggtl8MiFKt6m9tJWv6IwLIn+kzNk2XnFMW85zggTQEjUKKdwq9x2fjs2kj
         WYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983737; x=1795588537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLInY9Pas2VGdZHhoGedVfli2rsw8GnKGiuTBZLrurs=;
        b=mO19VyyWHJNg42Sdk9msV+6fEagLXAYR75vGLkjI6xWVtBRNAN3jQVzYpOyr/E5mXh
         HmHfq7mlDIrjWrT7S0yEqTyraYpqOYvkeMhE8JL1Bjdjm5+gE84S+jUIeQPYZw5Vaog4
         Jwo3WjaCPUewtUmlpVgEj2oS9u9ThjAhB56v62cKyz++VkOlGHd8WWai0EFH5ecSpqfz
         R2JLb1P5d4rOvoHW1dCQ8+EYb2Vz6YOBlUx32rGHHrX76WJhX6dRHLgoedCHFRybK1bp
         o3Lcen96bPOG1lYukfFCN3n3yBsc+fOJCNyOloVkiNTPQmElkKk7kFPrAa2kWtQWrnpJ
         +GAA==
X-Forwarded-Encrypted: i=1; AL+hErG+p/ewLCQTh4nrWchsOVNsaK04HkGIfbJDmsgkF8qheYTaUAZ1TLi//ae/Cx6nukOQ9rJQZUBSc6s=@lists.infradead.org
X-Gm-Message-State: APuU4Z/56oK5QSqHIhya2d4xX5bNdN1tqJkIJwrIcNIJLHbABuKPpvnQ
	t+M1xuTntAppvbfdqchZ4uwmSd/vK6x/Jhu9IO+bI12GA1QT3sePKIlj
X-Gm-Gg: AYBFou0oCJPgABpulIoxV7EGv3V7S/8hSPOcFNGMi38+ekyozKmwpmA/DhuQNrD9PI6
	gEGuvpo6SOMaP4UYLLQmQtdg7KKXD/dzYQsmZZ4wah9+/env9SnqrdL5pzHS6mlHjaZznmQo6b0
	NYJBAeJx1w8XozOsVMQlY9OPABVt5AHHV/m9MSdL4qb9ARL50XtTF5ovqwkIbPFjmSP9ig99Stt
	e+WBsnD6Oib9sxKkKEAJZIVgTfXOsc2pIHTbr1YCb0yGgPBO5ixyoH7BNVdNiOmG4pBk/5Mr6nb
	qw4Mf/kXOd+X7XfCTB1kEPIhACwCe4kwP3U8GydWaIBIxRZJluyWWK177Jt/p32YMSD6etnnlOA
	1QgYXIHgh2hDKbVXi0apI524kbrG5asoScCdrjNXPm5XF6besF+RYs6VbFACq0l+mUojGYf19U7
	WRSezgFH42k3OHScPIomiOkXKXljfDb2yiYZtOYVtrlcU2nqQ4FiUkfv3LgC4K7rLOZ8BJX6VAu
	DhQEK09L0g3d8AMicB9SPzamMnmgZP0YdlmRMcFUT+dvraSEgZ8ZYrirOiv9rKse8+rYqy7NeyL
	fjnuaoZR31L1wyBFOSHAYQ4sCdi8BfqA1oE9Ig+h8ZmD3z0WrcJf9FOT0WiZv3kGDBzKPRECWeX
	B1s8L1Z+HijMYDRn4ntsw8yAFL4jucwUcR4liBl5SlUpcFfU=
X-Received: by 2002:a05:600c:8b02:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb7da1b48dmr25981005e9.17.1794983737429;
        Tue, 17 Nov 2026 22:35:37 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560ab70sm3069822f8f.30.2026.11.17.22.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:35:36 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de,
	linux-mtd@lists.infradead.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net
Subject: Re: [PATCH v4 4/4] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Wed, 18 Nov 2026 06:35:35 +0000
Message-ID: <20261118063535.4001217-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-219726@kernel.org>
References: <20261117214141.3826637-1-orgads@gmail.com> <20261117214141.3826637-5-orgads@gmail.com> <sashiko-outbox-219726@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_063540_227592_261E4AD3 
X-CRM114-Status: UNSURE (   5.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Does calling simple_map_init(map) break mtd_point() on little-endian
> Octeon kernels (CONFIG_CPU_LITTLE_ENDIAN=y)?

It does. memcpy_fromio() stays correct there (unswizzled 64-bit reads,
swizzled byte reads), but loads through a pointed address get no
swizzle. v5 keeps the semaphore accessors on little-endian kernels.

Miquel, Richard, Vignesh: please don't apply v4; v5 with these three
fixes follows in a few days.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
