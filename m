Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F57ED0E6D8
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwkwyzHmkj1s2ap3KKYiXbXGh/yMK8cnq4OIp7mm+GY=; b=YGmp0sfu7ZKgqC
	RPYh/CWyATvL1pKhe4F192N/HJ22NcZclBygJQkkokXFkruksvNCjOyf9kajMsjIiT4or8Err6Opr
	p3Ki7RxTbumI2EcwL2lspwn5ALFznK6tb8GDO64yhQitwcaFVKuCw1kOVdl1k6sHk6j0ODB9H8KdU
	p77chGCxGNyUtrp7379/0x37xgrUKnOLbU/qulKwrEBRpIVzZRdpJyRNbrdNLIhIRGtYe6hS+tneD
	53Q9dffkZGkiCf4Oa1gYgM9AlEabGkARA1pMF5A+Jjyk0YPMOGKDHXU6WVRLqmM3EzSoGES10/vbJ
	ocm80X1fFWKVdnYboUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pDM-00000006nEx-3MuO;
	Mon, 21 Oct 2024 10:00:40 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pDK-00000006nEU-13pG
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:00:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80345E000B;
	Mon, 21 Oct 2024 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TH8Hf74bQ0+yLalQUsfKFvE+2C53qQbThPb0dQPJhKA=;
	b=F0giQytThxUzIbovIBAUD0MPFryZU11D17s25RZ7hOS11CruAwfh3AR5rTqlG4cOIJb29e
	+JGGaZzHbvWsA809VLBU2vgHF/yuuJ06WHy4QMAK8SRp3MVV+8ulIa/mo8iowCb8D1zp9c
	If9K241b4IIKg7uR7Zl7ZtF0BCWkCCNa/AncpAxRwZPpcdkybant/v9LPa3ZFLnO/10MI6
	EjV3RgiFIKQm9r8EQIPGJlghla9pwD/+e0DQdgO6DdHrDlEVB2ZvsZM6dHFoMazOa490oT
	x+7us3Jn74HdPSDZ1KVN+oB0bMeI+iqRH5IuwDY8JCRTdkZLIRAWR2NdoomT4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Switch back to struct platform_driver::remove()
Date: Mon, 21 Oct 2024 12:00:34 +0200
Message-ID: <20241021100035.101785-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007205803.444994-10-u.kleine-koenig@baylibre.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f8470006c4d6bd54dbf9a3479f85e13387bff56d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030038_588182_B06F4036 
X-CRM114-Status: UNSURE (   9.41  )
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

T24gTW9uLCAyMDI0LTEwLTA3IGF0IDIwOjU4OjA3IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IEFmdGVyIGNvbW1pdCAwZWRiNTU1YTY1ZDEgKCJwbGF0Zm9y
bTogTWFrZSBwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZSgpCj4gcmV0dXJuIHZvaWQiKSAucmVtb3Zl
KCkgaXMgKGFnYWluKSB0aGUgcmlnaHQgY2FsbGJhY2sgdG8gaW1wbGVtZW50IGZvcgo+IHBsYXRm
b3JtIGRyaXZlcnMuCj4gCj4gQ29udmVydCBhbGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2
ZXJzL210ZCB0byB1c2UgLnJlbW92ZSgpLCB3aXRoCj4gdGhlIGV2ZW50dWFsIGdvYWwgdG8gZHJv
cCBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyOjpyZW1vdmVfbmV3KCkuIEFzCj4gLnJlbW92ZSgpIGFu
ZCAucmVtb3ZlX25ldygpIGhhdmUgdGhlIHNhbWUgcHJvdG90eXBlcywgY29udmVyc2lvbiBpcyBk
b25lCj4gYnkganVzdCBjaGFuZ2luZyB0aGUgc3RydWN0dXJlIG1lbWJlciBuYW1lIGluIHRoZSBk
cml2ZXIgaW5pdGlhbGl6ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQs
IHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
