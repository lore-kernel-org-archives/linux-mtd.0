Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED694C3271E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2024 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3xz7ibqup2GBommSvenSdpIumV+aTJ/ipgKNJtv0ek=; b=dRwA2bMUmi2mOD
	JK1yJlhjPbyzt/lYZqxFAxuixQsz/uXUvX1qlgl7UlI+IecnmsfodfTb0trrdc8vGXBJvzk/78kli
	OqjXTY9WVdu96aVds2YF8TwHpJkxZWDTGxEvVJbQbRpicyt6AGVJ9Ewgg6pTSKRrQSuVZLlFXrVIt
	8K4Qsl0ig7wC83Nb6278EzlywXqh4posd54p2lrZi7f247FfAPHzzILpq3EP5l6qHekrnjAIZE+8d
	yBH3xsA8E2nwIHHP7lSn441jH0oVSn+Pn8KuJqWlIq9NAPzC4pJSvvI/1eZVQ/xjZPisfNJUekxAU
	2U7apuvKKEE/fPvJU1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPkqJ-0000000GKY1-1Bhv;
	Fri, 05 Jul 2024 15:27:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPkq6-0000000GKXI-0KiO;
	Fri, 05 Jul 2024 15:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6JnxrUOlqbH2mNGsHeA7Vvi/lieV8ve4eKCHNY22ByE=; b=MEbKK9VHkSLWYKZmdBaJ5ogtqg
	maO5tP0iwerNspna9r9cFlIPfXObCeDhG/pW8j4IuGE7/E0V1Q1PSm76pDEbXI6c0griGYdK1yIyn
	VBoLZAe45jGiAebXWiYqCFvlqm8Q3QDjBuozEn960oqfx+DTTvxVj0yMwKYy7jLlpZusuRXL1v3/n
	e+Utzivuy0JXediyGURaowaFfn+57/YCfH12p/foNN90/kHc/3kXeEMuQoJr8HbMwgec3Y+M743Ay
	MopfUxzl+K+JZsfAc9wcdtnxAC/9zwVOeLr4HnAA7QeDwGKHNyb2MQU+RSGzL622zZOMoaqpHvjse
	mKh52dcg==;
Received: from mout.web.de ([217.72.192.78])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPkq1-0000000AL56-0N5i;
	Fri, 05 Jul 2024 15:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720193177; x=1720797977; i=markus.elfring@web.de;
	bh=6JnxrUOlqbH2mNGsHeA7Vvi/lieV8ve4eKCHNY22ByE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=J9dWrh77ExL55IHtoHg9UexxBIB1DbtXtNZWyZx2CcLCm7ZAopRT05QVgDrwgI4i
	 Fx1WVsR63xBJGTn8w4XU69mpiYeJqTT++7Eqbqd+AtsQc7Fi1t53WBZGph2XgEnb/
	 FslclELTR7MABLKKWpQaANZcel5SqO6ltpBEDr63L9EZcvD/lorqWhsJTdUbvjy7E
	 BBVKLn+36Z1ygzoecQ5RoB4IFcEqYsMYEsnLNPXBScYIAnRrSrhokGtfWAvdWUj0e
	 /1rqvOupHoCZsU7tOEqKwQK82xhok/S75A9a403RBUrp/6yQlrtuAdQX/35L0clrA
	 1Tj/t1wg0Rfw6xu3CQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0qvH-1sE7ky2rP3-013FjJ; Fri, 05
 Jul 2024 17:26:17 +0200
Message-ID: <e3dc918e-07df-4fd1-b69a-9650a246ff7c@web.de>
Date: Fri, 5 Jul 2024 17:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vladimir Zapolskiy <vz@mleia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Li Zetao <lizetao1@huawei.com>,
 Yangtao Li <frank.li@vivo.com>
References: <20240705093851.18107-1-piotr.wojtaszczyk@timesys.com>
Subject: Re: [PATCH] mtd: rawnand: lpx32xx: Fix dma_request_chan() error
 checks
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240705093851.18107-1-piotr.wojtaszczyk@timesys.com>
X-Provags-ID: V03:K1:lNOiipqr4XlYK+cmZBteRE8mMPYw/wCeZ+u14Ww6uOWGO9szABd
 FxzXJYVNM934Ocz33GU+zcYxPubpf+O0CjTdlrfb0dUoSVLRjLQ06CXqr+uWimHZ9npuX5o
 BedgALtHx3GvG8kHwEBuOgC9UIzpNN3vx9N2BQkQxJFyvRd74s5R7l2LelgxzxLzG7V8M/q
 BRw6CGbfF+KEaRYChm/Zw==
UI-OutboundReport: notjunk:1;M01:P0:UOTWRfcKhgQ=;RZsdVvtSLb0xq/AQHD6GuOMZe1v
 yHkjXhczTksARmriX/0/1KrtpAQcngmT8mLglKUiSyqa5kxX5iTVBWBzI/2hf2/jN8DhGt2oQ
 foZTPsKoozTi1KSkyDId+oIOsogAJo7Z9O+mOmF5oeAOl12NcthBQ3EXtlt+KfFdzqiwhRYtN
 +y8jVpktVXr0pW4BdTwcVyTuBel5Us2QcZFFtgHxUqzlEBBpGyhyXAuMkcT7SuMMZOmrXCbGd
 a3N6/xIXb4MydUcTb3VuDNR6aXKoRjiNciOXOwbwGkHuw6G7kq6oZe+Mlxbkwof+uwd29W2Tf
 wBhNcVAd1UuHAsR2KPNEmfNJ1HUo9z1TiPOt2aiVv9yhDk5dlWMG+I2V94oPjowHt/wjVBHiu
 6cGxt7PwuVFfrVMY4MymUbkA2u6TDJqQxmnFFqHNlYL4/oz+VXmQdCwH6SWvBgOCmDlO2tybi
 TLrbDUzTU5HugnSLSp3afdbgg2UejdgVgMl9j08BidPFcitaOO761grOSdHZrFvicc3uUy/Kg
 a+G6ataG7Gj3FgQBHW0vM7TD4TAt4W8FARDhAsOgPrwsQrza74gTnwCdM3G8E5rDtmkxT5r6B
 ByYGltDJsYfRdZzGPwWJ6od2gY3Etbj1ZiKUb3TYdlGENOWyd8sqyt4Yt3QPhuNbBFl4cQ4xH
 8HBytZdxvD9i/q0HY+0rzn7YJF9xAKnAzC17MEFmIqcHPC4TI6hr0W0L+vdkyqc+t7S/W6PrX
 2cVfHFKp/8nCLhD1nw5kEKWJGz0CP1DNkmhegUX80OXmgdcO9wN9WSX8ciKT9XZsiRS6mzJ+2
 XBKW4XxjaPYea1g7KshKf89Q3HSES+UZ7rM/3iqK94Xh8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_162705_594178_C7146A02 
X-CRM114-Status: UNSURE (   4.90  )
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

4oCmCj4gZG1hX3JlcXVlc3RfY2hhbm5lbCgpIHJldHVybnMgTlVMTCBpbiBjYXNlIG9mIGVycm9y
IOKApgoKKiBJIGZpbmQgdGhpcyBpbmZvcm1hdGlvbiBub3QgcmVsZXZhbnQgaGVyZSBiZWNhdXNl
IHN1Y2ggYSBmdW5jdGlvbgogIGlzIG5vdCBjYWxsZWQgYXQgdGhlIGFmZmVjdGVkIHNvdXJjZSBj
b2RlIHBsYWNlcy4KCiogUGxlYXNlIGltcHJvdmUgc3VjaCBhIGNoYW5nZSBkZXNjcmlwdGlvbiB3
aXRoIGltcGVyYXRpdmUgd29yZGluZ3MuCiAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni4xMC1yYzYjbjk0CgoKPiBGaXhlczog
NzMyNmQzZmIxZWUzICgibXRkOiByYXduYW5kOiBscHgzMnh4OiBSZXF1ZXN0IERNQSBjaGFubmVs
cwo+IHVzaW5nIERUIGVudHJpZXMiKQoKUGxlYXNlIG9taXQgYSBsaW5lIGJyZWFrIGZyb20gdGhl
IHRhZyBzdW1tYXJ5LgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0
dGluZy1wYXRjaGVzLnJzdD9oPXY2LjEwLXJjNiNuMTQ1CgpSZWdhcmRzLApNYXJrdXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
