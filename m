Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC019C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Oct 2023 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OngbcYjElWn0QeRpn86UFn3NrU4p/uWdJp/RZSnNU0Y=; b=Ge7r8Dot68oCJZ
	4kiVptXLJLo+bMxLS/rGgLbTwa8F5FIoH8JpPpKwGSQ5NA5NQpBEWwCXOfg7gHEr3aw3iuJ8KvQ4f
	nH2M75g+M0dS4S8ijlyBJIzJ5BxphrvanooaP4Wsqyy9PTM+yI27i1IBF74IiiChfXf8FGM+FGv9O
	5vii/tx/pvWq8w+a560pH6+y2lKlJoMjBbqNOuiciSw4zyeE60bqis09NPDsyplmmwjYKrA2aBGNr
	fkZiCAXuTnO8OnMWQcezpXF3U5DmJmmhatyi6TzOACPds3srqa/gLya+P7Ys0lOKevWioy2Pj3qD8
	2Q2X2Y8JJqGhbbXE4wKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx69y-001n9w-1Q;
	Sun, 29 Oct 2023 13:48:58 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx69u-001n96-11
	for linux-mtd@lists.infradead.org;
	Sun, 29 Oct 2023 13:48:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CC5F40004;
	Sun, 29 Oct 2023 13:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698587325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4C29Y/0MMpQE3H8sEiOwcDim+jc5OpB518WeaoXpI/E=;
	b=IKfUb/fp+gNnT0EgVAJT4mDaUzIvFqi0GL14YuLu0gcJIgJ9VLkvLjrf6f4+enHf9HYe1/
	m0WdhpBfoT3ZUbKb7ITGwBxwDlc4h7Uy1DM1QdEAftS99S32qhKWZHONgKqt3b3cMbGSH8
	xW9BF3362EjglG4vCTjh1lbaNqJUP5JUbo701XH/oxg4D31txgGSwBdSQYsvMWvkI5zxD0
	6eDb7dAj60PkCNYW3/AJUKU3b/wYzqZZcfowTV029M6nKCJOQ98QsRxkGRE+scMPPzCbZy
	YjS3k+Ds3aPdyqtkSb3EgTqfSMOMw2/VREmYUHTnfNsHI9728FFTcZUJuHgEUw==
Date: Sun, 29 Oct 2023 14:48:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH 1/1] mtd: rawnand: add support for TH58NYG3S0HBAI4 NAND
 flash
Message-ID: <20231029144840.484facee@xps-13>
In-Reply-To: <20231029072005.6097-1-amadeus@jmu.edu.cn>
References: <20231023095451.65c4c0ec@xps-13>
	<20231029072005.6097-1-amadeus@jmu.edu.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_064854_512353_49EA052B 
X-CRM114-Status: GOOD (  10.84  )
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

SGkgQ2h1a3VuLAoKYW1hZGV1c0BqbXUuZWR1LmNuIHdyb3RlIG9uIFN1biwgMjkgT2N0IDIwMjMg
MTU6MjA6MDUgKzA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiA+IEFueSB3YXkgeW91IGNhbiBkZXRl
Y3QgdGhpcyBhbmQgZml4IHRoZSBwYXJhbWV0ZXIgcGFnZSBhdCBydW4gdGltZQo+ID4gaW5zdGVh
ZD8gIAo+IAo+IFNvcnJ5IGJ1dCBJIGRvbid0IGtub3csIEkga25vdyB2ZXJ5IGxpdHRsZSBhYm91
dCB0aGlzLgo+IAo+IFRoYW5rcywKPiBDaHVrdW4KPiAKCkl0J3MgbW9yZSBsaWtlIGEgcmVxdWVz
dCB0aGFuIGEgcXVlc3Rpb24uIFBsZWFzZSBmaXggdGhlIHBhcmFtZXRlciBwYWdlCmF0IHJ1biB0
aW1lIGJ5IHJlZ2lzdGVyaW5nIGEgLT4uZml4dXBfb25maV9wYXJhbV9wYWdlKCkgaG9vayBpbgpU
b3NoaWJhJ3MgbmFuZF9tYW51ZmFjdHVyZXJfb3BzIHN0cnVjdHVyZS4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
