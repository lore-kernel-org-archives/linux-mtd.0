Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EFC44501
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBnSzF7htwdbvO6MgesQUNUlnp0S9PpL21XDlHisdPY=; b=GgEF+e1H5EjQwD
	FkCnntUmx+++QNCkqqGhVfW7bAO7vPyY3Z5wwAgEuoNFMK9QV8EPzQxqamIYCfD4gi9l8wcukgX2O
	nPyH2Be5DIAdwOkScjJk3TJvtTSktYCgxHpfQeY4grnyaWJDnR3JSDfiM+0gK1Zuyf+fJfBYr+YLI
	sja72I7TQB5zAqHLBbER/YukMCa9xf+6ui/Rh8Iol1Cru4Ga9vxVQNc5Xk/0bhZb0zs+frsoPwmYj
	hE2nGlIsvkgsG495xVkmI6UDeZvfD1HLnENixUgL1gEc9+g1XcTIMw5ORt5uMFjILYVZ2di0enM2z
	RVlUXIRzfltMq5G4YLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckz-0000000Bc3D-0LWB;
	Mon, 06 Jul 2026 06:24:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckt-0000000BbxG-0IDE
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F1A91A0E7F;
	Mon,  6 Jul 2026 06:24:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7393D601A2;
	Mon,  6 Jul 2026 06:24:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E80B911BB9890;
	Mon,  6 Jul 2026 08:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319072; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G5YSt5LqPpDji/+iYeNl66jaZ+aG+9gheNxmJyQ8oOg=;
	b=Dd6/eOx3rVQO6Ql7vwVCEzgB1kBSTrAPi8WrwdDH1LegRf6Bs0Zi5SDBtuX9wyOiq5h7/+
	010wJJ10jbR+ieR69DryBclyjYM3ISojTo+W22DMxViqaGgJW/jWBZq5uOc/tsV8zSXtGy
	P2GQw1ptZpxYe6BhXUh5LMtgXwsf1fWqyZsLbChayesuU8f28Lj6XqamkSZSBEepHfS9S8
	IykVNpnUv8uq64sEnW4+W9GSPPRXTxzArMrmclng8KcziT0ZaA+w6GKi1R9q4wxJ/+f5L8
	XsXBArT5gjjzjjv4kqQ0sNv7QNhcQrvJpqSDMlrVpWlGbEoAhLYwdltle0pTJA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Greg Ungerer <gregungerer@westnet.com.au>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20260703-perso-revert-uclinux-map-v1-1-2b7d46f20465@bootlin.com>
References: <20260703-perso-revert-uclinux-map-v1-1-2b7d46f20465@bootlin.com>
Subject: Re: [PATCH] Revert "mtd: maps: remove uclinux map driver"
Message-Id: <178331907087.868671.16280555247108085410.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:30 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232436_808662_BB99F5DD 
X-CRM114-Status: UNSURE (   7.49  )
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

T24gRnJpLCAwMyBKdWwgMjAyNiAxMzozNTo0NyArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBUaGUgdWNsaW51eCBNVEQgbWFwIGRyaXZlciBpcyBzdGlsbCBhY3RpdmVseSB1c2VkIG9uIENv
bGRGaXJlIChtNjhrKQo+IHBsYXRmb3Jtcy4gVGhlIENvbGRGaXJlIHN0YXJ0dXAgY29kZSBpbiBh
cmNoL202OGsvY29sZGZpcmUvaGVhZC5TIGNvcGllcwo+IGFuIGF0dGFjaGVkIGZpbGVzeXN0ZW0g
YmxvYiB0byBfYnNzX3N0b3AsIGFuZCB0aGUgdWNsaW51eCBkcml2ZXIgcGlja3MKPiBpdCB1cCBm
cm9tIHRoZXJlLiBNb3N0IENvbGRGaXJlIGRlZmNvbmZpZ3MgZW5hYmxlIENPTkZJR19NVERfVUNM
SU5VWCwgYXMKPiB0aGUgZHJpdmVyIHNlZW1zIHRvIHNlcnZlIGFzIGEgcmVwbGFjZW1lbnQgZm9y
IENPTkZJR19CTEtfREVWX0lOSVRSRCBvbgo+IHRoZXNlIG5vbi1NTVUgdGFyZ2V0cy4KPiAKPiBb
Li4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIFJldmVydCAibXRkOiBt
YXBzOiByZW1vdmUgdWNsaW51eCBtYXAgZHJpdmVyIgogICAgICBjb21taXQ6IDJiNTMzZTc3NWFl
YzU4MGNmNjAwNzQ0MTdmNGNhMDBhYzljZjM1ODAKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxh
YmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJv
dmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1p
cXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
