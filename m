Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A94C46467
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epmHehMtyRq3FBwJyDjGTMoVCJwF6WjMD3QAUlXTDNk=; b=TwfY8L5rJ96yee
	PfB7085CZN9SkF9kjM6Jde5rJy5FOGz50kEhKyK2nyRHsCriFU2UFSkkjxM1bGv0Rp4iRMXn9LDIo
	GcqlOuwokHDe4orMqJv2FwntS1PlZl8UNgclBbXdB1z/0hGNDqqzdoPPikdgsq0c5t21lzfksFvnt
	yinlZgHS7ll065bL3SL9B77FjqHnDnWvYC5xtPaaNux+VKRs9UDp8H4R+0pD7FjALcoPgy5KJ2Mip
	GjJBdpSqNpxiAAB9+YsFjG5EZBctAdwVSMUFwR+axFLGnYxyCWRH6dWELMoSZvPKsSaGvxGNj4OXd
	OQ9+5/2tDLjJmv+ppidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIrU-00AjUV-6c; Mon, 02 Jan 2023 11:20:12 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIqR-00Aj4t-KH
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2023 11:19:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1946FC000D;
	Mon,  2 Jan 2023 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmZOFIRPUxRbgADaNIqMPGTVn972Lk8IMLnC4lxZO7c=;
	b=NekCXkjn8uNt8LsUZK3ktj6JmLI49SywH1StWRlKMSCML2H8aguvs/6eGx2bspGFI3VIF3
	GnwxYbYCEkBetHMM/va6FYRP48CTYUTetEagMmuy/kY8heBJGoNpzWZXJcghkb7rWqUnCL
	bX0CnZLOZdvk61KCIE8Kh/MkFdxA2iPVqRI3IrzkPPp4/Nx5PaxeTmGH/dKup3QnO7ftts
	LUxzI6fyTk06d+keNxvk2n/3WD/nlvhhph0nYbxkPl7eObm91xGpHNjNUCzMRFBb3YHs7S
	MWAIOCzXS5w3HYqzAh3UK4wMqouh/KUmSE5LgQ1zKNuHUZocelTLjct2BgH+tA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Claudius Heine <ch@denx.de>,
	=?utf-8?q?Uw?= =?utf-8?q?e_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: dataflash: remove duplicate SPI ID table
Date: Mon,  2 Jan 2023 12:18:56 +0100
Message-Id: <20230102111856.168762-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215164736.1315815-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a30144c02c84614ed160ab70e38fcf7b024a1bb0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_031908_542278_7CDD3B05 
X-CRM114-Status: GOOD (  10.33  )
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

T24gVGh1LCAyMDIyLTEyLTE1IGF0IDE2OjQ3OjMwIFVUQywgQXJuZCBCZXJnbWFubiB3cm90ZToK
PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IEJ1aWxkaW5nIHdpdGgg
LVdlcnJvcj1vdmVycmlkZS1pbml0IHJldmVhbGRzIHRoYXQgdHdvIHBhdGNoZXMgYWRkZWQKPiB0
aGUgc2FtZSBkZXZpY2UgSUQgdGFibGUgdG8gdGhpcyBkcml2ZXI6Cj4gCj4gZHJpdmVycy9tdGQv
ZGV2aWNlcy9tdGRfZGF0YWZsYXNoLmM6OTQ2OjI3OiBlcnJvcjogaW5pdGlhbGl6ZWQgZmllbGQg
b3ZlcndyaXR0ZW4gWy1XZXJyb3I9b3ZlcnJpZGUtaW5pdF0KPiAgIDk0NiB8ICAgICAgICAgLmlk
X3RhYmxlICAgICAgID0gZGF0YWZsYXNoX3NwaV9pZHMsCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRf
ZGF0YWZsYXNoLmM6OTQ2OjI3OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3IgJ2RhdGFm
bGFzaF9kcml2ZXIuaWRfdGFibGUnKQo+IAo+IFJlbW92ZSBvbmUgb2YgdGhlIGNvcGllcy4KPiAK
PiBGaXhlczogMjdhMDMwZTg3MjkyICgibXRkOiBkYXRhZmxhc2g6IEFkZCBkZXZpY2UtdHJlZSBT
UEkgSURzIikKPiBGaXhlczogYWM0ZjgzNDgyYWZiICgibXRkOiBkYXRhZmxhc2g6IEFkZCBTUEkg
SUQgdGFibGUiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Cj4gQWNrZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
