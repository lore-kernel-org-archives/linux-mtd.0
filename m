Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4264C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0/dPLWVxLBv64zEnFdp+yRb5SRaoEt3zFxZu+zZrpc=; b=myqXTy4V+MnPbv
	TyBqcaXKmDVXB/Opft+0kTeSJ/qmUwhZTx0ugzUF9xQMuRtAMYHt0ie3UyD+nKTN3gLisYwQ+oBMW
	pTndh/E1k1HmxIw/JckoQgQkqauYviWp265xgOJkNstKWW19V7vd4WazaptgbMcf5HvGLtRsEw2qf
	yMSIdBY/6leZqPLQ7rUbBSiHnzS9K9dPcvdr3t/kzgWFUweQTB1D/MJAhvEsh604enfBIPRlsVS0M
	e2rNqemhqHwF6NtPPdA0XJcrk89byAty7uLBs94HCVZih7b668Ma7UVAtL1BFqpeUpS76zttc9Svw
	a4ecA09IaqVm7XeOJ9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzvW-004ZCS-EP; Fri, 04 Nov 2022 16:52:19 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzv2-004Yse-1G; Fri, 04 Nov 2022 16:51:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2389EE0006;
	Fri,  4 Nov 2022 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2TpV1GkI8zGQR6JKfyw/HdeFrbBiylvnAQB2Uw3mqNs=;
	b=WMLsC7SmXuJmoX0RIhZMa9MCjLX40bblUGF4D7yA8RKM5cAoPU9S7JuH8Ell4gOlE+BIOC
	POakrWGAPj5Jz5EW77NkUuBT8fVp8CWifEqC5ye9D69d4BD22xvUx4dSM9p+2FIMu18VJY
	749sh98b0COmXUKQQ79jZ30UhX6lbui4nWkglF+VdSw9gro8qygHy1ldlJfANPgsfe2V6p
	vFL+GMadFXsFB08z1OpXFyyWnj5VVUvFav8jz+cn3CX86ae+NihEQOzo5kjSUlNeARW+J1
	LW021OsOeZWQxZipUUCtsMWGaQ1GvmOkd2Nz8bK9vOLTKHfwwUDztmPyxK+yiQ==
Date: Fri, 4 Nov 2022 17:51:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vadym Kochan <vadym.kochan@plvision.eu>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
  Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Elad Nachman <enachman@marvell.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <20221104175142.5ca2f132@xps-13>
In-Reply-To: <VI1P190MB0317E5C8AD323A8D1A4B5D8195379@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
References: <20221026134545.7146-1-vadym.kochan@plvision.eu>
	<20221026134545.7146-2-vadym.kochan@plvision.eu>
	<33f04b06-dc00-b7ce-6a24-2282608b40dc@linaro.org>
	<VI1P190MB0317C739E2D39427CD2A771D95309@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
	<10581088-e4ff-76db-3c9b-42a7a9c118ee@linaro.org>
	<20221027151825.166a9255@xps-13>
	<e937b059-4168-3bd4-b294-cbfff0519d1f@linaro.org>
	<20221027155025.7c04774a@xps-13>
	<683dffbc-744f-80cd-2262-b6deb4200ccc@linaro.org>
	<20221028094740.3c11f52b@xps-13>
	<a98f00bd-013a-a1ce-0054-bbceeaefcefa@linaro.org>
	<20221028145049.76db792f@xps-13>
	<VI1P190MB0317E5C8AD323A8D1A4B5D8195379@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_095148_290517_33CC9A94 
X-CRM114-Status: GOOD (  10.29  )
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

SGkgVmFkeW0sCgp2YWR5bS5rb2NoYW5AcGx2aXNpb24uZXUgd3JvdGUgb24gTW9uLCAzMSBPY3Qg
MjAyMiAxNDoyOToyMiArMDIwMDoKCj4gSGkgS3J6eXN6dG9mLCBNaXF1ZWwsCj4gCj4gT24gRnJp
LCAyOCBPY3QgMjAyMiAxNDo1MDo0OSArMDIwMCwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiBIaSBLcnp5c3p0b2YsCj4gPiAgIAo+IAo+IFtzbmlw
XQo+IAo+IEZvciBtZSBpdCBsb29rcyBsaWtlIHRoZSAibGFiZWwiIGFuZCAicGFydGl0aW9ucyIg
Y2FuIGJlIGRyb3BwZWQgZnJvbSB0aGlzIHNlcmllcywKPiBzbyBpbiB0aGUgZnV0dXJlIHRoZXkg
Y2FuIGJlIGhhbmRsZWQgYnkgdGhlIGNvbW1vbiBtdGQtcmVsYXRlZCB5YW1sID8KCkkgYW0gY3Vy
cmVudGx5IHdvcmtpbmcgb24gdGhpcywgc2VlIGJlbG93LiBUaGlzIHNlcmllcyBoYXMgbm90IHll
dCBiZWVuCmFjY2VwdGVkIGJ1dCBJIGJlbGlldmUgeW91IGNhbiByZWJhc2UgeW91ciB3b3JrIG9u
IHRvcCBvZiBpdC4gUGxlYXNlIGJlCnN1cmUgeW91ciByZWZlcmVuY2UgdGhlIHJpZ2h0IHlhbWwg
ZmlsZXMgYW5kIGRvIG5vdCByZWRlZmluZSBnZW5lcmljCnByb3BlcnRpZXMgKGZyb20gbXRkLnlh
bWwsIG5hbmQtY29udHJvbGxlci55YW1sIG9yIG5hbmQtY2hpcC55YW1sKS4KCkxpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIyMTEwNDE2NDcxOC4xMjkwODU5LTEtbWlx
dWVsLnJheW5hbEBib290bGluLmNvbS9ULyNtZjJhOTRmYTM2YjQ3NjBiMjkyNjljNWI5NGE3ZGZj
YjUzM2M4Y2FmZQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
