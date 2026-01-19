Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B92FCCF2D2
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmbWfPB5ItVeRPVqeUbKPco8ivx4FD9lsRzVYo+keZg=; b=G1d8LZpfcE/LH8
	jq9jQp5Mri7xvFL7UIx2tFK2sy3fSRrlLfNkczu9nPH7hgnwEvmxJeMD7GHn1JzW7TzljkWQc/OBM
	Oz/xNdFutCuR4imgcuWfpldk1M/5n07L2jSkueOFltSBnM4V1ouyaHu1L/hxnRJa+nNhSBt1b7ISA
	AEPBuDWel3Yn6Hx4UCVw6el4OkQSOiBdXrnSlG6Zj1BLHF2jHD27lwHFNVLaYi9LOAEDIY79cB8ek
	012ZOQVmTFiv3ZX5agIyQVdHfFBPeCWU33D8hbb8ye6YpruwD3BmJxvLoDuQhHLUdoNBP1W/zT6gd
	BamCJn0PgguNYikfoqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmOK-00000001l1y-0K9V;
	Mon, 19 Jan 2026 10:21:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmOH-00000001kzw-1OeA
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:21:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 72ACAC214C1;
	Mon, 19 Jan 2026 10:21:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 788F360731;
	Mon, 19 Jan 2026 10:21:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D7C310B6993C;
	Mon, 19 Jan 2026 11:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768818102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=io7/1CBGpuEJksfwcZ+XEOWyqPrISU4aqPzE15+/GSY=;
	b=Lx/LxEnmn6xez3KdCkr3UsfqmbFYZZYuzGUq47Asl1MAutDbD7JnSvswBbUh9qHB0bIYif
	prLSBcz/d3UArSjqKesJwqFgL+o9k4zrQcyXdHls7Jhc0sZZfOlkqu1Gu36C3vhVlBMSJm
	yslnIS5tEBpYZI2uMorwYIvLPQ/vBo5m/HPtZ4VGMsgzL5FMlGARp7bCYJrdI79alT6y/b
	xG2q3iV5HISuUzXKEr+tcVWaWL8J0Xc8+UzduWVtbfLvty3oFctuFJmfmADN5n5Wf7YpZc
	CzHdptaSEB6AJlnK8iDwHgm9tnSYFtbIaZm2WCsfPYE4XlAiLpnJuzNrpt4R9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] at91: Remove of_platform_default_populate() calls
Date: Mon, 19 Jan 2026 11:21:35 +0100
Message-ID: <176881807614.2444994.10707378152162604281.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_022145_512979_561742FE 
X-CRM114-Status: GOOD (  11.67  )
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

T24gTW9uLCAwNSBKYW4gMjAyNiAxNTowNjo0MiAtMDYwMCwgUm9iIEhlcnJpbmcgKEFybSkgd3Jv
dGU6Cj4gVGhpcyBpcyBhbm90aGVyIGF0dGVtcHQgYXQgcmVtb3Zpbmcgb2ZfcGxhdGZvcm1fZGVm
YXVsdF9wb3B1bGF0ZSgpIGNhbGxzCj4gb24gYXQ5MSBwbGF0Zm9ybXMuIFRoZSBsYXN0IGF0dGVt
cHRzIHdlcmUgaW4gMjAxOFsxXSBhbmQgMjAyM1syXS4gVGhlCj4gcHJvYmxlbXMgcmVwb3J0ZWQg
YXJlIFBNIGFuZCBOQU5EIGZhaWx1cmVzLiBCb3RoIG9mIHRoZXNlIGRlcGVuZCBvbiBTUkFNCj4g
cG9vbCB3aGljaCBkb2Vzbid0IGhhdmUgYW55IGZ3X2RldmxpbmsgdHJhY2tpbmcuIEFsc28sIHRo
ZSBQTSBjb2RlIGlzCj4gbm90IGEgZHJpdmVyLCBzbyBmd19kZXZsaW5rIHdvdWxkbid0IGhlbHAu
IEZvciB0aGUgTkFORCBkcml2ZXIsIHdlIGNhbgo+IHNpbXBseSBkZWZlciBwcm9iZS4gRm9yIHRo
ZSBQTSBpbml0LCB3ZSBjYW4gbW92ZSBpdCB0byB0aGUgLmxhdGVfaW5pdAo+IGhvb2suCj4gCj4g
Wy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8zXSBtdGQ6IG5hbmQ6IGF0
bWVsOiBEZWZlciBwcm9iZSBpZiBTUkFNIGlzIG1pc3NpbmcKClBhdGNoZShzKSBzaG91bGQgYmUg
YXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQ
UiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2Fy
ZHMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
