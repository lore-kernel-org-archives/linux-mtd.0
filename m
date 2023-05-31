Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29259C77B7C
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZW2UBMOTeyczrwidjRFnbq1WuGAEGc/mbKr+ZhnBAH4=; b=SAvb7brPYcSplL
	PYU4W8qXIq8MCjEHPFvcylDvp2tffDECTN70vfwZuodipBwk6PjRwg2DoGUXGkRdai9MNq7WHaxp6
	GUO1HM0nmLU77mIaZpdl+AbNYfyL/umA2W1ZOC5FRoxeRxtBCZo0u5jWxQeqRHicggXY4ATlsGhuU
	FuJ7CD8LIIYX2/KZxxd57Rp1w1tqhqszn/dxxFoZFtOcn5QgjqVMHCfBxjvA6uus2Qx1M2jBNAo/C
	Yuw9DkZnq6H/tbQ0iyst7m12IljjP5b39NLw2EBmwXWVZ9ZxC2FFahAljXk28Us/QeXlpj9SPWGKv
	+liAuceM9PVKeDAJ++fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GMa-00GSoj-1v;
	Wed, 31 May 2023 07:35:20 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GMX-00GSnL-0r;
	Wed, 31 May 2023 07:35:18 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685518515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUnorI/qOvsXjlT7WXm+LLn3umXwCSS1TTFJLqxcPFg=;
	b=X9/l352R3GaXjSe+wkke6JFZycBsByaaGdfLySy2l/cF/hTtqqOdyjunOS3rAeeP+Ht4ab
	ASY0JZOBwVglAh3yjyDLS/ls7ZhKsNoBTl2t6e7gTqk0hfZyJHtj2gt45J6kM4U/T3xwpd
	P6aWeeSUpQj1/ricomG21DcNbZyLM7CYx/WYRSwBlqddyQz7bU30a8BJcPbBKTX5oQCZ66
	NwWWZLC/3pziD9agG6MLQbpLs4bcg8RjopjMdac3dDZVku8ympDUBZE9gJEHyLltpg0/5G
	wlbNU3jZpHz/JvRHc0IPNeinbEsGHyXg45sbCLCIfhqL8snRpD62dp23axMQ0w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AE65FF80C;
	Wed, 31 May 2023 07:35:12 +0000 (UTC)
Date: Wed, 31 May 2023 09:35:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 enachman@marvell.com, Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v7 1/4] arm64: dts: marvell: cp11x: Fix nand_controller
 node name according to YAML
Message-ID: <20230531093512.0f7e12e4@xps-13>
In-Reply-To: <20230530235456.1009082-2-chris.packham@alliedtelesis.co.nz>
References: <20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz>
	<20230530235456.1009082-2-chris.packham@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_003517_434792_D76E2100 
X-CRM114-Status: GOOD (  13.32  )
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

SGkgQ2hyaXMsCgpjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gV2Vk
LCAzMSBNYXkgMjAyMyAxMTo1NDo1MworMTIwMDoKCj4gRnJvbTogVmFkeW0gS29jaGFuIDx2YWR5
bS5rb2NoYW5AcGx2aXNpb24uZXU+Cj4gCj4gTWFydmVsbCBOQU5EIGNvbnRyb2xsZXIgaGFzIG5v
dyBZQU1MIHRvIHZhbGlkYXRlIGl0J3MgRFQgYmluZGluZ3MsIHNvCj4gY2hhbmdlIHRoZSBub2Rl
IG5hbWUgb2YgY3AxMXggRFRTSSBhcyBpdCBpcyByZXF1aXJlZCBieSBuYW5kLWNvbnRyb2xsZXIu
eWFtbAo+IAo+IFNpZ25lZC1vZmYtYnk6IFZhZHltIEtvY2hhbiA8dmFkeW0ua29jaGFuQHBsdmlz
aW9uLmV1Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxs
aWVkdGVsZXNpcy5jby5uej4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2Fy
bWFkYS1jcDExeC5kdHNpIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2
ZWxsL2FybWFkYS1jcDExeC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFk
YS1jcDExeC5kdHNpCj4gaW5kZXggMGNjOWVlOTg3MWU3Li40ZWMxYWFlMGEzYTkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS1jcDExeC5kdHNpCj4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS1jcDExeC5kdHNpCj4gQEAgLTQ2
OCw3ICs0NjgsNyBAQCBDUDExWF9MQUJFTCh1YXJ0Myk6IHNlcmlhbEA3MDIzMDAgewo+ICAJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAJCX07Cj4gIAo+IC0JCUNQMTFYX0xBQkVMKG5hbmRfY29u
dHJvbGxlcik6IG5hbmRANzIwMDAwIHsKPiArCQlDUDExWF9MQUJFTChuYW5kX2NvbnRyb2xsZXIp
OiBuYW5kLWNvbnRyb2xsZXJANzIwMDAwIHsKPiAgCQkJLyoKPiAgCQkJICogRHVlIHRvIHRoZSBs
aW1pdGF0aW9uIG9mIHRoZSBwaW5zIGF2YWlsYWJsZQo+ICAJCQkgKiB0aGlzIGNvbnRyb2xsZXIg
aXMgb25seSB1c2FibGUgb24gdGhlIENQTQoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
