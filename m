Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7E8E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHs0+mKJAsv6mame/xHwlVFKuAeYSWxg7VTjnkrIgBQ=; b=TerYInTVtXaCQ8
	GvfdOyFNioyg7abBHhABtUB9jAHvKhAmfTUcAHvNyEwGbbiFMsp65ZHLm6cruIM5ZSA9h5ja/bjbd
	PYF9OO+xB0jiSpQY0ErHJGzW+FQct4JEKYEI9WBvcAxP4MMH9N+TVkH7kqYzWJC1dzhAc2jCxASO0
	Q8duZ7vHvoTr8160F7jCaIAvVq0HPqDn7r3aEK5JIg4L8NLkQ7nkGQtX70lCaWCc6YYac2vESqioR
	594xaKkjbbiN2Xts6FzVe7Vfdwzy6ioHND2ym6xG95fIWIMQCZB+oqEqElsQjIFeP984KZmImiKoG
	G05lfRSyW+yQ8otz1tDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4JO-0000000BzBT-1bzn;
	Tue, 24 Dec 2024 12:46:58 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4IB-0000000Byuf-0Pb0;
	Tue, 24 Dec 2024 12:45:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C24361BF203;
	Tue, 24 Dec 2024 12:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735044340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FyNdq7QSQghOLluVRgy7Wxrmk0g9pD6sxxaWDMGrIQ=;
	b=N7kD66nsYD0DWDypGCZBfHK9LDjkSdkwy0bo+SNaf2vqCrRHXa2wi2vV1OTyrLsN9XUrq3
	lu9B/SqVTpEV5ydKFCcUQnd6ew76PH5qD3040JHAgoSkQWHrNQNiv33tm1k6eBPIQ8qwN0
	2CgjhcFGnmktXboR6rFLvk92dsNx0UI8PSSbDgPW4oQMjpNVctB7Z2NiUjjE2AOpC3B6az
	Du+cSay4R/If/Pb0AuQY93KlsElJxa7cPp7TSsumBNdnPk2Rf74UfqwacDtgGKcNYSwNnq
	FH5tWchm7hzfeQGUn4b3sgKdV76LcDzochwBCt4PhqMK/BNEZZBntAfySvMDzw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nikita.shubin@maquefel.me,
	arnd@arndb.de,
	vkoul@kernel.org,
	esben@geanix.com,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] Add support for nuvoton ma35 nand controller
Date: Tue, 24 Dec 2024 13:40:59 +0100
Message-ID: <173504401426.1625053.7886349006828481289.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206031318.156152-1-hpchen0nvt@gmail.com>
References: <20241206031318.156152-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_044543_281197_EF21DDA9 
X-CRM114-Status: UNSURE (   8.30  )
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

T24gRnJpLCAwNiBEZWMgMjAyNCAwMzoxMzoxNiArMDAwMCwgSHVpLVBpbmcgQ2hlbiB3cm90ZToK
PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHRoZSBtdGQgbmFuZCBkcml2ZXIgZm9yIHRoZSBudXZv
dG9uIG1hMzUgQVJNdjggU29DLgo+IEl0IGluY2x1ZGVzIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlv
biBhbmQgdGhlIG1hMzUgbXRkIG5hbmQgZHJpdmVyLgo+IAo+IHYxMToKPiAgIC0gVXBkYXRlIG1h
MzVkMSBtdGQgbmFuZCBkcml2ZXIKPiAgICAgLSBGaXggd2FybmluZ3MgYW5kIGNoZWNrcyB1c2Ug
LS1zdHJpY3QuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8y
XSBkdC1iaW5kaW5nczogbXRkOiBudXZvdG9uLG1hMzVkMS1uYW5kOiBhZGQgbmV3IGJpbmRpbmdz
CiAgICAgIGNvbW1pdDogYzIwZTA2MDE5MDg3NDEwODMyNDU1ZDAxYzk3ZTlmNzJmNmJiMTYyNgpb
Mi8yXSBtdGQ6IHJhd25hbmQ6IG51dm90b246IGFkZCBuZXcgZHJpdmVyIGZvciB0aGUgTnV2b3Rv
biBNQTM1IFNvQwogICAgICBjb21taXQ6IDVhYmI1ZDQxNGQ1NTA5OThhMjM1ZGUxMTYxYWM2YmVm
MjQwYjBjMjkKClBhdGNoZShzKSB3aWxsIGJlIGF2YWlsYWJsZSB3aXRoaW4gaG91cnMgb246Cm10
ZC9saW51eC5naXQKCktpbmQgcmVnYXJkcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
