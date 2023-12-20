Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A91C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 07:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyvD/2xGIsWyJ98DGd7gaF9fhsgTkp0oqfpW75k/Zls=; b=U3EC7NWs0/4zmI
	d+u3G1AGIANlXbMoMHECCZuXY7/FEImKC2Od+isXzywIRDuY74PzDELbpaUv/W6iheVQm2041vpQB
	t9HG3hO4nN9V/BaG/64EYObSY8No0KWYG4I9hf84N8YGNKzbbX6HEuUOBUbOzz1CCLJT43C4HgplJ
	P0c99jUa8MIArkRMhFaaMx1hmosGKDPSZ0CALZtkl0/IBiehe8i9yJsUcu8kMLMl8UiW2QxeZxPJe
	Tvn52wBI+Lu/YCA5+iJQUxPJBWr+f85L9pWJ7fdbwOsYSCfQSBmiO4X1F4EFyhgVh1OMcgTt7akUS
	Qg4bT9wJ/JI54JibQGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqpg-00GNvG-2T;
	Wed, 20 Dec 2023 07:17:32 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqpc-00GNtc-2v;
	Wed, 20 Dec 2023 07:17:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9D5CE0002;
	Wed, 20 Dec 2023 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703056639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OBi+8NL7aE/XRZED3MqrIc3p9l2z2kSeWHJGCwCuiVU=;
	b=O+Cvo4591OIgVVq6asdrH1hS+zDMLhGXgs8JiEiI+QlBo98Rt8fCd8S7GN1yPJ0VcRdLwl
	3v6KfKW+HKekpuGvj5BQwcK/ziuf/22EMCZR6+kxNRODklgpAPWvePigutFecov13JmxKt
	GIEld6cfo0cokWr4WVsNWqPD4LQUisg0qLCgaFoPRsyeKTmKV7yfvTA3+fh4QGQm6HCvEt
	be1geQbgJzIU3rKhwYtSZtM1NIDwM8m74BraPimkr7ime7QvmUpdUnRvevL0S2PMBT/nG4
	Vo0VVUfL8eqRCLyeUFMaXAT4EikQ9IumiBibwslHrjpYD7eBpMS/TJF+NKdd4g==
Date: Wed, 20 Dec 2023 08:17:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 3/5] nvmem: u-boot-env: use more nvmem subsystem
 helpers
Message-ID: <20231220081717.0afc17f3@xps-13>
In-Reply-To: <1b5d4c36-9963-476c-8edf-e807beceda80@gmail.com>
References: <20231219174025.15228-1-zajec5@gmail.com>
	<20231219174025.15228-3-zajec5@gmail.com>
	<2023121929-salami-pessimist-c943@gregkh>
	<1b5d4c36-9963-476c-8edf-e807beceda80@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_231729_082768_76BF9E7E 
X-CRM114-Status: GOOD (  13.38  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDE5IERlYyAyMDIzIDE5
OjE2OjM3ICswMTAwOgoKPiBPbiAxOS4xMi4yMDIzIDE5OjEzLCBHcmVnIEtyb2FoLUhhcnRtYW4g
d3JvdGU6Cj4gPiBPbiBUdWUsIERlYyAxOSwgMjAyMyBhdCAwNjo0MDoyM1BNICswMTAwLCBSYWZh
xYIgTWnFgmVja2kgd3JvdGU6ICAKPiA+PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1p
bGVja2kucGw+Cj4gPj4KPiA+PiAxLiBVc2UgbnZtZW1fZGV2X3NpemUoKSBhbmQgbnZtZW1fZGV2
aWNlX3JlYWQoKSB0byBtYWtlIHRoaXMgZHJpdmVyIGxlc3MKPiA+PiAgICAgbXRkIGRlcGVuZGVu
dAo+ID4+IDIuIFVzZSBudm1lbV9hZGRfb25lX2NlbGwoKSB0byBzaW1wbGlmeSBhZGRpbmcgTlZN
RU0gY2VsbHMgIAo+ID4gCj4gPiBTaG91bGRuJ3QgdGhpcyBiZSAyIGRpZmZlcmVudCBwYXRjaGVz
PyAgCj4gCj4gSSB1c2VkIHRvIG1haW50YWluZXJzIGNvbXBsYWluaW5nIG15IHBhdGNoZXMgYXJl
IHRvbyBzbWFsbCBhbmQgbm90IHRoZQo+IG90aGVyIHdheSA7KSBJIHRoaW5rIGl0IGhhcHBlbmVk
IHR3byBvciB0aHJlZSB0aW1lcyB3aXRoIG10ZCBzdWJzeXMuCgpBIHNpbmdsZSBwYXRjaCBtYXkg
YmUgdG9vIHNtYWxsIGlmIGl0J3MgYWxvbmUgYW5kIHdlIGRvbid0IHNlZSB0aGUgYmlnCnBpY3R1
cmUsIG90aGVyd2lzZSBJIGhhdmUgbm8gaXNzdWUgd2l0aCBzbWFsbCBwYXRjaGVzLCBkbyBJPyBB
bnl3YXksIGluCnRoaXMgY2FzZSBJIGRvbid0IG1pbmQgdGhlIHBhdGNoIGJlaW5nIHNwbGl0IG9y
IGtlcHQgbGlrZSB0aGlzLCBqdXN0CmtlZXAgbXkgUi1ieSBhcHBsaWVkIHRvIGJvdGggaWYgeW91
IGRvIGluZGVlZCBzcGxpdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
