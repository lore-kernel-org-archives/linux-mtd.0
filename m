Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065B2606A31E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SCQwpIfA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tT/ippcm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0tCKfF096ucw4Z4tlOs8YJEE0p26xCdfjRBksTq3YlQ=; b=SCQwpIfAAGjjf8/Fn7nI9qIveA
	YQi9Tulu6vVeGFJufHcmst6NRyvcqNzx+gEk+fjG2gMkGi31euqkbqeIcVSoV8eVfmxfuZEdL+N0F
	oQkz8xzLKLkTagbHZYcxvTzT3FHAAYajJ+V2AcEC5fCzqPYjxpqnKda90+8Q47Giuw+N13TlI1ykt
	Dx0rsiFtO+fNhnsNZlDK63/p0KH481VAKlTetyRv4LlmGJTT6sqAmvFUaC6GoVf1tDo9CwiNB/CoP
	ifBExCd+3F98hLYV1uwOtrtjzpn2+8Z0aakGACss8bYNcGLxuige1wxq08jlj0dPCz65m83Aefp1g
	cSNOpZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo5u-0000000BvYz-1rU0;
	Fri, 30 Oct 2026 15:00:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo5r-0000000BvWy-2Ja1
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 15:00:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A9C15C49F62;
	Fri, 30 Oct 2026 15:01:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF7B1603C2;
	Fri, 30 Oct 2026 15:00:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58361103290E8;
	Fri, 30 Oct 2026 16:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793372427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dDd4BvTxSR0uBUQSKnRsKxmPO1GwP0bmDkHq0sbZkg8=;
	b=tT/ippcmnCNVkD9eNIMcwRGmgxafKoPkU+RG3W6+YYfU0nD9mMZlbMUs0P4gsz6LrhbyMN
	rYA8UPWtheXltmOKXmEF6gK1qBiKb4uPhX/DLGrTj/uG+Ha9tnYveuAort6dkWRxAmObGI
	S8CViDNR6AaeTEc00Bdym1et9NikSbzEsgcWNXbbXByt+bPDDOIQWqiW2ZLJ5srVW0JIWQ
	D9me8mITD7M33g+Yb9nT2LdtOsjjCIvkJyc3n85Z+9s/o2R0CBhfEcyNFWDzEJtxWlJWqd
	g86fonp5h9z9byzlHsKwez18YWY3yojofoL2lmvdx9ujBCWwtZMljrWJT13saQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Han Xu <han.xu@nxp.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Richard Weinberger <richard@nod.at>,  imx@lists.linux.dev,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
In-Reply-To: <20261030143945.2923554-1-samarth.colleges@gmail.com> (Samarth
	Narang's message of "Fri, 30 Oct 2026 14:39:45 +0000")
References: <20261030143945.2923554-1-samarth.colleges@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 30 Oct 2026 16:00:23 +0100
Message-ID: <87zevvcjy0.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_080035_759836_CA8DC567 
X-CRM114-Status: UNSURE (   9.13  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3Bt
aS1uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBp
bmRleCA1MjcxNjVjY2MuLmE4MTA2ZGUyYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9n
cG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBAQCAtMjY1OSw2ICsyNjU5LDggQEAgc3RhdGljIGludCBn
cG1pX25mY19leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAlpZiAoIXRvKSB7Cj4g
IAkJZGV2X2Vycih0aGlzLT5kZXYsICJETUEgdGltZW91dCwgbGFzdCBETUFcbiIpOwo+ICAJCWdw
bWlfZHVtcF9pbmZvKHRoaXMpOwo+ICsJCS8qIFJldGlyZSB0aGUgQVBCSCBjaGFpbiBiZWZvcmUg
aXRzIGJ1ZmZlcnMgYXJlIHVubWFwcGVkLiAqLwoKUGxlYXNlIGRyb3AgdGhpcyBjb21tZW50LgoK
T3RoZXJ3aXNlIGZpbmUuCgo+ICsJCWRtYWVuZ2luZV90ZXJtaW5hdGVfc3luYyhnZXRfZG1hX2No
YW4odGhpcykpOwo+ICAJCXJldCA9IC1FVElNRURPVVQ7Cj4gIAkJZ290byB1bm1hcDsKPiAgCX0K
Pgo+IGJhc2UtY29tbWl0OiAyNGExOWI5NTNlMmEzZDBlYTVhOGM0OTUxYTBhYjhmMzI3MjBjOTA3
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
