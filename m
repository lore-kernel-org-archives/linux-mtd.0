Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8375AC0219E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 21:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ZBawzW0cqG7CRaWI4B1LN8b9kfOzt3SV2q+pQUiNnA=; b=pEqToHThMYDrbf
	lBTx0aY6Sr4KfVJ/463k04Nf5n7FsodfOuLT7Nd4y7oix3rUXftFR2T+SSXs6lFt3Jm6ZFawENNcT
	g2FlZcDSlgyiyOhPIMRPoZYgQPUDY5mWzPl4oZlJuQtGcE1HU0E9u9hQCUBQLhGbwAaiiYhGmlwzl
	1sFyQq4p57VEGNSVLVSwOAFNPl9hyd/q5n8uobt0oDRjTpCZyz5le403mLwcB28CxEBwEaZ11hLB0
	4L6b68YHIWdNvlkWSqBKpjiPDzxEK+f9s3hEmb4ja/ru6vwkExiKEEKGh89+sA/M9oPE1g6bYa9zs
	xIkfLQxvbg9oQcdjOn0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwg-0000000BDi8-1g7C;
	Fri, 07 Feb 2025 21:31:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVvo-0000000BD6F-3Q3e
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 21:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0FD05C0065;
	Fri,  7 Feb 2025 21:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CBADC4CED1;
	Fri,  7 Feb 2025 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963835;
	bh=94ujvz3tk5ekjf2MZlbHHWzbwwWLaHAsa3ywPEveVtA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cfve54Sxfr9QBL7efbkka4gqbqtmLqDIX7fxuTzqbSgJRFcfeed3+Xr+9fKlcgoO0
	 7SkednyYe2a+mlwJXN/glHoULVuuNp1baglH2iIOGjL+wNZ+jRBjylOQx6u0p5+ZBl
	 dMyKW521/HplkdQ4imXzl6l6fSsYfVhNa5B42O6un/jk4TqpNh8LMY+JP6I5TeqJtI
	 D+hMbghbT5SMbxIjdMfsO1nwhUBYR53hrYmqyIhj7ciuV4+FQgVOboC0ytQwYr68hX
	 G4Sie13QcWfrJYErG7fN0GLjtfB3Vq/d//lMLHG1rsxBb8gSVPyyrXdt0fxq4WzU4A
	 L30mdjjFq+xFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5C6C02194;
	Fri,  7 Feb 2025 21:30:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 00/12] YAML conversion of several Freescale/PowerPC DT
 bindings
Date: Fri, 07 Feb 2025 22:30:17 +0100
Message-Id: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGp7pmcC/2XMQQ7CIBCF4as0sxYDVEh11XuYLuowWBItBAixa
 bi72K3L/+Xl2yFRdJTg1u0Qqbjk/NpCnjrAZV6fxJxpDZJLxYXULATc5veL6YEjmuHRW5TQ3iG
 SdZ9Duk+tF5eyj9sBF/Fb/40iGGeK68vVKoG9MWPwKZM/r5RhqrV+AeTPTISfAAAA
X-Change-ID: 20250126-ppcyaml-680ccd8b3fc2
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: imx@lists.linux.dev, Scott Wood <oss@buserror.net>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738963832; l=3147;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=94ujvz3tk5ekjf2MZlbHHWzbwwWLaHAsa3ywPEveVtA=;
 b=9ApSQvdR7H4b5oYJC3cFy1ErDfu4w+UKbTU0bUdy14D+XfqSBEdTRk2y9o2+fy4Ll7XwAb/Ap
 0ovzTOSCrwXC+++bUZmGcEPJeGRovxiY/IKS/grKdK9HL/fa7Yy7Bo+
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133036_942634_5D58EB2D 
X-CRM114-Status: UNSURE (   8.76  )
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
ZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+Ci0tLQpDaGFuZ2VzIGluIHYy
OgotIHJlYmFzZWQgb24gdjYuMTQtcmMxCi0gdmFyaW91cyBzdHlsZSBjbGVhbnVwcywgYm90aCBp
biBZQU1MIGFuZCBpbiBEVFMgZXhhbXBsZXMKLSBtaW5vciBpbXByb3ZlbWVudHMgdG8gdGhlIGNv
bW1pdCBtZXNzYWdlcwotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NTAxMjYtcHBjeWFtbC12MS0wLTUwNjQ5ZjUxYzNkZEBwb3N0ZW8ubmV0CgotLS0KSi4gTmV1c2No
w6RmZXIgKDEyKToKICAgICAgZHQtYmluZGluZ3M6IHBvd2VycGM6IEFkZCBGcmVlc2NhbGUvTlhQ
IE1QQzgzeHggU29DcwogICAgICBkdC1iaW5kaW5nczogYXRhOiBDb252ZXJ0IGZzbCxwcS1zYXRh
IHRvIFlBTUwKICAgICAgZHQtYmluZGluZ3M6IGNyeXB0bzogQ29udmVydCBmc2wsc2VjLTIuMCB0
byBZQU1MCiAgICAgIGR0LWJpbmRpbmdzOiBtZmQ6IENvbnZlcnQgZnNsLG1jdS1tcGM4MzQ5ZW1p
dHggdG8gWUFNTAogICAgICBkdC1iaW5kaW5nczogZG1hOiBDb252ZXJ0IGZzbCxlbG8qLWRtYSB0
byBZQU1MCiAgICAgIGR0LWJpbmRpbmdzOiBwY2k6IENvbnZlcnQgZnNsLG1wYzgzeHgtcGNpZSB0
byBZQU1MCiAgICAgIGR0LWJpbmRpbmdzOiB3YXRjaGRvZzogQ29udmVydCBtcGM4eHh4LXdkdCB0
byBZQU1MCiAgICAgIGR0LWJpbmRpbmdzOiBzcGk6IENvbnZlcnQgRnJlZXNjYWxlIFNQSSBiaW5k
aW5ncyB0byBZQU1MCiAgICAgIGR0LWJpbmRpbmdzOiBtZW1vcnktY29udHJvbGxlcnM6IENvbnZl
cnQgZnNsLGVsYmMgdG8gWUFNTAogICAgICBkdC1iaW5kaW5nczogbWVtb3J5LWNvbnRyb2xsZXJz
OiBBZGQgZnNsLGVsYmMtZ3BjbS11aW8KICAgICAgZHQtYmluZGluZ3M6IG5hbmQ6IEFkZCBmc2ws
ZWxiYy1mY20tbmFuZAogICAgICBkdC1iaW5kaW5nczogbXRkOiByYXctbmFuZC1jaGlwOiBSZWxh
eCBub2RlIG5hbWUgcGF0dGVybgoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wscHEt
c2F0YS55YW1sICAgICAgIHwgIDU5ICsrKysrKwogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2F0YS9mc2wtc2F0YS50eHQgfCAgMjggLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9jcnlwdG8vZnNsLHNlYzIuMC55YW1sICAgICB8IDE0MiArKysrKysrKysrKysrKwogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvY3J5cHRvL2ZzbC1zZWMyLnR4dCAgICAgICAgfCAgNjUgLS0tLS0t
LQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2ZzbCxlbG8tZG1hLnlhbWwgICAgICAgfCAx
NDAgKysrKysrKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9mc2wsZWxvMy1k
bWEueWFtbCAgICAgIHwgMTIzICsrKysrKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RtYS9mc2wsZWxvcGx1cy1kbWEueWFtbCAgIHwgMTM0ICsrKysrKysrKysrKysrCiAuLi4vbWVt
b3J5LWNvbnRyb2xsZXJzL2ZzbCxlbGJjLWdwY20tdWlvLnlhbWwgICAgICB8ICA1OSArKysrKysK
IC4uLi9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZnNsLGVsYmMueWFtbCAgICAgIHwgMTQ2
ICsrKysrKysrKysrKysrKwogLi4uL2JpbmRpbmdzL21mZC9mc2wsbWN1LW1wYzgzNDllbWl0eC55
YW1sICAgICAgICAgfCAgNTMgKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvZnNs
LGVsYmMtZmNtLW5hbmQueWFtbCB8ICA2OCArKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcmF3LW5hbmQtY2hpcC55YW1sICAgICB8ICAgMiArLQogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGNpL2ZzbCxtcGM4eHh4LXBjaS55YW1sICAgfCAxMTUgKysrKysrKysrKysrCiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxwY2kudHh0ICB8ICAyNyAtLS0K
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2RtYS50eHQgICAgICAgIHwgMjA0
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2ZzbCxtcGM4
M3h4LnlhbWwgICAgICAgICAgfCAgNjcgKysrKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
cG93ZXJwYy9mc2wvbGJjLnR4dCAgICAgICAgfCAgNDMgLS0tLS0KIC4uLi9iaW5kaW5ncy9wb3dl
cnBjL2ZzbC9tY3UtbXBjODM0OWVtaXR4LnR4dCAgICAgIHwgIDE3IC0tCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zcGkvZnNsLGVzcGkueWFtbCAgICAgICAgICB8ICA2NCArKysrKysrCiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2ZzbCxzcGkueWFtbCB8ICA3MyArKysr
KysrKwogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9mc2wtc3BpLnR4dCAg
fCAgNjIgLS0tLS0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXBjOHh4eC13
ZHQudHh0ICAgfCAgMjUgLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tcGM4
eHh4LXdkdC55YW1sICB8ICA2NCArKysrKysrCiAyMyBmaWxlcyBjaGFuZ2VkLCAxMzA4IGluc2Vy
dGlvbnMoKyksIDQ3MiBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiAyMDE0Yzk1YWZlY2Vl
M2U3NmNhNGE1Njk1NmE5MzZlMjMyODNmMDViCmNoYW5nZS1pZDogMjAyNTAxMjYtcHBjeWFtbC02
ODBjY2Q4YjNmYzIKCkJlc3QgcmVnYXJkcywKLS0gCkouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rl
by5uZXQ+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
