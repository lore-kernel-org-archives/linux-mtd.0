Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09876C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvClJ6mBJqt5CBSMax9S4xWp3AzmtTt0GCnWdWZFMXQ=; b=wpVH9a/fx0Ro8Z
	cljrGs+8Goc6BISW6zx+rmMdGQZyR74I1Zw67kLti+GXhq0xcPNPYGkh8aG7//c2qfPzvt18qaDPq
	YakQeCJGUOh5sfeMrmBEdVGZ3B1uk2NNzYp5wSf1ELYMZt5gf688EitQrMF0qOGqJDhvaDb344SJB
	jIRPDowNwcC9R97Pw2MVqgNwHmO/FxJMWA1kaRwYP3hpmRddQoF7Dy7Xwjs4ETOu70hruquvie+nM
	dfMYBJtQerGIviKIv/HGgF1ejbtByzZKJkeI0sDKu3kiTCikm6wBGOYUsEniQxzf46ciD9FLiXw+g
	/H8CJeUGhXCtPPKP8EjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhROH-00C4kB-Ki; Thu, 21 Apr 2022 07:38:13 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRMs-00C3gY-W0
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:36:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E7A8200009;
 Thu, 21 Apr 2022 07:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G0UHX32kBzwHwDqgs+ytOfrvxdrMdeF8RhVewiODVWs=;
 b=WLcglRbubCOfeNqImKpfGOOO44oBiQ4U93GKyqygGxeeyrJ56HUvhy0GMjEUG2ICIdg54L
 Y1+MwIhX4dCwCqdq5UQWAaUTpIhqbE/++9nwZbA+X6kitWscpjwJ8PAAtf8W/cRcyjG2O/
 YN5O+/STVd6SINNGkwDOiskqB8uP9orxWjyxP8s7+D+H55Fq8E8MYLRfZFO2rLgL2gdHO/
 0/6S/6E0HwZC75p7HYJI7CbY3lZ9nwgncQb1yflrKr6DRg0gKVN0X0VpD+3TR4N+rh79Xm
 YMpSykwaoOnsn3DCdP6FOXMo30M0lVTDgbi45apy1dq6HTA3u3auY+oUlMHg1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Andreas_B=C3=B6hler?= <dev@aboehler.at>,
 linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: add support for Toshiba TC58NVG0S3HTA00
 NAND flash
Date: Thu, 21 Apr 2022 09:36:43 +0200
Message-Id: <20220421073643.72345-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220420104034.6333-1-dev@aboehler.at>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3380557fc7e28d9bce7607e16d98f123d36da4ca'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003647_240387_9318D712 
X-CRM114-Status: UNSURE (   7.59  )
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

T24gV2VkLCAyMDIyLTA0LTIwIGF0IDEwOjQwOjM0IFVUQywgPT91dGYtOD9xP0FuZHJlYXNfQj1D
Mz1CNmhsZXI/PSB3cm90ZToKPiBUaGUgVG9zaGliYSBUQzU4TlZHMFMzSFRBMDAgaXMgZGV0ZWN0
ZWQgd2l0aCA2NCBieXRlIE9PQiB3aGlsZSB0aGUgZmxhc2gKPiBoYXMgMTI4IGJ5dGVzIE9PQi4g
VGhpcyBhZGRzIGEgc3RhdGljIE5BTkQgSUQgZW50cnkgdG8gY29ycmVjdCB0aGlzLgo+IAo+IFRl
c3RlZCBvbiBGUklUWiFCb3ggNzUzMCBmbGFzaGVkIHdpdGggT3BlbldydC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZWFzIELDtmhsZXIgPGRldkBhYm9laGxlci5hdD4KCkFwcGxpZWQgdG8gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4Lmdp
dCBuYW5kL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
