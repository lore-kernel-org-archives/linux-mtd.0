Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3D1E82CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJrZux46ns3FQtxSbNnIDF7GKQ9k4hJ2odRmDLJvWjY=; b=2XcLCmjGt1PT3k
	bWEk8IPes+/H8OhvUM6FVSbE+Tu3y1X0CWVVQ7QHlr2iSIwIZ5Ehz/xz4GA7AGdnm9V+1OcNl34iJ
	XDb8bxIn6cTeyk8HKxF1ilpz3YNH4wtnXVg+ekjvQVOnnP4d3UF234D+7uKW6P4eZWHa6EhNTtXlb
	szgfPqZPhJw1pwBWxr1l+uoV3JyhgcZeMDWiNSVNkQwloZOfbCuGaNM5tuqnOMbxWki98tvq6LAtj
	gSluno+KAWnLAgB8tBTYhPVzULOnJ1qr1px3HxpEvjfRDuBn5F9QwWnsc16kvUWeXikkqNKZwONT2
	aJ6oMVQQwTJ3OV2jgIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlb25-001ivt-2f;
	Wed, 27 Sep 2023 20:21:17 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlb1z-001iti-2p
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 20:21:13 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3512c09355fso28233945ab.0
        for <linux-mtd@lists.infradead.org>; Wed, 27 Sep 2023 13:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695846071; x=1696450871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/WPzSaDS9c+jiadSigu8kAq3wHnfTKelNMfiF3LTzM=;
        b=NtaBNEywLWOv7wbR/xcbkhug8hE2PWLyr2K0dawfv3Lc2XKANo/bpcxgDLMJzSNbVN
         oCdybINoBSdFI2sff1UqsvsyRKyCcjDdAcRP4ll62IrPlbZnEosU8fKT90U4MNWdfddz
         hmiLb/3kxph5Tg1YCz3jY4lNhBn2sCjIDaDpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846071; x=1696450871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/WPzSaDS9c+jiadSigu8kAq3wHnfTKelNMfiF3LTzM=;
        b=u56QxIQct/M9gH2cvykWu8K5dOpytmJ4WSRKikPZ+4cU0uMIZ6IyV0xST0F5f8zk7h
         YOHZV22XrSfjcramEHo13HxrjUdu/qOYI4bpIRsq5NQbVLy/9IiJYg9JdYdpjC+t2X2d
         M/4qPmfYffr8ze6+muNGHlLxadfeN7QCqQQ/s6VYyah94loykFjbOzE8bBt48TyeNZI7
         HysmR0a7EI5GOBCjgYwG8nke7rE1FbDACOvQucMRbqPZEV05vsUJG1EBb2L7Uri5iBtA
         FqzRWrK2qgTM2D943iliMKHm3HPLhBDJVP6dKqDIK41gxB+lEKhsIeuBexrLZMMlj6xF
         4+Ww==
X-Gm-Message-State: AOJu0YwLK0GB+WdB2cYQ6jpvgnn+8EEdLZb3yR/lQG1DC4tV8p5OZjlm
	faQcWCHJPaNGJkDyXQHjdnm0oQ==
X-Google-Smtp-Source: AGHT+IFRbrRAe8Dnju3UVQpeWZ5Tyu9bkia5NuOv1VLGeo8FMF3tFtAq/tcjBk0rXfAM+4qlRibD1A==
X-Received: by 2002:a92:ca0b:0:b0:34c:e7a3:894 with SMTP id j11-20020a92ca0b000000b0034ce7a30894mr4107520ils.16.1695846070751;
        Wed, 27 Sep 2023 13:21:10 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:5d4f:fe51:5575:6f76])
        by smtp.gmail.com with ESMTPSA id ei15-20020a05663829af00b0042fec8620e4sm4113299jab.57.2023.09.27.13.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 13:21:10 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Tom Rini <trini@konsulko.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: mtd: binman-partitions: Add alignment properties
Date: Wed, 27 Sep 2023 14:20:53 -0600
Message-ID: <20230927202057.3676497-3-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230927202057.3676497-1-sjg@chromium.org>
References: <20230927202057.3676497-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_132111_913055_D6EB740D 
X-CRM114-Status: GOOD (  21.51  )
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
aXQgbWVudGlvbiBvZiBoaWVyYXJjaHksIHNvIGEgJ3NlY3Rpb24nIGlzCmp1c3QgdGhlICdmaXhl
ZC1wYXJ0aXRpb25zJyBub2RlLgoKVGhlc2UgbmV3IHByb3BlcnRpZXMgYXJlIGlucHV0cyB0byB0
aGUgcGFja2FnaW5nIHByb2Nlc3MsIGJ1dCBhcmUgYWxzbwpuZWVkZWQgaWYgdGhlIGZpcm13YXJl
IGlzIHJlcGFja2VkLCB0byBlbnN1cmUgdGhhdCBhbGlnbm1lbnQKY29uc3RyYWludHMgYXJlIG5v
dCB2aW9sYXRlZC4gVGhlcmVmb3JlIHRoZXkgYSBwcm92aWRlZCBhcyBwYXJ0IG9mIHRoZQpzY2hl
bWEuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4KLS0tCgog
Li4uL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbCAgICAgIHwgMzkgKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlu
bWFuLXBhcnRpdGlvbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbAppbmRleCA2ZWU4MzJjYjRjNGMuLjlj
ZDQyNDQ0N2U3NiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLXBhcnRpdGlvbi55YW1s
CkBAIC0yNyw2ICsyNyw0MiBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAtIHUtYm9vdCAgICAgICAj
IHUtYm9vdC5iaW4gZnJvbSBVLUJvb3QgcHJvamVjNnQKICAgICAgICAgLSBhdGYtYmwzMSAgICAg
IyBibDMxLmJpbiBvciBibDMxLmVsZiBmcm9tIFRGLUEgcHJvamVjdAogCisgIGFsaWduOgorICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2Ny
aXB0aW9uOgorICAgICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVudHJ5LiBUaGUg
ZW50cnkgb2Zmc2V0IGlzIGFkanVzdGVkCisgICAgICBzbyB0aGF0IHRoZSBlbnRyeSBzdGFydHMg
b24gYW4gYWxpZ25lZCBib3VuZGFyeSB3aXRoaW4gdGhlIGNvbnRhaW5pbmcKKyAgICAgIHNlY3Rp
b24gb3IgaW1hZ2UuIEZvciBleGFtcGxlIOKAmGFsaWduID0gPDE2PuKAmSBtZWFucyB0aGF0IHRo
ZSBlbnRyeSB3aWxsCisgICAgICBzdGFydCBvbiBhIDE2LWJ5dGUgYm91bmRhcnkuIFRoaXMgbWF5
IG1lYW4gdGhhdCBwYWRkaW5nIGlzIGFkZGVkIGJlZm9yZQorICAgICAgdGhlIGVudHJ5LiBUaGUg
cGFkZGluZyBpcyBwYXJ0IG9mIHRoZSBjb250YWluaW5nIHNlY3Rpb24gYnV0IGlzIG5vdAorICAg
ICAgaW5jbHVkZWQgaW4gdGhlIGVudHJ5LCBtZWFuaW5nIHRoYXQgYW4gZW1wdHkgc3BhY2UgbWF5
IGJlIGNyZWF0ZWQgYmVmb3JlCisgICAgICB0aGUgZW50cnkgc3RhcnRzLiBBbGlnbm1lbnQgc2hv
dWxkIGJlIGEgcG93ZXIgb2YgMi4gSWYg4oCYYWxpZ27igJkgaXMgbm90CisgICAgICBwcm92aWRl
ZCwgbm8gYWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KKworICBhbGlnbi1zaXplOgorICAgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2NyaXB0aW9u
OgorICAgICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVudHJ5IHNpemUuIEZvciBl
eGFtcGxlLCB0byBlbnN1cmUKKyAgICAgIHRoYXQgdGhlIHNpemUgb2YgYW4gZW50cnkgaXMgYSBt
dWx0aXBsZSBvZiA2NCBieXRlcywgc2V0IHRoaXMgdG8gNjQuCisgICAgICBXaGlsZSB0aGlzIGRv
ZXMgbm90IGFmZmVjdCB0aGUgY29udGVudHMgb2YgdGhlIGVudHJ5IHdpdGhpbiBiaW5tYW4KKyAg
ICAgIGl0c2VsZiAodGhlIHBhZGRpbmcgaXMgcGVyZm9ybWVkIG9ubHkgd2hlbiBpdHMgcGFyZW50
IHNlY3Rpb24gaXMKKyAgICAgIGFzc2VtYmxlZCksIHRoZSBlbmQgcmVzdWx0IGlzIHRoYXQgdGhl
IGVudHJ5IGVuZHMgd2l0aCB0aGUgcGFkZGluZworICAgICAgYnl0ZXMsIHNvIG1heSBncm93LiBJ
ZiDigJhhbGlnbi1zaXpl4oCZIGlzIG5vdCBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlzCisgICAg
ICBwZXJmb3JtZWQuCisKKyAgYWxpZ24tZW5kOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBzZXRz
IHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVuZCBvZiBhbiBlbnRyeSB3aXRoIHJlc3BlY3QgdG8gdGhl
CisgICAgICBjb250YWluaW5nIHNlY3Rpb24uIFNvbWUgZW50cmllcyByZXF1aXJlIHRoYXQgdGhl
eSBlbmQgb24gYW4gYWxpZ25tZW50CisgICAgICBib3VuZGFyeSwgcmVnYXJkbGVzcyBvZiB3aGVy
ZSB0aGV5IHN0YXJ0LiBUaGlzIGRvZXMgbm90IG1vdmUgdGhlIHN0YXJ0CisgICAgICBvZiB0aGUg
ZW50cnksIHNvIHRoZSBjb250ZW50cyBvZiB0aGUgZW50cnkgd2lsbCBzdGlsbCBzdGFydCBhdCB0
aGUKKyAgICAgIGJlZ2lubmluZy4gQnV0IHRoZXJlIG1heSBiZSBwYWRkaW5nIGF0IHRoZSBlbmQu
IFdoaWxlIHRoaXMgZG9lcyBub3QKKyAgICAgIGFmZmVjdCB0aGUgY29udGVudHMgb2YgdGhlIGVu
dHJ5IHdpdGhpbiBiaW5tYW4gaXRzZWxmICh0aGUgcGFkZGluZyBpcworICAgICAgcGVyZm9ybWVk
IG9ubHkgd2hlbiBpdHMgcGFyZW50IHNlY3Rpb24gaXMgYXNzZW1ibGVkKSwgdGhlIGVuZCByZXN1
bHQgaXMKKyAgICAgIHRoYXQgdGhlIGVudHJ5IGVuZHMgd2l0aCB0aGUgcGFkZGluZyBieXRlcywg
c28gbWF5IGdyb3cuIElmIOKAmGFsaWduLWVuZOKAmQorICAgICAgaXMgbm90IHByb3ZpZGVkLCBu
byBhbGlnbm1lbnQgaXMgcGVyZm9ybWVkLgorCiBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
IAogZXhhbXBsZXM6CkBAIC0zOSwxMCArNzUsMTMgQEAgZXhhbXBsZXM6CiAgICAgICAgIHBhcnRp
dGlvbi11LWJvb3RAMTAwMDAwIHsKICAgICAgICAgICAgIGxhYmVsID0gInUtYm9vdCI7CiAgICAg
ICAgICAgICByZWcgPSA8MHgxMDAwMDAgMHhmMDAwMDA+OworICAgICAgICAgICAgYWxpZ24tc2l6
ZSA9IDwweDEwMDA+OworICAgICAgICAgICAgYWxpZ24tZW5kID0gPDB4MTAwMDA+OwogICAgICAg
ICB9OwogCiAgICAgICAgIHBhcnRpdGlvbi1hdGYtYmwzMXRAMjAwMDAwIHsKICAgICAgICAgICAg
IGxhYmVsID0gImF0Zi1ibDMxIjsKICAgICAgICAgICAgIHJlZyA9IDwweDIwMDAwMCAweDEwMDAw
MD47CisgICAgICAgICAgICBhbGlnbiA9IDwweDQwMDA+OwogICAgICAgICB9OwogICAgIH07Ci0t
IAoyLjQyLjAuNTE1LmczODBmYzdjY2QxLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
