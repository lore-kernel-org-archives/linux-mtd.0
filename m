Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2315D606A31A
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gGdazNpg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sXDDSVHp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OI4uWt5W98FLdUystNAdqtBUhUVnE4aI8kG3LKwwPMY=; b=gGdazNpguVuhJqTjOJlXjVcNAG
	je0V/10dgZzkor5Qc0IsAeNLMOMocrR3wT6K+Ea/8q5gCM1W7uVRidD6RQvKpjOWXeCJToZqPAbBY
	z+wjkt7OiYTZD5inMn3JP9I09PYlX3c24hR8yuH1H+NCCHnSUw86j6O9JadSvaIaVM8fe/HK2n8ph
	/mJ04TShb1zoQGsIEetrSFI95V0Iqe1TL/yBjECwoaJKSr2XmJlB4Neda7T+5r+caKSzUEjm9fhfW
	XNAYF6r0a+02NRMmqR9XeKhJ7s6yveL9jPOvOr9cC+sGB2Cl1WwwNhakfIfiWsCkyu0auUBdLpq/l
	bwN5b8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIZH-0000000GhjT-2497;
	Fri, 23 Oct 2026 16:56:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIZB-0000000GhiH-1WFo
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 16:56:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B01371A12F8;
	Fri, 23 Oct 2026 16:56:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B1E260398;
	Fri, 23 Oct 2026 16:56:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36EB8103284BB;
	Fri, 23 Oct 2026 18:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792774586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AXFgqiDomgAQWMawZVkg5333oANlEmLGODXfnaq56gU=;
	b=sXDDSVHpGcxJJ9Z5cK8OLnjEq7gtAke6xQuIq+UQYrbiIg9DBWvvLGv2VjHEpTFO4MIiIX
	4RXmnbykGxpq/JxO3StZiJIkuQF/1WGQd54C/Q5Y7JBTuYtOQQFaD2/zZ2q9ZSR1JP06x4
	i5s0H3BCeuRQYOhwovT2gui7bII731UEPBmaMLLE4WC+mEMMIwXZ+rca0jFgv73/ZTV3Lx
	DskMm6YKkLefk5e7cflBGAz3Q69+1xiXVrbTmLb4+bM33uEDiWBG6Qbw9UuczdWTSPRC4e
	1zNfQFecOTH6Jv3nkVO85IpdOihDz149CoEtwjvB6u3TJJZ8ouJJ6SlKNaEZkQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Michael Walle
 <michael@walle.cc>,  Pratyush Yadav <pratyush@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: nand: Changes for 7.4
In-Reply-To: <87bj8knz1t.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 23
	Oct 2026 18:48:14 +0200")
References: <87bj8knz1t.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 23 Oct 2026 18:56:24 +0200
Message-ID: <87tsmcmk3r.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_095630_176117_CAA5999E 
X-CRM114-Status: UNSURE (   2.85  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> This is the NAND PR for 7.4.

Merged into mtd/next.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
