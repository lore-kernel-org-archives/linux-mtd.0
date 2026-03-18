Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F259510775E4
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+d147zuWbzyzws5dQT6O3KPki9RSzuEjVyDxEqFL/8=; b=OSwcspJ/F3d8sC
	DvkoxgGP5W0C6lCAY99P+HwQBs2QjUVZxBVxW15xVijCchF+41H3kL97N+DCf3UHBrojcT1xz9VTD
	PWLnNBbLBxF3oEH39ECoys9X6nJ3sr5dhgRh4WjKCBHD+Bpm5BFCrGuR+DtZLhhtZhuzwLYzw3Bdl
	OEw9VIsiEWPtcXPRFo3btUU5AfsnCTpPZuyejQX2qddMbsifbeXN4rImHz0Amjw/vvlg69DuCCDIN
	hQyncrfAnP6NrE9Buk7bi731QohJphmRLVjkQ1gXqy9QxPPlNZmBi+4PbTC/thfayoSUBQzvIOqnP
	Xd2VF+jQx6NS/LS/CCLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uOU-0000000922i-2206;
	Wed, 18 Mar 2026 17:09:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uOS-0000000921j-2AJQ
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Mar 2026 17:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Zax5XZm81akV6xkhhXpN4ysizTkpEPk/kpg6u3k2zJQ=; b=MDbMs6KsUfW5Es73B0DwF4ue1o
	WtYz5iDtasRVyoZCX01m0FZ/BREzT5GMV4hmHANO56oRmFwhP46yGeY9U8tg9hWCh8KMTlAamZ1Lv
	R0UDj++QQ532pMmi3y4302FVMuZlHDSDRy8Zu1ef4n7q9BblIIDNZ+90obWHk1MaVT3KRZa4bdVyx
	O1167i7mANQJM/qN4I17ATUs4Tv6ZZY1mQz3UcEi0QQOJszuhHjXY80Yo1aI1lbjbnAYcuPde9pw4
	muxyvXe7vKynUlezoymftJJsmdGKCuU/SEMrdplmVxBakJz8sKSHQdwPScVqEr7HeP/sBjqdvCf8w
	d7c2E0Cw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uOP-00000004jRE-1Q80
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 17:09:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 63B90C5506C;
	Wed, 18 Mar 2026 17:09:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBB106004F;
	Wed, 18 Mar 2026 17:08:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A981810450567;
	Wed, 18 Mar 2026 18:08:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773853733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zax5XZm81akV6xkhhXpN4ysizTkpEPk/kpg6u3k2zJQ=;
	b=g1FYuwNXAXXlz6R+TMq0HeBOuHaX1JJdcuTevM666CxJoxYGrR4zK878M5ngZts/RuS39U
	Rf2DBviZQF3t3dzncq+ydm16RtlLDHS40uFA3jBvYDMnu/OdsIOZ8YCcppCTjcELho3NKw
	OGEWyPHO1RKgtGefr+692TLF7Kr+raR88ZpvzXzkp0GzLUN0YJRGfU3ssnozXyG7uWIaau
	RaolKNGMs8e0EGtKQXahLgvrWrJUVeWbXFetwjnO/aPzPrrv3I/ycXuOsvR6RzHcXkNMV+
	PlItq18JizzHDMzBnk12jRNkPakXIfjhEf93NyrTTDzn0+HsqfQpfIaNWGMIUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Olivier Sobrie <olivier@sobrie.be>
Cc: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrea Scian <andrea.scian@dave.eu>, stable@vger.kernel.org
In-Reply-To: <20260317171807.652642-1-olivier@sobrie.be>
References: <20260317171807.652642-1-olivier@sobrie.be>
Subject: Re: [PATCH v2] mtd: rawnand: pl353: make sure optimal timings are
 applied
Message-Id: <177385373262.729501.6970700040556749897.b4-ty@bootlin.com>
Date: Wed, 18 Mar 2026 18:08:52 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_170913_442439_F5C1AD91 
X-CRM114-Status: UNSURE (   8.79  )
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

T24gVHVlLCAxNyBNYXIgMjAyNiAxODoxODowNyArMDEwMCwgT2xpdmllciBTb2JyaWUgd3JvdGU6
Cj4gVGltaW5ncyBvZiB0aGUgbmFuZCBhcmUgYWRqdXN0ZWQgYnkgcGwzNXhfbmZjX3NldHVwX2lu
dGVyZmFjZSgpIGJ1dAo+IGFjdHVhbGx5IGFwcGxpZWQgYnkgdGhlIHBsMzV4X25hbmRfc2VsZWN0
X3RhcmdldCgpIGZ1bmN0aW9uLgo+IElmIHRoZXJlIGlzIG9ubHkgb25lIG5hbmQgY2hpcCwgdGhl
IHBsMzV4X25hbmRfc2VsZWN0X3RhcmdldCgpIHdpbGwgb25seQo+IGFwcGx5IHRoZSB0aW1pbmdz
IG9uY2Ugc2luY2UgdGhlIHRlc3QgYXQgaXRzIGJlZ2lubmluZyB3aWxsIGFsd2F5cyBiZSB0cnVl
Cj4gYWZ0ZXIgdGhlIGZpcnN0IGNhbGwgdG8gdGhpcyBmdW5jdGlvbi4gQXMgYSByZXN1bHQsIHRo
ZSBoYXJkd2FyZSB3aWxsCj4ga2VlcCB1c2luZyB0aGUgZGVmYXVsdCB0aW1pbmdzIHNldCBhdCBi
b290IHRvIGRldGVjdCB0aGUgbmFuZCBjaGlwLCBub3QKPiB0aGUgb3B0aW1hbCBvbmVzLgo+IAo+
IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5k
OiBwbDM1MzogbWFrZSBzdXJlIG9wdGltYWwgdGltaW5ncyBhcmUgYXBwbGllZAogICAgICBjb21t
aXQ6IGI5NDY1YjA0ZGU0YjkwMjI4ZGUwM2RiOWExZTBkNTZiMDA4MTQzNjYKClBhdGNoZShzKSBz
aG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0
aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpL
aW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
