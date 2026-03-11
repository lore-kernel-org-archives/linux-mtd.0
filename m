Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FD2112584E
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seMLw16Li5ianvcGZltRmQhx0bYG6C4qrxzqee1Y/P8=; b=DDDsHHBWRPWr83
	Pwbs2Ckp85Ckejotnw4WX/bJZ/fEGjB49t1Fx9RwNDoDSuBk71eg+NIMkEBmgo9sFajRrSGwyaCV6
	3Bw+55bH+H5pQPRqeaj0Qvre1J6GzmWNysbFB24LZ36AhsZysTue1DxK4+YFdSxwodVgxA47DY2ws
	peOL3P9aUIzRJwjTxDoW5XTvb9TB98MJXM5W+ty3HywHNXpS9lxuEJ1QthHyaLmq9wlA7zhPfn5VX
	21iNNiD3cU0TmPYivAQ1VYEv+DJGMIe3hKY46IV869W5KJ1niiuCnSyrXWv6q+MktHSJIbQ0lhOxz
	EpHotFb/zZbdA4wUGb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LZV-0000000BpU9-15RF;
	Wed, 11 Mar 2026 15:34:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LZS-0000000BpSs-1lyE
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:34:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A8D4A1A2D8E;
	Wed, 11 Mar 2026 15:34:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E35860004;
	Wed, 11 Mar 2026 15:34:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D35110369D16;
	Wed, 11 Mar 2026 16:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773243239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+QP/TAqA3g74ztyeRloOGhmFvEHQCQu4ynxix4TPmuE=;
	b=r8N+2F8R9IH+PngLeINvtdWKUimc4Ux9C9ltXZ4dhTCsS00lGwnz9rAhuCvEmzIthVmJJj
	NbpD88qqPNyrja9GDMBtE6sPqipSeI2rlC47lOYJPNEyN7NJm9YyivMiu33q65V9VgHdL2
	JE5jHuU1+8RNoS9gBR40tsreXIf+Gs6YVci9Dbn/CXbCEFRIMtT2sikCwRpI20wgM1N1hF
	hvfre5u9SPizw45vY8Xs1LHr3vdZBSxSLrzOBBDrAU9uVQUwiCOsYLgzS2E9d3kdgCYB2S
	NO9Fpj0uq+aOCpNqUow6y1TGvKOLpvkOLZdVmfRGggrYCb2Ra3qP1AwHI/pXow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: computersforpeace@gmail.com, richard@nod.at, vigneshr@ti.com, 
 Kamal Dasu <kamal.dasu@broadcom.com>
Cc: florian.fainelli@broadcom.com, william.zhang@broadcom.com, 
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260305202157.3571334-1-kamal.dasu@broadcom.com>
References: <20260305202157.3571334-1-kamal.dasu@broadcom.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: skip DMA during panic write
Message-Id: <177324323830.694817.16608954604648703261.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:33:58 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_083402_593927_DEFC0483 
X-CRM114-Status: UNSURE (   7.80  )
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

T24gVGh1LCAwNSBNYXIgMjAyNiAxNToyMTo1NyAtMDUwMCwgS2FtYWwgRGFzdSB3cm90ZToKPiBX
aGVuIG9vcHNfcGFuaWNfd3JpdGUgaXMgc2V0LCB0aGUgZHJpdmVyIGRpc2FibGVzIGludGVycnVw
dHMgYW5kCj4gc3dpdGNoZXMgdG8gUElPIHBvbGxpbmcgbW9kZSBidXQgc3RpbGwgZmFsbHMgdGhy
b3VnaCBpbnRvIHRoZSBETUEKPiBwYXRoLiBETUEgY2Fubm90IGJlIHVzZWQgcmVsaWFibHkgaW4g
cGFuaWMgY29udGV4dCwgc28gbWFrZSB0aGUKPiBETUEgcGF0aCBhbiBlbHNlIGJyYW5jaCB0byBl
bnN1cmUgb25seSBQSU8gaXMgdXNlZCBkdXJpbmcgcGFuaWMKPiB3cml0ZXMuCj4gCj4gCj4gWy4u
Ll0KCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGJy
Y21uYW5kOiBza2lwIERNQSBkdXJpbmcgcGFuaWMgd3JpdGUKICAgICAgY29tbWl0OiBkYTliYTRk
Y2MwMWU3Y2Y1MmI3Njc2ZjBlZTk2MDdiODM1OGMyMTcxCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2
YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIg
KHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRz
LApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
