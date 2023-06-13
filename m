Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315A5C7EE29
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jun 2023 11:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzwJ8Xfu32eLQ9zP96dPxb5IWvzNFrefiFKXmxsLSwI=; b=idcOUqnZNR/dei
	rLD+VpeWg6Kf1kBXfYsG3M8hvukztjT/Fp1HQKPbHCu+025+R0G2OY1AahxFMrvQrskavztBCL0cb
	8odi6X1vBkS5DZqswWaAdGaQifDNMJVOGqbLp/NG1MH6PMXkrtsShuUWMrmBt57if8z3pV0lJpD4W
	WJVNWe9od7anMStIBhMi1E5U0oEl0noR0rtERr2K26Laf7MFJcBd2JS5J3drzG14kPygb0Mlb3+GI
	mJ31GOWN8FMjWy5b0KiokuD1HrSpDgyKhTYOgVCEJW8g0edEu31IxJBzxcHARK4ZQ2MGQNvSOZZ0y
	OS7KeSxBYNgwn5XIFh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q92RT-007wnV-2l;
	Tue, 13 Jun 2023 11:44:07 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q92RO-007wmV-2X
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jun 2023 11:44:05 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686656639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+viFyHRWDefnY4D6QJul4yohlKiSyTDIqKgOG5jej0=;
	b=nX47Wvbd8EtfxIm1fg2SxtA1L6bRyebAPZxVBDh+pTniYAMq1CwwskGyPE/fGNPCU9wOlH
	wiWRbuunrR82JlkWGZZ0YmpyAUjX05BG3h1HaiMbtxvWtRw1kMexRKuX0l7xJLb6Zhn2Ss
	MTeZiunmwCfUcOTqvfa70GzkAgJBqZIJxEM+nlup//mushdf/rPeUsxEBdeqS88zlmTDgk
	B2eiPkkWhqxnC/zdvrtBqOyN37uEUk3CBM8YGag6REEr+d++hZ6e1FJWgPgug6kJUV+X/f
	emsTHG3cthJTBe5dEMBxCv5TmbiGQ+kv8VM2Qcmc8R8vaT0fHSXbFXr6TFSlpg==
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
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 976A2E0004;
	Tue, 13 Jun 2023 11:43:51 +0000 (UTC)
Date: Tue, 13 Jun 2023 13:43:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Brian Norris
 <computersforpeace@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Christophe
 Kerello <christophe.kerello@foss.st.com>, Heiko Stuebner <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Liang Yang <liang.yang@amlogic.com>, Manivannan
 Sadhasivam <mani@kernel.org>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Paul Cercueil <paul@crapouillou.net>, Samuel Holland
 <samuel@sholland.org>, Vadivel Murugan
 <vadivel.muruganx.ramuthevar@linux.intel.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v2 00/17] Prevent NAND chip unevaluated properties
Message-ID: <20230613134350.3cab6780@xps-13>
In-Reply-To: <e886db25-dd5f-c8d9-83d4-77540fc3826e@kernel.org>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
	<e886db25-dd5f-c8d9-83d4-77540fc3826e@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_044403_255619_30FA31CA 
X-CRM114-Status: GOOD (  16.54  )
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

SGkgS3J6eXN6dG9mLAoKa3J6a0BrZXJuZWwub3JnIHdyb3RlIG9uIFNhdCwgMTAgSnVuIDIwMjMg
MTE6Mjc6NTUgKzAyMDA6Cgo+IE9uIDA2LzA2LzIwMjMgMTk6NTIsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4gPiBBcyBkaXNjdXNzZWQgd2l0aCBLcnp5c3p0b2YgYW5kIENocmlzLCBpdCBzZWVtcyBs
aWtlIGVhY2ggTkFORAo+ID4gY29udHJvbGxlciBiaW5kaW5nIHNob3VsZCBhY3R1YWxseSByZXN0
cmFpbiB0aGUgcHJvcGVydGllcyBhbGxvd2VkIGluCj4gPiB0aGUgTkFORCBjaGlwIG5vZGUgd2l0
aCBpdHMgb3duICJ1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlIi4gVGhpcwo+ID4gb25seSB3
b3JrcyBpZiB3ZSByZWZlcmVuY2UgYSB5YW1sIHNjaGVtYSB3aGljaCBjb250YWlucyBhbGwgdGhl
IHBvc3NpYmxlCj4gPiBwcm9wZXJ0aWVzICppbiB0aGUgTkFORCBjaGlwIG5vZGUqLiBJbmRlZWQs
IHRoZSBOQU5EIGNvbnRyb2xsZXIgeWFtbAo+ID4gc2NoZW1hIGNvbnRhaW5zIHByb3BlcnRpZXMg
Zm9yIHRoZSBOQU5EIGNoaXAgd2hpY2ggYXJlIG5vdCBldmFsdWF0ZWQKPiA+IHdpdGggdGhpcyBj
b25zdHJ1Y3Rpb24uCj4gPiAKPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9h
MjNkZDQ4NS1hM2Q5LWUzMWYtYmUzZS0wYWIyOTNmY2ZjNGFAbGluYXJvLm9yZy8gIAo+IAo+IFBs
ZWFzZSByZWJhc2Ugb24gbGF0ZXN0IGtlcm5lbC4gVGhpcyBpcyBzb21lIHZlcnkgb2xkIHRyZWUg
aWYgeW91IENDCj4gdGhpcyBhZGRyZXNzLgoKU29ycnkgZm9yIHRoZSB0cm91YmxlLCBpdCB3YXMg
YSBoYXJkY29kZWQgYWRkcmVzcyBvbiBteSBzaWRlLiBJJ3ZlCnVwZGF0ZWQgdGhlIGFkZHJlc3Mg
dG8KCglLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5v
cmc+CgpUaGUgc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjQtcmMxLiBBZ2FpbnN0IHdoYXQgYnJhbmNo
L3RhZyBkbyB5b3Ugd2FudCBpdAp0byBiZSByZWJhc2VkPwoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
