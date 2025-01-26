Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C833AC02191
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OCJABxLM6HDfi8m5snslNgrQo0cisHgUYUc3bb1WqtM=; b=R6OG+RQR+mK3DT
	Hn7130K2djXH7BVEbHKvHwAfMiP5SGQVlDEb5nFSS8nxBYj8XiREZc5Qih+ter8VlvGbIeIiB1z5v
	7Iu0WO4/Zj4JLOsT2t8J34vY3JAmET+zuBParz3jgiclvkrDIwIEjO6CHTgBugYyYZfRCBAja1ILl
	HUrtmFY/zyZPnVOAoLMSzRxYJ8LA9F1KD7+JUCt/uGA2PdrvRVfl6EyY4l7h51Tod2FalZNn/aNHe
	fqpWjztzvQ9BgBC4JYUwO1f9J3/Mdph0BP9xj7/vCZwkt2O80xgzE55omi1KDIqfOf+eRVW5Fnh07
	i+INEeXKjLRiAYHBAJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qh-00000000gih-1UzS;
	Sun, 26 Jan 2025 18:59:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7qe-00000000gfs-1En1
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 18:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A87E55C2CB5;
	Sun, 26 Jan 2025 18:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B03EC4CED3;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737917945;
	bh=t7MiR81B+Iee46VXjw3fUJ5IYqT5cIbBOLroU8KM1fQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EyXFvuKmOEPqCcAclYtRc2Nf6D64xrAfFFHSZA0oJ5gamkDnb6Lx9KPgGTaKh2ZKh
	 StvXwLWvB4AXxrvQfCNYMVQ+vpVzioxQMMB5QA+tePMantmyW6B9rN0BRQvG1/FvWU
	 prHsgS/oe5U6OOHHZh5ZPSdmN7eKPsdtUb1nfbVEq0vPIx4qdqoqUXf6uZemN0OnPz
	 K8suGTkXNhL0Xx0Ng2m6CJ3yVE19C8LvGkQWvvwWjtIzah0W0CKFmEx6/EnIToChCc
	 AWYum0Cs2J7hzfAr6sBPp1fVniQybgbyId3cy5jTPg+VlAkwKGNgQLNyYIHuje6NCa
	 rNybsHqvM8Eig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66071C02181;
	Sun, 26 Jan 2025 18:59:05 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/9] YAML conversion of several Freescale/PowerPC DT
 bindings
Date: Sun, 26 Jan 2025 19:58:55 +0100
Message-Id: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO+FlmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMz3YKC5MrE3BxdMwuD5OQUiyTjtGQjJaDqgqLUtMwKsEnRsbW1AIw
 prb9ZAAAA
X-Change-ID: 20250126-ppcyaml-680ccd8b3fc2
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737917943; l=2648;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=t7MiR81B+Iee46VXjw3fUJ5IYqT5cIbBOLroU8KM1fQ=;
 b=rX4cEDadyqjKuA8yYkLZevdyfcRaUdz4BHeJl10YNn4xTsKCjeCD6OKBl3O1tpdL5puknSF0r
 w3DGg25+T63CHz+RBokGYXZ8fMyOUHiLEo+aY9gwD/QBhE8TjlNwX8S
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_105908_420953_0EFA5B66 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

VGhpcyBpcyBhIHNwaW4tb2ZmIG9mIHRoZSBzZXJpZXMgdGl0bGVkCiJwb3dlcnBjOiBNUEM4M3h4
IGNsZWFudXAgYW5kIExBTkNPTSBOV0FQUDIgYm9hcmQiLgoKRHVyaW5nIHRoZSBkZXZlbG9wbWVu
dCBvZiB0aGF0IHNlcmllcywgaXQgYmVjYW1lIGNsZWFyIHRoYXQgbWFueQpkZXZpY2V0cmVlIGJp
bmRpbmdzIGZvciBGcmVlc2NhbGUgTVBDOHh4eCBwbGF0Zm9ybXMgYXJlIHN0aWxsIGluIHRoZSBv
bGQKcGxhaW4tdGV4dCBmb3JtYXQsIG9yIGRvbid0IGV4aXN0IGF0IGFsbCwgYW5kIGluIGFueSBj
YXNlIGRvbid0IG1lbnRpb24KYWxsIHZhbGlkIGNvbXBhdGlibGUgc3RyaW5ncy4KClNpZ25lZC1v
ZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQpKLiBOZXVzY2jDpGZl
ciAoOSk6CiAgICAgIGR0LWJpbmRpbmdzOiBwb3dlcnBjOiBBZGQgYmluZGluZyBmb3IgRnJlZXNj
YWxlL05YUCBNUEM4M3h4IFNvQ3MKICAgICAgZHQtYmluZGluZ3M6IGF0YTogQ29udmVydCBmc2ws
cHEtc2F0YSBiaW5kaW5nIHRvIFlBTUwKICAgICAgZHQtYmluZGluZ3M6IGNyeXB0bzogQ29udmVy
dCBmc2wsc2VjLTIuMCBiaW5kaW5nIHRvIFlBTUwKICAgICAgZHQtYmluZGluZ3M6IG1mZDogQ29u
dmVydCBmc2wsbWN1LW1wYzgzNDllbWl0eCBiaW5kaW5nIHRvIFlBTUwKICAgICAgZHQtYmluZGlu
Z3M6IGRtYTogQ29udmVydCBmc2wsZWxvKi1kbWEgYmluZGluZ3MgdG8gWUFNTAogICAgICBkdC1i
aW5kaW5nczogcGNpOiBBZGQgZnNsLG1wYzgzeHgtcGNpZSBiaW5kaW5ncwogICAgICBkdC1iaW5k
aW5nczogd2F0Y2hkb2c6IENvbnZlcnQgbXBjOHh4eC13ZHQgYmluZGluZyB0byBZQU1MCiAgICAg
IGR0LWJpbmRpbmdzOiBzcGk6IENvbnZlcnQgRnJlZXNjYWxlIFNQSSBiaW5kaW5ncyB0byBZQU1M
CiAgICAgIFtSRkNdIGR0LWJpbmRpbmdzOiBuYW5kOiBDb252ZXJ0IGZzbCxlbGJjIGJpbmRpbmdz
IHRvIFlBTUwKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvZnNsLHBxLXNhdGEueWFtbCAg
ICAgICB8ICA1OSArKysrKysKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEv
ZnNsLXNhdGEudHh0IHwgIDI4IC0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvY3J5cHRvL2Zz
bCxzZWMyLjAueWFtbCAgICAgfCAxMzkgKysrKysrKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2NyeXB0by9mc2wtc2VjMi50eHQgICAgICAgIHwgIDY1IC0tLS0tLS0KIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2RtYS9mc2wsZWxvLWRtYS55YW1sICAgICAgIHwgMTI5ICsrKysrKysr
KysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9mc2wsZWxvMy1kbWEueWFtbCAgICAg
IHwgMTA1ICsrKysrKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvZnNsLGVsb3Bs
dXMtZG1hLnlhbWwgICB8IDEyMCArKysrKysrKysrKysKIC4uLi9iaW5kaW5ncy9tZmQvZnNsLG1j
dS1tcGM4MzQ5ZW1pdHgueWFtbCAgICAgICAgIHwgIDUzICsrKysrKwogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2ZzbCxlbGJjLWZjbS1uYW5kLnlhbWwgfCAgNjEgKysrKysrCiAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNsLG1wYzh4eHgtcGNpLnlhbWwgICB8ICA4MyArKysrKysr
KysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2RtYS50eHQgICAgICAgIHwg
MjA0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2ZzbCxl
bGJjLWdwY20tdWlvLnlhbWwgICAgfCAgNTUgKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9wb3dlcnBjL2ZzbC9mc2wsZWxiYy55YW1sICB8IDE1MCArKysrKysrKysrKysrKysKIC4uLi9i
aW5kaW5ncy9wb3dlcnBjL2ZzbC9mc2wsbXBjODN4eC55YW1sICAgICAgICAgIHwgIDY3ICsrKysr
KysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2xiYy50eHQgICAgICAgIHwg
IDQzIC0tLS0tCiAuLi4vYmluZGluZ3MvcG93ZXJwYy9mc2wvbWN1LW1wYzgzNDllbWl0eC50eHQg
ICAgICB8ICAxNyAtLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2ZzbCxlc3BpLnlhbWwg
ICAgICAgICAgfCAgNTYgKysrKysrCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c3BpL2ZzbCxzcGkueWFtbCB8ICA3MSArKysrKysrCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc3BpL2ZzbC1zcGkudHh0ICB8ICA2MiAtLS0tLS0tCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy93YXRjaGRvZy9tcGM4eHh4LXdkdC50eHQgICB8ICAyNSAtLS0KIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3dhdGNoZG9nL21wYzh4eHgtd2R0LnlhbWwgIHwgIDY0ICsrKysrKysKIDIx
IGZpbGVzIGNoYW5nZWQsIDEyMTIgaW5zZXJ0aW9ucygrKSwgNDQ0IGRlbGV0aW9ucygtKQotLS0K
YmFzZS1jb21taXQ6IGZmZDI5NGQzNDZkMTg1YjcwZTI4YjFhMjhhYmUzNjdiYmZlNTNjMDQKY2hh
bmdlLWlkOiAyMDI1MDEyNi1wcGN5YW1sLTY4MGNjZDhiM2ZjMgoKQmVzdCByZWdhcmRzLAotLSAK
Si4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
