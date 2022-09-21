Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B12C6FA90
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Sep 2022 08:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owRSmLPWrIH6HnSORpx0SCwT4IhAJkBpeP3o9gvjX9Q=; b=i1mO9lVMszDj+3
	9kZnMHpESA5F3+C7QJQU7VnvDmUp5FJLVurNyN6texB+KcydCvxDfKRO27LfHYGLZk5sAfMc4g6QU
	zpColcPigEQDsDX1SylslPnSw3PY6NB7TFcMcnf/EOsMmKngBfWzGNDVuyYTCibhR8SEmd+eo1njI
	LChHTlMyJzwpDE/GIGo1LECnqNDiFKj9Cqj9U/fBPXaVl/Vc3waRfmwqukSyRAWCXqXUBmbf0y6pl
	AMN5My6frYWCsiKhAOkCZqwxe6Kk4hT9ytFMKpq9w/otTOzVqOmPjCYXR/Dm3DepOq2Nyby+XQtEc
	IxmcSBggIyxj41A4BiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavLh-00A4cb-Lb; Wed, 21 Sep 2022 08:44:53 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavIE-00A2pP-Ao
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2022 08:41:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F0E0624000C;
	Wed, 21 Sep 2022 08:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663749674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d9cbzyFuyH09NAncmcdVqfJayfGYNOCh5xOhUfCxaJ8=;
	b=ZnDnZ51EEuIeSc/H/wAUhgxkQDL3Xs+bZS6dgEzs23GnOOAg3BaXHX9xYxpzcbFnjePweV
	oXaiQ3sCYfMC+hnyJfZhNEuL5cLELdQH9CeT4d/I7TaNOKWBiB2tbg2C4j2Iggjw6ghB98
	n3FmDYrKFg4Epg/HpZUIuBp4daAYYZxUZPuHMxwEEN6aNen1/Pkvz8W1cGuNB+9l4bl90M
	JNXeU1gKecYT/+YTEV5/mTaO9qThJFHq04WlDzGIvQBd164Yd/SsUDVYSkr+ZGrz9Y946M
	bfunZQk6hoZqLr0FEv6dfjVioqmdleFGkTXuPmCImdnO0vL8jc84G3DoS9HOyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] mtd: always initialize 'stats' in struct mtd_oob_ops
Date: Wed, 21 Sep 2022 10:41:11 +0200
Message-Id: <20220921084111.733303-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629125737.14418-3-kernel@kempniu.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'745df17906029cc683b8b5ac8bcb08f82860baff'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_014118_562002_9384CC7A 
X-CRM114-Status: GOOD (  10.86  )
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

T24gV2VkLCAyMDIyLTA2LTI5IGF0IDEyOjU3OjM1IFVUQywgPT91dGYtOD9iP1RXbGphR0hGZ2lC
THhKbHdhV1hGaEE9PT89IHdyb3RlOgo+IEFzIHRoZSAnc3RhdHMnIGZpZWxkIGluIHN0cnVjdCBt
dGRfb29iX29wcyBpcyB1c2VkIGluIGNvbmRpdGlvbmFsCj4gZXhwcmVzc2lvbnMsIGVuc3VyZSBp
dCBpcyBhbHdheXMgemVyby1pbml0aWFsaXplZCBpbiBhbGwgc3VjaCBzdHJ1Y3R1cmVzCj4gdG8g
cHJldmVudCByYW5kb20gc3RhY2sgZ2FyYmFnZSBmcm9tIGJlaW5nIGludGVycHJldGVkIGFzIGEg
cG9pbnRlci4KPiAKPiBTdHJpY3RseSBzcGVha2luZywgdGhpcyBwcm9ibGVtIGN1cnJlbnRseSBv
bmx5IG5lZWRzIHRvIGJlIGZpeGVkIGZvcgo+IHN0cnVjdCBtdGRfb29iX29wcyBzdHJ1Y3R1cmVz
IHN1YnNlcXVlbnRseSBwYXNzZWQgdG8gbXRkX3JlYWRfb29iKCkuCj4gSG93ZXZlciwgdGhpcyBj
b21taXQgZ29lcyBhIHN0ZXAgZnVydGhlciBhbmQgbWFrZXMgYWxsIGluc3RhbmNlcyBvZgo+IHN0
cnVjdCBtdGRfb29iX29wcyBpbiB0aGUgdHJlZSB6ZXJvLWluaXRpYWxpemVkLCBpbiBob3BlIG9m
IHByZXZlbnRpbmcKPiBmdXR1cmUgcHJvYmxlbXMsIGUuZy4gaWYgc3RydWN0IG10ZF9yZXFfc3Rh
dHMgZ2V0cyBleHRlbmRlZCB3aXRoIHdyaXRlCj4gc3RhdGlzdGljcyBhdCBzb21lIHBvaW50Lgo+
IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgS8SZcGllxYQgPGtlcm5lbEBrZW1wbml1LnBsPgoK
QXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0IG10ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
