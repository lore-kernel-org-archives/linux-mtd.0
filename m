Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE0ECD8CB9
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2026 07:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79fQI3oFNugOVPlrNV0CJQE65wI7tDvF0dAlcbNTQ3M=; b=aAYbv3go3MQidM
	AaoorGa1ibSv1410UT3i/SdAjRoz7qAF0YVPK51KE7uWnd63o0ccQXP5rREBkO5YZZN8TC6FjwX9/
	wMRaqb/2eTo2ahKyjDkUITu9nx54eQCu55cBpz7HjxKbRlvJ0qrq3c4REO9i3UmkM7aBnH5YC/k26
	7Webj02E4AMzDliDwrsmVoImZZc7pLnzwxN+5nAcKQ840oECFLCqrghZlWvvHh48egLxgPUP5Poj0
	X6h6bSUOXUKqleN02rsdVOp3CDltnKbNN4WV0QCDAFH6c/ANMMoO2UQQzIaAdMPJqSoMxUlPhc23q
	QSVwhu1WR/OkojHO+bgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZj3-00000008s2n-354i;
	Thu, 11 Jun 2026 07:21:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZj1-00000008s1t-15Dw
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jun 2026 07:21:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB9EFC49F63
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jun 2026 07:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF4C55FF03;
	Thu, 11 Jun 2026 07:21:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E463106B9E27;
	Thu, 11 Jun 2026 09:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781162472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A1twBLgdhRLF2qvxvKq9kb5ypc8A9zm4aGgfJAhwGPs=;
	b=eEQZa1HGdFwkhGBS0NBJ5cMZUkXgGR21+7UIr8ezng7bNmBLLCcHMgtUSiVnYxJDaw6rVS
	hPwgIToOolUjn9gJtm/YOvANp8OI/32WbjfjXGxfaFy+Gvn492U8fZx0hajR4m/8wV7dVi
	xeONXVwIUr/JwU128bcEoGU6n0PXk3yy7B6w5NePpCySxDrAJ7T2EXbSWcOfQL4UDii30B
	vj2SPvxybrWJWuJV0KXUeyTF9pWHOZaWZVwttbHLK0kcwBmkHzkYN5JngIkWPVkPYzyizX
	2K06DZj0IHgMJ+UH2giO53WpsRaVFDmOF7CK4PIjOqIDfx567KYb0/7pPYt10w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Ruoyu Wang <ruoyuw560@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260609084528.5-1-ruoyuw560@gmail.com>
References: <20260609084528.5-1-ruoyuw560@gmail.com>
Subject: Re: [PATCH v2 0/2] mtd: slram: fix failed registration cleanup
Message-Id: <178116247016.423856.9812812865588298072.b4-ty@bootlin.com>
Date: Thu, 11 Jun 2026 09:21:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_002115_460035_BD4AB8D7 
X-CRM114-Status: UNSURE (   8.25  )
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

T24gVHVlLCAwOSBKdW4gMjAyNiAxNjo0NToyNiArMDgwMCwgUnVveXUgV2FuZyB3cm90ZToKPiBU
aGlzIHNwbGl0cyB0aGUgcHJldmlvdXMgc2xyYW0gcGF0Y2ggaW50byBhIGJhY2twb3J0YWJsZSBm
aXggYW5kIGEKPiBmb2xsb3ctdXAgY2xlYW51cC4KPiAKPiBQYXRjaCAxIGZpeGVzIHRoZSBkYW5n
bGluZyBsaXN0IGVudHJ5IG9uIHJlZ2lzdGVyX2RldmljZSgpIGZhaWx1cmUgYW5kCj4gY2Fycmll
cyBGaXhlcyBhbmQgc3RhYmxlIHRhZ3MuCj4gCj4gUGF0Y2ggMiBpcyBhIGNsZWFudXAgd2hpY2gg
dXNlcyBsb2NhbCB2YXJpYWJsZXMgd2hpbGUgaW5pdGlhbGl6aW5nIHRoZQo+IG5ldyBlbnRyeSBh
bmQgcHVibGlzaGVzIHRoZSBsaXN0IGVudHJ5IG9ubHkgYWZ0ZXIgbXRkX2RldmljZV9yZWdpc3Rl
cigpCj4gc3VjY2VlZHMuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEK
ClsxLzJdIG10ZDogc2xyYW06IHJlbW92ZSBmYWlsZWQgZW50cmllcyBmcm9tIHRoZSBkZXZpY2Ug
bGlzdAogICAgICBjb21taXQ6IDM2ZjE2NDg2NDRkNzY5YzQ5NmE4ZTQ3ZTUzNjAzZTg2M2UzNThk
NzMKWzIvMl0gbXRkOiBzbHJhbTogc2ltcGxpZnkgcmVnaXN0ZXJfZGV2aWNlKCkgY2xlYW51cAog
ICAgICBjb21taXQ6IDRmZTk3YTU0ZGFkZGIyMjEwMDk5NjQxNjFmYjM2MmIyYjkzMGQ2NTcKClBh
dGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUK
cGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkg
dGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
