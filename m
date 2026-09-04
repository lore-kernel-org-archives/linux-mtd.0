Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D40C79F89
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw3Yp9PuCK2SmxLz0nnfYrfMLvAl+GbQaeK6LFI+zRA=; b=cdx+oEzmjNo0F4
	dXZah6wYVqrhGiTkKhyvYiYsUI1D/UejX240fHLe00pCOh3Et2LMa1mhWsedaeQUEdx5Q28hFB2Mx
	qKyTDawqP+nIPMiY8sSXsNrXzeUM0oaoGBSnWnk2f4S/NOp21BJa31t0jktyalo4/sOaXXAgevMia
	Jw0XlN44Kzrg7048yVSOAzwX5m8aYeGBmKlHI/iHgs/0HET8fVCVsH4ZHW26JlWAdtDa4B0b3IhXa
	k+8IMUXyG1SELne6vRL1ip/2EK0QY42pK0pqHPJeHudPVhBaYU7WXc/KpXNrdXES8JUlhsUIts+3O
	zGJ8P1QjujjMq/sb2yEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLe-00000002ypu-34F2;
	Fri, 04 Sep 2026 18:09:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLc-00000002ymH-1pKg
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:09:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EFA271A199C;
	Fri,  4 Sep 2026 18:09:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBD9E6057F;
	Fri,  4 Sep 2026 18:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6818411C78705;
	Fri,  4 Sep 2026 20:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ca8H73x2xQm8L3T2lZGE+j6oHWmt8WLN0PGrvi1lAPs=;
	b=wHZnLEaCwcbRp47TkgRBv7KBXtgP6yQ1GzwIKpCaeCX0BEZCuFkrKBATzFIpAGAZzKvfNn
	XoOlE7UP7WHizpylU5fDBeRRwFiygiEtLy8Y+TvWSPQt0dyZakm6RGwh6XuGikgLp6oMQb
	+Dk4hzAB5XKlMTrQy/cx7Yt/aWf8KE8BQdDplAPApA6eJsWyfjbjtLnVpytgZFDgSYYXGv
	Lv9KqVBFZhaxVkDKVAILP0rXv5kWpfD+3rWuf0Zacw/koYQST+HYqOuJK9CpUfma/W2JDH
	Vopxt+F1GgoStHF1E+y51lRiIp63RO5YCaQCnSTb5wNS1Awy9FQfhSskUrC/Zg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, christophe.kerello@foss.st.com, 
 johan@kernel.org, linux-mtd@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260822045957.12511-1-triet.hoang.dev@gmail.com>
References: <20260822045957.12511-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <178854534427.1533016.709006887043927226.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:09:04 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110908_611799_9B290A4C 
X-CRM114-Status: UNSURE (   5.54  )
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

T24gU2F0LCAyMiBBdWcgMjAyNiAwNDo1OTo1NiArMDAwMCwgVHJpZXQgSG9hbmcgd3JvdGU6Cj4g
Q29udmVydCB0aGUgZGVwcmVjYXRlZCBTSU1QTEVfREVWX1BNX09QUyB0byBERUZJTkVfU0lNUExF
X0RFVl9QTV9PUFMKPiBhbmQgcG1fc2xlZXBfcHRyKCkuCj4gCj4gVGhpcyBsZXRzIHVzIGRyb3Ag
dGhlIF9fbWF5YmVfdW51c2VkIGFubm90YXRpb25zIGZyb20gaXRzIHN1c3BlbmQKPiBhbmQgcmVz
dW1lIGNhbGxiYWNrcywgYWxzbyByZWR1Y2VzIGtlcm5lbCBzaXplIGluIGNhc2UgQ09ORklHX1BN
Cj4gb3IgQ09ORklHX1BNX1NMRUVQIGlzIGRpc2FibGVkLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRv
IG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBDb252
ZXJ0IHRvIERFRklORV9TSU1QTEVfREVWX1BNX09QUygpCiAgICAgIGNvbW1pdDogMDllYzRmZTkw
MzZlZDBhMDI5MzUxOGRjMTFmMjQ4MDQyM2QxMTM5YQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFp
bGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChw
cm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywK
TWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
