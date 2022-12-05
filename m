Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40911C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 18:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mokxSb4xCtptaCksyQVe4yQ7pa6/YvRBfBTeP66kxHs=; b=pfpxyZjs64K0IV
	r8zU97xkzxd6CuwWxSIEBcyKZtOda1u0qfK1WPQ564yQa2644B3egumrTyzcok4+vDYvA20l+nqNy
	O7gb0ACTgaFSYUs/NeZ8LCs19Z27F9Whzr0eQjQXzGB/cBIdGGAlN1zkMe7XWq1TvbY2bgaz3yXwg
	gRvhMIqegJsTOzSDLA+ari2Hkn8TkaHTpP75oa8olh0oRmF9d8L/ZkH///oh/dqYubxZxChoOVWcA
	7gN1qwsFkhCnQOufa5eeJ6tT5OGLYA4iKyH+J/KpeESDDHPC+y8gOJUiuYjCOdpBCvO1sNTQW7xLR
	56GfEFmfufqh6DXaJn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2G3I-008KTa-PO; Mon, 05 Dec 2022 18:18:52 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2G36-008KPu-VV; Mon, 05 Dec 2022 18:18:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DA2091C0004;
	Mon,  5 Dec 2022 18:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670264316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rzs5vO2necK+4hQNCAUS4xm4OA1j+MgotCla3Sp8mkU=;
	b=M5ZN0CNhsTtEBvzcmt5XR5oQ7+LjASrEO96UiTfR/MLTYwP8Ouufp19EOqWMOfNpvR2lq0
	mkpfXTSXEz4Y/vJV097W/pNGxFH0XxuvJGDsyAgRDlWh5fdyyCzYL+dFM1rXkrKiLWQB9E
	OS3dX6I/RkwX7P0/T6Nf2Agz0tWyVzRMpi3mVWsL76xQoB+3+tp+31+2n67qC9uLIVySa5
	LjtdraluwjJr37ZTnsF7JQ7+zR+Kp5P+dlnGmsoMbaiyE+ACTLixsnmWc8cf+NNKGA0d+e
	c3TauUKrTc9Xq4/nog6jyo/A2h6UeKDquZGHyWcUcmy/A6ILoNPWXt9SYEJ+RA==
Date: Mon, 5 Dec 2022 19:18:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, Francesco
 Dolcini <francesco.dolcini@toradex.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Message-ID: <20221205191828.3072d872@xps-13>
In-Reply-To: <f69746b0-51c0-041c-4035-679c27fcba64@denx.de>
References: <20221205152327.26881-1-francesco@dolcini.it>
	<0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
	<20221205185859.433d6cbf@xps-13>
	<f69746b0-51c0-041c-4035-679c27fcba64@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_101841_325456_09FB4F78 
X-CRM114-Status: GOOD (  24.40  )
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

SGkgTWFyZWssCgptYXJleEBkZW54LmRlIHdyb3RlIG9uIE1vbiwgNSBEZWMgMjAyMiAxOTowNzox
NCArMDEwMDoKCj4gT24gMTIvNS8yMiAxODo1OCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhp
IE1hcmVrLCAgCj4gCj4gSGksCj4gCj4gPiBtYXJleEBkZW54LmRlIHdyb3RlIG9uIE1vbiwgNSBE
ZWMgMjAyMiAxNzoyNjo1MyArMDEwMDoKPiA+ICAgCj4gPj4gT24gMTIvNS8yMiAxNjoyMywgRnJh
bmNlc2NvIERvbGNpbmkgd3JvdGU6ICAKPiA+Pj4gRnJvbTogRnJhbmNlc2NvIERvbGNpbmkgPGZy
YW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPgo+ID4+Pgo+ID4+PiBUaGlzIHJldmVydHMgY29t
bWl0IDc1MzM5NWVhMWU0NWM3MjQxNTAwNzBiNTc4NTkwMGI2YTQ0YmQ1ZmIuCj4gPj4+Cj4gPj4+
IEl0IGludHJvZHVjZWQgYSBib290IHJlZ3Jlc3Npb24gb24gY29saWJyaS1pbXg3LCBhbmQgcG90
ZW50aWFsbHkgYW55Cj4gPj4+IG90aGVyIGkuTVg3IGJvYXJkcyB3aXRoIE1URCBwYXJ0aXRpb24g
bGlzdCBnZW5lcmF0ZWQgaW50byB0aGUgZmR0IGJ5Cj4gPj4+IFUtQm9vdC4KPiA+Pj4KPiA+Pj4g
V2hpbGUgdGhlIGNvbW1pdCB3ZSBhcmUgcmV2ZXJ0aW5nIGhlcmUgaXMgbm90IG9idmlvdXNseSB3
cm9uZywgaXQgZml4ZXMKPiA+Pj4gb25seSBhIGR0IGJpbmRpbmcgY2hlY2tlciB3YXJuaW5nIHRo
YXQgaXMgbm9uLWZ1bmN0aW9uYWwsIHdoaWxlIGl0Cj4gPj4+IGludHJvZHVjZXMgYSBib290IHJl
Z3Jlc3Npb24gYW5kIHRoZXJlIGlzIG5vIG9idmlvdXMgZml4IHJlYWR5Lgo+ID4+Pgo+ID4+PiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4+PiBGaXhlczogNzUzMzk1ZWExZTQ1ICgiQVJN
OiBkdHM6IGlteDc6IEZpeCBOQU5EIGNvbnRyb2xsZXIgc2l6ZS1jZWxscyIpCj4gPj4+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9ZNGRnQlRHTldwTTZTUVhJQGZyYW5jZXNjby1u
Yi5pbnQudG9yYWRleC5jb20vCj4gPj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDIyMTIwNTE0NDkxNy42NTE0MTY4YUB4cHMtMTMvCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEZy
YW5jZXNjbyBEb2xjaW5pIDxmcmFuY2VzY28uZG9sY2luaUB0b3JhZGV4LmNvbT4KPiA+Pj4gLS0t
Cj4gPj4+ICAgIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDdzLmR0c2kgfCA0ICsrLS0KPiA+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDdzLmR0c2kgYi9hcmNoL2FybS9i
b290L2R0cy9pbXg3cy5kdHNpCj4gPj4+IGluZGV4IDAzZDJlODU0NGE0ZS4uMGZjOWU2YjhiMDVk
IDEwMDY0NAo+ID4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg3cy5kdHNpCj4gPj4+ICsr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDdzLmR0c2kKPiA+Pj4gQEAgLTEyNzAsMTAgKzEyNzAs
MTAgQEAgZG1hX2FwYmg6IGRtYS1hcGJoQDMzMDAwMDAwIHsKPiA+Pj4gICAgCQkJY2xvY2tzID0g
PCZjbGtzIElNWDdEX05BTkRfVVNESENfQlVTX1JBV05BTkRfQ0xLPjsKPiA+Pj4gICAgCQl9OyAg
Cj4gPj4+ICAgID4gLQkJZ3BtaTogbmFuZC1jb250cm9sbGVyQDMzMDAyMDAwIHsgIAo+ID4+PiAr
CQlncG1pOiBuYW5kLWNvbnRyb2xsZXJAMzMwMDIwMDB7Cj4gPj4+ICAgIAkJCWNvbXBhdGlibGUg
PSAiZnNsLGlteDdkLWdwbWktbmFuZCI7Cj4gPj4+ICAgIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+ID4+PiAtCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gPj4+ICsJCQkjc2l6ZS1jZWxscyA9IDwx
PjsKPiA+Pj4gICAgCQkJcmVnID0gPDB4MzMwMDIwMDAgMHgyMDAwPiwgPDB4MzMwMDQwMDAgMHg0
MDAwPjsKPiA+Pj4gICAgCQkJcmVnLW5hbWVzID0gImdwbWktbmFuZCIsICJiY2giOwo+ID4+PiAg
ICAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQgSVJRX1RZUEVfTEVWRUxfSElHSD47ICAKPiA+
Pgo+ID4+IEkgc3VzcGVjdCB0aGlzIGZpeCBzaG91bGQgZXZlbnR1YWxseSBiZSByZXZlcnRlZCBh
Z2Fpbiwgb25jZSBhIHByb3BlciBmaXggaXMgYWdyZWVkIHVwb24gaW4gdGhlIE1URCBPRiBwYXJz
ZXIsIHJpZ2h0ID8gIAo+ID4gCj4gPiBJIGd1ZXNzIGl0J3MgdGltZSB0byBtaWdyYXRlIHRvIGEg
bW9yZSBtb2Rlcm4gZGVmaW5pdGlvbiAgCj4gCj4gSXMgdGhhdCB0aGUgbmFuZC1jaGlwQE4geyBz
dGF0dXM9ImRpc2FibGVkIjsgfSBwYXJ0ID8KCkkgd291bGQgcHJlZmVyIHRoZSBjb250cm9sbGVy
IHRvIGJlIGRpc2FibGVkIGlmIHVzZWxlc3MsIGJ1dCBvdGhlcndpc2UKeWVzLgoKPiAKPiA+LCBp
dCdzIG5vdAo+ID4gY29tcGxleCB0byBkbywgdGhlcmUgYXJlIHBsZW50eSBvZiBleGFtcGxlcy4g
VGhpcyB3b3VsZCBiZSBJTUhPIGEKPiA+IGJldHRlciBzdGVwIGFoZWFkIHJhdGhlciB0aGFuIGp1
c3QgYSBjZWxsIGNoYW5nZS4gQW55d2F5LCBJIGRvbid0IG1pbmQKPiA+IHJldmVydGluZyB0aGlz
IG9uY2Ugd2UndmUgc29ydGVkIHRoaXMgbWVzcyBvdXQgYW5kIGZpeGVkIFUtQm9vdC4gIAo+IAo+
IFdvbid0IHdlIHN0aWxsIGhhdmUgaXNzdWVzIHdpdGggb2xkZXIgYm9vdGxvYWRlciB2ZXJzaW9u
cyB3aGljaCBwYXN0ZSBwYXJ0aXRpb25zIGRpcmVjdGx5IGludG8gdGhpcyAmZ3BtaSB7fSBub2Rl
LCBhbmQgd2hpY2ggbmVlZHMgdG8gYmUgZml4ZWQgdXAgaW4gdGhlIHBhcnNlciBpbiB0aGUgZW5k
ID8KCkkgYmVsaWV2ZSBmZHRfZml4dXBfbXRkcGFydHMoKSBzaG91bGQgYmUga2lsbGVkLCBzbyB3
ZSBzaG91bGQgbm8gbG9uZ2VyCmhhdmUgdGhpcyBwcm9ibGVtLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
