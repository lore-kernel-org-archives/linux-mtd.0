Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D26FCCA473
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5TmrJQxGnK2EQutMiN+S/qu/7bXkvHblGL5OPePXJQ=; b=aU2ZrcvCEstBWW
	3eeAmXCOagdCh1HAJ8SDiAYwFM3UcYbHpMSQCvanev47vQyR2IkiI0mFZgqyKR9kjf1/wzgFB+sm1
	mBTVc56PBWc+umGbIaU1ZYhu4V14p4aoYZ/GQPwflMKZ/T2PDHstuZB5jwrFvQYTX4cDgygCX8kC6
	nr+FYHY3HdjG63fFyQ0LSvfXtsd1i+3oz6mIZEZxcOihNmxm5gUOZMWkxncHfgaQymkraJxzF6YlA
	FlzC+cfy1WKS3RyL4V71tdyv/BeSOpHyQfWMGaS72qseDZKgnVdbSdk6Xbncmq/9PM2MIZKE1ChdC
	1qUN7wu6d37k+m7w41tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHxh-0022JA-Iq; Thu, 09 Jun 2022 13:12:33 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHuo-0020Pm-0O; Thu, 09 Jun 2022 13:09:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 40E3F100008;
	Thu,  9 Jun 2022 13:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAmBAA4MRqr7mc9Dx/LkvxNNHRJznX9N/BYAoPbHt/A=;
	b=nnE4GOeWAkP7DtAHmHwJ2lu2WHUVXfjd80aStVBh6MKlSpS5/jb1/1OAZfTo/WeJ/h4Prp
	qlMp2KeHOvhCdnCXUv69RmnmHDUwLeBYivb/guFlSXxlW/GIj7U/L8WtulLuJOGAhRNcrZ
	8Ihzdg73i5dL/2UHvWkvwjEzY5QphBoyv4CpcJvVTFgN0k53orQ5Rs8I2RQD534pcsXsjo
	BgyW1JTNbi13AuijbN9tbGBuxxnjUaBvyTrWnC1Ndwh3E2OliuB2HbOCS/lOoq/VbtWUn5
	Ee2U0QMnnwRvmZeE4b4P4WhX7OuE+2j7DfXanQfC6IZz+TwBzy4WIf93AaFsEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: kernel@pengutronix.de,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 11/14] mtd: rawnand: meson: Don't skip cleanup after mtd_device_unregister() failed
Date: Thu,  9 Jun 2022 15:09:29 +0200
Message-Id: <20220609130929.293214-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-12-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7beae6946255711d7914abe7c4914ff2691c4b8e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060934_280170_FE7B1FF2 
X-CRM114-Status: UNSURE (   9.45  )
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

T24gRnJpLCAyMDIyLTA2LTAzIGF0IDIxOjA3OjU1IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IElmIG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpIGZhaWxzICh3
aGljaCBpdCBkb2Vzbid0IHdoZW4gdXNlZCBjb3JyZWN0bHkpLAo+IHRoZSByZXNvdXJjZXMgYm91
bmQgYnkgdGhlIG5hbmQgY2hpcCBzaG91bGQgYmUgZnJlZWQgYW55aG93IGFzIHJldHVybmluZwo+
IGFuIGVycm9yIHZhbHVlIGRvZXNuJ3QgcHJldmVudCB0aGUgZGV2aWNlIGdldHRpbmcgdW5ib3Vu
ZC4KPiAKPiBJbnN0ZWFkIHVzZSBXQVJOX09OIG9uIHRoZSByZXR1cm4gdmFsdWUgc2ltaWxhciB0
byBob3cgb3RoZXIgZHJpdmVycyBkbwo+IGl0LiBUaGVuIG1lc29uX25mY19uYW5kX2NoaXBfY2xl
YW51cCgpIHJldHVybnMgMCB1bmNvbmRpdGlvbmFsbHkgYW5kIGNhbgo+IGJlIGNoYW5nZWQgdG8g
cmV0dXJuIHZvaWQgd2hpY2ggYWxsb3dzIGZ1cnRoZXIgc2ltcGxpZmljYXRpb24gaW4gdGhlCj4g
cmVtb3ZlIGNhbGxiYWNrLgo+IAo+IFRoaXMgaXMgYSBwcmVwYXJhdGlvbiBmb3IgbWFraW5nIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFja3MgcmV0dXJuIHZvaWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkFwcGxp
ZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
