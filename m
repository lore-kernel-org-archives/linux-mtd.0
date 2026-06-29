Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771C2C43638
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InfMcERTsTVGif0WL95N0fHkD3a7H6L81PHNH69BMRA=; b=4dq7HExLAKk3OJ
	L99qZRZ3xsNT7lzZI7VKK410ftZzZQ2oXnXfBtIEw/nLkgag+oUvjXHDSfHv/+xL2fpjK3p+NmDlY
	GwSXrpKbY5M6uNEz62WmEpoiGYZ6wPRkxP7GNZEDdQ+yvN1oip6KlTm6Rqno8Pe1+FT64/jUtxPbV
	3eiQujjinyQGxoYUzLXSiFjMLwQiwTR5fn+1t6lKtAzUuO+rJJ02CwOtH8Mm6jwqQmUacaLTk47Pw
	Vm6J5NZFBEBEqwcaQj1wmlVnWBTXvtW9KxsiEtu4MiEQL8cAnQ4bdFt6HxOhCUBrbkaxx5JOb+Sc5
	1wblXWVsPYGR8EqMjJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDg-0000000Ev1E-2KEF;
	Mon, 29 Jun 2026 14:44:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDd-0000000Euxx-2OXE
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:44:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E2554E407AE;
	Mon, 29 Jun 2026 14:44:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E70C95FF96;
	Mon, 29 Jun 2026 14:44:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80779106F0B48;
	Mon, 29 Jun 2026 16:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FuM6aR0sI87qisAcAl1wIRRMYWFMxCT2rE4zY1xR0dY=;
	b=BFF6EEMZTk7fBMwieVU/lTXhYLKqQzU4sTVZz3EWvbpjA+f3g3CRprRRVdbOPPgQplmwUB
	Ul3RTYmtpwEBDd47ExEWl8uFz425rhyO70h0s+dS4hghhU4wKbe46YPGmQ6a/5MyLA7Gqd
	j2wWO4QYa6vYHupKAvcwiM1te5R0YsAo7lkC2QUZu5v88mSxbmORUysMfPrX3i4aHNC8J6
	ZqKiqLzSBR63HH7ARIAc9PcMS0b1D8KSvajZexq6Ux0VGz4iF4XD+f2UOA9quRdlZbJTkr
	isvvPlKmWHp3Xift21xMBSG1etmzljC0retDpmG84SZo9+6pJjzQNlnYPSM9Vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, 
 Nikolay Ivchenko <nivchenko.dev@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com
In-Reply-To: <20260620170603.334732-1-nivchenko.dev@gmail.com>
References: <20260620170603.334732-1-nivchenko.dev@gmail.com>
Subject: Re: [PATCH] mtd: mtdpart: fix uninitialized erasesize on
 MTDPART_OFS_RETAIN error path
Message-Id: <178274425422.260178.18093225003400970337.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:44:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074417_744808_5F6C369B 
X-CRM114-Status: UNSURE (   6.19  )
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

T24gU2F0LCAyMCBKdW4gMjAyNiAyMDowNjowMyArMDMwMCwgTmlrb2xheSBJdmNoZW5rbyB3cm90
ZToKPiBXaGVuIHBhcnNpbmcgcGFydGl0aW9uIGxheW91dHMsIGlmIGEgcGFydGl0aW9uIHJlcXVl
c3RlZCB3aXRoCj4gTVREUEFSVF9PRlNfUkVUQUlOIHJ1bnMgb3V0IG9mIHNwYWNlLCB0aGUgYWxs
b2NhdG9yIGp1bXBzIGRpcmVjdGx5Cj4gdG8gJ291dF9yZWdpc3RlcicgdG8gcHJlc2VydmUgcGFy
dGl0aW9uIG51bWJlcmluZy4KPiAKPiBIb3dldmVyLCB0aGlzIGp1bXAgYnlwYXNzZXMgY2hpbGQt
PmVyYXNlc2l6ZSBpbml0aWFsaXphdGlvbiwgbGVhdmluZwo+IGl0IGF0IHplcm8uIFdoZW4gYWRk
X210ZF9kZXZpY2UoKSBpcyBsYXRlciBjYWxsZWQgb24gdGhpcyBjaGlsZCwgdGhlCj4gcmVnaXN0
cmF0aW9uIGZhaWxzIGFuZCB0cmlnZ2VycyBhIFdBUk5fT04oKSBkdWUgdG8gdGhlIHplcm8gLT5l
cmFzZXNpemUuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8x
XSBtdGQ6IG10ZHBhcnQ6IGZpeCB1bmluaXRpYWxpemVkIGVyYXNlc2l6ZSBvbiBNVERQQVJUX09G
U19SRVRBSU4gZXJyb3IgcGF0aAogICAgICBjb21taXQ6IGFlOWQ4MDU4ZjEzMjM4Y2FkNWY1ZDE2
ZjY3NmRhOTExODc2ODQ1ODEKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9s
aW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBu
byByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
