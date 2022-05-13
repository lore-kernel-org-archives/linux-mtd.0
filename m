Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0525CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5hCIwcV5LTamjd237WfK5iavmZbDePP5R4avUfTqCM=; b=AjlMMSddiN/XAl
	eV2EM7yxx+kaDR5VN33VnHYgspuHSLqg+wom9NMcobvil4om5bRqp3Jm5xb5yfHDsi33Gh+zlX7N7
	aSgo1slIfaFQnjfZAXrgK7fZMupOZB+0CMMeRjNegM0nxBa9euUpoj5gRQII9iBAHli2TFYfjP5vK
	7PwK5KEfq3HkYd4YfuBRLkH2HOJfehG8LLcsIdHErq/byQ2Wu0FpNpjA4u9ZZ8pX5Gd4PuuPudoci
	bMxEBpcj8xL4fr9kJS6wqZwmZH3/fu5lMQanOFGI5aQdjDFLSTyBfgGib45hAyLRgAjuw9bYSgj/i
	N1CtINwQhGow1lPgnvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npSkz-00FcYl-Bw; Fri, 13 May 2022 10:42:49 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npSkw-00FcXt-Ey
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 10:42:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA78DFF803;
 Fri, 13 May 2022 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652438560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCB50dRxYtKkpQt+TlUuVeUX5jQgvNYuipc9oj3tDHM=;
 b=os4MaqxcZPMofeGCFHgvF6hvXsOQtZWB1wI+6meTHw7CicnjuDzDB2fAFb3TWmyiGdY8js
 t5Cf18y3JU8PhgWmpPF8Z6nvJnGGZvQbEYIytxDG1dYWXGOpSJS/42SmvNQ7EJfgYkNZg3
 ULpX7sN8v/Yt3rQgCx2QzNWNlVCqqcJ4WIx4ggThDPFgATwALuNabrCrdTqV4Fk2/SEtq/
 dhtvkdmvXeCb09GnBSZJTukJhFoynvZ7S0QZvJ6rp5lcSWngl77Y8yztA/VoabAlg+95PW
 GdSadIG64jXD5AHWfbb1RhhioMRDwIaEzE85u58mJg5OrwdGJ3QntViOFF7bBQ==
Date: Fri, 13 May 2022 12:42:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>, Phil Edworthy
 <phil.edworthy@renesas.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Milan Stevanovic
 <milan.stevanovic@se.com>, Jimmy Lalande <jimmy.lalande@se.com>, Pascal
 Eberhard <pascal.eberhard@se.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
Message-ID: <20220513124237.42dd6c33@xps13>
In-Reply-To: <CAMuHMdX9sE5T_anQgerQNh6qKoR=P8uL4SbPjvFPXfCuHwVqEg@mail.gmail.com>
References: <20220509154943.25422-3-miquel.raynal@bootlin.com>
 <20220512152729.244940-1-miquel.raynal@bootlin.com>
 <CAMuHMdX9sE5T_anQgerQNh6qKoR=P8uL4SbPjvFPXfCuHwVqEg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_034246_681841_B258DEA3 
X-CRM114-Status: GOOD (  15.64  )
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

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBUaHUsIDEyIE1heSAyMDIy
IDE3OjM3OjUyICswMjAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gVGh1LCBNYXkgMTIsIDIwMjIg
YXQgNToyNyBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZToKPiA+IE9uIE1vbiwgMjAyMi0wNS0wOSBhdCAxNTo0OTo0MyBVVEMsIE1pcXVlbCBSYXluYWwg
d3JvdGU6ICAKPiA+ID4gVGhpcyBOQU5EIGNvbnRyb2xsZXIgaXMgcGFydCBvZiBhIHdlbGwgZGVm
aW5lZCBwb3dlciBkb21haW4gaGFuZGxlZCBieQo+ID4gPiB0aGUgcnVudGltZSBQTSBjb3JlLiBM
ZXQncyBrZWVwIHRoZSBoYXJtb255IHdpdGggdGhlIG90aGVyIFJaL04xIGRyaXZlcnMKPiA+ID4g
YW5kIGV4Y2x1c2l2ZWx5IHVzZSB0aGUgcnVudGltZSBQTSBBUEkgdG8gZW5hYmxlL2Rpc2FibGUg
dGhlIGNsb2Nrcy4KPiA+ID4KPiA+ID4gV2Ugc3RpbGwgbmVlZCB0byByZXRyaWV2ZSB0aGUgZXh0
ZXJuYWwgY2xvY2sgcmF0ZSBpbiBvcmRlciB0byBkZXJpdmUgdGhlCj4gPiA+IE5BTkQgdGltaW5n
cywgYnV0IHRoYXQgaXMgbm90IGEgYmlnIGRlYWwsIHdlIGNhbiBzdGlsbCBkbyB0aGF0IGluIHRo
ZQo+ID4gPiBwcm9iZSBhbmQganVzdCBzYXZlIHRoaXMgdmFsdWUgdG8gcmV1c2UgaXQgbGF0ZXIu
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+ICAKPiA+Cj4gPiBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LiAgCj4gCj4g
V2l0aG91dCBtb3ZpbmcgdGhlIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBjYWxsCj4gKGJldHRlcjog
cG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpKSBiZWZvcmUgdGhlIGZpcnN0IGhhcmR3YXJlIHJl
Z2lzdGVyCj4gYWNjZXNzPwoKVGhhdCB3YXMgYW4gYWNjaWRlbnRhbCBtb3ZlLCB0aGFua3MgZm9y
IG5vdGljaW5nLiAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
