Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BA3C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ten3qb+0tz/oNaiLvsuV5pSpTSond6BB9UMxn8K7S/s=; b=XrA5hmfnUEwm4S
	OyY+cc/d73LvB2g/NR7M6z4eys5nFqGoG877f2iWaOxXj5O8keDihnv/QAY1MM2RL80ymnlTzfEnZ
	wBuw+x/3sRi0MsJXUzdIY41oKOHSEGqrygZh5GynTVM2hO5l0S0jsJCYJy+OPXvdxxjGI1x/8i5LS
	UxOn6m1mfFZ8/3Miy0gq8x1eZViTcN6PTZUIVYGG9Fx1+Ra57Kk5PFkdWI42UTUlsCaNhTaglOxAw
	aZNNmiUOZRqxCmhKrmotW9YY295XYrGV9XEtEIhmCdyfytlVkcVKEzPqdHI57Y8l5ws3G+AUXsKEO
	pehCRQ/YFLVR0kmGPe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHuD-00206L-Mk; Thu, 09 Jun 2022 13:08:57 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHu9-00203a-VC
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:08:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0B05C4000F;
	Thu,  9 Jun 2022 13:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tkGkKsV/J2Rk1Qs9o9hbbSTvzaMT8dhy6YWJ9MYyHaw=;
	b=Cpcw4nY39QFRTXGx9idXHBk9k/ueltfiuHEHXvxCQCaIR7sEORf81PWlbkERuiTAlquoQ/
	MFjqQD1GHgSEwuivvgbxHDuWvn7LETzbW7HQD66njDGc/ZWo5B3w7pU1DzkOKt9ayyMqUW
	rc2zRVqAPZk1fU5XDmiNaieOoXe1ENp0ObKqobI0YQAb3oG2sP2CbpBtt4WwB1I1JWC8ZB
	WfRGhJ/zhq8BO21ec1LaFnaLFdeJk09uLiIcZU6aCE0cA2n7xtJLN5UAx5c1g3i6U/bkX/
	D3YTda2mC3KkFPfBpwLvOa2K8VNK10KvO+uXprK/UzEzqN0vw1sAjIrYJNwyWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arvind Yadav <arvind.yadav.cs@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 4/4] mtd: st_spi_fsm: Simplify error checking in .probe() a bit
Date: Thu,  9 Jun 2022 15:08:49 +0200
Message-Id: <20220609130849.292930-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607152458.232847-5-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6f6536a0e309177882975222d73984d1b5ad3bdd'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060854_201094_9004625A 
X-CRM114-Status: UNSURE (   8.10  )
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

T24gVHVlLCAyMDIyLTA2LTA3IGF0IDE1OjI0OjU4IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IEluc3RlYWQgb2YgZW5kaW5nIGVhY2ggaWYgYnJhbmNoIHdp
dGggdGhlIHNhbWUgY2hlY2ssIGRvIGl0IG9uY2UKPiB1bmNvbmRpdGlvbmFsbHkgYWZ0ZXIgdGhl
IGlmIGJsb2NrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5r
cy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
