Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21ABC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zL8s2WWLAj90i4a1rvLnOeiijdR/JZsZOSnbLBrnfbQ=; b=Hl6CTzFX0QrX9E
	OoVnpIX1i687xy74aLuggHz53oofrUW/nL9MnHW3y4IoPLswNk8QxJqBWav5Al5qhlcghnh6dsiw/
	PKni2FKOo/QSymxKe53qEmpoWrxDjr+q8c3WXDKWYd0cZxhG9Fwg2T/mpkUbcFimnj3cscsthi8sv
	fppMVxQSfePRs67UCmyHhcDmWXZJZbY1fWaJW8H8w2YQ4PMtp7HSsyrpCuPO5gtR4cgRp9t37vsFy
	PLnUVisAvCj/GqJPwDvZTfp16gYhOYl1CeXRKm9FPHHbZa05op/rtrTy+BHAA/gsoiXo1aT8zzhiJ
	FJYkxOTlVsQms9YA7mLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhlW-004LZc-R5; Tue, 18 Oct 2022 08:15:58 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhlT-004LWr-Bt
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 08:15:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3F1EB100012;
	Tue, 18 Oct 2022 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666080949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGYbCnVCRL2N/56PDzBt9eENkFCD+JfN+39IJjIGnGc=;
	b=Ki1O342IMBzNGuOydPVpP9nRMnCSRTjyw73Ygv1Kdf6dutmE5iBkn7nQSgnF43L59MBcz9
	OzavHiQE/X1B6v4PyPRJ0Xc/oqa5JSGr2wfZpFGEeDG2bBIS7Ta+BQq+0/drbvkgArVqFK
	BWmtMHC4kcr1dWJuyYSEHGvr2Hr/9IfJqcnGIDqE613bgZEaz8K73nK3oMZPSS05TaWfRW
	8+GThmNE1OB8pEKCwfhHTrfYHdjwVIeTcK+DSJGfgkEzRQmnHdL+eqwl4676yFlHfs4x2R
	E6IZkGAZcCOtEuJ/XSVBF0ghJt1GkOevpRyOBDkvg4Pit4FnNHwNIk8SDdS09A==
Date: Tue, 18 Oct 2022 10:15:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: parsers: bcm47xxpart: Fix halfblock reads
Message-ID: <20221018101545.14096421@xps-13>
In-Reply-To: <85d81d4d-cdc5-2cd6-3cfd-5cf8e15d6a10@gmail.com>
References: <20221013222855.2384881-1-linus.walleij@linaro.org>
	<85d81d4d-cdc5-2cd6-3cfd-5cf8e15d6a10@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_011555_581233_D440799B 
X-CRM114-Status: GOOD (  12.76  )
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

SGkgRmxvcmlhbiwgTGludXMsCgpmLmZhaW5lbGxpQGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDE3
IE9jdCAyMDIyIDE1OjE4OjE1IC0wNzAwOgoKPiBPbiAxMC8xMy8yMiAxNToyOCwgTGludXMgV2Fs
bGVpaiB3cm90ZToKPiA+IFRoZXJlIGlzIHNvbWUgY29kZSBpbiB0aGUgcGFyc2VyIHRoYXQgdHJp
ZXMgdG8gcmVhZCAweDgwMDAKPiA+IGJ5dGVzIGludG8gYSBibG9jayB0byAicmVhZCBpbiB0aGUg
bWlkZGxlIiBvZiB0aGUgYmxvY2suIFdlbGwKPiA+IHRoYXQgb25seSB3b3JrcyBpZiB0aGUgYmxv
Y2sgaXMgYWxzbyAweDEwMDAwIGJ5dGVzIGFsbCB0aGUgdGltZSwKPiA+IGVsc2Ugd2UgZ2V0IHRo
ZXNlIHBhcnNlIGVycm9ycyBhcyB3ZSByZWFjaCB0aGUgZW5kIG9mIHRoZSBmbGFzaDoKPiA+IAo+
ID4gc3BpLW5vciBzcGkwLjA6IG14MjVsMTYwNmUgKDIwNDggS2J5dGVzKQo+ID4gbXRkX3JlYWQg
ZXJyb3Igd2hpbGUgcGFyc2luZyAob2Zmc2V0OiAweDIwMDAwMCk6IC0yMiAgCj4gCj4gSXMgaXQg
d29ydGggYSBGaXhlczogdGFnIHNvIGl0IHJlYWNoZXMgc3RhYmxlIGV2ZW50dWFsbHkgYW5kIHdl
IGhhdmUgdGhpcyByZWFjaCBPcGVuV3J0IGRpcmVjdGx5IHdoZXJlIGl0IGlzIHByZXN1bWFibHkg
dGhlIG1vc3QgdXNlZnVsPwoKQWdyZWVkLiBMaW51cywgY2FuIHlvdSByZXNlbmQgd2l0aCBGaXhl
czogdGFnPyBJJ2xsIGFwcGx5IGl0IHJpZ2h0IGF3YXkKdG8gbXRkL2ZpeGVzLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
