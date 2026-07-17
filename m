Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63932C44515
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96q54Zmq6Fakkue8qkTNSOQ3CnouVcx9H+cNxUAYo+I=; b=VnEfQzw0dmqE1n
	GlXMCHTsx3nVl7xB6zbROfKLfT/aLb1k0FPH7lsg/8D/IIoQmOBGsMesqVxC1IadPyd8Liu6T27k7
	F+JNIPt4QJqtIJEyiQFhGk49AwOUcdFSaHouC/W2s0XUHgn4Zx+dKSpBrSnGqm4RjJZibRNUEgDry
	fqqbWVob8XgwcWvh2qwqgxYlqRO6G/dy47sjX1WEzpVcsyMiyinSMZuVqgzVLtY79F3IuDXDJk1zR
	d4qZCxXpIvzaOECGoyeWKHPJJ8rMKQdEiEL4slZPVpEkAlQ2oN4ndFDwCtjkDJoc7WV0SEgDv16JT
	bomqo0kS4DP8OsPyefQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpu-00000002fDs-1VKh;
	Fri, 17 Jul 2026 15:50:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpr-00000002f9q-3W6P
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:50:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 608A51A106A;
	Fri, 17 Jul 2026 15:50:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35F5260361;
	Fri, 17 Jul 2026 15:50:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AB3511BD091E;
	Fri, 17 Jul 2026 17:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHJZHOXUegGzTwvPHuKaTnOorkibtpxMhJXaYRbttLI=;
	b=LLJ8pPhy2IQAdaZDjmGTRfcdinAtyzSd5tGt7HBYzzMXRdLRaD4HipVVDKrdg1/HxUFDnk
	7TO7uBLWIipCbO+RgfWoDzN/FavUecAHUjSdGgLtsYPXTSWPCQtUnVWTVqgKKCYe1OYRLK
	Bbb/ezYaxdCqSPAfr1vWMsoMik3kOBpGz3VCkoTjeYEZnqKkSlrpmPJXUBLJBBae7hjWz6
	OUWO1svZmpxfSJtzAxshZHjJpPX58xzfIdotd3Ijc+v3E5VGAZrUTl5MIYI03di2pb+NDH
	AFXuru5JPz7Lbk3rPnYwz+QLZR+69JFP+ahBlfHICmvJtUQfwB797PxU/B/aHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: raoxu <raoxu@uniontech.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <11D80ECD6F2BBA62+20260713052203.3130998-1-raoxu@uniontech.com>
References: <11D80ECD6F2BBA62+20260713052203.3130998-1-raoxu@uniontech.com>
Subject: Re: [PATCH] mtd: mtdoops: free page bitmap when the backing MTD is
 removed
Message-Id: <178430344401.4129650.3604183866653317016.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:50:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_085048_021266_FE60BC97 
X-CRM114-Status: UNSURE (   6.91  )
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

T24gTW9uLCAxMyBKdWwgMjAyNiAxMzoyMjowMyArMDgwMCwgcmFveHUgd3JvdGU6Cj4gbXRkb29w
c19ub3RpZnlfYWRkKCkgYWxsb2NhdGVzIG9vcHNfcGFnZV91c2VkIHdoZW4gdGhlIGNvbmZpZ3Vy
ZWQgTVRECj4gZGV2aWNlIGlzIHJlZ2lzdGVyZWQuICBtdGRvb3BzX25vdGlmeV9yZW1vdmUoKSBk
ZXRhY2hlcyBmcm9tIHRoYXQgZGV2aWNlCj4gYnV0IGxlYXZlcyB0aGUgYml0bWFwIGFsbG9jYXRl
ZC4gIElmIHRoZSBzYW1lIE1URCBkZXZpY2UgaXMgbGF0ZXIKPiByZWdpc3RlcmVkIGFnYWluLCB0
aGUgYWRkIHBhdGggYWxsb2NhdGVzIGEgbmV3IGJpdG1hcCBhbmQgb3ZlcndyaXRlcyB0aGUKPiBv
bGQgcG9pbnRlciwgbGVha2luZyBvbmUgdm1hbGxvYyBhbGxvY2F0aW9uIHBlciByZW1vdmUvYWRk
IGN5Y2xlLgo+IAo+IFRoaXMgaXMgb25seSB2aXNpYmxlIHdoZW4gdGhlIGJhY2tpbmcgTVREIGRl
dmljZSBjYW4gZGlzYXBwZWFyIGFuZCBiZQo+IHJlZ2lzdGVyZWQgYWdhaW4gd2hpbGUgbXRkb29w
cyByZW1haW5zIGxvYWRlZCwgc28gdGhlIHVzdWFsIHN0YXRpYyBNVEQKPiBjYXNlIGRvZXMgbm90
IGV4cG9zZSBpdC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEv
MV0gbXRkOiBtdGRvb3BzOiBmcmVlIHBhZ2UgYml0bWFwIHdoZW4gdGhlIGJhY2tpbmcgTVREIGlz
IHJlbW92ZWQKICAgICAgY29tbWl0OiA5NTZlN2RhMTJjMTE0ZjEzYzYzZDEyNmFiMWQ3OWMzYjZh
ODE5MDYwCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFu
ZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29t
cGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
