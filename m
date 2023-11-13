Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9A1C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 11:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaysZavqmISyB2XP2tymn3KUtXH+jTxMpLLoa/c00oQ=; b=qDMpfOhcIoAMme
	5+VGPHuOQ8cdcfuB5t5LkHXAkuTf6sXSF9ryQXDAQ5WGY1yOuuFVytQwv43cPTzrJKLDahwSUl6WG
	Bnu7MgqwQwBNohKM8z447Yn/nnQWwI4qVuL2DJDjWpfXjT2ITiWYJ16xK+XZuGErxTJJrH03dS0C6
	qR0FsKAc0k7EJI/RuKd8gU/JEnnwdlcYYZCcRH98MmPbY6W8SwaY/DgODz04hPG72lKb7Z7ob8CEF
	fFCtB9Wet4MrVxVLyAsW0aF9y73PDnDA02wKzlddze3qA3ZA6K2c+7TEfbBFPhHC1aYLD5+PvZA4v
	dDsMEXMHSCWUH5Mpufvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Urz-00Dhio-1g;
	Mon, 13 Nov 2023 11:12:43 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Urw-00Dhgv-0V
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 11:12:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F8BD60008;
	Mon, 13 Nov 2023 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699873956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOn5PDTjLuDU0V00eTTk8uHsw19r3BSLQ4LcfEoZbFU=;
	b=Xp/VmZm3Eg638b42iZdNw6+SI4iJD5X+22p3wX4T3YDWBPAv/6PKacGfB8O0vDem3Lfw0x
	IFpy5vNPlumth5rotmQG88aSOJuhovpwxLRDbWL8Xj0eoBOJEDCI7WkKsprK+bPC34ILgA
	DBJKLIZ81K8TlKLnydzhJCAGtIAKu7grGJoGugPDE8Qms46SuvCLzxl+o40Kw3RDphjj71
	S7kT7eV+9FYwf5NyfoHTEECKA6ZEYyC2o4h+9Sjwb0V/kyan3NYFU5dCfOyF5JDCey+0wJ
	aCJMgAzV1ceXOQnqWS+fRcZCdO7LuyAM3DhoNjHFpR4vmNY49yyvBzx9jGztWw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 2/4] mtd: rawnand: txx9ndfmc: Switch to module_platform_driver()
Date: Mon, 13 Nov 2023 12:12:32 +0100
Message-Id: <20231113111232.464580-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102220246.3336154-8-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'160c0b7f9a166d62a3aa32853883666eda896c58'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_031240_327306_8EAA247E 
X-CRM114-Status: UNSURE (   8.40  )
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

T24gVGh1LCAyMDIzLTExLTAyIGF0IDIyOjAyOjQ5IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFdoaWxlIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUo
KSBvZmZlcnMgdGhlIHBvc3NpYmlsaXR5IHRvIGRpc2NhcmQKPiAucHJvYmUoKSBhbmQgLnJlbW92
ZSgpIGluIHNvbWUgc2l0dWF0aW9ucywgdGhlIGhhbmRsaW5nIGlzIGRpZmZpY3VsdCBhbmQKPiBp
biB0b2RheSdzIHN5c3RlbXMgdGhlIGZldyBodW5kcmVkIGJ5dGVzIHRoYXQgY2FuIGJlIHNhdmVk
IGhhdmUgbGl0dGxlCj4gaW1wb3J0YW5jZS4gU28gY29udmVydCB0aGUgZHJpdmVyIHRvIGJlIGEg
bm9ybWFsIGRyaXZlciB0aGF0IGNhbiBiZQo+IGJvdW5kIGFuZCB1bmJvdW5kIGF0IHJ1bnRpbWUg
YXMgbW9zdCBvdGhlciBkcml2ZXJzLCB0b28uCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4Lmdp
dCBuYW5kL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
