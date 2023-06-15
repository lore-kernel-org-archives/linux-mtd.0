Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4ABEB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 07:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwXCyWvd9pR/a/gko2qRa87tbbrVrxe0LEs6jj0Sepo=; b=dPXVtSXvO6FKfD
	p8ERKux/kLKIJMYYtyt76nvICYTZXPylH9fdfo+Dy/JKyYr7K0U6IbgfLHAGEkpJetG3NlFoGje2Z
	61wIB/XH2K7plSpyhWDfBi9sIoghLtkvaD/GYySVRKnOyPYEU/wjurW4umfrwpWaTihvITwTgSynC
	0MKWGMXQZSF+g8Iq7MEiDy0TIJjYAI0ssAKoERixjlFoFYmq06wNNfpFDYhOuAzYQ5xM5n+q/S4Mg
	7B6Ar25sY56TEKtJw1blriAT1oTletyd86psGP15BXVV1dEbq7fSC9H5BqJ4QUYKYf/5mo3TRsrwO
	JN4kmpx/zwiX6+uRHzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hZS-00E2wn-0G;
	Thu, 15 Jun 2023 07:39:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hZP-00E2tc-0L
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 07:39:04 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686814737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ypki8Q1FETy9cS5zGlCe51eb/DWUnch4Lfawodrm/+s=;
	b=YUs71mcqT6OwKd+ufcUb74W4DitaZZwtcUXcMS6j9rU7FyvG74PVo+eABlXrENRRgOBQ7X
	m/dTinqxC4jYAzUviAbBznh2w6zBYF4pHI7iTN/ioI0dZaI6MLAGRBvyJ/ffbhy2w5v0nj
	HmENLgMbrCex+a4j2d6UBmeYzgcGz6tCl895yRp6iwZeBPQlZ9xNsRe+j6VhIc+QQk3PS2
	Dd177PKqPe1vOQgOo0QwvRgaLE4uNpgqi1Pt3Rww5E011yRiDLKPavm7tOGCEp9vxlEnQh
	yjOXXTdxp+4RmNvR0EABMWRxrJ0ZeJoh9LUQm9lCE7Tqkmv1PCjckwrhyCmRug==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D8B91C0010;
	Thu, 15 Jun 2023 07:38:57 +0000 (UTC)
Date: Thu, 15 Jun 2023 09:38:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mauro Lima <mauro.lima@eclypsium.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: mtd: spi-nor: parsers questions
Message-ID: <20230615093853.4336862d@xps-13>
In-Reply-To: <CAArk9MNJnu7zbXLYOh8HX5RQZA47Sdfx3GjUo5HfbeXYdY8WJg@mail.gmail.com>
References: <CAArk9MNJnu7zbXLYOh8HX5RQZA47Sdfx3GjUo5HfbeXYdY8WJg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003903_287105_7FAC235A 
X-CRM114-Status: GOOD (  17.53  )
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

SGkgTWF1cm8sCgptYXVyby5saW1hQGVjbHlwc2l1bS5jb20gd3JvdGUgb24gV2VkLCAxNCBKdW4g
MjAyMyAxODoxOTo0NSAtMDMwMDoKCj4gSGV5IGFsbCEKPiBMb29raW5nIGZvciBzb21lIGhlbHAg
d2l0aCBtdGQuCj4gSSdtIHdvcmtpbmcgb24gc29tZSBjaGFuZ2VzIGZvciBJbnRlbCdzIHNwaSBj
b250cm9sbGVyLiBXZSBoYXZlIGEKPiAiQklPUyIgcGFydGl0aW9uLCBjb21wb3NlZCBvZiBtYW55
IHBhcnRzIHdpdGggZGlmZmVyZW50IG9mZnNldHMgYW5kCj4gY291bGQgYmUgc3ByZWFkIHdpdGhp
biB0d28gY2hpcHMgaW4gc29tZSBjYXNlcyAobm90IG5lY2Vzc2FyaWx5IG9mIHRoZQo+IHNhbWUg
c2l6ZSkuCj4gUmlnaHQgbm93IHRoZSBkcml2ZXIgdXNlcyBvbmUgcGFydGl0aW9uIHRoYXQsIGlu
IG15IHN5c3RlbSwgaXMgYmlnZ2VyCj4gdGhhbiB0aGUgZmlyc3QgY2hpcCdzIHNpemUsIHNvIEkn
bSBnZXR0aW5nIHRoZSAic2l6ZSB0cnVuY2F0ZWQgdG8KPiAweC4uLiIgbG9nLgo+IEFsbCBkcml2
ZXJzIHVzaW5nIG10ZF9wYXJ0aXRpb25zIGtub3cgdGhlIHBhcnRpdGlvbiBpbmZvcm1hdGlvbiBh
dAo+IGNvbXBpbGUgdGltZS4gVGhpcyBpcyBub3QgbXkgY2FzZSwgd2UgbmVlZCB0byByZWFkIHRo
ZSBmaXJzdCBwb3J0aW9uCj4gb2YgdGhlIGNoaXAgdG8gZ2V0IHRoZSBwYXJ0aXRpb24gcGFydHMn
IG9mZnNldHMuIFNvIEkgZm91bmQgcGFyc2VycywKPiBhbmQgdGhlIGRyaXZlcnMgdXNpbmcgcGFy
c2VycyBtYWtlIHBhcnRpdGlvbnMgd2l0aGluIHRoZSBjaGlwJ3Mgc2l6ZS4KPiBTbyBteSBxdWVz
dGlvbiBpcyB3aGV0aGVyIHBhcnNlcnMgY291bGQgc29sdmUgbXkgdHJ1bmNhdGlvbiBpc3N1ZSBh
bmQKPiB3aGV0aGVyIHBhcnNlcnMgc3VwcG9ydCB0aGlzIGtpbmQgb2YgbXVsdGlwbGUgY2hpcCBj
YXNlLgo+IFRoYW5rcyEKClRoZXJlIGlzIG10ZGNvbmNhdCBpbiB0aGUga2VybmVsIGJ1dCBJIGRv
bid0IHRoaW5rIGl0IHdpbGwgZml0IHlvdXIKcHVycG9zZS4gRllJIEkgdHJpZWQgYSBmZXcgeWVh
cnMgYWdvIHRvIGJyaW5nIHN1cHBvcnQgZm9yIHNvbWV0aGluZwpsaWtlIHRoaXMsIHVuc3VjY2Vz
c2Z1bGx5LgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS8y
MDE5MTEyNzEwNTUyMi4zMTQ0NS0xLW1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20vCgpZb3Ugd291
bGQgbmVlZCBzb21ldGhpbmcgbGlrZSB0aGF0IGFuZCBvbiB0b3Agb2YgaXQgYSBkeW5hbWljIHBh
cnRpdGlvbgpwYXJzZXIuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
