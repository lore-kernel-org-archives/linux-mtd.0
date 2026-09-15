Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2F6C88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 13:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E45SbkpEo0PYJbyUHoJ8KElnrPRM4ONVTiP8/OoPyfg=; b=48533pfaMoOBtY
	wTXjFHWz6Xp7RAZPmp0z3b6TKP/SWWIHiY89NNSdWzMVsTE2pyE/MAoaq4ld0AgaPVbgIn3xW56Lo
	FYHyo2cEYb3yvm3Y82ccQXHTudGYopLDY3XAMPzokw6x6+iu/nOUrf9O9ZDads5CPZK99yNjO56Ws
	HsKx6nxptGIVXcA+K4OkCxQndLqxdqRPa8VhVic3Exf9QYShI8y2SAFOTbZ8bSLD+9jYBxwoSA4ce
	FKZD8KmdVTpjKZWNCyTI23yyC5O71CWp02wJhEd5OvB9mDuVMctfImQVJr0dSEaHt3oPQKPtaxPiY
	VwVegVcDc1bxHDgU4/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TLo-00000006l9A-1MFx;
	Tue, 15 Sep 2026 13:37:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TLl-00000006l61-44qQ
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 13:37:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27C42C5CD44;
	Tue, 15 Sep 2026 13:38:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AD3560498;
	Tue, 15 Sep 2026 13:37:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4A6411C7AFEF;
	Tue, 15 Sep 2026 15:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789479444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RKb5raYH5jjg44l7lX7tk09hl1TxxM+EOthKDMqnefw=;
	b=rJYS+GGOGKJDnkFEYwc5rjJq7ei4z5rkLCbLTzhsk8d087j7LjBZnO/99LP/hq5fEXQI46
	aEsuCC9tT35rvp476F9GJZO9KTowL/EuCqr764OoQkL2k5jQTrEJVeTLUCWhs95SsW1SQK
	/sjidzNIBpCQt3TfBTRV8Od2FBDMEgQVT8LgXgx6jShnJHRIlY7BTN72mwgmv27U8BDRrA
	ZJ4IGE9A3WakazyW5nH1u9vrfPHiH3TqgcSUTmK1vWDw9z65PlOh7uePo18kJRnCbOmSpt
	Ggmhe9eKq9eYQ03SZGNqmsF/8FxgBtHaWTTNWPQ3TNOgb02RLRpD50z05YcfVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <mwalle@kernel.org>,  <pratyush@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <tudor.ambarus@linaro.org>,  <alex@sverdlin.org>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
In-Reply-To: <e15daee278f346cd8dae030e2409445e@infineon.com> (Takahiro
	Kuwano's message of "Tue, 15 Sep 2026 06:13:57 +0000")
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
	<20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
	<DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
	<fb4398e88939472eaa86cdc098a3d265@infineon.com>
	<DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
	<e15daee278f346cd8dae030e2409445e@infineon.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 15 Sep 2026 15:37:21 +0200
Message-ID: <874ifqoctq.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_063730_172621_D7D1BC50 
X-CRM114-Status: UNSURE (   7.11  )
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

SGVsbG8sCgo+IFRoaXMgZGlkbid0IGhlbHAgYXMgU0ZEUCBjYWNoZSBzaXplIGlzIHRydW5jYXRl
ZCB0byBQQUdFX1NJWkUgaW4gc2ZkcC5jOgo+Cj4gCS8qCj4gCSAqIExpbWl0IHRoZSB0b3RhbCBz
aXplIHRvIGEgcmVhc29uYWJsZSB2YWx1ZSB0byBhdm9pZCBhbGxvY2F0aW5nIHRvbwo+IAkgKiBt
dWNoIG1lbW9yeSBqdXN0IG9mIGJlY2F1c2UgdGhlIGZsYXNoIHJldHVybmVkIHNvbWUgaW5zYW5l
IHZhbHVlcy4KPiAJICovCj4gCWlmIChzZmRwX3NpemUgPiBQQUdFX1NJWkUpIHsKPiAJCWRldl9k
YmcoZGV2LCAiU0ZEUCBkYXRhICglenUpIHRvbyBiaWcsIHRydW5jYXRpbmdcbiIsCj4gCQkJIHNm
ZHBfc2l6ZSk7Cj4gCQlzZmRwX3NpemUgPSBQQUdFX1NJWkU7Cj4gCX0KClRoYXQgc2l6ZSBqdXN0
IGJlaW5nIGEgc2FuaXR5IGNoZWNrLCBpZiBpdCBubyBsb25nZXIgZml0cyBvdXIgbmVlZHMgaXQK
bXVzdCBiZSBpbmNyZWFzZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
