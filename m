Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F02C79F87
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IhHJVnI4L8/UovMIH9I9QJoljTFBnnfn7+efLAEwTk=; b=FGF19p+ll7A89P
	WRdXGjI4Twfc6+C0SVT92KU9+YA6mM39rmwNUySTDKoH7+zpUe84Le49BgbS3mrsC6mBRlQh7o2j1
	mpEkCqrXJYVxTt1UtMHo7dXzKcZDOT3Fk1yE8p5aIRipLnJgXDqKWaCR73cE+yXsFXiG2A/p7gZ63
	VtvQVXLzXWH3EaWrn4h91Q8ju3oVM1yBrpRZiMm4smbIlKN49vGlLYyXrF3OHvuC5y5/beYi7HJ+4
	avDwLrLoHzzncEICYmFnKyG/TP68GbLHGLa7Gvrn3j1229ZI5Z0GW6Sy1XDI65lYfUQQ1oEnz97nM
	ueybPzZl/9YpeRhKDKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLk-00000002yxn-1gyn;
	Fri, 04 Sep 2026 18:09:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLh-00000002ysr-3xiv
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:09:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8922D1A19BE;
	Fri,  4 Sep 2026 18:09:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D2E66057F;
	Fri,  4 Sep 2026 18:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E0ED11C78705;
	Fri,  4 Sep 2026 20:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Ip/FWfklx45FlIPNsjZ5FeG+r+BEA7rxfLkX+/C4cs=;
	b=kRClukK1cqbeXhVXfwwMMW4/ygx3D7UO0UuCPshBYCUvA5mo9TCD+ccqmaqUJsovf929G3
	fHkY5oE3BAa4Hzn0Ji/4/gNd8hHS35JMjzaXBwV7gWWmOzs8/SkXPJaPGlQRwoDM+SktvI
	JcGqRYfhnaRXKmZ1G9QEX40tDMXM2RIdL9Os2mrW5dA1bKe6RsfmVTO7sUK20nPvhzi/wm
	3HFNjeFtXeOMTFWqW0Q1c49h9r9OUBiwHWGimCmQqrPRVft5JqyZTzOLK2MxynSpxfdNg9
	OtyOi6n6Q/ZNtsnfu/sNF2U8pHWGsuesXAp4EDs8dsGHcrbDmkEmyyPhwNKnpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260903112425.1904748-1-vz@kernel.org>
References: <20260903112425.1904748-1-vz@kernel.org>
Subject: Re: [PATCH 0/2] mtd: rawnand: lpc32xx: Remove platform data
 support from drivers
Message-Id: <178854535106.1533016.16535478360917142774.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:11 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110914_141861_52FDC50B 
X-CRM114-Status: UNSURE (   7.70  )
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

T24gVGh1LCAwMyBTZXAgMjAyNiAxNDoyNDoyMiArMDMwMCwgVmxhZGltaXIgWmFwb2xza2l5IHdy
b3RlOgo+IFNpbmNlIE5YUCBMUEMzMnh4IFNvQyBzdXBwb3J0IGluIHRoZSBMaW51eCBrZXJuZWwg
c3RyaWN0bHkgZGVwZW5kcyBvbgo+IGRldmljZSB0cmVlIHN1cHBvcnQsIHRoZSB1bnVzZWQgcGxh
dGZvcm0gZGF0YSBzdXBwb3J0IGNhbiBiZSByZW1vdmVkCj4gZnJvbSB0aGUgTFBDMzJ4eCBOQU5E
IE1MQyBhbmQgU0xDIGRyaXZlcnMuCj4gCj4gVmxhZGltaXIgWmFwb2xza2l5ICgyKToKPiAgIG10
ZDogcmF3bmFuZDogbHBjMzJ4eF9zbGM6IFJlbW92ZSBwbGF0Zm9ybSBkYXRhIHN1cHBvcnQKPiAg
IG10ZDogcmF3bmFuZDogbHBjMzJ4eF9tbGM6IFJlbW92ZSBwbGF0Zm9ybSBkYXRhIHN1cHBvcnQK
PiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzJdIG10ZDogcmF3
bmFuZDogbHBjMzJ4eF9zbGM6IFJlbW92ZSBwbGF0Zm9ybSBkYXRhIHN1cHBvcnQKICAgICAgY29t
bWl0OiBlMThjNTE0ZTljMWZmMzMwYmVjODdmZDYyMzQxMjUxZDA0MWU3NDQzClsyLzJdIG10ZDog
cmF3bmFuZDogbHBjMzJ4eF9tbGM6IFJlbW92ZSBwbGF0Zm9ybSBkYXRhIHN1cHBvcnQKICAgICAg
Y29tbWl0OiBkZWY1NTlhMjE1Njk5YWEyZjJkOGVmOThmMzAxNTZiOWQ1NjJhMTU0CgpQYXRjaGUo
cykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQg
b2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4p
LgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
