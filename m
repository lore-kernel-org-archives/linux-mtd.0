Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B86FE77173
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BbfSIh5lc8/dmQ1dOtN2LIpzg8bjkB898icyxe1mivA=; b=ZVATVNZFI41C6e
	W6rXmpZzMuxLcqoVOJ9WbvN0RmJH4Bv2biJKSPnAKGvius/nnm1zdgXG4yClTBoy7K3FTA3w7QmzI
	6c0pZLSVDon4F9xklVUIHqVNljJGWt48GPiadTkTXCVnBXAB124qF4pld2VjzPc0kZfF7mwm+XvgZ
	1CvM8dwQJeOiDYl+T2dGR8f/5KZ5yqyfg8eXMzbcUidfYnvMmvDiiacMQrA9h3ueGU/d7hsIZKL73
	oBNqFDeYyvWOe18ZJDgKi1j2L+EIbZuefJnMD8rh+gsYx6lgk4NY5egbN+y4rV/ieHxfmcYcXTZCw
	CvtrAoVXYsDTltNA2Gxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Qw-0000000FcZO-1mIe;
	Thu, 05 Dec 2024 10:50:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Nf-0000000FcBy-1xRk
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Dec 2024 10:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=inXZSiSdow9lnlxEHLSvl7TRY3Mjafcy8CPpOrdlgqE=; b=iyzCEKcgYAof1Aa1xt+bDjg61t
	5Gzr5GwZMAPxme60swK99sExjIVRsL8KH07g5ZDLZpUf1stXlTwqbM1PytZMqsrJ2w0Cm7nmqxHt9
	+B0dQvfaEhiHwA2Ed9KIANfUaq4h2YPCCCbNX0tSiTD23cF2FBT9drC4keWsqpitD8RjM4hPc6S3d
	Ei+UI0aPP1J/eWxe4Mv9yJpn+aQ4Vu9i+LJ2yEX70ugo5wI90ezoWYl4okpZ4lgR6ouXqgx3Wda2O
	IC5chDdpcguFcIN0AUHduE+5Jls2tB9xPGd0ZM1VE9pFUN1XWEQ8Cvk2Qnq666EaoHOHsz6AtlK+P
	7aXxTGkA==;
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Nc-00000002p8e-2C8T
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:46:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDB68E0004;
	Thu,  5 Dec 2024 10:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inXZSiSdow9lnlxEHLSvl7TRY3Mjafcy8CPpOrdlgqE=;
	b=bx/XghAAOu5daQIBI50PbI23icFM90XQCnPU9shwwP3VCxUfv8gLaLJvx2fuLfGE6mNamH
	usAhgCUSTFjrt2u73yTpwmQJGN+zPg+fBGHzJrgV482BTkqwYWUFAYErvu2KWx0BW3Yobt
	jhElUSa7/cBOYezsIaicvPw+76XkIbA2sIVS3Z/7eMwpb05YYvGZ+6Ynd6YZv/WEHPQ7JM
	V4Zoke0EkSxLatqqUxrIexUTqxbv2VMIF7EIj76+y/wM1perMmFPH6RlJsw86AVH7erGZx
	ktxXs4HduY/MNyS29wzbQc8332yaCPeZbdH80Ls+ANVBjRjqX1bEPrxZULyvUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Heiko Schocher
 <hs@denx.de>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,  David Jander
 <david@protonic.nl>,  kernel@pengutronix.de,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/3] Add support for Fujitsu MB85RS128TY
In-Reply-To: <20241203-mb85rs128ty-v3-0-79107d54d839@pengutronix.de> (Jonas
	Rebmann's message of "Tue, 03 Dec 2024 11:38:34 +0100")
References: <20241203-mb85rs128ty-v3-0-79107d54d839@pengutronix.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 11:46:40 +0100
Message-ID: <877c8ev23z.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_104644_721091_02865177 
X-CRM114-Status: UNSURE (   7.22  )
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

T24gMDMvMTIvMjAyNCBhdCAxMTozODozNCArMDEsIEpvbmFzIFJlYm1hbm4gPGpyZUBwZW5ndXRy
b25peC5kZT4gd3JvdGU6Cgo+IFRoZSBGdWppdHN1IE1CODVSUzEyOFRZIEZSQU0gY2hpcHMgYmVo
YXZlIGFsbW9zdCBpZGVudGljYWxseSB0byB0aGUKPiBNaWNyb2NoaXAgNDhMNjQwLiBUaGlzIHNl
cmllcyBhZGRzIHRoZWlyIHN1cHBvcnQgdG8gdGhlIG1jaHA0OGw2NDAKPiBkcml2ZXIuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBKb25hcyBSZWJtYW5uIDxqcmVAcGVuZ3V0cm9uaXguZGU+CgpTZXJpZXMg
YXBwbGllZCB0byBtdGQvbmV4dC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
