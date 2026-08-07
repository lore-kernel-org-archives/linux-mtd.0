Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DAFC5ACAB
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W69JVXmFdROEMFTpq6meYKivq6zaeujky+WIFON+iPc=; b=yp2BnG5yxxnnTL
	hAAznpbeZBolfFIoAlXEVjO5sR0BiLctKzloehFhoXydo6CXzs6ECVTiVCRp2Tf/tNjkBLtIB3j0q
	6R+KhUB/VC0CCRNcLu3aMWeQ7HH1tkFfNNFVn0JCK+iPd4owMcK6lfI/XSGfWbRKwNG2a7IIyKo7C
	YO2nbHkoov8a8Gq/2SBH6WyX5pYzAdXf/ZG3zPkjFBgTfCGnob0W+2SKQm6X3hStP8vM+zKFXh0pg
	9Nlz7YTj94j8KTO7GtoNK4nB0IWcKTvnvnQ3BIPIWbu+1RpxME6RuQQ4MVvXenRXkWHftzydILIbN
	U3Fk+rVwDbFNH123DywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL9M-00000008Dqw-29l3;
	Fri, 07 Aug 2026 14:02:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL9K-00000008Dq3-13jO
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:02:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CBE571A14AF;
	Fri,  7 Aug 2026 14:02:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EA4C603F0;
	Fri,  7 Aug 2026 14:02:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB22511C37966;
	Fri,  7 Aug 2026 16:02:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WTbfIN0QP8NuY9hKSdTbaVkgz7TDJymj9rW0pljfkBQ=;
	b=wN0Ix8+xIAhBO7ZTAeuX3KO02751Bnh4JwjoEm249Zvypyan+hr0cnqytp40phtkKIBDki
	yhznG+gJOEuxKqxIZGVBwM01CljwjU8LTsNg5w+KPiBiftVazrHjQlxVoO1+6Qasm9C5FC
	LJWHeEw1rIZ/Etf9FZiK02jHBo1Dr/qpmSZwDFVoYhJSenzLv0ysYkjnKXDN+I7gmAP8pE
	PjWmAyqumbevVnwLFZHgTyN4KOcbKhkUKEEEMo8CCD1GFKdkNi8rmtZCVKlL6CkJQ4NC/Z
	Fuv5a0TT9130oN7TkxbSxU3t8dI5hBn8p8CRxSu6m37tx8GOnk/qp2XrNuRo+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Julian Braha <julianbraha@gmail.com>
Cc: arnd@arndb.de, sean@mess.org, andriy.shevchenko@linux.intel.com, 
 rdunlap@infradead.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260722220618.198164-1-julianbraha@gmail.com>
References: <20260722220618.198164-1-julianbraha@gmail.com>
Subject: Re: [PATCH v2] mtd: maps: remove dead select of
 MTD_CFI_BE_BYTE_SWAP
Message-Id: <178611132874.763513.10124405560170395066.b4-ty@bootlin.com>
Date: Fri, 07 Aug 2026 16:02:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_070214_456774_7BD0B408 
X-CRM114-Status: UNSURE (   6.13  )
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

T24gV2VkLCAyMiBKdWwgMjAyNiAyMzowNjoxOCArMDEwMCwgSnVsaWFuIEJyYWhhIHdyb3RlOgo+
ICdzZWxlY3QnIGRvZXMgbm90IHdvcmsgb24gY29uZmlnIG9wdGlvbnMgaW4gYSAnY2hvaWNlJywg
c28gY3VycmVudGx5IGl0IGlzCj4gcG9zc2libGUgdG8gZW5hYmxlIE1URF9QSFlTTUFQX0lYUDRY
WCB3aXRob3V0IE1URF9DRklfQkVfQllURV9TV0FQLgo+IAo+ID5Gcm9tIGEgcHJldmlvdXMgY29u
dmVyc2F0aW9uLCBpdCB3YXMgZGVjaWRlZCB0byByZW1vdmUgdGhlIHNlbGVjdCBlbnRpcmVseToK
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYzYyNjgxODQtNDkwNC00OWQ5LWIxNGYtMGUx
MWRjZThiZGFkQGFwcC5mYXN0bWFpbC5jb20vCj4gCj4gVGhpcyBkZWFkIHNlbGVjdCB3YXMgZm91
bmQgYnkga2NvbmZpcm0sIGEgc3RhdGljIGFuYWx5c2lzIHRvb2wgZm9yIEtjb25maWcuCj4gCj4g
Wy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbWFwczogcmVt
b3ZlIGRlYWQgc2VsZWN0IG9mIE1URF9DRklfQkVfQllURV9TV0FQCiAgICAgIGNvbW1pdDogOTRk
MzJmMWFjZThlZTNlZjM1MzdhYzZjOGU3MWI3NmE0MThhNDc2MgoKUGF0Y2hlKHMpIHNob3VsZCBi
ZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0
IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVn
YXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
