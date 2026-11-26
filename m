Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4285F606A326
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3kDhm3eQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lJu2H4Hk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HFL3yEdtq5qbY1bh5M4sRfCWD5jQ34WsWnCgwJHGcB0=; b=3kDhm3eQJLddx+Iakg0JFIG7eX
	7isfZo7+wVPbMldKiQmKgFiZt529ogKFACLFdjdRgd6QSdcDivDz8INWcDH2tWVoEQ07hoo6F88qy
	d1NAgwpsFYJSJUEfkU3wJUs66BNrNa3aWPNy3pAIC3SyqiBrFhz98JNCSDYQWmNtUh36jJZTSRJGh
	PlR7BcwJp2PYezVM6lARoNrj3l7KiAY7jUpATk823WSFuyleBd4wVnCGOWKG5GN886IWo6WAB2qAi
	MHAutFZCGwO8e6plcO5MA51yL3H6kF/eB+jlZnV/AWwElBS2Z/9bIkbdaTmnmVvdzHGgGO2wMpY1n
	TRXiO1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb10-0000000Debe-2NAX;
	Thu, 26 Nov 2026 15:04:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb0w-0000000Deap-11j7
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 15:04:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 45B26C2B9D1;
	Thu, 26 Nov 2026 15:04:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D58AE604ED;
	Thu, 26 Nov 2026 15:03:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B2E811E69022;
	Thu, 26 Nov 2026 16:03:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795705433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cXAbbENRHdarSgHRXIAEN8kf2z9aY1mP+g/6wPRUGSw=;
	b=lJu2H4HkhSU19ssS/2UIAUGPBMMsESe6yl5UG4PV4r/4iaYAmboj6/1rQXD/NGr5VRtqqW
	M7E5dD67FYaQtp/QNRqrHoRlAhP312Hiu5gM/HreBVwoZgktPbjONp843Poii724FBzOxR
	Rj9g+9HWGb0X/aCPZ3AcRasRjb9iPbIBWtPG3Lhdf4TL9CyJiIOBlWHsnmlvHOguCcVeqg
	UpL4szb8nVrohyl/LIJy86bnMc3QDBfQGhq0k01gTqW2xBNCGEmRDWgwFjg3tKh6GtV/w8
	Px+u05ih5Cg5+Gv588hd91HL00tw62Jne73qQftzr2nEGE1NNJ2c2A6J/99GBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Cheng Ming Lin" <linchengming884@gmail.com>,  "Marek Vasut"
 <marex@nabladev.com>,  "Pratyush Yadav" <pratyush@kernel.org>,  "Richard
 Weinberger" <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,  "Maarten Zanders"
 <maarten@zanders.be>,  "Cheng Ming Lin" <chengminglin@mxic.com.tw>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
In-Reply-To: <DN01NSO0FLT0.11GY6QPV7JVR4@kernel.org> (Michael Walle's message
	of "Fri, 20 Nov 2026 13:41:19 +0100")
References: <20261024001658.222147-1-marex@nabladev.com>
	<8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
	<20261028081534.945416-1-linchengming884@gmail.com>
	<DN01NSO0FLT0.11GY6QPV7JVR4@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 16:03:47 +0100
Message-ID: <874id3ws6k.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070358_435961_AABC9B07 
X-CRM114-Status: UNSURE (   6.05  )
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

Cj4+IFdvdWxkIHRoYXQgYmUgYW4gYWNjZXB0YWJsZSBkaXJlY3Rpb24/Cj4KPiBZZXMgYW5kIGlu
IGZhY3Qgd2l0aCB0aGUgcmVjZW50IGNoYW5nZXMsIHlvdSBzaG91bGQgYmUgYWJsZSB0byBzZXQK
PiAucmVhZF9zcjIuCgpJIGFtIGluZGVlZCB0cnlpbmcgdG8gc29ydCBhbGwgdGhpcyBvdXQsIGhv
cGVmdWxseSBNYWNyb25peCBmbGFzaGVzIGNhbgpsZXZlcmFnZSB0aGUgd2hvbGUgUUVSL1NSIHJl
d29yazoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjYxMTI2LW1hY3Jvbml4
LXVwc3RyZWFtaW5nLXNwaS1ub3ItY2xlYW51cC12Mi0wLTY3MmE1OWFiZWQ2MkBib290bGluLmNv
bS9ULyN0CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
