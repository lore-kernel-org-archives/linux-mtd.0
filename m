Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CA3C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b1k86RoBzJa8cnMisqRvBmudKSHq/d6piJXmrUQTQHM=; b=QAGA+IczKTmgaY
	Rafi75qeNGyYBnwsfmu7sf08jpnMuahZP0FjArdvko0UjVELTE4zlfYc1PYwjXGpkS4sTtHH7IJcI
	iHguWCjKKRlcbrCGwF/rK1e2kEr/enY1qxjEFzj5sZJXuVp6f7xlvlll8r4gbZ+Z+mle8duesdDVN
	hHk+WazQsfHELI2xqXzjDBhQSIND+G3ByJ7EjbjON9zjeRhIrCDg6qH2g9JBhBTVCjYW8EFiaAFr0
	BbZ4Z8FVVxZY5tnVOMIockq87vW/LCzYhh7BwG9d9pDYNSn551y7CQLeSDIY1eUcIVhVSbLxSypfj
	uGVG001OdtUW6doVuUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arj-002efN-2q;
	Tue, 06 Jun 2023 17:53:07 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6are-002ebR-0E
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:05 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ed7HST+fb6/FcGdKVdCSMGnOVxlQQtUu+Y5PDlptoSU=;
	b=WgI1ldBdO0U+IrO79NLdyHrhqIn1l8o4TkbvbeCvfN3TAm+9yCGlRmKiBbBchmAB1T2SKh
	KjhYX2zq2Ks8FhWvLVirabewR/sCZc72k4dLxu9HehzuybHBKUuDDoE6zCRO2mXyaRFrrD
	WbwRTRvEvzT55kWVZx/Bm5cioL11FtBAmJdlpIjs8CJsVsyOLZjogBxoHc36OYaeabMTzQ
	VBxzxEd/YdGU3p8QNgJ3TU3Vg+8zhpK/NnBR/9kqh1Spej2Lh/L86MJCQ+eekjxMWH3GhD
	9K55I2eiSfXkLX7Bii5cacHLYer5SWwJ8FxuOxNKBBi84AlcaBKI0C9dYIUpXA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF04A1C0005;
	Tue,  6 Jun 2023 17:52:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Samuel Holland <samuel@sholland.org>,
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [PATCH v2 00/17] Prevent NAND chip unevaluated properties
Date: Tue,  6 Jun 2023 19:52:29 +0200
Message-Id: <20230606175246.190465-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105302_405276_32161B5D 
X-CRM114-Status: GOOD (  13.81  )
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

QXMgZGlzY3Vzc2VkIHdpdGggS3J6eXN6dG9mIGFuZCBDaHJpcywgaXQgc2VlbXMgbGlrZSBlYWNo
IE5BTkQKY29udHJvbGxlciBiaW5kaW5nIHNob3VsZCBhY3R1YWxseSByZXN0cmFpbiB0aGUgcHJv
cGVydGllcyBhbGxvd2VkIGluCnRoZSBOQU5EIGNoaXAgbm9kZSB3aXRoIGl0cyBvd24gInVuZXZh
bHVhdGVkUHJvcGVydGllczogZmFsc2UiLiBUaGlzCm9ubHkgd29ya3MgaWYgd2UgcmVmZXJlbmNl
IGEgeWFtbCBzY2hlbWEgd2hpY2ggY29udGFpbnMgYWxsIHRoZSBwb3NzaWJsZQpwcm9wZXJ0aWVz
ICppbiB0aGUgTkFORCBjaGlwIG5vZGUqLiBJbmRlZWQsIHRoZSBOQU5EIGNvbnRyb2xsZXIgeWFt
bApzY2hlbWEgY29udGFpbnMgcHJvcGVydGllcyBmb3IgdGhlIE5BTkQgY2hpcCB3aGljaCBhcmUg
bm90IGV2YWx1YXRlZAp3aXRoIHRoaXMgY29uc3RydWN0aW9uLgoKTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsL2EyM2RkNDg1LWEzZDktZTMxZi1iZTNlLTBhYjI5M2ZjZmM0YUBsaW5h
cm8ub3JnLwoKV2hpbGUgY29udmVydGluZyBNYXJ2ZWxsIGNvbnRyb2xsZXIgYmluZGluZ3MsIENo
cmlzIGV4cGxpY2l0bHkgcG9pbnRlZApzaW1pbGFyIGJpbmRpbmdzIHdoaWNoIHdvdWxkIGFsc28g
dHJpZ2dlciBlcnJvcnMgd2hlbiB1c2luZwoidW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSIg
YmVjYXVzZSBvZiB0aGUgcHJvYmxlbSBtZW50aW9uZWQgYWJvdmUuCgpIZXJlIGlzIGFuIGF0dGVt
cHQgYXQgbWFraW5nIHRoaXMgbG9naWMgbW9yZSByb2J1c3Q6CiogQWxsIE5BTkQgY2hpcCBwcm9w
ZXJ0aWVzIHdoaWNoIGFyZSBzcGVjaWZpYyB0byB0aGUgcmF3IE5BTkQgd29ybGQgYXJlCiAgbW92
ZWQgaW50byBhIHJhdy1uYW5kLWNoaXAueWFtbCBmaWxlLgoqIHJhdy1uYW5kLWNoaXAueWFtbCBp
cyByZWZlcmVuY2VkIGJ5IGFsbCBOQU5EIGNvbnRyb2xsZXIgYmluZGluZ3Mgd2hlbgogIHRoZSBO
QU5EIGNoaXAgbXVzdCBiZSBmdXJ0aGVyIGNvbnN0cmFpbmVkLgoqIHJhdy1uYW5kLWNoaXAueWFt
bCBhbmQgc3BpLW5hbmQueWFtbCByZWZlcmVuY2UgbmFuZC1jaGlwLnlhbWwuCgpUaGVzZSBjaGFu
Z2UgbWFkZSBtZSByZWFsaXplIHRoZSBxY29tLGJvb3QtcGFydGl0aW9uIHByb3BlcnR5CmRlc2Ny
aXB0aW9uIHdhcyBicm9rZW4sIGFuZCBhIGZldyBvdGhlciBkZXNjcmlwdGlvbnMgbmVlZGVkIHNt
YWxsCnVwZGF0ZXMuIEhlcmUgaXMgYSBiYXRjaCBvZiB1cGRhdGVzIHRvIGZpeCBhbGwgdGhlc2Uu
CgpUaGFua3MsCk1pcXXDqGwKCk1pcXVlbCBSYXluYWwgKDE3KToKICBkdC1iaW5kaW5nczogbXRk
OiBBY2NlcHQgbmFuZCByZWxhdGVkIG5vZGUgbmFtZXMKICBkdC1iaW5kaW5nczogbXRkOiBDcmVh
dGUgYSBmaWxlIGZvciByYXcgTkFORCBjaGlwIHByb3BlcnRpZXMKICBkdC1iaW5kaW5nczogbXRk
OiBNYXJrIG5hbmQtZWNjLXBsYWNlbWVudCBkZXByZWNhdGVkCiAgZHQtYmluZGluZ3M6IG10ZDog
RGVzY3JpYmUgbmFuZC1lY2MtbW9kZQogIGR0LWJpbmRpbmdzOiBtdGQ6IHFjb206IEZpeCBhIHBy
b3BlcnR5IHBvc2l0aW9uCiAgZHQtYmluZGluZ3M6IG10ZDogcWNvbTogUHJldmVudCBOQU5EIGNo
aXAgdW5ldmFsdWF0ZWQgcHJvcGVydGllcwogIGR0LWJpbmRpbmdzOiBtdGQ6IGluZ2VuaWM6IFBy
ZXZlbnQgTkFORCBjaGlwIHVuZXZhbHVhdGVkIHByb3BlcnRpZXMKICBkdC1iaW5kaW5nczogbXRk
OiBzdW54aTogUHJldmVudCBOQU5EIGNoaXAgdW5ldmFsdWF0ZWQgcHJvcGVydGllcwogIGR0LWJp
bmRpbmdzOiBtdGQ6IG1lc29uOiBQcmV2ZW50IE5BTkQgY2hpcCB1bmV2YWx1YXRlZCBwcm9wZXJ0
aWVzCiAgZHQtYmluZGluZ3M6IG10ZDogYnJjbW5hbmQ6IFByZXZlbnQgTkFORCBjaGlwIHVuZXZh
bHVhdGVkIHByb3BlcnRpZXMKICBkdC1iaW5kaW5nczogbXRkOiBkZW5hbGk6IFByZXZlbnQgTkFO
RCBjaGlwIHVuZXZhbHVhdGVkIHByb3BlcnRpZXMKICBkdC1iaW5kaW5nczogbXRkOiBpbnRlbDog
UHJldmVudCBOQU5EIGNoaXAgdW5ldmFsdWF0ZWQgcHJvcGVydGllcwogIGR0LWJpbmRpbmdzOiBt
dGQ6IHJvY2tjaGlwOiBQcmV2ZW50IE5BTkQgY2hpcCB1bmV2YWx1YXRlZCBwcm9wZXJ0aWVzCiAg
ZHQtYmluZGluZ3M6IG10ZDogc3RtMzI6IFByZXZlbnQgTkFORCBjaGlwIHVuZXZhbHVhdGVkIHBy
b3BlcnRpZXMKICBkdC1iaW5kaW5nczogbXRkOiBtZWRpYXRlazogUmVmZXJlbmNlIHJhdy1uYW5k
LWNoaXAueWFtbAogIGR0LWJpbmRpbmdzOiBtdGQ6IG1lZGlhdGVrOiBQcmV2ZW50IE5BTkQgY2hp
cCB1bmV2YWx1YXRlZCBwcm9wZXJ0aWVzCiAgZHQtYmluZGluZ3M6IG10ZDogdGksYW02NTQ6IFBy
ZXZlbnQgdW5ldmFsdWF0ZWQgcHJvcGVydGllcwoKIC4uLi9tdGQvYWxsd2lubmVyLHN1bjRpLWEx
MC1uYW5kLnlhbWwgICAgICAgICB8ICAgNSArLQogLi4uL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1l
c29uLW5hbmQueWFtbCAgICAgIHwgICAzICsKIC4uLi9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFu
ZC55YW1sICAgICAgICAgICB8ICAgMyArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZGVu
YWxpLG5hbmQueWFtbCAgfCAgIDkgKy0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdl
bmljLG5hbmQueWFtbCB8ICAgNCArCiAuLi4vYmluZGluZ3MvbXRkL2ludGVsLGxnbS1lYnVuYW5k
LnlhbWwgICAgICAgfCAgIDUgKy0KIC4uLi9iaW5kaW5ncy9tdGQvbWVkaWF0ZWssbXRrLW5mYy55
YW1sICAgICAgICB8ICAgMyArLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ZC55YW1s
ICAgICAgICAgIHwgICAyICstCiAuLi4vYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1s
ICAgICAgICAgfCAgODUgKy0tLS0tLS0tLS0tLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9xY29tLG5hbmRjLnlhbWwgICB8ICA0NSArKysrLS0tCiAuLi4vYmluZGluZ3MvbXRkL3Jhdy1u
YW5kLWNoaXAueWFtbCAgICAgICAgICAgfCAxMTEgKysrKysrKysrKysrKysrKysrCiAuLi4vbXRk
L3JvY2tjaGlwLG5hbmQtY29udHJvbGxlci55YW1sICAgICAgICAgfCAgIDMgKwogLi4uL2JpbmRp
bmdzL210ZC9zdCxzdG0zMi1mbWMyLW5hbmQueWFtbCAgICAgIHwgICAzICsKIC4uLi9iaW5kaW5n
cy9tdGQvdGksYW02NTQtaGJtYy55YW1sICAgICAgICAgICB8ICAgMiArCiAxNCBmaWxlcyBjaGFu
Z2VkLCAxNzIgaW5zZXJ0aW9ucygrKSwgMTExIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcmF3LW5hbmQtY2hpcC55
YW1sCgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
