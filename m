Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6050DCF649D
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 09:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5axmEh8CKZw3ROSV2voewRm3ufy3Qp1f0X+l8kZM+w=; b=il68kOuYRnA6Pl
	2LIvg3MenyE45jPim8SxRCdj80JVowZNQ6LSvE4gZ160yERK0UpjlxlZYwD5ManR9BQbWpijxy3zN
	3W+ETag7VVYwLMzLqiHq5Swd8fJKj+nNpuFVIZV0jxmh0D3DyWN7hlrwYZ4Ash4alz/t2LO0ujBkq
	ib55qZDk7Dh2xqq6YJ34hfoD0CXQs4pIyKQJH9bOoWTLVD5ZEmjmIdch6iDIyN1/a3FStCqkSaUSQ
	JV/D1BeaMFDer9+PfpF6ugTfRMymv+UpaSNKgd3juGkhJuKIdDeVdxZFuYdvylML/Dmbx8FPMyTQj
	qa/eRo+xNVvbuujrrxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCbM-0000000GUUN-13hD;
	Mon, 30 Sep 2024 09:21:56 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCYT-0000000GTxz-2kFj;
	Mon, 30 Sep 2024 09:18:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 726A61C000B;
	Mon, 30 Sep 2024 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727687934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Blr8AqUM4hiswzZDj70roij+wAFRJvWfvmDyw7kgtr0=;
	b=L5DQpkwJjCF78igqUBzUHVZdrLloqSyCkM/5K2N7f7UmFEAGASXdUvyXxkeEhm8MoxNIC+
	q58SbZao1+8YxcL+ti1kEUZxutI5wwlAmOC/Q1/T8Uufk0Q9Xtl8xacT5MAmyLRh+iC+A9
	WW/FM/73en0OkXbZlIcSJQW+VrjudEk4x7Y78FvdL/E7UMKuGsOw+u7fU3Ygw0nyGEaj5e
	+RZGw93ENDsB/DoXvX64VS5IyEjEhq7RNGbHieXff5BA+c9mX/OT7qnsyFT9T1+BduJogq
	jF4zY5mkQX8s6K8Bwxm/90F9MvEVwDBL9l2LJYMvk2xC7H42I1YwVE0cJWLUig==
Date: Mon, 30 Sep 2024 11:18:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: jedec,spi-nor: add optional
 vcc-supply
Message-ID: <20240930111852.0fcb731f@xps-13>
In-Reply-To: <20240930-spi-v2-1-ed7f6bcbe0df@nxp.com>
References: <20240930-spi-v2-0-ed7f6bcbe0df@nxp.com>
	<20240930-spi-v2-1-ed7f6bcbe0df@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_021857_849382_F069737B 
X-CRM114-Status: GOOD (  12.28  )
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

SGksCgpwZW5nLmZhbkBvc3MubnhwLmNvbSB3cm90ZSBvbiBNb24sIDMwIFNlcCAyMDI0IDE3OjIy
OjI0ICswODAwOgoKPiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KPiAKPiBJbnRy
b2R1Y2Ugb3B0aW9uYWwgdmNjLXN1cHBseSBwcm9wZXJ0eSwgU1BJIE5PUiBmbGFzaGVzIG5lZWRz
IHBvd2VyIHN1cHBseQo+IHRvIHdvcmsgcHJvcGVybHkuIFRoZSBwb3dlciBzdXBwbHkgbWF5YmUg
c29mdHdhcmUgY29udHJvbGFibGUgcGVyIGJvYXJkCj4gZGVzaWduLgo+IAo+IEFja2VkLWJ5OiBS
b2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFBlbmcg
RmFuIDxwZW5nLmZhbkBueHAuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwKPiBpbmRleCA2ZTNhZmI0Mjky
NmUuLmJhYjA2MTdhNTFkNSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sCj4gQEAgLTk2LDYgKzk2LDEw
IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIElmICJicm9rZW4tZmxhc2gtcmVzZXQiIGlzIHByZXNl
bnQgdGhlbiBoYXZpbmcgdGhpcyBwcm9wZXJ0eSBkb2VzIG5vdAo+ICAgICAgICBtYWtlIGFueSBk
aWZmZXJlbmNlLgo+ICAKPiArICB2Y2Mtc3VwcGx5Ogo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAg
ICAgIFN1cHBseSBmb3IgdGhlIHNwaSBub3IgcG93ZXIuCgoJCQlTUEkgTk9SPwoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
