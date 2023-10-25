Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474A1C0032E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 21:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mml9TMhO/PEhdKdt7b2XZikk/6Rsdk+hkeD4J/k33Lw=; b=BzLzaSP0YgHxaC
	hpBZzWlrofOo3xz5wahOhvGHwQzUs2aAAMmrPk5UrPfdo7G4Lfp5FsJ4xyt9w2UGuKl5LSQsVwo1P
	4YqPDnwY5iWYS24HL0qqHZdYMcF3bxAfMSN1QD4oXhnIck1XQ3FjWuccA7H9SHOl4cOJYxkuHw1IC
	PlDSpbXptoUfauToTRqv7GZDeoOpMwC2diLJJZ3L6JJtLrvG9zChj1zJwlaCoQeIM00QArlnRx79A
	O3kHcx0hn/VUUCyxDZSdA9PXqYyiLZqjYFiF/vZ8WqdOmw/xZHFk9HE54ca3oqRQWifGV0vx6En4K
	KLn7tGQ/agvNC/PgNltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl5k-00D91S-0R;
	Wed, 25 Oct 2023 21:07:04 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl5h-00D8yc-21
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 21:07:03 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cac925732fso1115495ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2023 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698268019; x=1698872819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IdohqfpG/gdF3wirCpdcxePGouLjdXX9N31xMFKe2w=;
        b=gSCZdSrSARNVVOqypaUNnjqsPl/v3F2CAZ7rCxmzZVyNwWPgvdQQCVH2FQwBAIaY9Y
         cwCvsupDYRQ9Fo+Kfq6Y1HJr9kfahn92DUpZzHqz9RjdKlYbnxPh+/RCi19M5S1W9Av/
         8THvFaGQEgsR1hwMKcyRU9J7HYaNy45OXUNaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698268019; x=1698872819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IdohqfpG/gdF3wirCpdcxePGouLjdXX9N31xMFKe2w=;
        b=mbjwaD9bDiv5mZldBinrCZSyJc4NFEny8DkXyogzhKZ5wnMU/9vYoDC5volsVZiBWf
         NxNXXqE54Rgvp2uvPQoVXf64QIrzwaf2ZE4Og57QvHPTncCMUmOzEVoX0n03y/TLJpPI
         LrdwDft+dDhWLt0hajvYyq/dGUEN2p8xBa/Z7x/NvZ+awWuJZs7dRdDWkzLwK+8DomgY
         IbTF5fSeNbFSoOfe/Mj12vBHL6FeyC5k/lCwDMpc979F3eG25UbcjIgybrf2mYHRP8yy
         ORwb52PTXlJGKNWvpsJTHrw5KY0AvVeqVjq0AJT5r8z/j7hIl+sAF9agITTC0TrzLEfM
         /H9Q==
X-Gm-Message-State: AOJu0YxZanF9yy4B0JtgprpJ9fN1wl7lU/pK2lB+3EE5xClvpk7WnEsD
	nkeZ8URThQ9kvQSlMtQQUSfRIA==
X-Google-Smtp-Source: AGHT+IFnYu/xqKemRScJTcQjBe6USxgn3fG2r+kl8UXZa4BqRGhtLWHTLuta2cTb0ciL0LID92X1Rw==
X-Received: by 2002:a17:903:110d:b0:1c9:e508:ad43 with SMTP id n13-20020a170903110d00b001c9e508ad43mr15865350plh.8.1698268019179;
        Wed, 25 Oct 2023 14:06:59 -0700 (PDT)
Received: from sjg1.roam.corp.google.com ([202.144.206.130])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001bc5dc0cd75sm9689447plb.180.2023.10.25.14.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:06:58 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] dt-bindings: mtd: binman-partitions: Add alignment properties
Date: Thu, 26 Oct 2023 10:06:12 +1300
Message-ID: <20231025210616.3201502-3-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231025210616.3201502-1-sjg@chromium.org>
References: <20231025210616.3201502-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_140701_669405_18964D01 
X-CRM114-Status: GOOD (  23.61  )
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

QWRkIHRocmVlIHByb3BlcnRpZXMgZm9yIGNvbnRyb2xsaW5nIGFsaWdubWVudCBvZiBwYXJ0aXRp
b25zLCBha2EKJ2VudHJpZXMnIGluIGJpbm1hbi4KCkZvciBub3cgdGhlcmUgaXMgbm8gZXhwbGlj
aXQgbWVudGlvbiBvZiBoaWVyYXJjaHksIHNvIGEgJ3NlY3Rpb24nIGlzCmp1c3QgdGhlICdiaW5t
YW4nIG5vZGUuCgpUaGVzZSBuZXcgcHJvcGVydGllcyBhcmUgaW5wdXRzIHRvIHRoZSBwYWNrYWdp
bmcgcHJvY2VzcywgYnV0IGFyZSBhbHNvCm5lZWRlZCBpZiB0aGUgZmlybXdhcmUgaXMgcmVwYWNr
ZWQsIHRvIGVuc3VyZSB0aGF0IGFsaWdubWVudApjb25zdHJhaW50cyBhcmUgbm90IHZpb2xhdGVk
LiBUaGVyZWZvcmUgdGhleSBhcmUgcHJvdmlkZWQgYXMgcGFydCBvZgp0aGUgc2NoZW1hLgoKU2ln
bmVkLW9mZi1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Ci0tLQoKQ2hhbmdlcyBp
biB2NjoKLSBDb3JyZWN0IHNjaGVtYS12YWxpZGF0aW9uIGVycm9ycyBtaXNzZWQgZHVlIHRvIG9s
ZGVyIGR0LXNjaGVtYQogIChlbnVtIGZpeCBhbmQgcmVnIGFkZGl0aW9uKQoKQ2hhbmdlcyBpbiB2
NToKLSBBZGQgdmFsdWUgcmFuZ2VzCi0gQ29uc2lzdGVudGx5IG1lbnRpb24gYWxpZ25tZW50IG11
c3QgYmUgcG93ZXItb2YtMgotIE1lbnRpb24gdGhhdCBhbGlnbm1lbnQgcmVmZXJzIHRvIGJ5dGVz
CgpDaGFuZ2VzIGluIHYyOgotIEZpeCAnYScgdHlwbyBpbiBjb21taXQgbWVzc2FnZQoKIC4uLi9t
dGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwgICAgICB8IDU0ICsrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi1w
YXJ0aXRpb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKaW5kZXggODMyMjJhYzlhYTc4Li4yYmM4MGMy
NGJiOWIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbApAQCAt
MzMsNiArMzMsNTcgQEAgcHJvcGVydGllczoKICAgICBtaW5JdGVtczogMQogICAgIG1heEl0ZW1z
OiAyCiAKKyAgYWxpZ246CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvdWludDMyCisgICAgbWluaW11bTogMQorICAgIG1heGltdW06IDB4ODAwMDAwMDAKKyAgICBt
dWx0aXBsZU9mOiAyCisgICAgZGVzY3JpcHRpb246CisgICAgICBUaGlzIHNldHMgdGhlIGFsaWdu
bWVudCBvZiB0aGUgZW50cnkgaW4gYnl0ZXMuCisKKyAgICAgIFRoZSBlbnRyeSBvZmZzZXQgaXMg
YWRqdXN0ZWQgc28gdGhhdCB0aGUgZW50cnkgc3RhcnRzIG9uIGFuIGFsaWduZWQKKyAgICAgIGJv
dW5kYXJ5IHdpdGhpbiB0aGUgY29udGFpbmluZyBzZWN0aW9uIG9yIGltYWdlLiBGb3IgZXhhbXBs
ZSDigJhhbGlnbiA9CisgICAgICA8MTY+4oCZIG1lYW5zIHRoYXQgdGhlIGVudHJ5IHdpbGwgc3Rh
cnQgb24gYSAxNi1ieXRlIGJvdW5kYXJ5LiBUaGlzIG1heQorICAgICAgbWVhbiB0aGF0IHBhZGRp
bmcgaXMgYWRkZWQgYmVmb3JlIHRoZSBlbnRyeS4gVGhlIHBhZGRpbmcgaXMgcGFydCBvZgorICAg
ICAgdGhlIGNvbnRhaW5pbmcgc2VjdGlvbiBidXQgaXMgbm90IGluY2x1ZGVkIGluIHRoZSBlbnRy
eSwgbWVhbmluZyB0aGF0CisgICAgICBhbiBlbXB0eSBzcGFjZSBtYXkgYmUgY3JlYXRlZCBiZWZv
cmUgdGhlIGVudHJ5IHN0YXJ0cy4gQWxpZ25tZW50CisgICAgICBtdXN0IGJlIGEgcG93ZXIgb2Yg
Mi4gSWYg4oCYYWxpZ27igJkgaXMgbm90IHByb3ZpZGVkLCBubyBhbGlnbm1lbnQgaXMKKyAgICAg
IHBlcmZvcm1lZC4KKworICBhbGlnbi1zaXplOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIG1pbmltdW06IDEKKyAgICBtYXhpbXVtOiAweDgw
MDAwMDAwCisgICAgbXVsdGlwbGVPZjogMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBz
ZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVudHJ5IHNpemUgaW4gYnl0ZXMuIEl0IG11c3QgYmUg
YSBwb3dlcgorICAgICAgb2YgMi4KKworICAgICAgRm9yIGV4YW1wbGUsIHRvIGVuc3VyZSB0aGF0
IHRoZSBzaXplIG9mIGFuIGVudHJ5IGlzIGEgbXVsdGlwbGUgb2YgNjQKKyAgICAgIGJ5dGVzLCBz
ZXQgdGhpcyB0byA2NC4gV2hpbGUgdGhpcyBkb2VzIG5vdCBhZmZlY3QgdGhlIGNvbnRlbnRzIG9m
IHRoZQorICAgICAgZW50cnkgd2l0aGluIGJpbm1hbiBpdHNlbGYgKHRoZSBwYWRkaW5nIGlzIHBl
cmZvcm1lZCBvbmx5IHdoZW4gaXRzCisgICAgICBwYXJlbnQgc2VjdGlvbiBpcyBhc3NlbWJsZWQp
LCB0aGUgZW5kIHJlc3VsdCBpcyB0aGF0IHRoZSBlbnRyeSBlbmRzCisgICAgICB3aXRoIHRoZSBw
YWRkaW5nIGJ5dGVzLCBzbyBtYXkgZ3Jvdy4gSWYg4oCYYWxpZ24tc2l6ZeKAmSBpcyBub3QgcHJv
dmlkZWQsCisgICAgICBubyBhbGlnbm1lbnQgaXMgcGVyZm9ybWVkLgorCisgIGFsaWduLWVuZDoK
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBt
aW5pbXVtOiAxCisgICAgbWF4aW11bTogMHg4MDAwMDAwMAorICAgIG11bHRpcGxlT2Y6IDIKKyAg
ICBkZXNjcmlwdGlvbjoKKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IChpbiBieXRlcykg
b2YgdGhlIGVuZCBvZiBhbiBlbnRyeSB3aXRoIHJlc3BlY3QKKyAgICAgIHRvIHRoZSBjb250YWlu
aW5nIHNlY3Rpb24uIEl0IG11c3QgYmUgYSBwb3dlciBvZiAyLgorCisgICAgICBTb21lIGVudHJp
ZXMgcmVxdWlyZSB0aGF0IHRoZXkgZW5kIG9uIGFuIGFsaWdubWVudCBib3VuZGFyeSwKKyAgICAg
IHJlZ2FyZGxlc3Mgb2Ygd2hlcmUgdGhleSBzdGFydC4gVGhpcyBkb2VzIG5vdCBtb3ZlIHRoZSBz
dGFydCBvZiB0aGUKKyAgICAgIGVudHJ5LCBzbyB0aGUgY29udGVudHMgb2YgdGhlIGVudHJ5IHdp
bGwgc3RpbGwgc3RhcnQgYXQgdGhlIGJlZ2lubmluZy4KKyAgICAgIEJ1dCB0aGVyZSBtYXkgYmUg
cGFkZGluZyBhdCB0aGUgZW5kLiBXaGlsZSB0aGlzIGRvZXMgbm90IGFmZmVjdCB0aGUKKyAgICAg
IGNvbnRlbnRzIG9mIHRoZSBlbnRyeSB3aXRoaW4gYmlubWFuIGl0c2VsZiAodGhlIHBhZGRpbmcg
aXMgcGVyZm9ybWVkCisgICAgICBvbmx5IHdoZW4gaXRzIHBhcmVudCBzZWN0aW9uIGlzIGFzc2Vt
YmxlZCksIHRoZSBlbmQgcmVzdWx0IGlzIHRoYXQgdGhlCisgICAgICBlbnRyeSBlbmRzIHdpdGgg
dGhlIHBhZGRpbmcgYnl0ZXMsIHNvIG1heSBncm93LiBJZiDigJhhbGlnbi1lbmTigJkgaXMgbm90
CisgICAgICBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KKwogYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgpAQCAtNDUsMTAgKzk2LDEzIEBAIGV4YW1w
bGVzOgogICAgICAgICBwYXJ0aXRpb25AMTAwMDAwIHsKICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAidS1ib290IjsKICAgICAgICAgICAgIHJlZyA9IDwweDEwMDAwMCAweGYwMDAwMD47CisgICAg
ICAgICAgICBhbGlnbi1zaXplID0gPDB4MTAwMD47CisgICAgICAgICAgICBhbGlnbi1lbmQgPSA8
MHgxMDAwMD47CiAgICAgICAgIH07CiAKICAgICAgICAgcGFydGl0aW9uQDIwMDAwMCB7CiAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInRmYS1ibDMxIjsKICAgICAgICAgICAgIHJlZyA9IDwweDIw
MDAwMCAweDEwMDAwMD47CisgICAgICAgICAgICBhbGlnbiA9IDwweDQwMDA+OwogICAgICAgICB9
OwogICAgIH07Ci0tIAoyLjQyLjAuNzU4LmdhZWQwMzY4ZTBlLWdvb2cKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
