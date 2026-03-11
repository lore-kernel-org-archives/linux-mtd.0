Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876E11125847
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkRPjKWqGPvDWs9m2cNWMV8xz8YQl07d3ZbEk3WvBqI=; b=bvjqNfCLrdDB2k
	SHJPdSawhtsu9tQ2khp+/n+U9L87Y/SsSJxujrIZg/QSuiW6KPb3SbzrF7+AU9ZQ5Ss8JcRufVtxw
	w+W5wbdx5D9CVrqYSWDeg8hfhQ3icP4T1mDwg9glPIkdR2YcJYfsj9iUEqkCDsV9fQgV3vP1KDhR4
	rY7VG2cJDdPeq1h3/SqiWn4rBc3FM+MtL22OoM6rwjuVtbEPLhY8u71rkeJQwgnnkqbsShCSUN5gK
	lTdvhKLFa2wRYoE1rZUq/QHovcuJLRYUsDg9GVh1BxeU4WFJU/d+dvxhsQtCexxsoqDE+jFlhIzGC
	kAzOOyucibTNEsiuZwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRY-0000000Boi6-2a7S;
	Wed, 11 Mar 2026 15:25:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRV-0000000Bofz-0xoa
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:25:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2063C41588;
	Wed, 11 Mar 2026 15:26:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98BD760004;
	Wed, 11 Mar 2026 15:25:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 206BF10369C28;
	Wed, 11 Mar 2026 16:25:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773242747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qDYC6gMIjda1W+ekxn3OEPstANuf7EpN/Gc0f4A2X4U=;
	b=XjQtqzZ1LSJA7kNlU7eCeJq9Hz/u+dwBH9zx6BtAcZM6ZTW3FyGXwLButaUDqonLXAwRLY
	R1X5mRzI7vjwct/4BZc9MkDh7Wt3XW8chsZs/RgZTmUmwARtCXmSWmKIaFK51zb+cPwzVb
	lkBZo9JTJ7CZihcT6ZAR/KQOTF7iFg5IqiirfzGO7PFboZl/LsdIIrLYbLdgV8oTdC7z+1
	GatGDnshFUdbST0c0VIQ3hQooMVG1s3Q222Mb+dlYOm0fOb0DfZ/By0PgxkkXOwClJw0lG
	AtJ1/ChIeOOk/RucLM6wYENnbddhPynnnolBPTT/resmCnpmHHHdWpT5NGCfRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20260305224410.14251-1-rosenp@gmail.com>
References: <20260305224410.14251-1-rosenp@gmail.com>
Subject: Re: [PATCHv2 0/2] mtd: concat: use flex array
Message-Id: <177324274595.685435.1398058459578427934.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:25:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082549_439465_A7A7648E 
X-CRM114-Status: UNSURE (   6.74  )
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

T24gVGh1LCAwNSBNYXIgMjAyNiAxNDo0NDowOCAtMDgwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
U2ltcGxpZmllcyBhbGxvY2F0aW9uLiBUaGVyZSBtYXkgb3IgbWF5IG5vdCBiZSBtaXNzaW5nIGZy
ZWVzIGhlcmUuIE9uZQo+IGFsbG9jYXRpb24gaXMgc2ltcGxlciB0byByZWFzb24gYWJvdXQuCj4g
Cj4gdjI6IGZpeCBtaXN0YWtlIGluIGNvdW50ZWRfYnkgaW4gZmlyc3QgY29tbWl0IGRpcmVjdGx5
Lgo+IAo+IFJvc2VuIFBlbmV2ICgyKToKPiAgIG10ZDogdmlydF9jb25jYXQ6IHVzZSBzaW5nbGUg
YWxsb2NhdGlvbiBmb3Igbm9kZQo+ICAgbXRkOiBjb25jYXQ6IHJlcGxhY2UgYWxsb2MgKyBjYWxs
b2Mgd2l0aCAxIGFsbG9jCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEK
ClsxLzJdIG10ZDogdmlydF9jb25jYXQ6IHVzZSBzaW5nbGUgYWxsb2NhdGlvbiBmb3Igbm9kZQog
ICAgICBjb21taXQ6IGM2ODVlNmU4ZDg4ZDU0NGU4YzQ0MjliMDZjM2U2Nzk1Y2JiYTMyZGQKWzIv
Ml0gbXRkOiBjb25jYXQ6IHJlcGxhY2UgYWxsb2MgKyBjYWxsb2Mgd2l0aCAxIGFsbG9jCiAgICAg
IGNvbW1pdDogZTE5ZWFmZmM1MjEzZmRkNjE3OWU4NDlkMzAzMjkyOWZhZTBkOGMyYwoKUGF0Y2hl
KHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0
IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVu
KS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
