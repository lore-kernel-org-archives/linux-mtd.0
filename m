Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3684EEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYxE0TFn98bRbNiuTaA7rf/GQUF5zLRVUYxMvB233EY=; b=XKeo2x9U4nlaPK
	M2lBAUcG64JR3UE4NgyzHJQHy9fVg7PLpVsuAFziXf/HwXTGMGmbvZlfia7rwoEX74mv1fNu3N2tR
	q42HBe8EJLPbKFUYbnxb6IjJz/zTDD5f/6uWkeSdmB36kCfo7zqjqM2fD+AAeE1ygFdJVurVyKddS
	SUZcDY/QZZdut0yU4D8phyQz7bWnPvtjqoSNha4ey+r0IavwuLzZBG9SOwGIGKbz6ZNozdLa1sdqK
	5cieM8ss4JvADR6BKKnmdN5f1q/Dps2GOeYTNYvxKAkG4Rts3qbGPkSHB7vb7KhK1mmq6XAY6gkf4
	UwjHPrDhOfLaDYwYrPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iJC-00E9sn-0r;
	Thu, 15 Jun 2023 08:26:22 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iJ8-00E9s7-22
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 08:26:20 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686817575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=369VxYvjbyWVGycDQfqUtVNy7bfv3AtTk5Fu4/mlMp4=;
	b=TkjfIhXulIm0GjR2EXKACTtjO2pCq0em6cXj4inMyC9xo8p12JFVN+zYloCKFhYw/Ea2L4
	Y+/FTb2wkvswsJVBrbj0s/yabCaVZO+wFhusPOUSON4JGiQg7GKkT8zzArNa1fCceGc7PK
	FIWuCoBGVxq2ExpEURgKSHsbnHqhDz376NEqrJ/tNze0waAQhYc4BjweRS6dfzMUTKTylk
	cTLQBGRjQmDfYc9VVqPz15cXTuREjcS6bxxlW5Sm1IyZE8oxuETrwQcWBYYBrhWhyLLvUK
	DuD9XYUPsqkHrMFLaSdcESSr00FmVi8WfuCO8zPO49rioezXrFSM2fI3VSI4Kw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CBA8E0008;
	Thu, 15 Jun 2023 08:26:10 +0000 (UTC)
Date: Thu, 15 Jun 2023 10:26:09 +0200
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
Message-ID: <20230615102609.0aeea6ab@xps-13>
In-Reply-To: <20230613134350.3cab6780@xps-13>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
	<e886db25-dd5f-c8d9-83d4-77540fc3826e@kernel.org>
	<20230613134350.3cab6780@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_012618_937174_86DBC9DC 
X-CRM114-Status: GOOD (  22.66  )
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

SGkgS3J6eXN6dG9mLAoKbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBUdWUsIDEz
IEp1biAyMDIzIDEzOjQzOjUwICswMjAwOgoKPiBIaSBLcnp5c3p0b2YsCj4gCj4ga3J6a0BrZXJu
ZWwub3JnIHdyb3RlIG9uIFNhdCwgMTAgSnVuIDIwMjMgMTE6Mjc6NTUgKzAyMDA6Cj4gCj4gPiBP
biAwNi8wNi8yMDIzIDE5OjUyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPiA+IEFzIGRpc2N1
c3NlZCB3aXRoIEtyenlzenRvZiBhbmQgQ2hyaXMsIGl0IHNlZW1zIGxpa2UgZWFjaCBOQU5ECj4g
PiA+IGNvbnRyb2xsZXIgYmluZGluZyBzaG91bGQgYWN0dWFsbHkgcmVzdHJhaW4gdGhlIHByb3Bl
cnRpZXMgYWxsb3dlZCBpbgo+ID4gPiB0aGUgTkFORCBjaGlwIG5vZGUgd2l0aCBpdHMgb3duICJ1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlIi4gVGhpcwo+ID4gPiBvbmx5IHdvcmtzIGlmIHdl
IHJlZmVyZW5jZSBhIHlhbWwgc2NoZW1hIHdoaWNoIGNvbnRhaW5zIGFsbCB0aGUgcG9zc2libGUK
PiA+ID4gcHJvcGVydGllcyAqaW4gdGhlIE5BTkQgY2hpcCBub2RlKi4gSW5kZWVkLCB0aGUgTkFO
RCBjb250cm9sbGVyIHlhbWwKPiA+ID4gc2NoZW1hIGNvbnRhaW5zIHByb3BlcnRpZXMgZm9yIHRo
ZSBOQU5EIGNoaXAgd2hpY2ggYXJlIG5vdCBldmFsdWF0ZWQKPiA+ID4gd2l0aCB0aGlzIGNvbnN0
cnVjdGlvbi4KPiA+ID4gCj4gPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9h
MjNkZDQ4NS1hM2Q5LWUzMWYtYmUzZS0wYWIyOTNmY2ZjNGFAbGluYXJvLm9yZy8gICAgCj4gPiAK
PiA+IFBsZWFzZSByZWJhc2Ugb24gbGF0ZXN0IGtlcm5lbC4gVGhpcyBpcyBzb21lIHZlcnkgb2xk
IHRyZWUgaWYgeW91IENDCj4gPiB0aGlzIGFkZHJlc3MuICAKPiAKPiBTb3JyeSBmb3IgdGhlIHRy
b3VibGUsIGl0IHdhcyBhIGhhcmRjb2RlZCBhZGRyZXNzIG9uIG15IHNpZGUuIEkndmUKPiB1cGRh
dGVkIHRoZSBhZGRyZXNzIHRvCj4gCj4gCUtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2krZHRAbGluYXJvLm9yZz4KPiAKPiBUaGUgc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjQt
cmMxLiBBZ2FpbnN0IHdoYXQgYnJhbmNoL3RhZyBkbyB5b3Ugd2FudCBpdAo+IHRvIGJlIHJlYmFz
ZWQ/CgpXaGVuIEkgYXNrZWQgdGhpcyBxdWVzdGlvbiBJIGZvcmdvdCBJIHVzdWFsbHkgYXBwbHkg
bXRkIGJpbmRpbmdzIGluIG15Cm93biB0cmVlIDopIEkgdXN1YWxseSBkbyBpdCBhZnRlciByZWNl
aXZpbmcgYXQgbGVhc3Qgb25lIFItYnkgb24gdGhlCndob2xlIHNlcmllcywgYnV0IGhlcmUgYXMg
SSdtIHRoZSBhdXRob3IgSSB3b3VsZCBqdXN0IGxpa2UgdG8gZ2V0CmNvbmZpcm1hdGlvbiBmcm9t
IHlvdSBLcnp5c3p0b2YgdGhhdCBJIGNhbiBnbyBhaGVhZCAob3IgaWYgeW91IHByZWZlcgp0byB0
YWtlIGl0LCBvciBtYXliZSB3YW50IHRvIGdpdmUgdGhpcyBhbm90aGVyIGxvb2sgbGF0ZXIpLgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
