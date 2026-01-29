Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAF3D73E80
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D414cEvLW7JdzFOo4INwYbh6doSiGD2KrADpqp230XE=; b=sWCEdENgsb+PrY
	6pz+OuAU9TluIMqAofgaADaFjbo6SP1p14w9qTlWT/TP8ItFf0iRN78PbW8vjPByxDdz2CYD8QeiW
	fs4cD+Eoo/f+Qr4eqA7ZMTkwJhyyl6XFSWwwjW+1Cal67HQemNvUdN0TtTAgG9QMIVLZTXKOb8fZD
	gzUTHyDb+yc28LQ+WBGv4BjMoIHe1GlTsRzcoa4/2NsO1mNMvhyJvH2PL5hxeQyGDZpFzaC5QTWtv
	040QOb1r39sDtG+pXrXz7hnSN9ItAa6y8AWZqC3c6mHH6uWqQHqSke2ZmaKt3I23kb14SancOSQf4
	r0J08u1UdvAWceQfr08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWZm-00000000UyU-0zTC;
	Thu, 29 Jan 2026 18:17:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWZi-00000000Uwo-3Ik3
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 18:17:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 858E31A2B11;
	Thu, 29 Jan 2026 18:16:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46DA260746;
	Thu, 29 Jan 2026 18:16:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDA98119A880F;
	Thu, 29 Jan 2026 19:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769710617; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L7YCBwBoaiRsPLE7Tj+P6CYrnlkYQ6LNmgLRcqLU6Iw=;
	b=09njaIxrADs4ZHcWn8GUP4wxztWbBxM2D7f61xWmWHrxE3ZR7CKy013fjSd8/qB6TMSX/a
	JNCLu7XYn2nL5Z6Mc5KRASm4VhYdBWZ491JRYwZfSu2UzThAoE6odkAmJeNvVOwH2fttdy
	mb8AYPMxwgz2P5f4WrDE4zIVolUcwMudMDkgycqJL5v5rT7+EDuF1M5ZKSKaBexCMvSZNZ
	bXjSl+4P8Eefb44AfDL8da2nkayhQJdnSBCQ5vdHgAYMoX9IFefUWlNwS3fPJs3FYxyDnP
	qn+o0o8mXu3IlMH6uFJLV/FoqbHlWCg3e6D92PtwCCZHogB92WQhKI0nYAmUZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: physmap-core: Prioritize ofparts for OF probe
In-Reply-To: <20260129-gemini-mtd-of-partition-parse-order-v1-1-c209dfd7c0ce@kernel.org>
	(Linus Walleij's message of "Thu, 29 Jan 2026 00:55:09 +0100")
References: <20260129-gemini-mtd-of-partition-parse-order-v1-1-c209dfd7c0ce@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 29 Jan 2026 19:16:53 +0100
Message-ID: <87qzr8l1wq.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101702_955784_52A90040 
X-CRM114-Status: UNSURE (   7.22  )
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

Cj4gVGhpcyBoYXBwZW5zIHdoZW4gYSBkZXZpY2Ugc3VjaCBhcyBSYWlkc29uaWMgSUItNDIyMC1C
IGhhcwo+IHRocmVlIHBhcnRpdGlvbnMgbmFtZWQgIktlcm4iLCAiUmFtZGlzayIgYW5kICJBcHBs
aWNhdGlvbiIKPiB0aGF0IHdlIHdhbnQgdG8gbWVyZ2UgaW50byBvbmUgZm9yIG1vcmUgZWZmaWNp
ZW50IHVzZQo+IG9mIHRoZSBmbGFzaCBtZW1vcnkgaW4gT3BlbldydC4KCklmIGJ5ICJtb3JlIGVm
ZmljaWVudCIgeW91IG1lYW4gInNwbGl0IGludG8gVUJJIHZvbHVtZXMgcmF0aGVyIHRoYW4gTVRE
CnBhcnRpdGlvbnMiLCBJJ20gYWxsIGZvciBpdCA7LSkKCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
