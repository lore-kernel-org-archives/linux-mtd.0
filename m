Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55293C4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Dec 2022 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2aQCicOHPDYQyuJxVB59lHBRDC83L6Dd7es+0Qq9jk=; b=Pm+VTpS8Lt4eLu
	uGJl2uL58Ysj9BrdKXMWymrpATsGgpvhNM+8KIodn0UIBUHynw1mi8SuCl4ld0aY8q4ADZLWMx/Yp
	AmN9McNrUWU0gzd9XhAMGX7o6dw4POENoQF7wjiaAAzaw8tG8guTSKA9Wfmjj0OIXgQLOINbB/Vjz
	2t65595zcMZ0RtQF5ZWxExgGcusmL1D2Skzfi0wiP4NmmT9z3//ic3BnUhK4NKMMR+2+2ibZo7Sin
	0UxIR8ibVj9Xy2ko0Qf+1+Ui5CGNvmrHjyYdZ54+ghOiAneS8eT+7aPaFZVT7X/Y3iJ8f2e+STwm+
	I5otMJc5yQhZmAJoKM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBHzi-00AvO3-00; Fri, 30 Dec 2022 16:12:30 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBHvh-00Au96-CC
	for linux-mtd@lists.infradead.org; Fri, 30 Dec 2022 16:08:25 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 6B3D75C00A1;
	Fri, 30 Dec 2022 11:08:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 30 Dec 2022 11:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672416495; x=
	1672502895; bh=b741EFPUe1bgAIlEI2cslsqKpSL7Wg+QlqeM91Vlh98=; b=l
	EFgSDAwiywCzxUJV4uL3vhG4slnO3cYQMQC6yJeFf1po6uxEpbwnWGhVOQkpUE3H
	p0uS7qrboke+SXqOf0ernKkxGgHEkTU6eFyrfFyh68xryfjR9nw2ALtiwWm1szE/
	ZlEiGA0aO3U6b2Yd4HNiU25Knq/bS9pES/PqlbTLXvdgCMGRi24hnFHOuiQ9wJRm
	nJbHyF+SA5CZs0J/yTz4IW5txlVf3FC2gS7A/1WB1hgjumxOAoq0Fwyv4CyheSeO
	FSE7bdd/Dm5zS4EcaGWJ944XYn6mKlCMftfM4Lphz6qK/E6A6jjC3/i1t3ef/NmW
	OTttM+Q+y0HOBXxv4QNiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672416495; x=
	1672502895; bh=b741EFPUe1bgAIlEI2cslsqKpSL7Wg+QlqeM91Vlh98=; b=a
	E2Z174njBnauv7Q9n15SAK4kUdJPGRpVPzACYQPXVAxeCGT6NHOEmHgh4rYLU+LH
	XtTOlQk6ewXfsrKOLL1SJ+ny7/mg+HYnHSAj8F83ykhOPCIDf0BGdyeV0cDp0D0x
	SWaK7ABNjRtz5BOtPSS2ic1DB4w1kES6xk9MeYUGTPoRT/VLagMKRp/UMRryMyy1
	GeHcdTJDIRHqkPBi+eomtaoSN07Dw+7eX7z2y3GQMsVSuTjEniJTmnpPGGsFSN/A
	pvBbj8IDRhET2o8HzdPs0LZcG+sIIWeP6szz7JuHvZuebh0y9mpuvvywwh1zpMIH
	LjEAkgybOgZL91lgd4d5g==
X-ME-Sender: <xms:7gyvY-0ld52a0_XV3DuTBcncUJqfo6X5fKDEL-ozYdU2lBrqp8LDjg>
    <xme:7gyvYxEwQNzlYUpny-Ki0knoeQPkooTiIukacoJWfV8Jd8foBO0ykg4AWCEcNPPH7
    9T-md1afgk_1dzOLA>
X-ME-Received: <xmr:7gyvY24VkHfu1nkB3ffPdj_CIHE6yE9gBh24tn3moHbrUfTdN-1WHyog2ufUKMb4pjK-Vs7LcqGrUI6pmSim6cBDm15TZ7U00YkKZQ4Z0Jjj-YWliRKH_4WLTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeigdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnheptdegheektdejgfelgeeljeefteevffeggeejledtffffkeeghfeh
    tedvffefgeeinecuffhomhgrihhnpehsthgrtghkphgrthhhtggunhdrtghomhdpiihsoh
    hnghdrtghomhdrtghnpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hg
X-ME-Proxy: <xmx:7gyvY_1f5cWrKhOB8rXaR-Db7wMAma-aC--EbWxuZvSGVJrgfRH2qg>
    <xmx:7gyvYxHxZnYKrxwcepT5iv9G-uek4BiEd9BNuDPbJmjogj9RdfBK0g>
    <xmx:7gyvY4-G_GBnr2nh3z6XaBUucZg-ZlTcFY-zHeRqbJ34VzC2XQzWow>
    <xmx:7wyvYxCPc4HNAeOg41oY4aUy_z3J1pvvlpsoYwU_xoXYiyHak4XCLg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Dec 2022 11:08:14 -0500 (EST)
Message-ID: <1b17f332-827b-c8b1-807c-9c6e38caf173@sholland.org>
Date: Fri, 30 Dec 2022 10:08:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221229190906.6467-1-samuel@sholland.org>
 <20221229190906.6467-2-samuel@sholland.org> <20221230134507.719edeae@xps-13>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/3] mtd: rawnand: hynix: Add support for H27UCG8T2FTR-BC
 MLC NAND
In-Reply-To: <20221230134507.719edeae@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_080821_991621_B105D812 
X-CRM114-Status: GOOD (  12.63  )
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

SGkgTWlxdcOobCwKCk9uIDEyLzMwLzIyIDA2OjQ1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhp
IFNhbXVlbCwKPiAKPiBzYW11ZWxAc2hvbGxhbmQub3JnIHdyb3RlIG9uIFRodSwgMjkgRGVjIDIw
MjIgMTM6MDk6MDMgLTA2MDA6Cj4gCj4+IEgyN1VDRzhUMkZUUi1CQyBpcyBzaW1pbGFyIHRvIHRo
ZSBhbHJlYWR5LXN1cHBvcnRlZCBIMjdVQ0c4VDJFVFItQkMsIGJ1dAo+PiByZXBvcnRzIGEgZGlm
ZmVyZW50IElELgo+IAo+IENhbiB5b3UgcHJvdmlkZSBhIGRhdGFzaGVldCBmb3IgdGhpcyBwYXJ0
PyBJIGFtIHN1cnByaXNlZCBieSB0aGUgcGFnZQo+IHNpemUuIEluIGdlbmVyYWwgYW55d2F5LCBp
dCdzIGJlc3QgdG8gcHJvdmlkZSBhIGxpbmsgd2hlbiBhZGRpbmcKPiBzdXBwb3J0IGZvciBhIG5l
dyBjb21wb25lbnQuCgpJIHdhcyB1bmFibGUgdG8gZmluZCBhIGRhdGFzaGVldCBmb3Igc3BlY2lm
aWNhbGx5IEgyN1VDRzhUMkZUUi1CQy4gVGhlCmJlc3QgZGF0YXNoZWV0IEkgY291bGQgZmluZCBp
cyBmb3IgSDI3VUNHOFQyRVRSLUJDWzBdWzFdLiBIb3dldmVyLCB0aGVyZQphcmUgbGF5b3V0IHBh
cmFtZXRlcnMgZm9yIEgyN1VDRzhUMkZUUi1CQyBpbiBzb21lIHZlcnNpb25zIG9mIHRoZSB2ZW5k
b3IKTkFORCBkcml2ZXJbMl1bM11bNF0uIFRoZSBIeW5peCBjaGlwIGlzIHBhY2thZ2VkIGFzIEVz
c2VuY29yZQpJM1QtOEdROFQySDVUQVJDLCBhcyByZWZlcmVuY2VkIGluIHRoYXQgTkFORCBJRCB0
YWJsZSwgd2hpY2ggaXMgdGhlCmFjdHVhbCBwYWNrYWdlIG9uIHRoZSBib2FyZCBJIGhhdmUuCgpS
ZWdhcmRzLApTYW11ZWwKClswXToKaHR0cHM6Ly96M2Q5Yjd1OC5zdGFja3BhdGhjZG4uY29tL3Bk
Zi1kb3duL0gvMi83L0gyN1VDRzhUMkVUUi1CQy1IeW5peC5wZGYKWzFdOiBodHRwOi8vd3d3Lnpz
b25nLmNvbS5jbi91c2VyZmlsZXMvSDI3VUMoRClHOFQoVSkyRVRSLUJDX1JldjEuMF8wODI2LnBk
ZgpbMl06Cmh0dHBzOi8vZ2l0aHViLmNvbS9lbmdTaW50ZWNrL0ExMzNfSW1hZ2UvYmxvYi9tYWlu
L2xvbmdhbi9rZXJuZWwvbGludXgtNC45L21vZHVsZXMvbmFuZC9zdW44aXcxNXAxL3BoeS1uYW5k
L3BoeXNpY192Mi9uYW5kX2lkMi5jI0wxNTkyClszXToKaHR0cHM6Ly9naXRodWIuY29tL2xhdW5j
aGZ1ci9yZzgxOC1rZXJuZWwvYmxvYi9tYXN0ZXIvbW9kdWxlcy9uYW5kL3N1bjhpdzE1cDEvcGh5
LW5hbmQvcGh5c2ljX3YyL25hbmRfaWQyLmMjTDE1OTIKWzRdOiBBZGRpbmcgbWVtYmVyIG5hbWVz
IHRvIHRoYXQgdGFibGUgZW50cnk6Cgp7Lm5hbmRfaWQgICAgICAgICAgICAgICA9IHsweGFkLCAw
eGRlLCAweDE0LCAweGFiLCAweDQyLCAweDRhLAogICAgICAgICAgICAgICAgICAgICAgICAgICAw
eGZmLCAweGZmfSwKIC5kaWVfY250X3Blcl9jaGlwICAgICAgPSAxLAogLnNlY3RfY250X3Blcl9w
YWdlICAgICA9IDMyLAogLnBhZ2VfY250X3Blcl9ibGsgICAgICA9IDI1NiwKIC5ibGtfY250X3Bl
cl9kaWUgICAgICAgPSAyMTEyLAogI2RlZmluZSBOQU5EX01VTFRJX1BST0dSQU0gKDEgPDwgMykK
ICNkZWZpbmUgTkFORF9SQU5ET00gICAgICAgICgxIDw8IDcpCiAjZGVmaW5lIE5BTkRfUkVBRF9S
RVRSWSAgICAoMSA8PCA4KQogI2RlZmluZSBOQU5EX0xTQl9QQUdFX1RZUEUgKDB4ZmYgPDwgMTIp
CiAub3BlcmF0aW9uX29wdCAgICAgICAgID0gMHgwMDAwMjE4OCwKIC52YWxpZF9ibGtfcmF0aW8g
ICAgICAgPSA4OTYsCiAuYWNjZXNzX2ZyZXEgICAgICAgICAgID0gNDAsCiAuZWNjX21vZGUgICAg
ICAgICAgICAgID0gOCwKIC5yZWFkX3JldHJ5X3R5cGUgICAgICAgPSAweDA1MDgwNCwKIC5kZHJf
dHlwZSAgICAgICAgICAgICAgPSAwLAogLm9wdGlvbl9waHlpc2Nfb3Bfbm8gICA9IDE0LAogLmRk
cl9pbmZvX25vICAgICAgICAgICA9IDAsCiAuaWRfbnVtYmVyICAgICAgICAgICAgID0gMHgwMTAw
MjYsCiAubWF4X2Jsa19lcmFzZV90aW1lcyAgID0gMzAwMCwKIC5kcml2ZXJfbm8gICAgICAgICAg
ICAgPSAxLAogLmFjY2Vzc19oaWdoX2ZyZXEgICAgICA9IDQwLAogLnJhbmRvbV9jbWQyX3NlbmRf
ZmxhZyA9IDAsCiAucmFuZG9tX2FkZHJfbnVtICAgICAgID0gMCwKIC5uYW5kX3JlYWxfcGFnZV9z
aXplICAgPSAxNjM4NCArIDE2NjR9LAoKIi5vcHRpb25fcGh5aXNjX29wX25vID0gMTQiIHJlZmVy
ZW5jZXMgdGhpcyBlbnRyeToKewogICAgLyogMTQgKi8KICAgIC5tdWx0aV9wbGFuZV9yZWFkX2Nt
ZCA9IHsweDYwLCAweDMwfSwKICAgIC5tdWx0aV9wbGFuZV93cml0ZV9jbWQgPSB7MHgxMSwgMHg4
MX0sCiAgICAubXVsdGlfcGxhbmVfY29weV9yZWFkX2NtZCA9IHsweDYwLCAweDYwLCAweDM1fSwK
ICAgIC5tdWx0aV9wbGFuZV9jb3B5X3dyaXRlX2NtZCA9IHsweDg1LCAweDExLCAweDgxfSwKICAg
IC5tdWx0aV9wbGFuZV9zdGF0dXNfY21kID0gMHg3OCwKICAgIC5pbnRlcl9ibmswX3N0YXR1c19j
bWQgPSAweDc4LAogICAgLmludGVyX2JuazFfc3RhdHVzX2NtZCA9IDB4NzgsCiAgICAuYmFkX2Js
b2NrX2ZsYWdfcG9zaXRpb24gPSAweDAwLAogICAgLm11bHRpX3BsYW5lX2Jsb2NrX29mZnNldCA9
IDEwMjQsCn0sCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
