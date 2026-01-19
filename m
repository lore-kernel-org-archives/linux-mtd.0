Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510C3CCF2DB
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IB9XQEzTOdbzz6fk7rY/JVVHiruYGCa6a+PmBRur7lY=; b=SI+sa49bp272rm
	M/B4UELoogVKSXj0V/GTaepXiPrToCOav0NJTKBaAz60NIy0onMSlNYFOScFWneikvlcAKfyDq5P+
	+1dD364RqSbhZenDUdijSeR0wRDBj2iK5taAemFVqRMrbsRpLiOo83wbi41gyXEabVDDRYyekvHPp
	rMZ03OJGAHb+Asg4Hzw7dSbTV90PeBX/JuqPw9Fi7bqcnyYt2srlqcWG3HnCnQeWqJiWSuykkQ4WI
	ITZRnt0WPBhBjm6njLNhOmQzHOmBrz6SBPLf91KqeLdqvd6/Q2YHlTJiFh+HekRP7uCftQAAFew+Z
	eyBYkPvnfNdXhd60WGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmM7-00000001kMS-0IR1;
	Mon, 19 Jan 2026 10:19:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmM4-00000001kKA-07zV
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:19:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D041C214C5;
	Mon, 19 Jan 2026 10:18:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 852BA60731;
	Mon, 19 Jan 2026 10:19:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B5F210B6993E;
	Mon, 19 Jan 2026 11:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768817966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+bHNw2UUVVi0SQYNsp/nBK3qd5rlchNe93n8lzK/Vfk=;
	b=excdtB7/n6fTtHzkGEzF/MYSoiIXhH2eYF1XfpAzq68QC1t38PleEsts9eFoXRlspt5DWR
	D6pzWx5+bd4qOIlZPU4B+R/jYDKaWPGsFqC1HAXn5IYb2yNIdCdwd1vY0u+eE0WLXbG8z0
	l0BUnRrfQukaLwo244gMFIZpU8ti56OhSy9Xslv5TginwQNwtLkR647VHGwqyPjBfjQlpV
	bQaMGNUamlNUF/9s9V2AHsJ20MVcq6Wom/6qbqZkUIyr+e6ONeO1q3EINtef02bJzT5lBG
	eQp/hES1MODv7TufJPk5a/oWg08YYhhWO85PzODjJmiKbnxsCJoW0TFZr5zSzg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhila YS <akhilayalmati@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260105-nxp-v3-1-05af634831ef@gmail.com>
References: <20260105-nxp-v3-1-05af634831ef@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mtd: microchip,mchp23k256: convert to
 DT schema
Message-Id: <176881796446.2442128.3635875032600807923.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:19:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021928_204648_097F50E5 
X-CRM114-Status: UNSURE (   7.45  )
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

T24gTW9uLCAwNSBKYW4gMjAyNiAxNTowODowMCArMDAwMCwgQWtoaWxhIFlTIHdyb3RlOgo+IENv
bnZlcnQgTWljcm9jaGlwIDIzSzI1NiBTUEkgU1JBTSBNVEQgYmluZGluZyB0byBZQU1MIGZvcm1h
dC4KPiBDaGFuZ2VzIGR1cmluZyBjb252ZXJzaW9uOgo+IC0gUmVtb3ZlICJhZGRyZXNzLWNlbGxz
IiBhbmQgInNpemUtY2VsbHMiIGZyb20gcHJvcGVydGllcyBhbmQKPiAgIHJlcXVpcmVkIHNlY3Rp
b25zIGFzIHRoZXJlIGlzIG5vIGNoaWxkIG5vZGUgZm9yIHNyYW0uCj4gCj4gCgpBcHBsaWVkIHRv
IG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBkdC1iaW5kaW5nczogbXRkOiBtaWNyb2NoaXAsbWNo
cDIzazI1NjogY29udmVydCB0byBEVCBzY2hlbWEKICAgICAgY29tbWl0OiAyMzcyZmUxY2VhZjVh
MWU2ODFjODFmM2RjMzVlYjdmOTU0NTI2Y2JkCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJs
ZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3Zp
ZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
