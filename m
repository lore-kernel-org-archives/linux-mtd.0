Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D268C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNobCljpO4e8TNHU+MVZOpM+mPMGU9TSQpjFpYxZHe0=; b=sb9+w6kuAiHWvA
	6lHN9MgqnnbSuoC06GDYBsHFHy/cA6y3O1opcJpwhsf2s0RdGiTQI2bZDhZOsIYEoIHh9RRAK/zoB
	xJdgFW/PUeHbRO72q+Sz+nV1tVqLHNEJwbT582I+64VaTEgwYh/SRoiTD9Lfn+7KN+2TFkddMn85y
	kiJoOHHwpfFYDD8i7pWdH1/Q3M/F+wWowLebYQtkAnxe87ZT+s0ctAqmm+R5+0ehOZZfOzEcu6NBr
	zGh2WF6z97GmbgqYDjJWklRPvTap3Ug+2WTBr6Xmuufk93wusWS/d4JoSdAv5ili/i4pSH9f49T8S
	ZEr5OT0WNJqiQW327MHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHvN-0020m0-20; Thu, 09 Jun 2022 13:10:09 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHuT-0020Cx-3s; Thu, 09 Jun 2022 13:09:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 18D8D10000E;
	Thu,  9 Jun 2022 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJMObUxXvW1JPqBpJkJyr++Eelvwt8iY4c63Bcq0+xA=;
	b=RCDcCAOl1AM1+Up9PZaNnKrAoE+dssIqLtQOAAW7D+vuXpYRKqF1weI/XkdDVvIbsKq5b9
	kMaMKVS70gNdgc6vJKAikQy0TpaiL2yqbM3Y1hjSgYcM3JjyxOXygVWcoB65jBLFKNWpTL
	hPEsH/w9N8VAE2MEm2VfCNg2uguhnInr/Nl55YXBULGWz6sismrzq735BmMvjIKIQkNSQZ
	n5XYtIyVWucGps6heVnMQV13xoJyZOQE4W78CpX1oavZxDJBGlgahbdgdygzAKemb//mI6
	xg+J7HeHkwWVIY9frK7nNsQjg30GICQnZJYC3ukMYfbZxdF2eDn81oaiQvuf3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v2] mtd: rawnand: atmel: Warn about failure to unregister mtd device
Date: Thu,  9 Jun 2022 15:09:09 +0200
Message-Id: <20220609130909.293073-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607062503.211345-1-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1cc82e09fc20dbb1f3aa41e9924c48e8194da754'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060913_343143_D0A17A65 
X-CRM114-Status: UNSURE (   8.42  )
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

T24gVHVlLCAyMDIyLTA2LTA3IGF0IDA2OjI1OjAzIFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSBMaW51eCBkZXZpY2UgY29yZSBkb2Vzbid0IGludGVu
ZCByZW1vdmUgY2FsbGJhY2tzIHRvIGZhaWwuIElmIGFuCj4gZXJyb3IgY29kZSBpcyByZXR1cm5l
ZCB0aGUgZGV2aWNlIGlzIHJlbW92ZWQgYW55aG93LiBTbyB3YWlsIGxvdWRseSBpZgo+IHRoZSBh
dG1lbCBzcGVjaWZpYyByZW1vdmUgY2FsbGJhY2sgZmFpbHMgYW5kIHJldHVybiAwIGFueWhvdyB0
byBzdXBwcmVzcwo+IHRoZSBnZW5lcmljIChhbmQgbGl0dGxlIGhlbHBmdWwpIGVycm9yIG1lc3Nh
Z2UgYnkgdGhlIGRldmljZSBjb3JlLgo+IAo+IFRoaXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgbWFr
aW5nIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3MgcmV0dXJuIHZvaWQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
CkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
