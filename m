Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B28C02196
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 18:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5JEDEp5uKBXmmHOTy2sWBf8W66WZ/EI6bPK549RbHA=; b=A9o9MxYK0C6ewU
	tw9r4h5rsbgz9wKBo+jvyN8FvN4PI9XRAC81knpIv1jlAAEowB+enEgpDGSGE5J2+arNSWGxT+I7N
	im29DaBlSjPtHdtXiCgq1v14hjPTobtAEbxaiH2Nc7Vj72w7X+GH0oICrLlhMI78KgiNGKlex3V6R
	GRFSIjHxae+4f6Xa4404JOm7/L3POpAvshDQCfX5+IUO6K9BUhj8PPi90flTH5vIJyB1f2rsJA8U6
	m1sykzW3x6YpLbKaV0I3PecvF65OpPvJerrwVYr/CEvY0wpa62CrB3xxaYp+R6KqYyEBXx9Olnwyy
	fzwX0/ELvYChhOFgxqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qi-00000000gk0-3cBo;
	Sun, 26 Jan 2025 18:59:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qf-00000000gg9-0meN
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 18:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0655A40FAF;
	Sun, 26 Jan 2025 18:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC328C4CEEA;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917945;
	bh=PfmNx/8FKpi9tfUAdO7gZEl/uHyfgKgSWW2BXdSdoIQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hlBl+2Mepw3J0ugLK7PkI8UhzdeeqA/WiddWAV3kijb7ZnCtkPlAyMnYcEBRKzM8i
	 szPVi3M92ZsLsWNMLoZRauZkytz+GVITyoORsXs1LFwgUKIAOBOcRIUeYEWQYIQB5A
	 3eYI/ojthnmUg2xz45MP76X0LM9NAfOUXljfNym5onKAeu0ORIKBMlYvLyLg52/MUk
	 LP3i9Yb0exACSUyS2RblZUbAjiM5bIAdcVQXNSsneEpXLdeRhG/5cYZlCmEpLJjcp8
	 rux3S6W1R4QAF0j7ZLLp6ihPOh92E4FabI0Z7i9XcG/fELKiegSW1Clla/onX+AYxA
	 1R41p4+M9CSFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959D7C0218F;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 26 Jan 2025 19:58:57 +0100
Subject: [PATCH 2/9] dt-bindings: ata: Convert fsl,pq-sata binding to YAML
MIME-Version: 1.0
Message-Id: <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
In-Reply-To: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=3504;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=48lSRCoXCpxIM3oWRMWEs2/wzI+AW7ICjxV1sPl67HM=;
 b=bLScZP/2+P6PR65AL0gqKUI72UMsRCVo5PvGbwA6A20OrYb8mo+L9jUpwnATuOGNgbYUCZiMa
 IDQ1X0kek+XC8PpxrWEqVS4GPZSevrgs3kbZPbmh63BNiFb2AkiKb0p
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_105909_353381_67F333C0 
X-CRM114-Status: GOOD (  12.49  )
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
Reply-To: j.ne@posteo.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBwb3N0ZW8ubmV0PgoKQ29udmVydCB0aGUgRnJl
ZXNjYWxlIFBvd2VyUVVJQ0MgU0FUQSBjb250cm9sbGVyIGJpbmRpbmcgZnJvbSB0ZXh0IGZvcm0K
dG8gWUFNTC4gVGhlIGxpc3Qgb2YgY29tcGF0aWJsZSBzdHJpbmdzIHJlZmxlY3RzIGN1cnJlbnQg
dXNhZ2UuCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0Pgot
LS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wscHEtc2F0YS55YW1sICAgICAgIHwg
NTkgKysrKysrKysrKysrKysrKysrKysrKwogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2F0YS9mc2wtc2F0YS50eHQgfCAyOCAtLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDU5
IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvZnNsLHBxLXNhdGEueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvZnNsLHBxLXNhdGEueWFtbApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi42
YWYzMWZmYmNhZDVlOWNjODMxMThhMGJkOGVhZjQ1MzUxYTI4MjNmCi0tLSAvZGV2L251bGwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wscHEtc2F0YS55YW1s
CkBAIC0wLDAgKzEsNTkgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvYXRhL2ZzbCxwcS1zYXRhLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEZyZWVzY2FsZSA4
eHh4LzMuMCBHYi9zIFNBVEEgbm9kZXMKKworbWFpbnRhaW5lcnM6CisgIC0gSi4gTmV1c2Now6Rm
ZXIgPGoubmVAcG9zdGVvLm5ldD4KKworZGVzY3JpcHRpb246IHwKKyAgU0FUQSBub2RlcyBhcmUg
ZGVmaW5lZCB0byBkZXNjcmliZSBvbi1jaGlwIFNlcmlhbCBBVEEgY29udHJvbGxlcnMuCisgIEVh
Y2ggU0FUQSBwb3J0IHNob3VsZCBoYXZlIGl0cyBvd24gbm9kZS4KKworcHJvcGVydGllczoKKyAg
Y29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gaXRlbXM6CisgICAgICAgICAgLSBlbnVt
OgorICAgICAgICAgICAgICAtIGZzbCxtcGM4Mzc3LXNhdGEKKyAgICAgICAgICAgICAgLSBmc2ws
bXBjODUzNi1zYXRhCisgICAgICAgICAgICAgIC0gZnNsLG1wYzgzMTUtc2F0YQorICAgICAgICAg
ICAgICAtIGZzbCxtcGM4Mzc5LXNhdGEKKyAgICAgICAgICAtIGNvbnN0OiBmc2wscHEtc2F0YQor
ICAgICAgLSBjb25zdDogZnNsLHBxLXNhdGEtdjIKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEK
KworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2VsbC1pbmRleDoKKyAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBlbnVtOiBb
MSwgMiwgMywgNF0KKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgMSBmb3IgY29udHJvbGxlciBA
IDB4MTgwMDAKKyAgICAgIDIgZm9yIGNvbnRyb2xsZXIgQCAweDE5MDAwCisgICAgICAzIGZvciBj
b250cm9sbGVyIEAgMHgxYTAwMAorICAgICAgNCBmb3IgY29udHJvbGxlciBAIDB4MWIwMDAKKwor
cmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIGludGVycnVwdHMKKyAgLSBjZWxsLWluZGV4
CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgorICAgIHNh
dGFAMTgwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4Mzc5LXNhdGEiLCAiZnNs
LHBxLXNhdGEiOworICAgICAgICByZWcgPSA8MHgxODAwMCAweDEwMDA+OworICAgICAgICBjZWxs
LWluZGV4ID0gPDE+OworICAgICAgICBpbnRlcnJ1cHRzID0gPDQ0IElSUV9UWVBFX0xFVkVMX0xP
Vz47CisgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmlwaWM+OworICAgIH07CmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXRhL2ZzbC1zYXRhLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvZnNsLXNhdGEudHh0CmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmZDYzYmIzYmVjYzkzNjNjNTIwYThmZDA2NjI5ZmRj
NTJjNGQ0Mjk5Li4wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwCi0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvZnNsLXNhdGEudHh0CisrKyAv
ZGV2L251bGwKQEAgLTEsMjggKzAsMCBAQAotKiBGcmVlc2NhbGUgOHh4eC8zLjAgR2IvcyBTQVRB
IG5vZGVzCi0KLVNBVEEgbm9kZXMgYXJlIGRlZmluZWQgdG8gZGVzY3JpYmUgb24tY2hpcCBTZXJp
YWwgQVRBIGNvbnRyb2xsZXJzLgotRWFjaCBTQVRBIHBvcnQgc2hvdWxkIGhhdmUgaXRzIG93biBu
b2RlLgotCi1SZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21wYXRpYmxlICAgICAgICA6IGNvbXBh
dGlibGUgbGlzdCwgY29udGFpbnMgMiBlbnRyaWVzLCBmaXJzdCBpcwotCQkgImZzbCxDSElQLXNh
dGEiLCB3aGVyZSBDSElQIGlzIHRoZSBwcm9jZXNzb3IKLQkJIChtcGM4MzE1LCBtcGM4Mzc5LCBl
dGMuKSBhbmQgdGhlIHNlY29uZCBpcwotCQkgImZzbCxwcS1zYXRhIgotLSBpbnRlcnJ1cHRzICAg
ICAgICA6IDxpbnRlcnJ1cHQgbWFwcGluZyBmb3IgU0FUQSBJUlE+Ci0tIGNlbGwtaW5kZXggICAg
ICAgIDogY29udHJvbGxlciBpbmRleC4KLSAgICAgICAgICAgICAgICAgICAgICAgICAgMSBmb3Ig
Y29udHJvbGxlciBAIDB4MTgwMDAKLSAgICAgICAgICAgICAgICAgICAgICAgICAgMiBmb3IgY29u
dHJvbGxlciBAIDB4MTkwMDAKLSAgICAgICAgICAgICAgICAgICAgICAgICAgMyBmb3IgY29udHJv
bGxlciBAIDB4MWEwMDAKLSAgICAgICAgICAgICAgICAgICAgICAgICAgNCBmb3IgY29udHJvbGxl
ciBAIDB4MWIwMDAKLQotT3B0aW9uYWwgcHJvcGVydGllczoKLS0gcmVnICAgICAgICAgICAgICAg
OiA8cmVnaXN0ZXJzIG1hcHBpbmc+Ci0KLUV4YW1wbGU6Ci0Jc2F0YUAxODAwMCB7Ci0JCWNvbXBh
dGlibGUgPSAiZnNsLG1wYzgzNzktc2F0YSIsICJmc2wscHEtc2F0YSI7Ci0JCXJlZyA9IDwweDE4
MDAwIDB4MTAwMD47Ci0JCWNlbGwtaW5kZXggPSA8MT47Ci0JCWludGVycnVwdHMgPSA8MmMgOD47
Ci0JCWludGVycnVwdC1wYXJlbnQgPSA8ICZpcGljID47Ci0JfTsKCi0tIAoyLjQ4LjAucmMxLjIx
OS5nYjZiNjc1N2Q3NzIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
