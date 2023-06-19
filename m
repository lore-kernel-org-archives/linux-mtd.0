Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62ACEB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wrcD3z5X4s6NXJbfBkzBuEVxpkMfSashe2SN4BCaY3w=; b=wtdL4t3IlhVeXZ
	E272ipH0o1yts3cwClQYEJsn/g7hVfYuxTRoH4RC4sR8Qw/3ScfivHPYuB/a9OOvUDB2A/se1aNRC
	Tiev+Xn5h9wdDybQTrFlyBV+reOHdbrNZladrGWaECnVtthVkHOR0teg7rxorFJje6tEQNOhBuJr4
	OklCccgU8HLP4ILWdWStLt/l1EMZ8b/g5BzXSAAT2Aab3KsvjLWp5RVai4u7CUszChAX1x8wKOY4I
	C4Vo+fpFhm+yzyu8HppEuecQn/5wNNPwYAekM5KTXY8WhYswulBS1sZmEC3m0E6SvBP2UgPF6Fk5g
	itiE/ti5WAjeRLGPDrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCS-0080Qv-2Y;
	Mon, 19 Jun 2023 09:29:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCO-0080O4-1Z
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:26 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hzm+wyXnQnXoG7AF86SFOyQilabBBm30tZrluvS3Mxw=;
	b=OAy1t10cbWqn87umkXPZKI8KjwiCGlHD/GvvBRPSzPr3gq3ZdC9FsL9EfP6lEuOTA6rJ2C
	ja70LU3Oz/TXbsTgFvbUEQf8U7pkcWiYdsIJo418LrHtEFhL0FAnqKWuZHGmJWxlfgcg2g
	Gu6c/eBSxpuZdx188VJ2a9+BpOJIg2Mt6vXlo2jRWMIm5HgmkDE2c3wE7FXGOdwAE2DUFs
	jf6l99XS/XPyZh8gpvXLHt1Cv/D0DqDZoJQ4888SE2IyYw7SmJOJ8M+FwAk5YokvS/ths5
	HjYV3lM1mgpw9pJr5LqhtmhmVFDuxp4MS9XtDAyuf4HZfJOJZVMTLphzwOg2ZA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F21B1BF205;
	Mon, 19 Jun 2023 09:29:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
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
Subject: [PATCH v3 00/17] Prevent NAND chip unevaluated properties
Date: Mon, 19 Jun 2023 11:28:59 +0200
Message-Id: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022924_939021_08423330 
X-CRM114-Status: GOOD (  16.24  )
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
CgpUaGFua3MsCk1pcXXDqGwKCkNoYW5nZXMgaW4gdjM6CiogSSdtIG5vdCBzdXJlIHdoYXQgaGFw
cGVuZWQgd2l0aCB2MiBidXQgdGhlcmUgd2VyZSBzb21lIGxlZnRvdmVycyBmcm9tCiAgInByZXZp
b3VzIiBrZXJuZWxzLCBhbnl3YXkgdGhpcyB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMgZG9lcyBub3Qg
c2VlbSB0bwogIGJlIGFmZmVjdGVkLgoqIEkgYWxzbyByZW1vdmVkIHRoZSByZW1haW5pbmcgcXVv
dGVzIHdoaWNoIGFyZSBub3QgbmVlZGVkIGFueW1vcmUuCiogQ29sbGVjdGVkIGFsbCB0YWdzLgoK
TWlxdWVsIFJheW5hbCAoMTcpOgogIGR0LWJpbmRpbmdzOiBtdGQ6IEFjY2VwdCBuYW5kIHJlbGF0
ZWQgbm9kZSBuYW1lcwogIGR0LWJpbmRpbmdzOiBtdGQ6IENyZWF0ZSBhIGZpbGUgZm9yIHJhdyBO
QU5EIGNoaXAgcHJvcGVydGllcwogIGR0LWJpbmRpbmdzOiBtdGQ6IE1hcmsgbmFuZC1lY2MtcGxh
Y2VtZW50IGRlcHJlY2F0ZWQKICBkdC1iaW5kaW5nczogbXRkOiBEZXNjcmliZSBuYW5kLWVjYy1t
b2RlCiAgZHQtYmluZGluZ3M6IG10ZDogcWNvbTogRml4IGEgcHJvcGVydHkgcG9zaXRpb24KICBk
dC1iaW5kaW5nczogbXRkOiBxY29tOiBQcmV2ZW50IE5BTkQgY2hpcCB1bmV2YWx1YXRlZCBwcm9w
ZXJ0aWVzCiAgZHQtYmluZGluZ3M6IG10ZDogaW5nZW5pYzogUHJldmVudCBOQU5EIGNoaXAgdW5l
dmFsdWF0ZWQgcHJvcGVydGllcwogIGR0LWJpbmRpbmdzOiBtdGQ6IHN1bnhpOiBQcmV2ZW50IE5B
TkQgY2hpcCB1bmV2YWx1YXRlZCBwcm9wZXJ0aWVzCiAgZHQtYmluZGluZ3M6IG10ZDogbWVzb246
IFByZXZlbnQgTkFORCBjaGlwIHVuZXZhbHVhdGVkIHByb3BlcnRpZXMKICBkdC1iaW5kaW5nczog
bXRkOiBicmNtbmFuZDogUHJldmVudCBOQU5EIGNoaXAgdW5ldmFsdWF0ZWQgcHJvcGVydGllcwog
IGR0LWJpbmRpbmdzOiBtdGQ6IGRlbmFsaTogUHJldmVudCBOQU5EIGNoaXAgdW5ldmFsdWF0ZWQg
cHJvcGVydGllcwogIGR0LWJpbmRpbmdzOiBtdGQ6IGludGVsOiBQcmV2ZW50IE5BTkQgY2hpcCB1
bmV2YWx1YXRlZCBwcm9wZXJ0aWVzCiAgZHQtYmluZGluZ3M6IG10ZDogcm9ja2NoaXA6IFByZXZl
bnQgTkFORCBjaGlwIHVuZXZhbHVhdGVkIHByb3BlcnRpZXMKICBkdC1iaW5kaW5nczogbXRkOiBz
dG0zMjogUHJldmVudCBOQU5EIGNoaXAgdW5ldmFsdWF0ZWQgcHJvcGVydGllcwogIGR0LWJpbmRp
bmdzOiBtdGQ6IG1lZGlhdGVrOiBSZWZlcmVuY2UgcmF3LW5hbmQtY2hpcC55YW1sCiAgZHQtYmlu
ZGluZ3M6IG10ZDogbWVkaWF0ZWs6IFByZXZlbnQgTkFORCBjaGlwIHVuZXZhbHVhdGVkIHByb3Bl
cnRpZXMKICBkdC1iaW5kaW5nczogbXRkOiB0aSxhbTY1NDogUHJldmVudCB1bmV2YWx1YXRlZCBw
cm9wZXJ0aWVzCgogLi4uL210ZC9hbGx3aW5uZXIsc3VuNGktYTEwLW5hbmQueWFtbCAgICAgICAg
IHwgICA1ICstCiAuLi4vYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sICAgICAg
fCAgIDMgKwogLi4uL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlhbWwgICAgICAgICAgIHwg
ICAzICsKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9kZW5hbGksbmFuZC55YW1sICB8ICAg
OSArLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2luZ2VuaWMsbmFuZC55YW1sIHwgICA0
ICsKIC4uLi9iaW5kaW5ncy9tdGQvaW50ZWwsbGdtLWVidW5hbmQueWFtbCAgICAgICB8ICAgNSAr
LQogLi4uL2JpbmRpbmdzL210ZC9tZWRpYXRlayxtdGstbmZjLnlhbWwgICAgICAgIHwgICAzICst
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLnlhbWwgICAgICAgICAgfCAgIDIgKy0K
IC4uLi9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwgICAgICAgICB8ICA4NSArLS0t
LS0tLS0tLS0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20sbmFuZGMueWFtbCAg
IHwgIDQ1ICsrKystLS0KIC4uLi9iaW5kaW5ncy9tdGQvcmF3LW5hbmQtY2hpcC55YW1sICAgICAg
ICAgICB8IDExMSArKysrKysrKysrKysrKysrKysKIC4uLi9tdGQvcm9ja2NoaXAsbmFuZC1jb250
cm9sbGVyLnlhbWwgICAgICAgICB8ICAgMyArCiAuLi4vYmluZGluZ3MvbXRkL3N0LHN0bTMyLWZt
YzItbmFuZC55YW1sICAgICAgfCAgIDMgKwogLi4uL2JpbmRpbmdzL210ZC90aSxhbTY1NC1oYm1j
LnlhbWwgICAgICAgICAgIHwgICAyICsKIDE0IGZpbGVzIGNoYW5nZWQsIDE3MiBpbnNlcnRpb25z
KCspLCAxMTEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9yYXctbmFuZC1jaGlwLnlhbWwKCi0tIAoyLjM0LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
