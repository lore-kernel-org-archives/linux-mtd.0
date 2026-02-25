Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180F5FD3774
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qW2E+QTFPMK+MY7egraZsTNb44KG4+cD1ueQEY98qaE=; b=BxrBcdMpPrcqsw
	xq1UXNZyy9kPqfZlYwGzIebyWd33GzLFUDhMOeCUKMzeA/cnLj8yDK/poZc+9I+THUx7lVKAu4hnU
	JkLRzvHO0PUs++gdzvR552eaE4CPNayOXwhIfzannrmJYpLH+M8yKL7tW2C6hmU2O2DEH+RQ6JYVP
	A/LtLkZzDMRIU2p1QsXhuxjue9SejXQcXNrNrsyjRFU9SDruddt1BnD/wE2N01QhhM1eSk6pmTYpp
	CDOJdQ16MI2WjBD/2AoNNwLTHrSdj6TDCYOL/s9yoWVzPzKwZGf6bHkM5D9Q2La5NnL76o91UGNMW
	gKggf9QGuMhewA47eMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHxp-00000004YH6-1gqh;
	Wed, 25 Feb 2026 16:42:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHxo-00000004YGN-0oLy
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Feb 2026 16:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=fdAfjryxA3Lp3LiOFTQyRALLhnGHpH7v51pUu8Vvri8=; b=S682K0XfbkgXAxZGfoyJ31Owyr
	CL9Aw4C5lXmChV48+kilccwSb/Z0/YqLVhSBCikNZQNimgk5Ww8ObS2vHshuoz9qmHFGAnYuPJ+Ks
	whJw9AqOJwPT5ggExvY4sW//hx9nKe5QB1/QAdsy7Ievh7hp3GApodY6ADv+6/KJIyLg49BrwFQlO
	d5PCoi9Va3SZ/09G0b63zZDT78tVhTuP3nuwYJJYrnM2v/DmkH+w8SXpgICfSTAT5rpIHcH41x7Gs
	tfKXsX4s76LWxzkRc8QXpGXEyeNasm0ozPWqCyeqACSG7IBWdn6U48uJSdWkyFoMj6Sn3pRa42OTZ
	qWRN5nBg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHxl-00000001LbZ-0fMY
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:42:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8258BC143FD;
	Wed, 25 Feb 2026 16:42:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 288D25FDE6;
	Wed, 25 Feb 2026 16:42:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A229510369259;
	Wed, 25 Feb 2026 17:42:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772037725; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fdAfjryxA3Lp3LiOFTQyRALLhnGHpH7v51pUu8Vvri8=;
	b=lqQzSEdup+2YhwQw8Im4WUmOcq8rVFPQ7BwjrcIgX+nx+IG/CDUQwurRkebMxuLDChqic7
	Te+qrBrz+ryGfOXO5s4NDUHR7alQ0lEKFvfXcJ7LvoyxhdTY0ofevv3pu2e7rn9qsdvJNY
	Mh2ZB+ahtOnBM261gfUCzny3/FaZpKH1ZGUhcfHe8xgDV0ESMBiD25z66VrM7DdgHQdZsR
	CAhFRK9tGcFgE+zXtVqsYbRF9h4GXlW+OYde3VMbYVq9zJytHy45pWlaMvhhJMavWSY6WI
	a1Utll+Qhyk0+3O1jFB0OiD/mjCPDjZCEjfSE1jRUqGZUgQsoeRwxx2/U4684w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel@desktop-tit0j8o.localdomain, Raynal@desktop-tit0j8o.localdomain, 
 Richard@desktop-tit0j8o.localdomain, Weinberger@desktop-tit0j8o.localdomain, 
 richard@nod.at, Vignesh@desktop-tit0j8o.localdomain, 
 Raghavendra@desktop-tit0j8o.localdomain, vigneshr@ti.com, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Markus Stockhausen <markus.stockhausen@gmx.de>, 
 Ahmed Naseef <naseefkm@gmail.com>
In-Reply-To: <aYbjk7vRA/gMZPSx@DESKTOP-TIT0J8O.localdomain>
References: <aYbjk7vRA/gMZPSx@DESKTOP-TIT0J8O.localdomain>
Subject: Re: [PATCH v2] mtd: nand: realtek-ecc: relax OOB size check to
 minimum
Message-Id: <177203772283.1981785.1872888061577311082.b4-ty@bootlin.com>
Date: Wed, 25 Feb 2026 17:42:02 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_164213_276230_ED0E8C09 
X-CRM114-Status: UNSURE (   6.80  )
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

T24gU2F0LCAwNyBGZWIgMjAyNiAxMTowMjo0MyArMDQwMCwgQWhtZWQgTmFzZWVmIHdyb3RlOgo+
IFRoZSBFQ0MgZW5naW5lIHN0cmljdGx5IHZhbGlkYXRlcyB0aGF0IGZsYXNoIE9PQiBzaXplIGVx
dWFscyBleGFjdGx5Cj4gNjQgYnl0ZXMuIEhvd2V2ZXIsIHNvbWUgTkFORCBjaGlwcyBoYXZlIGEg
bGFyZ2VyIHBoeXNpY2FsIE9PQiB3aGlsZQo+IHZlbmRvciBmaXJtd2FyZSBvbmx5IHVzZXMgdGhl
IGZpcnN0IDY0IGJ5dGVzIGZvciB0aGUgRUNDIGxheW91dC4gRm9yCj4gZXhhbXBsZSB0aGUgTWFj
cm9uaXggTVgzNUxGMUcyNEFEIGZvdW5kIGluIHRoZSBOZXRsaW5rIEhHMzIzREFDIGhhcwo+IDEy
OCBieXRlIHBoeXNpY2FsIE9PQiBidXQgdmVuZG9yIGZpcm13YXJlIG9ubHkgdXNlcyB0aGUgZmly
c3QgNjQKPiBieXRlcyAoMjQgYnl0ZXMgZnJlZSArIDQwIGJ5dGVzIEJDSDYgcGFyaXR5KSwgbGVh
dmluZyBieXRlcyA2NC0xMjcKPiB1bnVzZWQuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9u
ZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IG5hbmQ6IHJlYWx0ZWstZWNjOiByZWxheCBPT0Igc2l6
ZSBjaGVjayB0byBtaW5pbXVtCiAgICAgIGNvbW1pdDogMGM3NDFiOGI2OTYzZTU4NGI0MWMyODRj
ZDc0M2M1NDU2MzZlZGIwNAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
