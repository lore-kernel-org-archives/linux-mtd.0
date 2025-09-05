Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986E4CAC580
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Sep 2025 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNr+TJhyY8ocCI2ihnF4aKzuAxkt/KskuC/67ZW4Fgk=; b=g+O8SmckCFT50t
	QQwoeHd/FSeD2oO0V8dg8azJgWKs/Np3K/4YVo9dfsSNgxigb3nddI9/8exe1NCObwMkBnLXxOe7S
	1bxuYLqkaaaETIHuXyaFXotoFtNGj4NgIW/sXSKG/0VfKd42wup0pgEz6ADjz+8Me97j653ohRgq6
	vwckKMpTRqUBOn6DniDzPXQc6JugxSCUQLZkZ11wJtCDbSLo2LNRJeBu9USzGV10IExXMsd8PIPi4
	7rRaUwSTKn68+IuTO+vSoMUgNWNlJqz9um5PYtt/0r3WBU1zrrPOy4diqhOUVr4Bq6SjzUYxBTwrF
	xKChFlXUKaFzbDYBIfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc54-000000046v7-3pqt;
	Fri, 05 Sep 2025 19:26:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXrI-00000002XMV-0nFn
	for linux-mtd@bombadil.infradead.org;
	Fri, 05 Sep 2025 14:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qdhTArbNaDMxsjs34Ef1EAsaB5kOJ8TTb3Y4r3qV6wk=; b=YsNctEdYOET3ZTb/321vCI0Pd6
	wniCS/vbPEjW5g3vuQicO/2C3fw7yvCzD6tWgxR1JeL99Yi3ot9mZg4PWyNuzwmwupfeg8kNPSUmB
	m5CFfmkqIRh5Ny74HFn9m3GMC75NuBgS2AWkpkuPGYX+5D406Il0Umur2hk3gyS88YFkgbN0XPJtg
	mro7q2x/iSOfyoeIod3WCgSzanZxWMIGlLWpnniXHYB7G3GHk0qwHw35hOkZIq55apB05wrpb0RNk
	MwKykgUsDSp/XviA2wR1DsjLnzG7yue8JHzEVaBpkZ51ctSGUxKKyk/CkIry114bCrDhpMI/Dmiwa
	mgvpw0lQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXrE-00000004dAY-0zMc
	for linux-mtd@lists.infradead.org;
	Fri, 05 Sep 2025 14:56:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EDD05C6B3BB;
	Fri,  5 Sep 2025 14:55:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3923B6060B;
	Fri,  5 Sep 2025 14:55:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7327102F08F5;
	Fri,  5 Sep 2025 16:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757084158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qdhTArbNaDMxsjs34Ef1EAsaB5kOJ8TTb3Y4r3qV6wk=;
	b=CiQiM12/7wbT3hOLdnc+4lAZfLnMPcXqtjySzbnkibZBYF4z1Rr+5HIb7gD14lAvjpBtBw
	ZXK9+4J4TtSJjJBCK71g+8Zj7csxK3YvgsodgqaWt/11hf0m7e1A0/wl/zE/EaQhMR6vrH
	wPecGbGX8KfR+mNSgZKI28uRAIkhfIv3Mml/OzwxKrh4cgL3WoWnwpVE0MYY2DsVhOSpUv
	vTS9QJOAlBS9K3y2DCMxXtiVUUuxsWGWZNuxvIjHlPKTUZbFOEglH+KmMtkkPfCiZug6Vn
	2KV6Fhor3/dVnm6x/FqbZGJvp6ReuXpLH+QGAgYRaqgymitZVY74AeT9iB9UTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Amit Kumar <amit.kumar-mahapatra@amd.com>, linux-next@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250902082539.126099-1-miquel.raynal@bootlin.com>
References: <20250902082539.126099-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/2] mtd: concat: Set virtual concatenation to tristate
Message-Id: <175708413736.334139.7652849015516021898.b4-ty@bootlin.com>
Date: Fri, 05 Sep 2025 16:55:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_155608_384654_FEC0C4ED 
X-CRM114-Status: GOOD (  10.32  )
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

T24gVHVlLCAwMiBTZXAgMjAyNSAxMDoyNTozOCArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBUaGVyZSBpcyBhIGNpcmN1bGFyIGRlcGVuZGVuY3kgd2hlcmUgdGhlIE1URCBjb3JlIGNhbGxz
IGEgZnVuY3Rpb24gZnJvbQo+IHRoaXMgZHJpdmVyIGFuZCB0aGlzIGRyaXZlciBjYWxscyBhIGZ1
bmN0aW9uIGZyb20gdGhlIE1URAo+IGNvcmUgKGFkZC9kZWxfbXRkX2RldmljZSgpKS4KPiAKPiBP
bmUgc29sdXRpb24gY291bGQgaGF2ZSBiZWVuIHRvIGV4dGVuZCBtdGQteSB3aXRoIHRoaXMgS2Nv
bmZpZyBzeW1ib2wsCj4gYnV0IGF0IHRoZSBzYW1lIHRpbWUgdGhlcmUgaXMgbm90IHJlYXNvbiB0
byBmb3JjZSA9eSBvbiB0aGlzIGRyaXZlciwgc28KPiBqdXN0IHR1cm4gaXQgaW50byBhIHRyaXN0
YXRlIHdoaWNoIHNvbHZlcyB0aGUgc2l0dWF0aW9uLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10
ZC9uZXh0LCB0aGFua3MhCgpbMS8yXSBtdGQ6IGNvbmNhdDogU2V0IHZpcnR1YWwgY29uY2F0ZW5h
dGlvbiB0byB0cmlzdGF0ZQogICAgICBjb21taXQ6IGM2NDI5NWVhMjg4MDg1OTBiMTUzNDFmNGY4
MDY1Yzg4NmEyYmIzNzIKWzIvMl0gbXRkOiBjb25jYXQ6IEZpeCBLY29uZmlnIHR5cG9zCiAgICAg
IGNvbW1pdDogZTdmOTcwZTU3NDBlYjIxYjY3NDIxZDk4MWJhYzVkZmY4OGU4YWQxNAoKUGF0Y2hl
KHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0
IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVu
KS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
