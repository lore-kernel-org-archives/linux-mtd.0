Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A21C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srAYZNY8gP+GN4p1FB1tZq6/pRF/vKh5M5ZB8Zs4/wU=; b=cpaCOM8omMTAVf
	gZxKwTTd/AvFCQze4HUlboooq+kDi6mdJapKICe9/zA4V3kSGk6L5B5igAAdTMBcAPyTcnOlG6bdS
	jf6tn3lZkHcCvXqaHGuwoEFwot1vIWObkuqOOQ44Vy5Wjhd4hMku3YqB6EgWkifzkT+/cR0u799tL
	xKYsMyd/+GrU4H9HVCNrLAu9x5kr6y0O9+BAn7skzVJKMiN7vuF90hQ/uMtvljau5AVSj+4e45jA2
	pXDu0eJ2LRIEmo8aHCDbkbHW6O3r4iaDVMqc6RX1Mm4S53KoAls9nikW6y7fPA5RrpWk9d+8KalLX
	CQRhWpoq5DnSUpb3QKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHyJ-0022gy-7w; Thu, 09 Jun 2022 13:13:11 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHux-0020WS-8k
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:09:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4231BE000E;
	Thu,  9 Jun 2022 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z59Wt55ps7kf99ljcms1YjeGh/X8NNxueUuVlrhV4zQ=;
	b=nCxlZfsIiFs0XHBv8cFl9i9R8YzpgJ+nAvrDV5ctju4E6ViaiVcZreJW6vUeVw6btjjriN
	6KEYOkp7KKYXXM0QDVUvynrGmW4f4YxRFJnXk/AP/jp1tCVvzU6L60+ImdYnLhG8Udim79
	vLoi7At0sLh1w46L5XBLd2kBpJiiI9gaWS+keAfgXx6ltJ465dJXD6vmwtVugYDsaK6DMR
	atT9NX/LjSh48//TwWm0FrrUjx9jOolEhXUDS2DF/1e2xF7LWPTr1JSS7sU+QHcU2qSPT5
	LJBo6g5JrnuhnXMXYO4gQQ8pWZBnySYVfuoaKKBpApj8utsmrFFcuEuj2OCm1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 09/14] mtd: rawnand: omap2: Suppress error message after WARN in .remove()
Date: Thu,  9 Jun 2022 15:09:39 +0200
Message-Id: <20220609130939.293280-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-10-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'37e00244047c5675a7f3f1ec0358f8c53cd12b75'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060943_476092_0DF0C999 
X-CRM114-Status: UNSURE (   8.36  )
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

T24gRnJpLCAyMDIyLTA2LTAzIGF0IDIxOjA3OjUzIFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFJldHVybmluZyBhbiBlcnJvciB2YWx1ZSBpbiBhIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXN1bHRzIGluIGFuIGVycm9yCj4gbWVzc2FnZSBiZWluZyBl
bWl0dGVkIGJ5IHRoZSBwbGF0Zm9ybSBjb3JlLCBidXQgb3RoZXJ3aXNlIGl0IGRvZXNuJ3QgbWFr
ZQo+IGEgZGlmZmVyZW5jZS4gQWZ0ZXIgdGhlIFdBUk4gc3BsYXQgdGhpcyBnZW5lcmljIGVycm9y
IG1lc3NhZ2UgZG9lc24ndCBhZGQKPiBhbnkgdmFsdWUsIHNvIHJldHVybiAwIHVuY29uZGl0aW9u
YWxseQo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGU+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1p
cXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
