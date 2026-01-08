Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C3BD1D478
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9rcMxaSlBQmrpT1UjK/7rwkdhaBjUIL5TZsheUaZCg=; b=vSvXhvNEJVTPN7
	Ca1KNdi+NN8BQJEbnrT/0xaK5BAhDASBDnnSxgIcgmmw4v3FtFLfYPngafVb7B7JDuxXGrUWR08+N
	xEZjISnkJAS4yRXOhh6F9Q+SROzljehzJcviOjuM5f7QkXg+wcTME/Y6xJ5BdLlzMptiOgO4+IF34
	OBD4lvirUyhqW10t3LvFXYW6mx38zS7Fq0q9q31We2GA1Aowj9T723gsxOrzZy/2mN9GpPonqfTOz
	ofhkZO8gZ4JOeTHliNKhHbSrfLjJNWk8fQRe+CjGOGaNmGTLJmAu6BV/MCNtXodzemQ0zGaSrEQ7W
	biSJQXHJr2OoBFo11v8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCf-00000000VdA-1dgl;
	Thu, 08 Jan 2026 17:53:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCa-00000000VbF-2Zbv
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AA02442CD;
	Thu,  8 Jan 2026 17:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F058FC16AAE;
	Thu,  8 Jan 2026 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767894820;
	bh=ugA+9bTKP7viQx4bvjNE6uPV3wSRpbGlQ6T4noR20Pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aZdTvL7kKt6kaEBFVE5qpZEXckuIMzXmmjZVHjh2YN8Ovk7zMcsbWzWAizzJK6Nc7
	 mRKKIHQbU2UqRgANA3dCGZKBHaRVIRFmbDtHt93OOmCmGYyOS3OuI20gGNskRZ0/YF
	 9kvdcKarMVGz1Pd2qTjIFp0/SRJSRsWM+zN2p4hS8GXcGc4B4bz7wxildWrdsUPCuo
	 C36LYtmX4x8QQ5+7xPabHDCQGCEUDxsOw0j54HpD4ulTfElA62+iC1T38XK0iLfvch
	 ESs2dqw/rfLYCKySMhZqWaedoFRz9QPq203BATdvxt3TvjBHTCv7UGuP6TsEobBVEu
	 1vv+DkcImao0g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 08 Jan 2026 11:53:11 -0600
Subject: [PATCH 02/10] dt-bindings: mtd: fixed-partitions: Move
 "compression" to partition node
MIME-Version: 1.0
Message-Id: <20260108-dt-mtd-partitions-v1-2-124a53ce6279@kernel.org>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
In-Reply-To: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, 
 William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, 
 Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_095341_594920_252FD39C 
X-CRM114-Status: GOOD (  10.50  )
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

VGhlICJjb21wcmVzc2lvbiIgcHJvcGVydHkgaXMgZGVmaW5lZCBpbiB0aGUgd3JvbmcgcGxhY2Ug
YXMgaXQgYXBwbGllcwp0byBpbmRpdmlkdWFsIHBhcnRpdGlvbnMgbm9kZXMsIG5vdCBhbGwgbm9k
ZXMuCgpGaXhlczogOGJhYmE4ZDUyZmY1ICgiZHQtYmluZGluZ3M6IG10ZDogZml4ZWQtcGFydGl0
aW9uczogQWRkIGNvbXByZXNzaW9uIHByb3BlcnR5IikKU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJp
bmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KLS0tCiAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlv
bnMvZml4ZWQtcGFydGl0aW9ucy55YW1sICAgICAgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sICB8IDE4
ICsrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAx
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFt
bAppbmRleCA2MjA4NjM2NjgzN2MuLjczZDc0YzBmNWNiNyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMu
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlv
bnMvZml4ZWQtcGFydGl0aW9ucy55YW1sCkBAIC0yOSwyNCArMjksNiBAQCBwcm9wZXJ0aWVzOgog
CiAgICIjc2l6ZS1jZWxscyI6IHRydWUKIAotICBjb21wcmVzc2lvbjoKLSAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcKLSAgICBkZXNjcmlwdGlvbjogfAot
ICAgICAgQ29tcHJlc3Npb24gYWxnb3JpdGhtIHVzZWQgdG8gc3RvcmUgdGhlIGRhdGEgaW4gdGhp
cyBwYXJ0aXRpb24sIGNob3NlbgotICAgICAgZnJvbSBhIGxpc3Qgb2Ygd2VsbC1rbm93biBhbGdv
cml0aG1zLgotCi0gICAgICBUaGUgY29udGVudHMgYXJlIGNvbXByZXNzZWQgdXNpbmcgdGhpcyBh
bGdvcml0aG0uCi0KLSAgICBlbnVtOgotICAgICAgLSBub25lCi0gICAgICAtIGJ6aXAyCi0gICAg
ICAtIGd6aXAKLSAgICAgIC0gbHpvcAotICAgICAgLSBsejQKLSAgICAgIC0gbHptYQotICAgICAg
LSB4egotICAgICAgLSB6c3RkCi0KIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAiQFswLTlhLWZdKyQi
OgogICAgICRyZWY6IHBhcnRpdGlvbi55YW1sIwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1s
CmluZGV4IDgwZDA0NTJhMmEzMy4uMGI5ODkwMzdhMDA1IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRp
dGlvbi55YW1sCkBAIC0xMDgsNiArMTA4LDI0IEBAIHByb3BlcnRpZXM6CiAgICAgICB3aXRoIHRo
ZSBwYWRkaW5nIGJ5dGVzLCBzbyBtYXkgZ3Jvdy4gSWYg4oCYYWxpZ24tZW5k4oCZIGlzIG5vdCBw
cm92aWRlZCwKICAgICAgIG5vIGFsaWdubWVudCBpcyBwZXJmb3JtZWQuCiAKKyAgY29tcHJlc3Np
b246CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nCisg
ICAgZGVzY3JpcHRpb246IHwKKyAgICAgIENvbXByZXNzaW9uIGFsZ29yaXRobSB1c2VkIHRvIHN0
b3JlIHRoZSBkYXRhIGluIHRoaXMgcGFydGl0aW9uLCBjaG9zZW4KKyAgICAgIGZyb20gYSBsaXN0
IG9mIHdlbGwta25vd24gYWxnb3JpdGhtcy4KKworICAgICAgVGhlIGNvbnRlbnRzIGFyZSBjb21w
cmVzc2VkIHVzaW5nIHRoaXMgYWxnb3JpdGhtLgorCisgICAgZW51bToKKyAgICAgIC0gbm9uZQor
ICAgICAgLSBiemlwMgorICAgICAgLSBnemlwCisgICAgICAtIGx6b3AKKyAgICAgIC0gbHo0Cisg
ICAgICAtIGx6bWEKKyAgICAgIC0geHoKKyAgICAgIC0genN0ZAorCiBpZjoKICAgbm90OgogICAg
IHJlcXVpcmVkOiBbIHJlZyBdCgotLSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
