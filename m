Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA1606BC9B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TxaoiS+m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=17SXczhd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H8LMwLcqVJTDEd2ETNiJqEtrS3vnZqquvLHQAVqlAE0=; b=TxaoiS+mXVmUpM8VCaiVO/CARD
	X+mNUVyXlo+EKa1CoHORmkPlmWFAzP1ZjKw506CbX11sCZ9gJGFsauBUMClWsEY5e1CjYODy1T+sp
	ntT3Hcw1Bt1oJGa42qX1FdeBNt/5gT1ACQ9YYxRAVB0JtcDwRP70ZiTjGgUuVjZX0xckD8xYCD1Qw
	ob4WKIAiJD0VGhhr0uEeXbUVno1ToMNEYZ69NF+juIhwrBTiGtgk866LSZDb4Xp9i2kmQXAV02rfo
	zUsZdmosgkpXHarr0ObqtMgNDbbcOwtmJ/H4GjW6qFRCfQjk3+5QIXwqyBWts3nE+DaXN/uDLb/vO
	dy4p+jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ9s-0000000FLlb-411k;
	Fri, 20 Nov 2026 15:04:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ9p-0000000FLiU-02Yq
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 15:04:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C00D1A174E;
	Fri, 20 Nov 2026 15:04:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58653601B9;
	Fri, 20 Nov 2026 15:04:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFB5A11BC02BF;
	Fri, 20 Nov 2026 16:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795187042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qTsVWDFIN84DHt+aCPVV0qGJJbilxMxMCdLcxlnYey4=;
	b=17SXczhdsGQgnzYyaX+DdmSQiY9lY1lgd5mlOS8ckNA/+SdtTzJTUyIUZnJbb0LAvXITvX
	c7TvhPYX6GInBZflUf3B8+g3a0Tp6gxYnkWJkFRH8hZxTYkQdljFs8JFzNrD0HNyvbjOTI
	7IuvCOsy5/0Kqdnt0PXDHEFE0tZPF275pP82yLebkHbB1Hs6euMVj9aG0cVmsnjI8GbknV
	ytnxMwYduRaERuSQN2XNNO3r5CSbN80y//qYYEqs5avwFAb19loYMDvfyueT1qjDMCb46D
	aMqmkm2wbxYK1BmkCOTlyXtruFqG1ex/GyRacSsgEFz27RyLw83aV3IqUXQpnQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <dwmw2@infradead.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wang wei <a929244872@163.com>, stable@vger.kernel.org
In-Reply-To: <20261108-submit-nandsim-overridesize-bound-v1-v1-1-9cde7657a69b@gmail.com>
References: <20261108-submit-nandsim-overridesize-bound-v1-v1-1-9cde7657a69b@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: nandsim: validate overridesize before
 shifting
Message-Id: <179518703904.3404688.2705223904736724197.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:03:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_070409_215491_5E7A6507 
X-CRM114-Status: UNSURE (   7.48  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCAwOCBOb3YgMjAyNiAxNDowMTozOCAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gVGhlIHNpemUgb3ZlcmZsb3cgY2hlY2sgc2hpZnRzIGJ5IG92ZXJyaWRlc2l6ZSBiZWZvcmUg
dmFsaWRhdGluZyBpdCwgc28KPiB2YWx1ZXMgYXQgbGVhc3QgNjQgYWxyZWFkeSBjYXVzZSBhbiBp
bnZhbGlkIHNoaWZ0LiBTbWFsbGVyIHZhbHVlcyBjYW4KPiBwYXNzIHRoYXQgY2hlY2sgYnV0IGV4
Y2VlZCB0aGUgd2lkdGggb2YgdGhlIGxhdGVyIGVyYXNlYmxvY2stY291bnQgc2hpZnQuCj4gCj4g
VXNlIGNoZWNrX3NobF9vdmVyZmxvdygpIHRvIGNhbGN1bGF0ZSB0aGUgdW5zaWduZWQgZXJhc2Vi
bG9jayBjb3VudCBhbmQKPiByZWplY3QgdmFsdWVzIHRoYXQgY2Fubm90IGJlIHJlcHJlc2VudGVk
LiBEZXJpdmUgdGhlIGJ5dGUgc2l6ZSBieQo+IG11bHRpcGx5aW5nIHRoZSB0d28gMzItYml0IHF1
YW50aXRpZXMgaW4gNjQtYml0IGFyaXRobWV0aWMuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFu
ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IG5hbmRzaW06IHZhbGlkYXRlIG92
ZXJyaWRlc2l6ZSBiZWZvcmUgc2hpZnRpbmcKICAgICAgY29tbWl0OiAzODhjYzhmOWM1MTE2M2U4
NDlhYzlkNzQ5ODAwZTA0MzVkYjc2ZTUxCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBv
biBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVk
IHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
